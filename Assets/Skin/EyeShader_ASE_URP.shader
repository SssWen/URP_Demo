// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CustomURP/EyeShader_ASE_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][NoScaleOffset][Header(Main Textures)]_RGBMask1("RGBMask", 2D) = "white" {}
		[NoScaleOffset]_IrisExtraDetail1("IrisExtraDetail", 2D) = "white" {}
		[NoScaleOffset]_Sclera_Normal1("Sclera_Normal", 2D) = "bump" {}
		[NoScaleOffset]_Lens_Base_Normal1("Lens_Base_Normal", 2D) = "bump" {}
		[Header(Color Customization)][Space(6)]_EyeBallColorGlossA1("[眼白颜色]EyeBallColor-Gloss(A)", Color) = (1,1,1,0.853)
		_IrisBaseColor1("[虹膜颜色]IrisBaseColor", Color) = (0.4999702,0.5441177,0.4641004,1)
		_IrisExtraColorAmountA1("[虹膜遮罩颜色]IrisExtraColor-Amount(A)", Color) = (0.08088237,0.07573904,0.04698314,0.591)
		_EyeVeinColorAmountA1("[血管颜色]EyeVeinColor-Amount(A)", Color) = (0.375,0,0,0)
		_RingColorAmount1("[虹膜边缘]_RingColorAmount", Color) = (0,0,0,0)
		_LimbalEdge_Adjustment1("LimbalEdge_Adjustment", Range( 0 , 1)) = 0
		_LimbalRingGloss1("LimbalRingGloss", Range( 0 , 1)) = 0
		_ScleraBumpScale1("ScleraBumpScale", Range( 0 , 1)) = 0
		_EyeSize1("[虹膜放大]EyeSize", Range( 0 , 2)) = 1
		_BIrisSize1("[虹膜纹理放大]IrisSize", Range( 0 , 10)) = 1
		_LensGloss1("[高光点放大]LensGloss", Range( 0 , 1)) = 0.98
		_LensPush1("[高光点推进]LensPush", Range( 0 , 1)) = 0.64
		_EyeReflectCubeMap1("[反射高光]EyeReflectCubeMap", CUBE) = "white" {}
		_EyeReflectFactor1("[高光系数]EyeReflectFactor", Range( 0 , 2)) = 0
		_Rotate_Y1("[旋转高光]Rotate_Y", Range( -360 , 360)) = 0
		_RotateXYZ1("[旋转高光]RotateXYZ", Range( -360 , 360)) = 0
		_XYZ_Axis1("XYZ_Axis", Vector) = (0,0,0,0)
		_FullEyeFactor1("[眼球整体放大]FullEyeFactor", Range( -1 , 1)) = 0
		[Header(Metalness)]_LimbalRingMetalness1("LimbalRingMetalness", Range( 0 , 1)) = 0
		_IrisPupilMetalness1("IrisPupilMetalness", Range( 0 , 1)) = 0
		_EyeBallMetalness1("EyeBallMetalness", Range( 0 , 1)) = 0
		[NoScaleOffset][Header(Caustic FX)]_CausticMask1("CausticMask", 2D) = "white" {}
		_CausticPower1("CausticPower", Range( 0.5 , 10)) = 17
		_CausticFX_inDarkness1("CausticFX_inDarkness", Range( 0 , 2)) = 17
		[Header(Pupil Control)][Space(6)]_PupilColorEmissivenessA1("[瞳孔颜色]PupilColor-Emissiveness(A)", Color) = (0,0,0,0)
		_PupilHeightWidth2("[瞳孔形状]Pupil", Range( 0.01 , 10)) = 1
		_PupilSharpness1("[瞳孔模糊]PupilSharpness", Range( 0.1 , 5)) = 5
		_PupilAutoDilateFactor1("[瞳孔大小]PupilAutoDilateFactor", Range( 0 , 50)) = 0
		_PupilSize1("[瞳孔大小]PupilSize", Range( 0.001 , 90)) = 70
		[NoScaleOffset][Header(Parallax Control)]_ParallaxMask1("ParallaxMask", 2D) = "black" {}
		_PushParallaxMask1("PushParallaxMask", Range( 0 , 5)) = 1
		_PupilParallaxHeight1("PupilParallaxHeight", Range( 0 , 3)) = 2.5
		_EyeShadingPower1("EyeShadingPower", Range( 0.01 , 2)) = 0.5
		_MinimumGlow1("MinimumGlow", Range( 0 , 1)) = 0.2
		_Eyeball_microScatter1("Eyeball_microScatter", Range( 0 , 5)) = 0
		[ASEEnd]_SubSurfaceFromDirectionalLight1("SubSurfaceFromDirectionalLight", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull Back
		AlphaToMask Off
		HLSLINCLUDE
		#pragma target 2.0
		#define UNITY_PI 3.1415926
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }
			
			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100202

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			// //#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma multi_compile_instancing


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _IrisBaseColor1;
			float4 _IrisExtraColorAmountA1;
			float4 _RingColorAmount1;
			float4 _EyeVeinColorAmountA1;
			float4 _EyeBallColorGlossA1;
			float4 _PupilColorEmissivenessA1;
			float3 _XYZ_Axis1;
			float _EyeReflectFactor1;
			float _LensPush1;
			float _CausticFX_inDarkness1;
			float _Rotate_Y1;
			float _LimbalRingMetalness1;
			float _EyeBallMetalness1;
			float _CausticPower1;
			float _IrisPupilMetalness1;
			float _RotateXYZ1;
			float _ScleraBumpScale1;
			float _EyeShadingPower1;
			float _SubSurfaceFromDirectionalLight1;
			float _LimbalRingGloss1;
			float _BIrisSize1;
			float _PupilSharpness1;
			float _PupilParallaxHeight1;
			float _PushParallaxMask1;
			float _PupilHeightWidth2;
			float _PupilAutoDilateFactor1;
			float _LimbalEdge_Adjustment1;
			float _EyeSize1;
			float _FullEyeFactor1;
			half _PupilSize1;
			float _Eyeball_microScatter1;
			float _LensGloss1;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask1;
			sampler2D _ParallaxMask1;
			sampler2D _IrisExtraDetail1;
			sampler2D _Sclera_Normal1;
			sampler2D _Lens_Base_Normal1;
			sampler2D _CausticMask1;
			samplerCUBE _EyeReflectCubeMap1;
			UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow1)
			UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float3 RotateYDegrees268( float3 normal, float degrees )
			{
				float alpha = degrees * UNITY_PI / 180.0;
				float sina, cosa;
								sincos(alpha, sina, cosa);
								float2x2 m = float2x2(cosa, -sina, sina, cosa);
				return float3(mul(m, normal.xz), normal.y).xzy;
			}
			
			float3 RotationMatrix287( float3 vAxis, float fAngle, float3 uvw )
			{
				// compute sin/cos of fAngle
				fAngle *= UNITY_PI / 180.0;
				float2 vSinCos;
				#ifdef OPENGL
					vSinCos.x = sin(fAngle);
					vSinCos.y = cos(fAngle);
				#else
					sincos(fAngle, vSinCos.x, vSinCos.y);
				#endif
				const float c = vSinCos.y;
				const float s = vSinCos.x;
				const float t = 1.0 - c;
				const float x = vAxis.x;
				const float y = vAxis.y;
				const float z = vAxis.z;
				float3x3 RotateMatrix = float3x3(t * x * x + c,      t * x * y - s * z,  t * x * z + s * y,
								t * x * y + s * z,  t * y * y + c,      t * y * z - s * x,
								t * x * z - s * y,  t * y * z + s * x,  t * z * z + c);
				return mul(RotateMatrix,uvw);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xyz = v.texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 texCoord163 = IN.ase_texcoord7.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_185_0 = ( ( 1.0 - texCoord163.y ) * texCoord163.y );
				#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
				float3 ase_worldlightDir = 0;
				#else //aseld
				float3 ase_worldlightDir = ( _MainLightPosition.xyz );
				#endif //aseld
				float3 _Vector2 = float3(0.15,0.06,0.4);
				float fresnelNdotV212 = dot( WorldNormal, ase_worldlightDir );
				float fresnelNode212 = ( _Vector2.x + _Vector2.y * pow( 1.0 - fresnelNdotV212, _Vector2.z ) );
				float3 temp_cast_0 = (( pow( ( temp_output_185_0 + temp_output_185_0 + temp_output_185_0 + temp_output_185_0 ) , ( 25.0 * _EyeShadingPower1 ) ) * fresnelNode212 )).xxx;
				float temp_output_2_0_g43 = _EyeShadingPower1;
				float temp_output_3_0_g43 = ( 1.0 - temp_output_2_0_g43 );
				float3 appendResult7_g43 = (float3(temp_output_3_0_g43 , temp_output_3_0_g43 , temp_output_3_0_g43));
				float3 eyeShading238 = ( ( temp_cast_0 * temp_output_2_0_g43 ) + appendResult7_g43 );
				float3 break31 = _MainLightColor.rgb;
				half FullEyeFactor11 = _FullEyeFactor1;
				float temp_output_18_0 = ( ( 1.0 - FullEyeFactor11 ) * ( (float)2 - _EyeSize1 ) );
				float2 temp_cast_3 = (temp_output_18_0).xx;
				float2 temp_cast_5 = (( ( 1.0 - temp_output_18_0 ) / 2.0 )).xx;
				float2 texCoord21 = IN.ase_texcoord7.xyz.xy * temp_cast_3 + temp_cast_5;
				float2 eyeSizeUVs22 = texCoord21;
				float4 tex2DNode26 = tex2D( _RGBMask1, eyeSizeUVs22 );
				float lerpResult30 = lerp( tex2DNode26.b , ( tex2DNode26.b - tex2DNode26.r ) , _LimbalEdge_Adjustment1);
				float clampResult34 = clamp( lerpResult30 , 0.0 , 1.0 );
				float IrisPupil_MASK38 = clampResult34;
				float clampResult48 = clamp( ( _PupilSize1 + ( ( ( ( ( break31.x + break31.y + break31.z ) / 3.0 ) * 0.0 ) * IrisPupil_MASK38 ) * ( _PupilAutoDilateFactor1 + ( _PupilAutoDilateFactor1 * FullEyeFactor11 ) ) ) ) , 0.0 , 99.0 );
				float temp_output_50_0 = ( 100.0 - ( 100.0 - clampResult48 ) );
				float2 appendResult113 = (float2(( temp_output_50_0 / 2.0 ) , ( temp_output_50_0 / ( _PupilHeightWidth2 * 2.0 ) )));
				float4 appendResult100 = (float4(temp_output_50_0 , ( temp_output_50_0 / _PupilHeightWidth2 ) , 0.0 , 0.0));
				float2 uv_ParallaxMask161 = IN.ase_texcoord7.xyz.xy;
				float4 tex2DNode61 = tex2D( _ParallaxMask1, uv_ParallaxMask161 );
				float4 lerpResult65 = lerp( float4( 0,0,0,0 ) , tex2DNode61 , _PushParallaxMask1);
				float PupilParallaxHeight64 = _PupilParallaxHeight1;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset70 = ParallaxOffset( lerpResult65.r , PupilParallaxHeight64 , ase_tanViewDir );
				float2 ParallaxPush_Vec273 = paralaxOffset70;
				float2 texCoord104 = IN.ase_texcoord7.xyz.xy * appendResult100.xy + ParallaxPush_Vec273;
				float clampResult153 = clamp( ( pow( distance( appendResult113 , texCoord104 ) , ( _PupilSharpness1 * 7.0 ) ) + ( 1.0 - IrisPupil_MASK38 ) ) , 0.0 , 1.0 );
				float PupilMaskArea156 = clampResult153;
				float Sclera_MASK101 = tex2DNode26.g;
				float clampResult129 = clamp( ( ( _EyeVeinColorAmountA1.a * 1.5 ) * Sclera_MASK101 ) , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( ( _EyeBallColorGlossA1 * ( 1.0 - IrisPupil_MASK38 ) ) , ( _EyeVeinColorAmountA1 * Sclera_MASK101 ) , clampResult129);
				float4 LimbalRing_Color135 = _RingColorAmount1;
				float LimbalRing_MASK102 = tex2DNode26.r;
				float eyeLimbalRingPower130 = ( _RingColorAmount1.a * LimbalRing_MASK102 );
				float4 lerpResult149 = lerp( lerpResult140 , LimbalRing_Color135 , eyeLimbalRingPower130);
				float IrisPupilFactor57 = ( temp_output_50_0 * 0.017 );
				float eyeSizing71 = ( ( ( (float)10 - _BIrisSize1 ) * temp_output_18_0 ) + temp_output_18_0 + IrisPupilFactor57 );
				float2 temp_cast_11 = (eyeSizing71).xx;
				float2 texCoord86 = IN.ase_texcoord7.xyz.xy * temp_cast_11 + ( ( ParallaxPush_Vec273 * float2( 0.15,0.15 ) ) + ( ( 1.0 - eyeSizing71 ) / 2.0 ) );
				float4 BaseIrisColors151 = ( ( ( ( tex2D( _IrisExtraDetail1, texCoord86 ) * _IrisExtraColorAmountA1 ) * _IrisExtraColorAmountA1.a ) * IrisPupil_MASK38 ) + ( IrisPupil_MASK38 * _IrisBaseColor1 ) );
				float4 temp_output_173_0 = ( PupilMaskArea156 * ( ( lerpResult149 * lerpResult149 ) + BaseIrisColors151 ) );
				float _MinimumGlow1_Instance = UNITY_ACCESS_INSTANCED_PROP(NewAmplifyShader,_MinimumGlow1);
				float clampResult187 = clamp( ( 0.0 * PupilMaskArea156 ) , _MinimumGlow1_Instance , 1.0 );
				float4 lerpResult224 = lerp( ( temp_output_173_0 * ( clampResult187 * 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower130);
				float4 temp_output_276_0 = ( float4( eyeShading238 , 0.0 ) * lerpResult224 );
				float fresnelNdotV94 = dot( WorldNormal, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode94 = ( 0.5 + 1.0 * pow( 1.0 - fresnelNdotV94, 1.0 ) );
				float FresnelLight126 = ( 1.0 - fresnelNode94 );
				float4 SubSurfaceArea235 = lerpResult140;
				float4 clampResult273 = clamp( ( FresnelLight126 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult218 = dot( SafeNormalize(_MainLightPosition.xyz) , WorldNormal );
				float LightComponent234 = dotResult218;
				float4 clampResult278 = clamp( ( LightComponent234 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 lerpResult307 = lerp( temp_output_276_0 , ( _MainLightColor * ( clampResult273 + clampResult278 + temp_output_276_0 ) ) , _SubSurfaceFromDirectionalLight1);
				
				float4 appendResult190 = (float4(0.0 , 0.0 , 1.0 , 0.0));
				float clampResult186 = clamp( ( ( 1.0 - IrisPupil_MASK38 ) * 0.1 ) , 0.0 , 1.0 );
				float4 temp_output_196_0 = ( appendResult190 * clampResult186 * _Eyeball_microScatter1 );
				float4 lerpResult216 = lerp( float4( float3(0,0,1) , 0.0 ) , appendResult190 , temp_output_196_0);
				float3 unpack208 = UnpackNormalScale( tex2D( _Sclera_Normal1, eyeSizeUVs22 ), _ScleraBumpScale1 );
				unpack208.z = lerp( 1, unpack208.z, saturate(_ScleraBumpScale1) );
				float3 lerpResult220 = lerp( float3(0,0,1) , UnpackNormalScale( tex2D( _Lens_Base_Normal1, eyeSizeUVs22 ), 1.0f ) , _LensPush1);
				float3 lerpResult229 = lerp( BlendNormal( lerpResult216.xyz , unpack208 ) , lerpResult220 , IrisPupil_MASK38);
				float3 NORMAL_OUTPUT304 = lerpResult229;
				
				float2 paralaxOffset83 = ParallaxOffset( tex2DNode61.r , ( PupilParallaxHeight64 * 0.03 ) , ase_tanViewDir );
				float2 texCoord88 = IN.ase_texcoord7.xyz.xy * float2( 0,0 ) + paralaxOffset83;
				float2 ParallaxOffset_Vec295 = texCoord88;
				float2 eyeLocalUV133 = ( eyeSizeUVs22 + ParallaxOffset_Vec295 );
				float cos150 = cos( SafeNormalize(_MainLightPosition.xyz).x );
				float sin150 = sin( SafeNormalize(_MainLightPosition.xyz).x );
				float2 rotator150 = mul( eyeLocalUV133 - float2( 0.5,0.5 ) , float2x2( cos150 , -sin150 , sin150 , cos150 )) + float2( 0.5,0.5 );
				float4 tex2DNode155 = tex2D( _CausticMask1, rotator150 );
				float clampResult148 = clamp( ( ( FresnelLight126 + 0.5 ) * 1.25 ) , 0.0 , 1.0 );
				float4 lerpResult184 = lerp( ( BaseIrisColors151 + ( BaseIrisColors151 * tex2DNode155 * ( _CausticPower1 * clampResult148 ) ) ) , ( BaseIrisColors151 + ( BaseIrisColors151 * tex2DNode155 * _CausticPower1 ) ) , _CausticFX_inDarkness1);
				float4 clampResult199 = clamp( lerpResult184 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				float4 caustEmissission262 = clampResult199;
				float causticInDark265 = _CausticFX_inDarkness1;
				float4 BaseColoring198 = ( PupilMaskArea156 * _MinimumGlow1_Instance * temp_output_173_0 );
				float4 clampResult246 = clamp( ( lerpResult224 + lerpResult224 + ( BaseColoring198 + ( clampResult199 * PupilMaskArea156 ) ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float temp_output_245_0 = ( _PupilColorEmissivenessA1.a * ( 1.0 - PupilMaskArea156 ) );
				float4 lerpResult249 = lerp( clampResult246 , lerpResult224 , temp_output_245_0);
				float4 PreEmissive271 = lerpResult249;
				float4 PupilGlow299 = ( _PupilColorEmissivenessA1 * temp_output_245_0 );
				float3 vAxis287 = _XYZ_Axis1;
				float fAngle287 = _RotateXYZ1;
				float3 tanNormal242 = lerpResult229;
				float3 worldNormal242 = float3(dot(tanToWorld0,tanNormal242), dot(tanToWorld1,tanNormal242), dot(tanToWorld2,tanNormal242));
				float3 normal268 = reflect( -WorldViewDirection , worldNormal242 );
				float degrees268 = _Rotate_Y1;
				float3 localRotateYDegrees268 = RotateYDegrees268( normal268 , degrees268 );
				float3 uvw287 = localRotateYDegrees268;
				float3 localRotationMatrix287 = RotationMatrix287( vAxis287 , fAngle287 , uvw287 );
				
				float clampResult302 = clamp( ( ( LimbalRing_MASK102 * _LimbalRingMetalness1 ) + ( _EyeBallMetalness1 * ( 1.0 - IrisPupil_MASK38 ) ) + ( IrisPupil_MASK38 * _IrisPupilMetalness1 ) ) , 0.0 , 1.0 );
				float METALNESS_OUTPUT308 = clampResult302;
				
				float EyeBallGloss239 = _EyeBallColorGlossA1.a;
				float lerpResult283 = lerp( EyeBallGloss239 , ( _LensGloss1 * IrisPupil_MASK38 ) , IrisPupil_MASK38);
				float4 microScatter255 = temp_output_196_0;
				float lerpResult298 = lerp( ( ( _LimbalRingGloss1 * LimbalRing_MASK102 ) + lerpResult283 ) , 0.0 , ( ( 1.0 - IrisPupil_MASK38 ) * microScatter255 ).x);
				float SMOOTHNESS_OUTPUT306 = lerpResult298;
				
				float3 Albedo = ( lerpResult307 + _MainLightColor ).rgb;
				float3 Normal = NORMAL_OUTPUT304;
				float3 Emission = ( ( ( ( caustEmissission262 * causticInDark265 ) + ( _MainLightColor * PreEmissive271 ) ) * PupilMaskArea156 ) + PupilGlow299 + ( _EyeReflectFactor1 * texCUBE( _EyeReflectCubeMap1, localRotationMatrix287 ) * IrisPupil_MASK38 ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = METALNESS_OUTPUT308;
				float Smoothness = SMOOTHNESS_OUTPUT306;
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				
				// inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				// inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100202

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _IrisBaseColor1;
			float4 _IrisExtraColorAmountA1;
			float4 _RingColorAmount1;
			float4 _EyeVeinColorAmountA1;
			float4 _EyeBallColorGlossA1;
			float4 _PupilColorEmissivenessA1;
			float3 _XYZ_Axis1;
			float _EyeReflectFactor1;
			float _LensPush1;
			float _CausticFX_inDarkness1;
			float _Rotate_Y1;
			float _LimbalRingMetalness1;
			float _EyeBallMetalness1;
			float _CausticPower1;
			float _IrisPupilMetalness1;
			float _RotateXYZ1;
			float _ScleraBumpScale1;
			float _EyeShadingPower1;
			float _SubSurfaceFromDirectionalLight1;
			float _LimbalRingGloss1;
			float _BIrisSize1;
			float _PupilSharpness1;
			float _PupilParallaxHeight1;
			float _PushParallaxMask1;
			float _PupilHeightWidth2;
			float _PupilAutoDilateFactor1;
			float _LimbalEdge_Adjustment1;
			float _EyeSize1;
			float _FullEyeFactor1;
			half _PupilSize1;
			float _Eyeball_microScatter1;
			float _LensGloss1;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
			UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)


			
			float3 _LightDirection;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100202

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _IrisBaseColor1;
			float4 _IrisExtraColorAmountA1;
			float4 _RingColorAmount1;
			float4 _EyeVeinColorAmountA1;
			float4 _EyeBallColorGlossA1;
			float4 _PupilColorEmissivenessA1;
			float3 _XYZ_Axis1;
			float _EyeReflectFactor1;
			float _LensPush1;
			float _CausticFX_inDarkness1;
			float _Rotate_Y1;
			float _LimbalRingMetalness1;
			float _EyeBallMetalness1;
			float _CausticPower1;
			float _IrisPupilMetalness1;
			float _RotateXYZ1;
			float _ScleraBumpScale1;
			float _EyeShadingPower1;
			float _SubSurfaceFromDirectionalLight1;
			float _LimbalRingGloss1;
			float _BIrisSize1;
			float _PupilSharpness1;
			float _PupilParallaxHeight1;
			float _PushParallaxMask1;
			float _PupilHeightWidth2;
			float _PupilAutoDilateFactor1;
			float _LimbalEdge_Adjustment1;
			float _EyeSize1;
			float _FullEyeFactor1;
			half _PupilSize1;
			float _Eyeball_microScatter1;
			float _LensGloss1;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
			UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}
		
		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100202

			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"

			// //#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma multi_compile_instancing


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _IrisBaseColor1;
			float4 _IrisExtraColorAmountA1;
			float4 _RingColorAmount1;
			float4 _EyeVeinColorAmountA1;
			float4 _EyeBallColorGlossA1;
			float4 _PupilColorEmissivenessA1;
			float3 _XYZ_Axis1;
			float _EyeReflectFactor1;
			float _LensPush1;
			float _CausticFX_inDarkness1;
			float _Rotate_Y1;
			float _LimbalRingMetalness1;
			float _EyeBallMetalness1;
			float _CausticPower1;
			float _IrisPupilMetalness1;
			float _RotateXYZ1;
			float _ScleraBumpScale1;
			float _EyeShadingPower1;
			float _SubSurfaceFromDirectionalLight1;
			float _LimbalRingGloss1;
			float _BIrisSize1;
			float _PupilSharpness1;
			float _PupilParallaxHeight1;
			float _PushParallaxMask1;
			float _PupilHeightWidth2;
			float _PupilAutoDilateFactor1;
			float _LimbalEdge_Adjustment1;
			float _EyeSize1;
			float _FullEyeFactor1;
			half _PupilSize1;
			float _Eyeball_microScatter1;
			float _LensGloss1;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask1;
			sampler2D _ParallaxMask1;
			sampler2D _IrisExtraDetail1;
			sampler2D _CausticMask1;
			samplerCUBE _EyeReflectCubeMap1;
			sampler2D _Sclera_Normal1;
			sampler2D _Lens_Base_Normal1;
			UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow1)
			UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			float3 RotateYDegrees268( float3 normal, float degrees )
			{
				float alpha = degrees * UNITY_PI / 180.0;
				float sina, cosa;
								sincos(alpha, sina, cosa);
								float2x2 m = float2x2(cosa, -sina, sina, cosa);
				return float3(mul(m, normal.xz), normal.y).xzy;
			}
			
			float3 RotationMatrix287( float3 vAxis, float fAngle, float3 uvw )
			{
				// compute sin/cos of fAngle
				fAngle *= UNITY_PI / 180.0;
				float2 vSinCos;
				#ifdef OPENGL
					vSinCos.x = sin(fAngle);
					vSinCos.y = cos(fAngle);
				#else
					sincos(fAngle, vSinCos.x, vSinCos.y);
				#endif
				const float c = vSinCos.y;
				const float s = vSinCos.x;
				const float t = 1.0 - c;
				const float x = vAxis.x;
				const float y = vAxis.y;
				const float z = vAxis.z;
				float3x3 RotateMatrix = float3x3(t * x * x + c,      t * x * y - s * z,  t * x * z + s * y,
								t * x * y + s * z,  t * y * y + c,      t * y * z - s * x,
								t * x * z - s * y,  t * y * z + s * x,  t * z * z + c);
				return mul(RotateMatrix,uvw);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xyz = v.ase_texcoord.xyz;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 texCoord163 = IN.ase_texcoord2.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_185_0 = ( ( 1.0 - texCoord163.y ) * texCoord163.y );
				#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
				float3 ase_worldlightDir = 0;
				#else //aseld
				float3 ase_worldlightDir = ( _MainLightPosition.xyz);				
				#endif //aseld
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 _Vector2 = float3(0.15,0.06,0.4);
				float fresnelNdotV212 = dot( ase_worldNormal, ase_worldlightDir );
				float fresnelNode212 = ( _Vector2.x + _Vector2.y * pow( 1.0 - fresnelNdotV212, _Vector2.z ) );
				float3 temp_cast_0 = (( pow( ( temp_output_185_0 + temp_output_185_0 + temp_output_185_0 + temp_output_185_0 ) , ( 25.0 * _EyeShadingPower1 ) ) * fresnelNode212 )).xxx;
				float temp_output_2_0_g43 = _EyeShadingPower1;
				float temp_output_3_0_g43 = ( 1.0 - temp_output_2_0_g43 );
				float3 appendResult7_g43 = (float3(temp_output_3_0_g43 , temp_output_3_0_g43 , temp_output_3_0_g43));
				float3 eyeShading238 = ( ( temp_cast_0 * temp_output_2_0_g43 ) + appendResult7_g43 );
				float3 break31 = _MainLightColor.rgb;
				half FullEyeFactor11 = _FullEyeFactor1;
				float temp_output_18_0 = ( ( 1.0 - FullEyeFactor11 ) * ( (float)2 - _EyeSize1 ) );
				float2 temp_cast_3 = (temp_output_18_0).xx;
				float2 temp_cast_5 = (( ( 1.0 - temp_output_18_0 ) / 2.0 )).xx;
				float2 texCoord21 = IN.ase_texcoord2.xyz.xy * temp_cast_3 + temp_cast_5;
				float2 eyeSizeUVs22 = texCoord21;
				float4 tex2DNode26 = tex2D( _RGBMask1, eyeSizeUVs22 );
				float lerpResult30 = lerp( tex2DNode26.b , ( tex2DNode26.b - tex2DNode26.r ) , _LimbalEdge_Adjustment1);
				float clampResult34 = clamp( lerpResult30 , 0.0 , 1.0 );
				float IrisPupil_MASK38 = clampResult34;
				float clampResult48 = clamp( ( _PupilSize1 + ( ( ( ( ( break31.x + break31.y + break31.z ) / 3.0 ) * 0.0 ) * IrisPupil_MASK38 ) * ( _PupilAutoDilateFactor1 + ( _PupilAutoDilateFactor1 * FullEyeFactor11 ) ) ) ) , 0.0 , 99.0 );
				float temp_output_50_0 = ( 100.0 - ( 100.0 - clampResult48 ) );
				float2 appendResult113 = (float2(( temp_output_50_0 / 2.0 ) , ( temp_output_50_0 / ( _PupilHeightWidth2 * 2.0 ) )));
				float4 appendResult100 = (float4(temp_output_50_0 , ( temp_output_50_0 / _PupilHeightWidth2 ) , 0.0 , 0.0));
				float2 uv_ParallaxMask161 = IN.ase_texcoord2.xyz.xy;
				float4 tex2DNode61 = tex2D( _ParallaxMask1, uv_ParallaxMask161 );
				float4 lerpResult65 = lerp( float4( 0,0,0,0 ) , tex2DNode61 , _PushParallaxMask1);
				float PupilParallaxHeight64 = _PupilParallaxHeight1;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset70 = ParallaxOffset( lerpResult65.r , PupilParallaxHeight64 , ase_tanViewDir );
				float2 ParallaxPush_Vec273 = paralaxOffset70;
				float2 texCoord104 = IN.ase_texcoord2.xyz.xy * appendResult100.xy + ParallaxPush_Vec273;
				float clampResult153 = clamp( ( pow( distance( appendResult113 , texCoord104 ) , ( _PupilSharpness1 * 7.0 ) ) + ( 1.0 - IrisPupil_MASK38 ) ) , 0.0 , 1.0 );
				float PupilMaskArea156 = clampResult153;
				float Sclera_MASK101 = tex2DNode26.g;
				float clampResult129 = clamp( ( ( _EyeVeinColorAmountA1.a * 1.5 ) * Sclera_MASK101 ) , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( ( _EyeBallColorGlossA1 * ( 1.0 - IrisPupil_MASK38 ) ) , ( _EyeVeinColorAmountA1 * Sclera_MASK101 ) , clampResult129);
				float4 LimbalRing_Color135 = _RingColorAmount1;
				float LimbalRing_MASK102 = tex2DNode26.r;
				float eyeLimbalRingPower130 = ( _RingColorAmount1.a * LimbalRing_MASK102 );
				float4 lerpResult149 = lerp( lerpResult140 , LimbalRing_Color135 , eyeLimbalRingPower130);
				float IrisPupilFactor57 = ( temp_output_50_0 * 0.017 );
				float eyeSizing71 = ( ( ( (float)10 - _BIrisSize1 ) * temp_output_18_0 ) + temp_output_18_0 + IrisPupilFactor57 );
				float2 temp_cast_11 = (eyeSizing71).xx;
				float2 texCoord86 = IN.ase_texcoord2.xyz.xy * temp_cast_11 + ( ( ParallaxPush_Vec273 * float2( 0.15,0.15 ) ) + ( ( 1.0 - eyeSizing71 ) / 2.0 ) );
				float4 BaseIrisColors151 = ( ( ( ( tex2D( _IrisExtraDetail1, texCoord86 ) * _IrisExtraColorAmountA1 ) * _IrisExtraColorAmountA1.a ) * IrisPupil_MASK38 ) + ( IrisPupil_MASK38 * _IrisBaseColor1 ) );
				float4 temp_output_173_0 = ( PupilMaskArea156 * ( ( lerpResult149 * lerpResult149 ) + BaseIrisColors151 ) );
				float _MinimumGlow1_Instance = UNITY_ACCESS_INSTANCED_PROP(NewAmplifyShader,_MinimumGlow1);
				float clampResult187 = clamp( ( 0.0 * PupilMaskArea156 ) , _MinimumGlow1_Instance , 1.0 );
				float4 lerpResult224 = lerp( ( temp_output_173_0 * ( clampResult187 * 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower130);
				float4 temp_output_276_0 = ( float4( eyeShading238 , 0.0 ) * lerpResult224 );
				float fresnelNdotV94 = dot( ase_worldNormal, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode94 = ( 0.5 + 1.0 * pow( 1.0 - fresnelNdotV94, 1.0 ) );
				float FresnelLight126 = ( 1.0 - fresnelNode94 );
				float4 SubSurfaceArea235 = lerpResult140;
				float4 clampResult273 = clamp( ( FresnelLight126 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult218 = dot( SafeNormalize(_MainLightPosition.xyz) , ase_worldNormal );
				float LightComponent234 = dotResult218;
				float4 clampResult278 = clamp( ( LightComponent234 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 lerpResult307 = lerp( temp_output_276_0 , ( _MainLightColor * ( clampResult273 + clampResult278 + temp_output_276_0 ) ) , _SubSurfaceFromDirectionalLight1);
				
				float2 paralaxOffset83 = ParallaxOffset( tex2DNode61.r , ( PupilParallaxHeight64 * 0.03 ) , ase_tanViewDir );
				float2 texCoord88 = IN.ase_texcoord2.xyz.xy * float2( 0,0 ) + paralaxOffset83;
				float2 ParallaxOffset_Vec295 = texCoord88;
				float2 eyeLocalUV133 = ( eyeSizeUVs22 + ParallaxOffset_Vec295 );
				float cos150 = cos( SafeNormalize(_MainLightPosition.xyz).x );
				float sin150 = sin( SafeNormalize(_MainLightPosition.xyz).x );
				float2 rotator150 = mul( eyeLocalUV133 - float2( 0.5,0.5 ) , float2x2( cos150 , -sin150 , sin150 , cos150 )) + float2( 0.5,0.5 );
				float4 tex2DNode155 = tex2D( _CausticMask1, rotator150 );
				float clampResult148 = clamp( ( ( FresnelLight126 + 0.5 ) * 1.25 ) , 0.0 , 1.0 );
				float4 lerpResult184 = lerp( ( BaseIrisColors151 + ( BaseIrisColors151 * tex2DNode155 * ( _CausticPower1 * clampResult148 ) ) ) , ( BaseIrisColors151 + ( BaseIrisColors151 * tex2DNode155 * _CausticPower1 ) ) , _CausticFX_inDarkness1);
				float4 clampResult199 = clamp( lerpResult184 , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				float4 caustEmissission262 = clampResult199;
				float causticInDark265 = _CausticFX_inDarkness1;
				float4 BaseColoring198 = ( PupilMaskArea156 * _MinimumGlow1_Instance * temp_output_173_0 );
				float4 clampResult246 = clamp( ( lerpResult224 + lerpResult224 + ( BaseColoring198 + ( clampResult199 * PupilMaskArea156 ) ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float temp_output_245_0 = ( _PupilColorEmissivenessA1.a * ( 1.0 - PupilMaskArea156 ) );
				float4 lerpResult249 = lerp( clampResult246 , lerpResult224 , temp_output_245_0);
				float4 PreEmissive271 = lerpResult249;
				float4 PupilGlow299 = ( _PupilColorEmissivenessA1 * temp_output_245_0 );
				float3 vAxis287 = _XYZ_Axis1;
				float fAngle287 = _RotateXYZ1;
				float4 appendResult190 = (float4(0.0 , 0.0 , 1.0 , 0.0));
				float clampResult186 = clamp( ( ( 1.0 - IrisPupil_MASK38 ) * 0.1 ) , 0.0 , 1.0 );
				float4 temp_output_196_0 = ( appendResult190 * clampResult186 * _Eyeball_microScatter1 );
				float4 lerpResult216 = lerp( float4( float3(0,0,1) , 0.0 ) , appendResult190 , temp_output_196_0);
				float3 unpack208 = UnpackNormalScale( tex2D( _Sclera_Normal1, eyeSizeUVs22 ), _ScleraBumpScale1 );
				unpack208.z = lerp( 1, unpack208.z, saturate(_ScleraBumpScale1) );
				float3 lerpResult220 = lerp( float3(0,0,1) , UnpackNormalScale( tex2D( _Lens_Base_Normal1, eyeSizeUVs22 ), 1.0f ) , _LensPush1);
				float3 lerpResult229 = lerp( BlendNormal( lerpResult216.xyz , unpack208 ) , lerpResult220 , IrisPupil_MASK38);
				float3 tanNormal242 = lerpResult229;
				float3 worldNormal242 = float3(dot(tanToWorld0,tanNormal242), dot(tanToWorld1,tanNormal242), dot(tanToWorld2,tanNormal242));
				float3 normal268 = reflect( -ase_worldViewDir , worldNormal242 );
				float degrees268 = _Rotate_Y1;
				float3 localRotateYDegrees268 = RotateYDegrees268( normal268 , degrees268 );
				float3 uvw287 = localRotateYDegrees268;
				float3 localRotationMatrix287 = RotationMatrix287( vAxis287 , fAngle287 , uvw287 );
				
				
				float3 Albedo = ( lerpResult307 + _MainLightColor ).rgb;
				float3 Emission = ( ( ( ( caustEmissission262 * causticInDark265 ) + ( _MainLightColor * PreEmissive271 ) ) * PupilMaskArea156 ) + PupilGlow299 + ( _EyeReflectFactor1 * texCUBE( _EyeReflectCubeMap1, localRotationMatrix287 ) * IrisPupil_MASK38 ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100202

			#pragma enable_d3d11_debug_symbols
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			//#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma multi_compile_instancing


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _IrisBaseColor1;
			float4 _IrisExtraColorAmountA1;
			float4 _RingColorAmount1;
			float4 _EyeVeinColorAmountA1;
			float4 _EyeBallColorGlossA1;
			float4 _PupilColorEmissivenessA1;
			float3 _XYZ_Axis1;
			float _EyeReflectFactor1;
			float _LensPush1;
			float _CausticFX_inDarkness1;
			float _Rotate_Y1;
			float _LimbalRingMetalness1;
			float _EyeBallMetalness1;
			float _CausticPower1;
			float _IrisPupilMetalness1;
			float _RotateXYZ1;
			float _ScleraBumpScale1;
			float _EyeShadingPower1;
			float _SubSurfaceFromDirectionalLight1;
			float _LimbalRingGloss1;
			float _BIrisSize1;
			float _PupilSharpness1;
			float _PupilParallaxHeight1;
			float _PushParallaxMask1;
			float _PupilHeightWidth2;
			float _PupilAutoDilateFactor1;
			float _LimbalEdge_Adjustment1;
			float _EyeSize1;
			float _FullEyeFactor1;
			half _PupilSize1;
			float _Eyeball_microScatter1;
			float _LensGloss1;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _RGBMask1;
			sampler2D _ParallaxMask1;
			sampler2D _IrisExtraDetail1;
			UNITY_INSTANCING_BUFFER_START(NewAmplifyShader)
				UNITY_DEFINE_INSTANCED_PROP(float, _MinimumGlow1)
			UNITY_INSTANCING_BUFFER_END(NewAmplifyShader)


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 texCoord163 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_185_0 = ( ( 1.0 - texCoord163.y ) * texCoord163.y );
				#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
				float3 ase_worldlightDir = 0;
				#else //aseld
				float3 ase_worldlightDir = ( _MainLightPosition.xyz );
				#endif //aseld
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 _Vector2 = float3(0.15,0.06,0.4);
				float fresnelNdotV212 = dot( ase_worldNormal, ase_worldlightDir );
				float fresnelNode212 = ( _Vector2.x + _Vector2.y * pow( 1.0 - fresnelNdotV212, _Vector2.z ) );
				float3 temp_cast_0 = (( pow( ( temp_output_185_0 + temp_output_185_0 + temp_output_185_0 + temp_output_185_0 ) , ( 25.0 * _EyeShadingPower1 ) ) * fresnelNode212 )).xxx;
				float temp_output_2_0_g43 = _EyeShadingPower1;
				float temp_output_3_0_g43 = ( 1.0 - temp_output_2_0_g43 );
				float3 appendResult7_g43 = (float3(temp_output_3_0_g43 , temp_output_3_0_g43 , temp_output_3_0_g43));
				float3 eyeShading238 = ( ( temp_cast_0 * temp_output_2_0_g43 ) + appendResult7_g43 );
				float3 break31 = _MainLightColor.rgb;
				half FullEyeFactor11 = _FullEyeFactor1;
				float temp_output_18_0 = ( ( 1.0 - FullEyeFactor11 ) * ( (float)2 - _EyeSize1 ) );
				float2 temp_cast_3 = (temp_output_18_0).xx;
				float2 temp_cast_5 = (( ( 1.0 - temp_output_18_0 ) / 2.0 )).xx;
				float2 texCoord21 = IN.ase_texcoord2.xy * temp_cast_3 + temp_cast_5;
				float2 eyeSizeUVs22 = texCoord21;
				float4 tex2DNode26 = tex2D( _RGBMask1, eyeSizeUVs22 );
				float lerpResult30 = lerp( tex2DNode26.b , ( tex2DNode26.b - tex2DNode26.r ) , _LimbalEdge_Adjustment1);
				float clampResult34 = clamp( lerpResult30 , 0.0 , 1.0 );
				float IrisPupil_MASK38 = clampResult34;
				float clampResult48 = clamp( ( _PupilSize1 + ( ( ( ( ( break31.x + break31.y + break31.z ) / 3.0 ) * 0.0 ) * IrisPupil_MASK38 ) * ( _PupilAutoDilateFactor1 + ( _PupilAutoDilateFactor1 * FullEyeFactor11 ) ) ) ) , 0.0 , 99.0 );
				float temp_output_50_0 = ( 100.0 - ( 100.0 - clampResult48 ) );
				float2 appendResult113 = (float2(( temp_output_50_0 / 2.0 ) , ( temp_output_50_0 / ( _PupilHeightWidth2 * 2.0 ) )));
				float4 appendResult100 = (float4(temp_output_50_0 , ( temp_output_50_0 / _PupilHeightWidth2 ) , 0.0 , 0.0));
				float2 uv_ParallaxMask161 = IN.ase_texcoord2.xy;
				float4 tex2DNode61 = tex2D( _ParallaxMask1, uv_ParallaxMask161 );
				float4 lerpResult65 = lerp( float4( 0,0,0,0 ) , tex2DNode61 , _PushParallaxMask1);
				float PupilParallaxHeight64 = _PupilParallaxHeight1;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset70 = ParallaxOffset( lerpResult65.r , PupilParallaxHeight64 , ase_tanViewDir );
				float2 ParallaxPush_Vec273 = paralaxOffset70;
				float2 texCoord104 = IN.ase_texcoord2.xy * appendResult100.xy + ParallaxPush_Vec273;
				float clampResult153 = clamp( ( pow( distance( appendResult113 , texCoord104 ) , ( _PupilSharpness1 * 7.0 ) ) + ( 1.0 - IrisPupil_MASK38 ) ) , 0.0 , 1.0 );
				float PupilMaskArea156 = clampResult153;
				float Sclera_MASK101 = tex2DNode26.g;
				float clampResult129 = clamp( ( ( _EyeVeinColorAmountA1.a * 1.5 ) * Sclera_MASK101 ) , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( ( _EyeBallColorGlossA1 * ( 1.0 - IrisPupil_MASK38 ) ) , ( _EyeVeinColorAmountA1 * Sclera_MASK101 ) , clampResult129);
				float4 LimbalRing_Color135 = _RingColorAmount1;
				float LimbalRing_MASK102 = tex2DNode26.r;
				float eyeLimbalRingPower130 = ( _RingColorAmount1.a * LimbalRing_MASK102 );
				float4 lerpResult149 = lerp( lerpResult140 , LimbalRing_Color135 , eyeLimbalRingPower130);
				float IrisPupilFactor57 = ( temp_output_50_0 * 0.017 );
				float eyeSizing71 = ( ( ( (float)10 - _BIrisSize1 ) * temp_output_18_0 ) + temp_output_18_0 + IrisPupilFactor57 );
				float2 temp_cast_11 = (eyeSizing71).xx;
				float2 texCoord86 = IN.ase_texcoord2.xy * temp_cast_11 + ( ( ParallaxPush_Vec273 * float2( 0.15,0.15 ) ) + ( ( 1.0 - eyeSizing71 ) / 2.0 ) );
				float4 BaseIrisColors151 = ( ( ( ( tex2D( _IrisExtraDetail1, texCoord86 ) * _IrisExtraColorAmountA1 ) * _IrisExtraColorAmountA1.a ) * IrisPupil_MASK38 ) + ( IrisPupil_MASK38 * _IrisBaseColor1 ) );
				float4 temp_output_173_0 = ( PupilMaskArea156 * ( ( lerpResult149 * lerpResult149 ) + BaseIrisColors151 ) );
				float _MinimumGlow1_Instance = UNITY_ACCESS_INSTANCED_PROP(NewAmplifyShader,_MinimumGlow1);
				float clampResult187 = clamp( ( 0.0 * PupilMaskArea156 ) , _MinimumGlow1_Instance , 1.0 );
				float4 lerpResult224 = lerp( ( temp_output_173_0 * ( clampResult187 * 0.0 ) ) , float4( 0,0,0,0 ) , eyeLimbalRingPower130);
				float4 temp_output_276_0 = ( float4( eyeShading238 , 0.0 ) * lerpResult224 );
				float fresnelNdotV94 = dot( ase_worldNormal, SafeNormalize(_MainLightPosition.xyz) );
				float fresnelNode94 = ( 0.5 + 1.0 * pow( 1.0 - fresnelNdotV94, 1.0 ) );
				float FresnelLight126 = ( 1.0 - fresnelNode94 );
				float4 SubSurfaceArea235 = lerpResult140;
				float4 clampResult273 = clamp( ( FresnelLight126 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float dotResult218 = dot( SafeNormalize(_MainLightPosition.xyz) , ase_worldNormal );
				float LightComponent234 = dotResult218;
				float4 clampResult278 = clamp( ( LightComponent234 * SubSurfaceArea235 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 lerpResult307 = lerp( temp_output_276_0 , ( _MainLightColor * ( clampResult273 + clampResult278 + temp_output_276_0 ) ) , _SubSurfaceFromDirectionalLight1);
				
				
				float3 Albedo = ( lerpResult307 + _MainLightColor ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		

		
	}
	/*ase_lod*/
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18800
-1920;-152;1920;1019;-3884.517;-603.5044;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;9;-7701.158,-3472.947;Inherit;False;1277.707;559.7808;PupilControl;12;47;45;44;43;42;41;40;39;36;35;11;10;Pupil Control;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-7641.581,-2992.267;Float;False;Property;_FullEyeFactor1;[眼球整体放大]FullEyeFactor;22;0;Create;False;0;0;0;False;0;False;0;0.76;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;59;-7692.299,-2641.736;Inherit;False;2130.722;818.1102;Eye-Pupil/Iris Parallax;14;95;88;83;80;77;75;73;70;67;66;65;62;61;13;Parallax;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;-7329.122,-3004.927;Half;False;FullEyeFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-5567.19,-2244.322;Float;False;Property;_EyeSize1;[虹膜放大]EyeSize;12;0;Create;False;0;0;0;False;0;False;1;0.37;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;14;-5530.573,-2462.845;Inherit;False;11;FullEyeFactor;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;15;-5523.42,-2351.529;Float;False;Constant;_Int1;Int 0;36;0;Create;True;0;0;0;False;0;False;2;0;False;0;1;INT;0
Node;AmplifyShaderEditor.CommentaryNode;12;-5490.66,-2611.681;Inherit;False;2148.08;465.2037;Sizing;12;71;68;63;60;52;22;21;20;19;18;17;16;Sizing;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;-5300.323,-2290.129;Inherit;False;2;0;INT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;16;-5312.279,-2424.963;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-5107.13,-2390.88;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;19;-5036.833,-2252.43;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;20;-4817.466,-2225.525;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-4633.523,-2319.562;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;22;-4138.287,-2307.166;Float;False;eyeSizeUVs;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;23;-5443.611,-2101.304;Inherit;False;1296.923;486.1872;Eye Local UV setup and RGB masking for Sclera, Limbal Ring and Iris Area;11;133;123;107;102;101;34;30;29;27;26;24;RGB Mixer map;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;-5425.828,-1879.945;Inherit;False;22;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;25;-8626.742,-3728.027;Inherit;False;889.9717;218.2189;Comment;4;37;32;31;28;GetLightColorIntensity;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;26;-5050.707,-2044.611;Inherit;True;Property;_RGBMask1;RGBMask;0;1;[NoScaleOffset];Create;True;0;0;0;False;1;Header(Main Textures);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;29;-4616.957,-1904.945;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-4959.815,-1711.201;Float;False;Property;_LimbalEdge_Adjustment1;LimbalEdge_Adjustment;9;0;Create;True;0;0;0;False;0;False;0;0.457;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;28;-8594.344,-3680.208;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;30;-4448.732,-1835.844;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;31;-8410.912,-3669.488;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;33;-4117.238,-2101.161;Inherit;False;1320.225;575.4196;Make Metalness;11;308;302;290;282;274;269;261;260;254;251;38;Metalness;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;34;-4278.175,-1780.456;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;32;-8120.032,-3676.538;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;37;-7889.355,-3660.165;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-7616.731,-3221.17;Float;False;Property;_PupilAutoDilateFactor1;[瞳孔大小]PupilAutoDilateFactor;32;0;Create;False;0;0;0;False;0;False;0;10.9;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;38;-4082.621,-1727.523;Float;False;IrisPupil_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-7107.241,-3081.346;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-7649.981,-3310.775;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-7336.387,-3421.972;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-7196.063,-3354.648;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-7100.111,-3227.75;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-6960.869,-3320.341;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;45;-7631.791,-3121.546;Half;False;Property;_PupilSize1;[瞳孔大小]PupilSize;33;0;Create;False;0;0;0;False;0;False;70;32.7;0.001;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;47;-6785.09,-3222.679;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;48;-6294.683,-3294.452;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;99;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;46;-6294.545,-3379.354;Inherit;False;3085.553;637.4598;Pupil;23;156;153;144;136;131;122;120;116;113;106;104;100;99;98;93;91;90;82;57;53;51;50;49;Pupil Control - UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;49;-6112.716,-3348.77;Inherit;False;2;0;FLOAT;100;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;50;-6003.608,-3303.696;Inherit;False;2;0;FLOAT;100;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-6255.152,-3135.309;Float;False;Constant;_IrisPupilBond1;Iris-Pupil-Bond;23;0;Create;True;0;0;0;False;0;False;0.017;0.017;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;55;-4976.787,-2664.793;Float;False;Constant;_Int2;Int 1;36;0;Create;True;0;0;0;False;0;False;10;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-5163.454,-2552.113;Float;False;Property;_BIrisSize1;[虹膜纹理放大]IrisSize;13;0;Create;False;0;0;0;False;0;False;1;8.33;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;54;-7687.881,-2867.368;Inherit;False;733.9878;169.0557;ParallaxHeight Variable;2;64;56;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;-5859.779,-3178.705;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-7637.881,-2817.37;Float;False;Property;_PupilParallaxHeight1;PupilParallaxHeight;36;0;Create;True;0;0;0;False;0;False;2.5;0;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;58;-4743.345,-2613.375;Inherit;False;2;0;INT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;57;-5713.419,-3078.297;Float;False;IrisPupilFactor;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-6965.669,-2418.599;Float;False;Property;_PushParallaxMask1;PushParallaxMask;35;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;61;-7642.299,-2572.354;Inherit;True;Property;_ParallaxMask1;ParallaxMask;34;1;[NoScaleOffset];Create;True;0;0;0;False;1;Header(Parallax Control);False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;60;-4386.682,-2374.745;Inherit;False;57;IrisPupilFactor;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;64;-7235.893,-2813.313;Float;False;PupilParallaxHeight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-4518.637,-2543.544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;65;-6604.981,-2591.736;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;66;-6580.664,-2297.523;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;67;-6603.555,-2399.847;Inherit;False;64;PupilParallaxHeight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;68;-4110.967,-2487.273;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;69;-3946.02,308.4229;Inherit;False;1464.509;1000.859;Inputs;18;239;135;130;128;125;117;115;112;109;103;86;85;81;79;78;76;74;72;Color Inputs;1,1,1,1;0;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;70;-6145.477,-2417.303;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;71;-3583.041,-2493.384;Float;False;eyeSizing;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-3818.02,1076.423;Inherit;False;71;eyeSizing;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;73;-5834.173,-2418.786;Float;False;ParallaxPush_Vec2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;75;-7636.367,-2159.845;Inherit;False;64;PupilParallaxHeight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;76;-3530.02,1076.423;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-3578.02,980.4229;Inherit;False;73;ParallaxPush_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-7196.608,-2150.184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.03;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;79;-3242.02,1076.423;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-3258.02,980.4229;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.15,0.15;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;77;-7215.824,-2010.039;Float;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;85;-3002.02,1044.423;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;83;-6913.322,-2088.55;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-3082.02,932.4229;Inherit;False;71;eyeSizing;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;84;1160.519,4873.205;Inherit;False;1280.288;387.6746;Improved Light Falloff with inverse Fresnel and Light Dir;4;126;110;94;87;Light falloff simple;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;82;-6230.843,-2943.626;Float;False;Property;_PupilHeightWidth2;[瞳孔形状]Pupil;30;0;Create;False;0;0;0;False;0;False;1;10;0.01;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;86;-2762.02,980.4229;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;6,6;False;1;FLOAT2;-2.5,-2.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-5783.26,-2949.158;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;87;1210.519,4945.726;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;89;-2410.764,330.825;Inherit;False;1171.74;940.1422;IrisFunk;14;235;149;142;141;140;137;129;127;111;108;105;97;96;92;Iris mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;91;-5572.926,-3260.101;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;88;-6597.885,-2137.905;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;93;-5467.572,-3108.021;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;95;-6122.586,-2141.37;Float;False;ParallaxOffset_Vec2;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;98;-5427.657,-2962.129;Inherit;False;2;0;FLOAT;2;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;99;-5435.036,-3162.559;Inherit;False;73;ParallaxPush_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;100;-5381.415,-3278.413;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-4567.661,-1988.395;Float;False;Sclera_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;94;1520.446,4923.205;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;96;-2373.4,1046.51;Float;False;Property;_IrisExtraColorAmountA1;[虹膜遮罩颜色]IrisExtraColor-Amount(A);6;0;Create;False;0;0;0;False;0;False;0.08088237,0.07573904,0.04698314,0.591;0.3255562,0.4716981,0.3181733,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;102;-4575.309,-2059.619;Float;False;LimbalRing_MASK;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;92;-2366.056,505.3993;Float;False;Property;_EyeVeinColorAmountA1;[血管颜色]EyeVeinColor-Amount(A);7;0;Create;False;0;0;0;False;0;False;0.375,0,0,0;0.764151,0.4645935,0.37847,0.497;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;97;-2361.127,841.0078;Inherit;True;Property;_IrisExtraDetail1;IrisExtraDetail;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;108;-2378.42,694.7272;Inherit;False;101;Sclera_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;112;-3338.02,420.4229;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;111;-1935.045,966.4279;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;109;-3897.02,563.4229;Float;False;Property;_RingColorAmount1;[虹膜边缘]_RingColorAmount;8;0;Create;False;0;0;0;False;0;False;0,0,0,0;0.990566,0.3504351,0.3504351,0.353;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;105;-2058.322,622.6638;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-5057.317,-2966.95;Float;False;Property;_PupilSharpness1;[瞳孔模糊]PupilSharpness;31;0;Create;False;0;0;0;False;0;False;5;0.1;0.1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;110;1811.388,4922.458;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;114;-1215.608,397.9982;Inherit;False;2366.183;1252.259;Mixing;28;288;283;275;259;258;256;253;247;244;198;188;187;177;173;172;171;169;168;167;159;157;151;145;138;134;124;121;119;Extra Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;107;-5393.611,-1723.613;Inherit;False;95;ParallaxOffset_Vec2;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;104;-5138.388,-3293.523;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;103;-3887.02,771.4229;Inherit;False;102;LimbalRing_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;113;-5191.599,-3063.485;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;-1185.704,1225.108;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;121;-1164.092,1314.607;Float;False;Property;_IrisBaseColor1;[虹膜颜色]IrisBaseColor;5;0;Create;False;0;0;0;False;0;False;0.4999702,0.5441177,0.4641004,1;0.1320737,0.1160314,0.0679053,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-914.2753,1043.834;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;117;-2922.02,436.4229;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-3466.02,692.4229;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;123;-5112.605,-1805.008;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;118;-2174.839,1662.078;Inherit;False;2546.831;732.6423;IrisConeCaustics;21;265;234;218;205;199;184;179;178;176;166;164;161;160;155;150;148;147;146;143;139;132;Caustics;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-4738.608,-2968.71;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;7;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;122;-4829.745,-3224.657;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;125;-3898.02,372.4229;Float;False;Property;_EyeBallColorGlossA1;[眼白颜色]EyeBallColor-Gloss(A);4;0;Create;False;0;0;0;False;2;Header(Color Customization);Space(6);False;1,1,1,0.853;0.8962264,0.8962264,0.8962264,0.8784314;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;2082.142,4912.219;Float;False;FresnelLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-1885.329,665.3223;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;116;-4556.411,-2944.972;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;137;-1964.29,513.3885;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;135;-3578.02,548.4229;Float;False;LimbalRing_Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;-726.5911,1184.343;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;136;-4510.027,-3231.052;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;12;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-4922.672,-1797.204;Float;False;eyeLocalUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;-2698.02,356.4229;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;138;-740.1101,1067.456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;131;-4141.112,-2938.06;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-1525.451,2140.068;Inherit;False;126;FresnelLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;130;-3226.02,688.4229;Float;False;eyeLimbalRingPower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;129;-1726.538,663.0223;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;145;-556.6188,1105.806;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;142;-1773.686,445.964;Inherit;False;135;LimbalRing_Color;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;141;-1794.594,370.6082;Inherit;False;130;eyeLimbalRingPower;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;139;-1261.257,2124.399;Inherit;False;ConstantBiasScale;-1;;33;63208df05c83e8e49a48ffbdce2e43a0;0;3;3;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;1.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;143;-2116.852,1926.361;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;146;-2019.877,1752.296;Inherit;False;133;eyeLocalUV;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;140;-1593.965,523.2159;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;144;-3924.964,-3031.836;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;152;-969.9802,-912.4772;Inherit;False;1832.025;501.339;Fake Microscatter effect - May be replaced with a simple noise-normalmap in a newer version;11;255;216;203;196;192;190;186;181;174;165;158;Microscatter;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;149;-1398.917,411.0445;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;153;-3714.119,-3021.409;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;151;-320.9878,1103.421;Float;False;BaseIrisColors;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;148;-953.0387,2109.186;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;147;-1222.093,1970.481;Float;False;Property;_CausticPower1;CausticPower;27;0;Create;True;0;0;0;False;0;False;17;0.5;0.5;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;150;-1392.25,1812.551;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;-1169.093,439.8913;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;155;-1108.234,1794.559;Inherit;True;Property;_CausticMask1;CausticMask;26;1;[NoScaleOffset];Create;True;0;0;0;False;1;Header(Caustic FX);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;158;-964.7411,-851.3433;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;159;-571.5522,888.3059;Inherit;False;151;BaseIrisColors;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;160;-611.9595,2063.895;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;161;-1044.642,1686.236;Inherit;False;151;BaseIrisColors;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;154;381.3518,1784.487;Inherit;False;2223.228;278.96;Final Mixing - Emissive;7;262;246;232;221;215;210;170;Final Mixing for Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;162;-1319.439,4765.151;Inherit;False;2220.814;763.4307;Eye Shading - Created local shadows around the eye (fake AO);12;238;236;226;214;212;201;197;195;185;183;180;163;Eye Shading;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-3462.994,-3020.579;Float;False;PupilMaskArea;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;167;-126.3723,978.2148;Inherit;False;156;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;169;-265.6302,853.5469;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;164;-485.1643,1928.566;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;163;-1241.417,4829.894;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;165;-708.4554,-799.775;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;166;-483.0192,1751.036;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;170;417.6811,1973.967;Inherit;False;156;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-545.5551,-669.1459;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;179;-299.814,1695.637;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-784.8859,2242.001;Float;False;Property;_CausticFX_inDarkness1;CausticFX_inDarkness;28;0;Create;True;0;0;0;False;0;False;17;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;180;-907.5562,4829.322;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;177;706.343,1538.734;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;176;-253.6477,1906.485;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;351.9084,1097.099;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;172;337.4842,1012.818;Inherit;False;156;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;136.1443,1222.384;Float;False;InstancedProperty;_MinimumGlow1;MinimumGlow;38;0;Create;True;0;0;0;False;0;False;0.2;0.229;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;185;-670.8772,4834.751;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;183;-1173.868,5196.683;Float;False;Property;_EyeShadingPower1;EyeShadingPower;37;0;Create;True;0;0;0;False;0;False;0.5;0.01;0.01;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;191;-1032.374,-219.5771;Inherit;False;2142.244;468.7774;Normal Maps;16;227;220;211;209;208;207;204;194;193;8;7;6;5;4;3;1;Normal Maps;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;188;714.004,1205.191;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;189;2224.374,1130.057;Inherit;False;950.9968;628.9937;Final Outputs and Pupil Color control;13;314;313;299;285;276;266;249;245;233;231;219;217;202;Final Gather;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;190;-53.68991,-721.0513;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-104.0462,-490.9703;Float;False;Property;_Eyeball_microScatter1;Eyeball_microScatter;39;0;Create;True;0;0;0;False;0;False;0;5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;184;-17.87671,1829.258;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;175;1179.859,1206.435;Inherit;False;1022.617;442.3356;LocalShadowPass Extra limbal Ring effect;5;224;213;206;200;182;Shadow FX;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;186;-360.6276,-573.6784;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;187;935.3569,1390.002;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;195;-1179.478,5322.481;Float;False;Constant;_Vector2;Vector 1;38;0;Create;True;0;0;0;False;0;False;0.15,0.06,0.4;0.15,0.06,0.4;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;203;-84.2998,-874.0471;Float;False;Constant;_FlatNormal1;FlatNormal;31;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;201;-404.136,4830.304;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;-761.6844,5084.564;Inherit;False;2;2;0;FLOAT;25;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;204;119.6264,-123.5771;Float;False;Property;_ScleraBumpScale1;ScleraBumpScale;11;0;Create;True;0;0;0;False;0;False;0;0.273;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;200;1498.35,1351.079;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;199;199.947,1859.407;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;198;932.129,1237.712;Float;False;BaseColoring;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;358.5757,-625.2053;Inherit;False;3;3;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;194;-584.3736,-59.57712;Inherit;False;22;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;183.6264,-187.5771;Inherit;False;22;eyeSizeUVs;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;202;2243.258,1650.284;Inherit;False;156;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;208;487.6264,-187.5771;Inherit;True;Property;_Sclera_Normal1;Sclera_Normal;2;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;215;1000.375,1826.411;Inherit;False;198;BaseColoring;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;211;-344.3736,-27.57712;Inherit;True;Property;_Lens_Base_Normal1;Lens_Base_Normal;3;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;209;-230.3736,206.4229;Float;False;Property;_LensPush1;[高光点推进]LensPush;15;0;Create;False;0;0;0;False;0;False;0.64;0.788;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;1065.912,1903.159;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;206;1681.082,1256.435;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;205;-2111.135,2201.089;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;207;-232.3736,-203.5771;Float;False;Constant;_Vector1;Vector 0;10;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;213;1353.415,1543.167;Inherit;False;130;eyeLimbalRingPower;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;216;665.094,-778.5092;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PowerNode;214;-142.632,4829.501;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;212;-782.2432,5283.618;Inherit;True;Standard;WorldNormal;LightDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;-1.13;False;2;FLOAT;0.71;False;3;FLOAT;1.21;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;217;2401.051,1595.742;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;220;279.6264,52.42288;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;221;1599.306,1896.972;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;227;679.626,116.4229;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;219;2274.609,1580.528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;224;1941.664,1500.067;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;222;1203.037,-200.2986;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;218;-1736.717,2071.978;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;225;1793.179,-154.9596;Inherit;False;809.7659;371.8926;Blend normals;2;304;229;Blends Normal maps;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;226;213.5292,4921.439;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;235;-1413.786,559.5856;Float;False;SubSurfaceArea;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;234;-1558.592,2020.802;Float;False;LightComponent;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;228;2170.658,-636.0039;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;233;2249.248,1176.707;Float;False;Property;_PupilColorEmissivenessA1;[瞳孔颜色]PupilColor-Emissiveness(A);29;0;Create;False;0;0;0;False;2;Header(Pupil Control);Space(6);False;0,0,0,0;0,0,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;229;2016.843,-42.60522;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;236;382.8826,4930.336;Inherit;False;Lerp White To;-1;;43;047d7c189c36a62438973bad9d37b1c2;0;2;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;230;2672,92.25119;Inherit;False;1881.934;962.7947;Comment;14;311;307;303;294;293;289;278;273;264;252;243;241;237;317;BestSubSurface Scatter for Eye Model 3;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;223;2208.601,-881.5397;Inherit;False;1175.634;580.9745;Eye Reflect;12;315;312;301;295;287;279;270;268;267;250;242;240;Reflect CubeMap;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;232;2212.714,1850.996;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;231;2347.599,1496.662;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;241;2722.27,526.8763;Inherit;True;235;SubSurfaceArea;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;238;651.1464,4934.172;Float;False;eyeShading;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;240;2425.807,-594.1418;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;242;2228.907,-465.4886;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;243;2738.811,142.2512;Inherit;False;126;FresnelLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;2583.223,1451.544;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;237;2722,339.2173;Inherit;False;234;LightComponent;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;246;2429.58,1834.487;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;249;2983.648,1444.724;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;250;2356.156,-728.443;Float;False;Property;_Rotate_Y1;[旋转高光]Rotate_Y;19;0;Create;False;0;0;0;False;0;False;0;219;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;252;3060.769,454.8441;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;262;471.7086,1808.217;Float;False;caustEmissission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;257;3257.574,1122.814;Inherit;False;1443.159;515.8131;FinalEmissive;11;310;309;297;296;292;286;281;277;272;271;316;Final Emissive;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;264;3061.276,247.7269;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;265;-175.4442,2236.782;Float;False;causticInDark;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;266;2654.544,1170.992;Inherit;False;238;eyeShading;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ReflectOpNode;267;2561.55,-589.6713;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CustomExpressionNode;268;2783.716,-688.1948;Float;False;float alpha = degrees * UNITY_PI / 180.0@$float sina, cosa@$				sincos(alpha, sina, cosa)@$				float2x2 m = float2x2(cosa, -sina, sina, cosa)@$return float3(mul(m, normal.xz), normal.y).xzy@;3;False;2;True;normal;FLOAT3;0,0,0;In;;Float;False;True;degrees;FLOAT;0;In;;Float;False;RotateYDegrees;True;False;0;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;273;3296.939,243.359;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;281;3585.504,1267.829;Inherit;False;265;causticInDark;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;271;3307.574,1463.085;Float;False;PreEmissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;272;3570.635,1172.814;Inherit;False;262;caustEmissission;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;279;3013.738,-694.4125;Float;False;Property;_XYZ_Axis1;XYZ_Axis;21;0;Create;True;0;0;0;False;0;False;0,0,0;1,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;278;3306.48,469.562;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;276;2969.929,1251.575;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;270;2907.738,-438.4125;Float;False;Property;_RotateXYZ1;[旋转高光]RotateXYZ;20;0;Create;False;0;0;0;False;0;False;0;-49;-360;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;277;3313.756,1293.046;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;285;2728.533,1387.512;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;292;3578.488,1372.906;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;293;3602.918,453.772;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;289;3596.537,245.424;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.CustomExpressionNode;287;3214.987,-596.8259;Float;False;// compute sin/cos of fAngle$fAngle *= UNITY_PI / 180.0@$float2 vSinCos@$#ifdef OPENGL$	vSinCos.x = sin(fAngle)@$	vSinCos.y = cos(fAngle)@$#else$	sincos(fAngle, vSinCos.x, vSinCos.y)@$#endif$const float c = vSinCos.y@$const float s = vSinCos.x@$const float t = 1.0 - c@$const float x = vAxis.x@$const float y = vAxis.y@$const float z = vAxis.z@$float3x3 RotateMatrix = float3x3(t * x * x + c,      t * x * y - s * z,  t * x * z + s * y,$				t * x * y + s * z,  t * y * y + c,      t * y * z - s * x,$				t * x * z - s * y,  t * y * z + s * x,  t * z * z + c)@$return mul(RotateMatrix,uvw)@;3;False;3;True;vAxis;FLOAT3;0,0,0;In;;Float;False;True;fAngle;FLOAT;0;In;;Float;False;True;uvw;FLOAT3;0,0,0;In;;Float;False;RotationMatrix;True;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;286;3869.063,1212.247;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;294;3427.811,753.9958;Float;False;Property;_SubSurfaceFromDirectionalLight1;SubSurfaceFromDirectionalLight;40;0;Create;True;0;0;0;False;0;False;0.5;0.785;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;297;4079.524,1305.279;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;299;2946.866,1372.685;Float;False;PupilGlow;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;300;3402.456,-703.6221;Inherit;True;Property;_EyeReflectCubeMap1;[反射高光]EyeReflectCubeMap;16;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;301;2703.352,-513.4052;Inherit;True;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;2914.511,-878.9095;Float;False;Property;_EyeReflectFactor1;[高光系数]EyeReflectFactor;18;0;Create;False;0;0;0;False;0;False;0;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;296;3581.631,1523.628;Inherit;False;156;PupilMaskArea;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;303;3858.634,360.6177;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;307;4024.538,563.4062;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;305;3774.003,-686.7939;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;248;1177.936,821.3649;Inherit;False;1461.426;267.9109;Protect Iris area from eyewhite micro scatter;5;306;291;284;280;263;Mask out Microscatter;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;309;4313.317,1401.356;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;310;4239.959,1514.215;Inherit;False;299;PupilGlow;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LightColorNode;311;4066.48,899.0459;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ClampOpNode;302;-3257.475,-1767.541;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;308;-3051.975,-1930.241;Float;False;METALNESS_OUTPUT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;282;-3652.014,-1849.123;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;290;-3460.173,-1895.941;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;313;2898.175,1593.852;Inherit;False;308;METALNESS_OUTPUT;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;314;2887.112,1677.529;Inherit;False;306;SMOOTHNESS_OUTPUT;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;263;1205.936,900.4448;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;275;61.8559,627.4805;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;258;-217.1441,666.4805;Inherit;False;102;LimbalRing_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;317;4417.367,762.6461;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;256;-240.1441,591.4805;Float;False;Property;_LimbalRingGloss1;LimbalRingGloss;10;0;Create;True;0;0;0;False;0;False;0;0.408;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;316;4539.94,1412.251;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;255;606.778,-523.2199;Float;False;microScatter;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;315;2671.667,-805.7234;Float;False;Property;_ReflectScale1;[高光放大]ReflectScale;17;0;Create;False;0;0;0;False;0;False;0;4;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;239;-3578.02,468.4229;Float;False;EyeBallGloss;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;259;-608.6311,713.0101;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-4074.885,-1892.903;Float;False;Property;_EyeBallMetalness1;EyeBallMetalness;25;0;Create;True;0;0;0;False;0;False;0;0.329;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;260;-4080.737,-1631.525;Float;False;Property;_IrisPupilMetalness1;IrisPupilMetalness;24;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;274;-3770.237,-2047.161;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;291;1798.152,974.7089;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;288;240.8559,673.4805;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;284;1480.325,912.1378;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;283;-377.8953,720.8016;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;280;1199.103,990.8389;Inherit;False;255;microScatter;1;0;OBJECT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;298;2016.153,699.2566;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;312;2969.667,-785.7234;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;35;-7684.511,-3395.018;Inherit;False;PupilAffectedByLight_float;-1;;24;;0;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;306;2335.331,892.8909;Float;False;SMOOTHNESS_OUTPUT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;168;163.0722,1525.65;Inherit;False;LightDirectionZone_float;-1;;38;;0;0;0
Node;AmplifyShaderEditor.FunctionNode;174;-501.5312,-764.5059;Inherit;False;MicroScatterScale_vec2;-1;;42;;0;0;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-4097.701,-2001.969;Float;False;Property;_LimbalRingMetalness1;LimbalRingMetalness;23;0;Create;True;0;0;0;False;1;Header(Metalness);False;0;0.047;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;4909.517,972.5044;Inherit;False;304;NORMAL_OUTPUT;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;182;1229.859,1443.956;Inherit;False;LocalShadowing;-1;;40;;0;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;304;2339.945,-104.9596;Float;False;NORMAL_OUTPUT;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;-809.8334,545.9999;Inherit;False;239;EyeBallGloss;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;247;-1211.772,680.0864;Float;False;Property;_LensGloss1;[高光点放大]LensGloss;14;0;Create;False;0;0;0;False;0;False;0.98;0.133;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;-1192.579,787.8809;Inherit;False;38;IrisPupil_MASK;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;261;-3856.667,-1782.568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;-3732.724,-1719.049;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;5389.085,892.616;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;17;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;0;Hidden/InternalErrorShader;0;0;Standard;36;Workflow;1;Surface;0;  Refraction Model;0;  Blend;0;Two Sided;1;Fragment Normal Space,InvertActionOnDeselection;0;Transmission;0;  Transmission Shadow;0.5,False,-1;Translucency;0;  Translucency Strength;1,False,-1;  Normal Distortion;0.5,False,-1;  Scattering;2,False,-1;  Direct;0.9,False,-1;  Ambient;0.1,False,-1;  Shadow;0.5,False,-1;Cast Shadows;1;  Use Shadow Threshold;0;Receive Shadows;1;GPU Instancing;1;LOD CrossFade;1;Built-in Fog;1;_FinalColorxAlpha;0;Meta Pass;1;Override Baked GI;0;Extra Pre Pass;0;DOTS Instancing;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;8;False;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;8;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;5;False;False;False;False;False;False;False;False;True;0;False;-1;True;0;False;-1;False;False;False;False;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;0;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;11;0;10;0
WireConnection;17;0;15;0
WireConnection;17;1;13;0
WireConnection;16;0;14;0
WireConnection;18;0;16;0
WireConnection;18;1;17;0
WireConnection;19;0;18;0
WireConnection;20;0;19;0
WireConnection;21;0;18;0
WireConnection;21;1;20;0
WireConnection;22;0;21;0
WireConnection;26;1;24;0
WireConnection;29;0;26;3
WireConnection;29;1;26;1
WireConnection;30;0;26;3
WireConnection;30;1;29;0
WireConnection;30;2;27;0
WireConnection;31;0;28;1
WireConnection;34;0;30;0
WireConnection;32;0;31;0
WireConnection;32;1;31;1
WireConnection;32;2;31;2
WireConnection;37;0;32;0
WireConnection;38;0;34;0
WireConnection;41;0;36;0
WireConnection;41;1;11;0
WireConnection;39;0;37;0
WireConnection;42;0;39;0
WireConnection;42;1;40;0
WireConnection;43;0;36;0
WireConnection;43;1;41;0
WireConnection;44;0;42;0
WireConnection;44;1;43;0
WireConnection;47;0;45;0
WireConnection;47;1;44;0
WireConnection;48;0;47;0
WireConnection;49;1;48;0
WireConnection;50;1;49;0
WireConnection;53;0;50;0
WireConnection;53;1;51;0
WireConnection;58;0;55;0
WireConnection;58;1;52;0
WireConnection;57;0;53;0
WireConnection;64;0;56;0
WireConnection;63;0;58;0
WireConnection;63;1;18;0
WireConnection;65;1;61;0
WireConnection;65;2;62;0
WireConnection;68;0;63;0
WireConnection;68;1;18;0
WireConnection;68;2;60;0
WireConnection;70;0;65;0
WireConnection;70;1;67;0
WireConnection;70;2;66;0
WireConnection;71;0;68;0
WireConnection;73;0;70;0
WireConnection;76;0;72;0
WireConnection;80;0;75;0
WireConnection;79;0;76;0
WireConnection;78;0;74;0
WireConnection;85;0;78;0
WireConnection;85;1;79;0
WireConnection;83;0;61;0
WireConnection;83;1;80;0
WireConnection;83;2;77;0
WireConnection;86;0;81;0
WireConnection;86;1;85;0
WireConnection;90;0;82;0
WireConnection;91;0;50;0
WireConnection;91;1;82;0
WireConnection;88;1;83;0
WireConnection;93;0;50;0
WireConnection;95;0;88;0
WireConnection;98;0;50;0
WireConnection;98;1;90;0
WireConnection;100;0;50;0
WireConnection;100;1;91;0
WireConnection;101;0;26;2
WireConnection;94;4;87;0
WireConnection;102;0;26;1
WireConnection;97;1;86;0
WireConnection;111;0;97;0
WireConnection;111;1;96;0
WireConnection;105;0;92;4
WireConnection;110;0;94;0
WireConnection;104;0;100;0
WireConnection;104;1;99;0
WireConnection;113;0;93;0
WireConnection;113;1;98;0
WireConnection;119;0;111;0
WireConnection;119;1;96;4
WireConnection;117;0;112;0
WireConnection;115;0;109;4
WireConnection;115;1;103;0
WireConnection;123;0;24;0
WireConnection;123;1;107;0
WireConnection;120;0;106;0
WireConnection;122;0;113;0
WireConnection;122;1;104;0
WireConnection;126;0;110;0
WireConnection;127;0;105;0
WireConnection;127;1;108;0
WireConnection;137;0;92;0
WireConnection;137;1;108;0
WireConnection;135;0;109;0
WireConnection;134;0;124;0
WireConnection;134;1;121;0
WireConnection;136;0;122;0
WireConnection;136;1;120;0
WireConnection;133;0;123;0
WireConnection;128;0;125;0
WireConnection;128;1;117;0
WireConnection;138;0;119;0
WireConnection;138;1;124;0
WireConnection;131;0;116;0
WireConnection;130;0;115;0
WireConnection;129;0;127;0
WireConnection;145;0;138;0
WireConnection;145;1;134;0
WireConnection;139;3;132;0
WireConnection;140;0;128;0
WireConnection;140;1;137;0
WireConnection;140;2;129;0
WireConnection;144;0;136;0
WireConnection;144;1;131;0
WireConnection;149;0;140;0
WireConnection;149;1;142;0
WireConnection;149;2;141;0
WireConnection;153;0;144;0
WireConnection;151;0;145;0
WireConnection;148;0;139;0
WireConnection;150;0;146;0
WireConnection;150;2;143;1
WireConnection;157;0;149;0
WireConnection;157;1;149;0
WireConnection;155;1;150;0
WireConnection;160;0;147;0
WireConnection;160;1;148;0
WireConnection;156;0;153;0
WireConnection;169;0;157;0
WireConnection;169;1;159;0
WireConnection;164;0;161;0
WireConnection;164;1;155;0
WireConnection;164;2;147;0
WireConnection;165;0;158;0
WireConnection;166;0;161;0
WireConnection;166;1;155;0
WireConnection;166;2;160;0
WireConnection;181;0;165;0
WireConnection;179;0;161;0
WireConnection;179;1;166;0
WireConnection;180;0;163;2
WireConnection;177;1;170;0
WireConnection;176;0;161;0
WireConnection;176;1;164;0
WireConnection;173;0;167;0
WireConnection;173;1;169;0
WireConnection;185;0;180;0
WireConnection;185;1;163;2
WireConnection;188;0;172;0
WireConnection;188;1;171;0
WireConnection;188;2;173;0
WireConnection;184;0;179;0
WireConnection;184;1;176;0
WireConnection;184;2;178;0
WireConnection;186;0;181;0
WireConnection;187;0;177;0
WireConnection;187;1;171;0
WireConnection;201;0;185;0
WireConnection;201;1;185;0
WireConnection;201;2;185;0
WireConnection;201;3;185;0
WireConnection;197;1;183;0
WireConnection;200;0;187;0
WireConnection;199;0;184;0
WireConnection;198;0;188;0
WireConnection;196;0;190;0
WireConnection;196;1;186;0
WireConnection;196;2;192;0
WireConnection;208;1;193;0
WireConnection;208;5;204;0
WireConnection;211;1;194;0
WireConnection;210;0;199;0
WireConnection;210;1;170;0
WireConnection;206;0;173;0
WireConnection;206;1;200;0
WireConnection;216;0;203;0
WireConnection;216;1;190;0
WireConnection;216;2;196;0
WireConnection;214;0;201;0
WireConnection;214;1;197;0
WireConnection;212;1;195;1
WireConnection;212;2;195;2
WireConnection;212;3;195;3
WireConnection;217;0;202;0
WireConnection;220;0;207;0
WireConnection;220;1;211;0
WireConnection;220;2;209;0
WireConnection;221;0;215;0
WireConnection;221;1;210;0
WireConnection;219;0;217;0
WireConnection;224;0;206;0
WireConnection;224;2;213;0
WireConnection;222;0;216;0
WireConnection;222;1;208;0
WireConnection;218;0;143;0
WireConnection;218;1;205;0
WireConnection;226;0;214;0
WireConnection;226;1;212;0
WireConnection;235;0;140;0
WireConnection;234;0;218;0
WireConnection;229;0;222;0
WireConnection;229;1;220;0
WireConnection;229;2;227;0
WireConnection;236;1;226;0
WireConnection;236;2;183;0
WireConnection;232;0;224;0
WireConnection;232;1;224;0
WireConnection;232;2;221;0
WireConnection;231;0;219;0
WireConnection;238;0;236;0
WireConnection;240;0;228;0
WireConnection;242;0;229;0
WireConnection;245;0;233;4
WireConnection;245;1;231;0
WireConnection;246;0;232;0
WireConnection;249;0;246;0
WireConnection;249;1;224;0
WireConnection;249;2;245;0
WireConnection;252;0;237;0
WireConnection;252;1;241;0
WireConnection;262;0;199;0
WireConnection;264;0;243;0
WireConnection;264;1;241;0
WireConnection;265;0;178;0
WireConnection;267;0;240;0
WireConnection;267;1;242;0
WireConnection;268;0;267;0
WireConnection;268;1;250;0
WireConnection;273;0;264;0
WireConnection;271;0;249;0
WireConnection;278;0;252;0
WireConnection;276;0;266;0
WireConnection;276;1;224;0
WireConnection;285;0;233;0
WireConnection;285;1;245;0
WireConnection;292;0;277;0
WireConnection;292;1;271;0
WireConnection;293;0;273;0
WireConnection;293;1;278;0
WireConnection;293;2;276;0
WireConnection;287;0;279;0
WireConnection;287;1;270;0
WireConnection;287;2;268;0
WireConnection;286;0;272;0
WireConnection;286;1;281;0
WireConnection;297;0;286;0
WireConnection;297;1;292;0
WireConnection;299;0;285;0
WireConnection;300;1;287;0
WireConnection;303;0;289;0
WireConnection;303;1;293;0
WireConnection;307;0;276;0
WireConnection;307;1;303;0
WireConnection;307;2;294;0
WireConnection;305;0;295;0
WireConnection;305;1;300;0
WireConnection;305;2;301;0
WireConnection;309;0;297;0
WireConnection;309;1;296;0
WireConnection;302;0;290;0
WireConnection;308;0;302;0
WireConnection;282;0;254;0
WireConnection;282;1;261;0
WireConnection;290;0;274;0
WireConnection;290;1;282;0
WireConnection;290;2;269;0
WireConnection;275;0;256;0
WireConnection;275;1;258;0
WireConnection;317;0;307;0
WireConnection;317;1;311;0
WireConnection;316;0;309;0
WireConnection;316;1;310;0
WireConnection;316;2;305;0
WireConnection;255;0;196;0
WireConnection;239;0;125;4
WireConnection;259;0;247;0
WireConnection;259;1;244;0
WireConnection;274;0;102;0
WireConnection;274;1;251;0
WireConnection;291;0;284;0
WireConnection;291;1;280;0
WireConnection;288;0;275;0
WireConnection;288;1;283;0
WireConnection;284;0;263;0
WireConnection;283;0;253;0
WireConnection;283;1;259;0
WireConnection;283;2;244;0
WireConnection;298;0;288;0
WireConnection;298;2;291;0
WireConnection;312;0;315;0
WireConnection;306;0;298;0
WireConnection;304;0;229;0
WireConnection;261;0;38;0
WireConnection;269;0;38;0
WireConnection;269;1;260;0
WireConnection;2;0;317;0
WireConnection;2;1;318;0
WireConnection;2;2;316;0
WireConnection;2;3;313;0
WireConnection;2;4;314;0
ASEEND*/
//CHKSM=965748A0CD4D062624524CF7ABFDF1C0185A7BC6