#ifndef UNIVERSAL_FORWARD_CLOTH_LIT_PASS_INCLUDED
#define UNIVERSAL_FORWARD_CLOTH_LIT_PASS_INCLUDED

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

struct Attributes
{
    float4 positionOS   : POSITION;
    float3 normalOS     : NORMAL;
    float4 tangentOS    : TANGENT;
    float2 texcoord     : TEXCOORD0;
    float2 lightmapUV   : TEXCOORD1;
    float2 uv1   : TEXCOORD2;
    float2 uv2   : TEXCOORD3;
    float2 uv3   : TEXCOORD4;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};
// target 3.0 <= 10 interpolators
struct Varyings
{
    float4 uv                       : TEXCOORD0; // float2 to float4
    DECLARE_LIGHTMAP_OR_SH(lightmapUV, vertexSH, 1);

#if defined(REQUIRES_WORLD_SPACE_POS_INTERPOLATOR)
    float3 positionWS               : TEXCOORD2;
#endif

#ifdef _NORMALMAP
    float4 normalWS                 : TEXCOORD3;    // xyz: normal, w: viewDir.x
    float4 tangentWS                : TEXCOORD4;    // xyz: tangent, w: viewDir.y
    float4 bitangentWS              : TEXCOORD5;    // xyz: bitangent, w: viewDir.z
#else
    float3 normalWS                 : TEXCOORD3;
    float3 viewDirWS                : TEXCOORD4;
#endif

    half4 fogFactorAndVertexLight   : TEXCOORD6; // x: fogFactor, yzw: vertex light

#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
    float4 shadowCoord              : TEXCOORD7;
#endif

    float4 detailUV                 : TEXCOORD8;

    float4 positionCS               : SV_POSITION;
    UNITY_VERTEX_INPUT_INSTANCE_ID
    UNITY_VERTEX_OUTPUT_STEREO
};

void InitializeInputData(Varyings input, half3 normalTS, out F_InputData inputData)
{
    inputData = (F_InputData)0;

#if defined(REQUIRES_WORLD_SPACE_POS_INTERPOLATOR)
    inputData.positionWS = input.positionWS;
#endif

#ifdef _NORMALMAP
    half3 viewDirWS = half3(input.normalWS.w, input.tangentWS.w, input.bitangentWS.w);
    inputData.normalWS = TransformTangentToWorld(normalTS,
        half3x3(input.tangentWS.xyz, input.bitangentWS.xyz, input.normalWS.xyz));
#else
    half3 viewDirWS = input.viewDirWS;
    inputData.normalWS = input.normalWS;
#endif

    inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
    viewDirWS = SafeNormalize(viewDirWS);
    inputData.viewDirectionWS = viewDirWS;

#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
    inputData.shadowCoord = input.shadowCoord;
#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
    inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
#else
    inputData.shadowCoord = float4(0, 0, 0, 0);
#endif

    inputData.fogCoord = input.fogFactorAndVertexLight.x;
    inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
    inputData.bakedGI = SAMPLE_GI(input.lightmapUV, input.vertexSH, inputData.normalWS);
}

// no "inline" keyword either, useless.
void InitializeStandardLitSurfaceData(Varyings input, out F_SurfaceData outSurfaceData)
{
    half4 albedoAlpha = SampleAlbedoAlpha(input.uv, TEXTURE2D_ARGS(_BaseMap, sampler_BaseMap));
    outSurfaceData.alpha = Alpha(albedoAlpha.a, _BaseColor, _Cutoff);

    half4 specGloss = SampleMetallicSpecGloss(input.uv, albedoAlpha.a);
    // outSurfaceData.albedo = albedoAlpha.rgb * _BaseColor.rgb;
    half3 outCol = albedoAlpha.rgb * _BaseColor.rgb;
    half outMetallic = specGloss.r;
    half outSmoothness = specGloss.a;    
    half3 outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
    // 目前，layer颜色进行覆盖，金属度和光滑度是加法，法线是覆盖
    #if _LAYER_0_NORMAL
		half2 layer0SourceUV = GetLayer0Texcoord(i_tex, detailUV);
		half2 layer0UV = layer0SourceUV * _Layer0Normal_ST.xy + _Layer0Normal_ST.zw;
        half3 layer0NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer0Normal, layer0UV), _Layer0NormalScale);		
		outNormalTS = BlendNormals(outNormalTS, layer0NormalTS);			
	#endif

    #if _LAYER_1_TEX         
		half2 layer1SourceUV = GetLayer1Texcoord(input.uv, input.detailUV);
		half2 layer1UV = layer1SourceUV * _Layer1Tex_ST.xy + _Layer1Tex_ST.zw;		
		half layer1Mask = GetLayer1Mask(layer1UV);
        half4 layer1TexCol = SAMPLE_TEXTURE2D_Default (_Layer1Tex, layer1UV);		
		layer1TexCol = layer1TexCol*layer1Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer1TexCol*_Layer1Color.rgb,layer1TexCol.a*_Layer1Color.a); 
		#if _LAYER_1_MASK 
			half _layer1Mask = SAMPLE_TEXTURE2D_Default (_Layer1Mask, layer1UV);			
			_layer1Mask = lerp(1,0,step(_layer1Mask,0)); 
			layer1TexCol.a *= layer1Mask* _layer1Mask;
		#endif
		outMetallic +=  _Layer1Metallic * layer1TexCol.a;
		outSmoothness += _Layer1Smoothness * layer1TexCol.a;
        
        
        #if (_LAYER_1_TEX && _LAYER_1_NORMAL)
            half3 layer1NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer1Normal, layer1UV), _Layer1NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer1NormalTS, layer1Mask);		
        #endif
	#endif

    #if _LAYER_2_TEX               
		half2 layer2SourceUV = GetLayer2Texcoord(input.uv, input.detailUV);
		half2 layer2UV = layer2SourceUV * _Layer2Tex_ST.xy + _Layer2Tex_ST.zw;		
		half layer2Mask = GetLayer2Mask(layer2UV);
        half4 layer2TexCol = SAMPLE_TEXTURE2D_Default (_Layer2Tex, layer2UV);		
		layer2TexCol = layer2TexCol*layer2Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer2TexCol*_Layer2Color.rgb,layer2TexCol.a*_Layer2Color.a); 
		#if _LAYER_2_MASK 
			half _layer2Mask = SAMPLE_TEXTURE2D_Default (_Layer2Mask, layer2UV);			
			_layer2Mask = lerp(2,0,step(_layer2Mask,0)); 
			layer2TexCol.a *= layer2Mask* _layer2Mask;
		#endif
		outMetallic +=  _Layer2Metallic * layer2TexCol.a;
		outSmoothness += _Layer2Smoothness * layer2TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_2_TEX && _LAYER_2_NORMAL)
            half3 layer2NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer2Normal, layer2UV), _Layer2NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer2NormalTS, layer2Mask);		
        #endif        
	#endif

    #if _LAYER_3_TEX         
		half2 layer3SourceUV = GetLayer3Texcoord(input.uv, input.detailUV);
		half2 layer3UV = layer3SourceUV * _Layer3Tex_ST.xy + _Layer3Tex_ST.zw;		
		half layer3Mask = GetLayer3Mask(layer3UV);
        half4 layer3TexCol = SAMPLE_TEXTURE2D_Default (_Layer3Tex, layer3UV);		
		layer3TexCol = layer3TexCol*layer3Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer3TexCol*_Layer3Color.rgb,layer3TexCol.a*_Layer3Color.a); 
		#if _LAYER_3_MASK 
			half _layer3Mask = SAMPLE_TEXTURE2D_Default (_Layer3Mask, layer3UV);			
			_layer3Mask = lerp(3,0,step(_layer3Mask,0)); 
			layer3TexCol.a *= layer3Mask* _layer3Mask;
		#endif
		outMetallic +=  _Layer3Metallic * layer3TexCol.a;
		outSmoothness += _Layer3Smoothness * layer3TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_3_TEX && _LAYER_3_NORMAL)
            half3 layer3NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer3Normal, layer3UV), _Layer3NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer3NormalTS, layer3Mask);		
        #endif
	#endif


    #if _LAYER_4_TEX         
		half2 layer4SourceUV = GetLayer4Texcoord(input.uv, input.detailUV);
		half2 layer4UV = layer4SourceUV * _Layer4Tex_ST.xy + _Layer4Tex_ST.zw;		
		half layer4Mask = GetLayer4Mask(layer4UV);
        half4 layer4TexCol = SAMPLE_TEXTURE2D_Default (_Layer4Tex, layer4UV);		
		layer4TexCol = layer4TexCol*layer4Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer4TexCol*_Layer4Color.rgb,layer4TexCol.a*_Layer4Color.a); 
		#if _LAYER_4_MASK 
			half _layer4Mask = SAMPLE_TEXTURE2D_Default (_Layer4Mask, layer4UV);			
			_layer4Mask = lerp(4,0,step(_layer4Mask,0)); 
			layer4TexCol.a *= layer4Mask* _layer4Mask;
		#endif
		outMetallic +=  _Layer4Metallic * layer4TexCol.a;
		outSmoothness += _Layer4Smoothness * layer4TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_4_TEX && _LAYER_4_NORMAL)
            half3 layer4NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer4Normal, layer4UV), _Layer4NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer4NormalTS, layer4Mask);		
        #endif
	#endif


    #if _LAYER_5_TEX         
		half2 layer5SourceUV = GetLayer5Texcoord(input.uv, input.detailUV);
		half2 layer5UV = layer5SourceUV * _Layer5Tex_ST.xy + _Layer5Tex_ST.zw;		
		half layer5Mask = GetLayer5Mask(layer5UV);
        half4 layer5TexCol = SAMPLE_TEXTURE2D_Default (_Layer5Tex, layer5UV);		
		layer5TexCol = layer5TexCol*layer5Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer5TexCol*_Layer5Color.rgb,layer5TexCol.a*_Layer5Color.a); 
		#if _LAYER_5_MASK 
			half _layer5Mask = SAMPLE_TEXTURE2D_Default (_Layer5Mask, layer5UV);			
			_layer5Mask = lerp(5,0,step(_layer5Mask,0)); 
			layer5TexCol.a *= layer5Mask* _layer5Mask;
		#endif
		outMetallic +=  _Layer5Metallic * layer5TexCol.a;
		outSmoothness += _Layer5Smoothness * layer5TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_5_TEX && _LAYER_5_NORMAL)
            half3 layer5NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer5Normal, layer5UV), _Layer5NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer5NormalTS, layer5Mask);		
        #endif
	#endif


    #if _LAYER_6_TEX         
		half2 layer6SourceUV = GetLayer6Texcoord(input.uv, input.detailUV);
		half2 layer6UV = layer6SourceUV * _Layer6Tex_ST.xy + _Layer6Tex_ST.zw;		
		half layer6Mask = GetLayer6Mask(layer6UV);
        half4 layer6TexCol = SAMPLE_TEXTURE2D_Default (_Layer6Tex, layer6UV);		
		layer6TexCol = layer6TexCol*layer6Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer6TexCol*_Layer6Color.rgb,layer6TexCol.a*_Layer6Color.a); 
		#if _LAYER_6_MASK 
			half _layer6Mask = SAMPLE_TEXTURE2D_Default (_Layer6Mask, layer6UV);			
			_layer6Mask = lerp(6,0,step(_layer6Mask,0)); 
			layer6TexCol.a *= layer6Mask* _layer6Mask;
		#endif
		outMetallic +=  _Layer6Metallic * layer6TexCol.a;
		outSmoothness += _Layer6Smoothness * layer6TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_6_TEX && _LAYER_6_NORMAL)
            half3 layer6NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer6Normal, layer6UV), _Layer6NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer6NormalTS, layer6Mask);		
        #endif
	#endif


    #if _LAYER_7_TEX         
		half2 layer7SourceUV = GetLayer7Texcoord(input.uv, input.detailUV);
		half2 layer7UV = layer7SourceUV * _Layer7Tex_ST.xy + _Layer7Tex_ST.zw;		
		half layer7Mask = GetLayer7Mask(layer7UV);
        half4 layer7TexCol = SAMPLE_TEXTURE2D_Default (_Layer7Tex, layer7UV);		
		layer7TexCol = layer7TexCol*layer7Mask; 			
		outCol.rgb = lerp(outCol.rgb, layer7TexCol*_Layer7Color.rgb,layer7TexCol.a*_Layer7Color.a); 
		#if _LAYER_7_MASK 
			half _layer7Mask = SAMPLE_TEXTURE2D_Default (_Layer7Mask, layer7UV);			
			_layer7Mask = lerp(7,0,step(_layer7Mask,0)); 
			layer7TexCol.a *= layer7Mask* _layer7Mask;
		#endif
		outMetallic +=  _Layer7Metallic * layer7TexCol.a;
		outSmoothness += _Layer7Smoothness * layer7TexCol.a;
        
        outNormalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
        #if (_LAYER_7_TEX && _LAYER_7_NORMAL)
            half3 layer7NormalTS = UnpackScaleNormal(SAMPLE_TEXTURE2D_Default (_Layer7Normal, layer7UV), _Layer7NormalScale);		
            outNormalTS = BlendNormalTS(outNormalTS, layer7NormalTS, layer7Mask);		
        #endif
	#endif
    
#if _SPECULAR_SETUP
    outSurfaceData.metallic = 1.0h;
    outSurfaceData.specular = specGloss.rgb;
#else
    outSurfaceData.metallic = outMetallic;
    outSurfaceData.specular = half3(0.0h, 0.0h, 0.0h);
#endif

    outSurfaceData.smoothness = outSmoothness;

    outSurfaceData.albedo = outCol;
    outSurfaceData.normalTS = outNormalTS;
    outSurfaceData.occlusion = SampleOcclusion(input.uv);
    outSurfaceData.emission = SampleEmission(input.uv, _EmissionColor.rgb, TEXTURE2D_ARGS(_EmissionMap, sampler_EmissionMap));    
}

///////////////////////////////////////////////////////////////////////////////
//                  Vertex and Fragment functions                            //
///////////////////////////////////////////////////////////////////////////////

// Used in Standard (Physically Based) shader
Varyings Cloth_LitPassVertex(Attributes input)
{
    Varyings output = (Varyings)0;

    UNITY_SETUP_INSTANCE_ID(input);
    UNITY_TRANSFER_INSTANCE_ID(input, output);
    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

    VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
    VertexNormalInputs normalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);
    half3 viewDirWS = GetCameraPositionWS() - vertexInput.positionWS;
    half3 vertexLight = VertexLighting(vertexInput.positionWS, normalInput.normalWS);
    half fogFactor = ComputeFogFactor(vertexInput.positionCS.z);

    output.uv = float4(input.texcoord,input.uv1);
    output.detailUV.xyzw = float4(input.uv2,input.uv3);
#ifdef _NORMALMAP
    output.normalWS = half4(normalInput.normalWS, viewDirWS.x);
    output.tangentWS = half4(normalInput.tangentWS, viewDirWS.y);
    output.bitangentWS = half4(normalInput.bitangentWS, viewDirWS.z);
#else
    output.normalWS = NormalizeNormalPerVertex(normalInput.normalWS);
    output.viewDirWS = viewDirWS;
#endif

    OUTPUT_LIGHTMAP_UV(input.lightmapUV, unity_LightmapST, output.lightmapUV);
    OUTPUT_SH(output.normalWS.xyz, output.vertexSH);

    output.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

#if defined(REQUIRES_WORLD_SPACE_POS_INTERPOLATOR)
    output.positionWS = vertexInput.positionWS;
#endif

#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
    output.shadowCoord = GetShadowCoord(vertexInput);
#endif

    output.positionCS = vertexInput.positionCS;

    return output;
}

// Used in Standard (Physically Based) shader
half4 Cloth_LitPassFragment(Varyings input) : SV_Target
{
    UNITY_SETUP_INSTANCE_ID(input);
    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);
    // ClothLitInput.hlsl
    F_SurfaceData surfaceData;
    // layer calculate
    InitializeStandardLitSurfaceData(input, surfaceData);// (uv, out SurfaceData outSurfaceData)    
    // ClothLitInput.hlsl SurfaceData: alpha,albedo,metallic,specular,smoothness,normalTS,occlusion,emission
    F_InputData inputData;    
    // current
    InitializeInputData(input, surfaceData.normalTS, inputData);
    // Lighting.hlsl
    half4 color = Cloth_FragmentPBR(inputData, surfaceData.albedo, surfaceData.metallic, surfaceData.specular, surfaceData.smoothness, surfaceData.occlusion, surfaceData.emission, surfaceData.alpha);

    color.rgb = MixFog(color.rgb, inputData.fogCoord);
    return color;
}




#endif
