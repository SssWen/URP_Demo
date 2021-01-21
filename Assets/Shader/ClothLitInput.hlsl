#ifndef UNIVERSAL_CLOTH_LIT_INPUT_INCLUDED
#define UNIVERSAL_CLOTH_LIT_INPUT_INCLUDED

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonMaterial.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceInput.hlsl"

struct F_SurfaceData
{
    half3 albedo;
    half3 specular;
    half  metallic;
    half  smoothness;
    half3 normalTS;
    half3 emission;
    half  occlusion;
    half  alpha;
};

// properties defined inside a concrete memory buffere instead of at the global level.
// constant buffer aren't surpported on all platforms eg:OpenGLES2.0
// use cbuffer_start macros instead.
CBUFFER_START(UnityPerMaterial)
float4 _BaseMap_ST;
half4 _BaseColor;
half4 _SpecColor;
half4 _EmissionColor;
half _Cutoff;
half _Smoothness;
half _Metallic;
half _BumpScale;
half _OcclusionStrength;
// 添加相关Attributes 参数

CBUFFER_END

TEXTURE2D(_OcclusionMap);       SAMPLER(sampler_OcclusionMap);
TEXTURE2D(_MetallicGlossMap);   SAMPLER(sampler_MetallicGlossMap);
TEXTURE2D(_SpecGlossMap);       SAMPLER(sampler_SpecGlossMap);

// ------Added Layer- TODO:公用采样器----------------    

    #if _LAYER_0_NORMAL
        TEXTURE2D(_Layer0Normal);   SAMPLER(sampler_Layer0Normal);
        half4 _Layer0Normal_ST;
        half _Layer0NormalScale;
    #endif

    #if _LAYER_1_TEX
        TEXTURE2D(_Layer1Tex);       SAMPLER(sampler_Layer1Tex);    
        half4 _Layer1Tex_ST;
        half4 _Layer1Color;
        half _Layer1Smoothness;
        half _Layer1Metallic;        
        #if _LAYER_1_MASK    
            TEXTURE2D(_Layer1Mask);    SAMPLER(sampler_Layer1Mask);
        #endif
        #if _LAYER_1_NORMAL
            TEXTURE2D(_Layer1Normal);   SAMPLER(sampler_Layer1Normal);
            half _Layer1NormalScale;
        #endif
    #endif

    #if _LAYER_2_TEX
        TEXTURE2D(_Layer2Tex);       SAMPLER(sampler_Layer2Tex);    
        half4 _Layer2Tex_ST;
        half4 _Layer2Color;
        half _Layer2Smoothness;
        half _Layer2Metallic;        
        #if _LAYER_2_MASK    
            TEXTURE2D(_Layer2Mask);    SAMPLER(sampler_Layer2Mask);
        #endif
        #if _LAYER_2_NORMAL
            TEXTURE2D(_Layer2Normal);   SAMPLER(sampler_Layer2Normal);
            half _Layer2NormalScale;
        #endif
    #endif
    
    #if _LAYER_3_TEX
        TEXTURE2D(_Layer3Tex);       SAMPLER(sampler_Layer3Tex);    
        half4 _Layer3Tex_ST;
        half4 _Layer3Color;
        half _Layer3Smoothness;
        half _Layer3Metallic;        
        #if _LAYER_3_MASK    
            TEXTURE2D(_Layer3Mask);    SAMPLER(sampler_Layer3Mask);
        #endif
        #if _LAYER_3_NORMAL
            TEXTURE2D(_Layer3Normal);   SAMPLER(sampler_Layer3Normal);
            half _Layer3NormalScale;
        #endif
    #endif

    #if _LAYER_4_TEX
        TEXTURE2D(_Layer4Tex);       SAMPLER(sampler_Layer4Tex);    
        half4 _Layer4Tex_ST;
        half4 _Layer4Color;
        half _Layer4Smoothness;
        half _Layer4Metallic;        
        #if _LAYER_4_MASK    
            TEXTURE2D(_Layer4Mask);    SAMPLER(sampler_Layer4Mask);
        #endif
        #if _LAYER_4_NORMAL
            TEXTURE2D(_Layer4Normal);   SAMPLER(sampler_Layer4Normal);
            half _Layer4NormalScale;
        #endif
    #endif

    #if _LAYER_5_TEX
        TEXTURE2D(_Layer5Tex);       SAMPLER(sampler_Layer5Tex);    
        half4 _Layer5Tex_ST;
        half4 _Layer5Color;
        half _Layer5Smoothness;
        half _Layer5Metallic;        
        #if _LAYER_5_MASK    
            TEXTURE2D(_Layer5Mask);    SAMPLER(sampler_Layer5Mask);
        #endif
        #if _LAYER_5_NORMAL
            TEXTURE2D(_Layer5Normal);   SAMPLER(sampler_Layer5Normal);
            half _Layer5NormalScale;
        #endif
    #endif

    #if _LAYER_6_TEX
        TEXTURE2D(_Layer6Tex);       SAMPLER(sampler_Layer6Tex);    
        half4 _Layer6Tex_ST;
        half4 _Layer6Color;
        half _Layer6Smoothness;
        half _Layer6Metallic;        
        #if _LAYER_6_MASK    
            TEXTURE2D(_Layer6Mask);    SAMPLER(sampler_Layer6Mask);
        #endif
        #if _LAYER_6_NORMAL
            TEXTURE2D(_Layer6Normal);   SAMPLER(sampler_Layer6Normal);
            half _Layer6NormalScale;
        #endif
    #endif

    #if _LAYER_7_TEX
        TEXTURE2D(_Layer7Tex);       SAMPLER(sampler_Layer7Tex);    
        half4 _Layer7Tex_ST;
        half4 _Layer7Color;
        half _Layer7Smoothness;
        half _Layer7Metallic;        
        #if _LAYER_7_MASK    
            TEXTURE2D(_Layer7Mask);    SAMPLER(sampler_Layer7Mask);
        #endif
        #if _LAYER_7_NORMAL
            TEXTURE2D(_Layer7Normal);   SAMPLER(sampler_Layer7Normal);
            half _Layer7NormalScale;
        #endif
    #endif


// ------Added Layer-----------------    


#ifdef _SPECULAR_SETUP
    #define SAMPLE_METALLICSPECULAR(uv) SAMPLE_TEXTURE2D(_SpecGlossMap, sampler_SpecGlossMap, uv)
#else
    #define SAMPLE_METALLICSPECULAR(uv) SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MetallicGlossMap, uv)
#endif

half4 SampleMetallicSpecGloss(float2 uv, half albedoAlpha)
{
    half4 specGloss;

#ifdef _METALLICSPECGLOSSMAP
    specGloss = SAMPLE_METALLICSPECULAR(uv);
    #ifdef _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
        specGloss.a = albedoAlpha * _Smoothness;
    #else
        specGloss.a *= _Smoothness;
    #endif
#else // _METALLICSPECGLOSSMAP
    #if _SPECULAR_SETUP
        specGloss.rgb = _SpecColor.rgb;
    #else
        specGloss.rgb = _Metallic.rrr;
    #endif

    #ifdef _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
        specGloss.a = albedoAlpha * _Smoothness;
    #else
        specGloss.a = _Smoothness;
    #endif
#endif

    return specGloss;
}

half SampleOcclusion(float2 uv)
{
#ifdef _OCCLUSIONMAP
// TODO: Controls things like these by exposing SHADER_QUALITY levels (low, medium, high)
#if defined(SHADER_API_GLES)
    return SAMPLE_TEXTURE2D(_OcclusionMap, sampler_OcclusionMap, uv).g;
#else
    half occ = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_OcclusionMap, uv).g;
    return LerpWhiteTo(occ, _OcclusionStrength);
#endif
#else
    return 1.0;
#endif
}

// // 相关layer计算
// // inline void InitializeStandardLitSurfaceData(float2 uv, out F_SurfaceData outSurfaceData)
// inline void InitializeStandardLitSurfaceData(Varyings input, out F_SurfaceData outSurfaceData)
// {
//     half4 albedoAlpha = SampleAlbedoAlpha(input.uv, TEXTURE2D_ARGS(_BaseMap, sampler_BaseMap));
//     outSurfaceData.alpha = Alpha(albedoAlpha.a, _BaseColor, _Cutoff);

//     half4 specGloss = SampleMetallicSpecGloss(input.uv, albedoAlpha.a);
//     outSurfaceData.albedo = albedoAlpha.rgb * _BaseColor.rgb;

// #if _SPECULAR_SETUP
//     outSurfaceData.metallic = 1.0h;
//     outSurfaceData.specular = specGloss.rgb;
// #else
//     outSurfaceData.metallic = specGloss.r;
//     outSurfaceData.specular = half3(0.0h, 0.0h, 0.0h);
// #endif

//     outSurfaceData.smoothness = specGloss.a;
//     // 切线空间进行法线混合
//     outSurfaceData.normalTS = SampleNormal(input.uv, TEXTURE2D_ARGS(_BumpMap, sampler_BumpMap), _BumpScale);
//     outSurfaceData.occlusion = SampleOcclusion(input.uv);
//     outSurfaceData.emission = SampleEmission(input.uv, _EmissionColor.rgb, TEXTURE2D_ARGS(_EmissionMap, sampler_EmissionMap));
// }

#endif // UNIVERSAL_CLOTH_LIT_INPUT_INCLUDED
