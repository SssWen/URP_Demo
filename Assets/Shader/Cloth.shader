Shader "CustomURP/Cloth"
{
    Properties
    {
        // Specular vs Metallic workflow
        [HideInInspector] _WorkflowMode("WorkflowMode", Float) = 1.0

        [MainColor] _BaseColor("Color", Color) = (1,1,1,1)
        [MainTexture] _BaseMap("Albedo", 2D) = "white" {}

        _Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5

        _Smoothness("Smoothness", Range(0.0, 1.0)) = 0.5
        _GlossMapScale("Smoothness Scale", Range(0.0, 1.0)) = 1.0
        _SmoothnessTextureChannel("Smoothness texture channel", Float) = 0

        [Gamma] _Metallic("Metallic", Range(0.0, 1.0)) = 0.0
        _MetallicGlossMap("Metallic", 2D) = "white" {}

        _SpecColor("Specular", Color) = (0.2, 0.2, 0.2)
        _SpecGlossMap("Specular", 2D) = "white" {}

        [ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
        [ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0

        _BumpScale("Scale", Float) = 1.0
        _BumpMap("Normal Map", 2D) = "bump" {}

        _OcclusionStrength("Strength", Range(0.0, 1.0)) = 1.0
        _OcclusionMap("Occlusion", 2D) = "white" {}

        _EmissionColor("Color", Color) = (0,0,0)
        _EmissionMap("Emission", 2D) = "white" {}

        // Blending state
        [HideInInspector] _Surface("__surface", Float) = 0.0
        [HideInInspector] _Blend("__blend", Float) = 0.0
        [HideInInspector] _AlphaClip("__clip", Float) = 0.0
        [HideInInspector] _SrcBlend("__src", Float) = 1.0
        [HideInInspector] _DstBlend("__dst", Float) = 0.0
        [HideInInspector] _ZWrite("__zw", Float) = 1.0
        [HideInInspector] _Cull("__cull", Float) = 2.0

        _ReceiveShadows("Receive Shadows", Float) = 1.0
        // Editmode props
        [HideInInspector] _QueueOffset("Queue offset", Float) = 0.0

        // ObsoleteProperties
        [HideInInspector] _MainTex("BaseMap", 2D) = "white" {}
        [HideInInspector] _Color("Base Color", Color) = (1, 1, 1, 1)
        [HideInInspector] _GlossMapScale("Smoothness", Float) = 0.0
        [HideInInspector] _Glossiness("Smoothness", Float) = 0.0
        [HideInInspector] _GlossyReflections("EnvironmentReflections", Float) = 0.0


        _Layer0Normal("Layer0Normal", 2D) = "black"{}

		_Layer1Tex("Layer1Tex", 2D) = "black"{}
		_Layer1Mask("Layer1Mask", 2D) = "black"{}
		_Layer1Normal("Layer1Normal", 2D) = "bump"{}
		_Layer1NormalScale("Layer1NormalScale", float) = 1
		_Layer1Color("Layer1Color", Color) = (1,1,1,1)
		_Layer1Smoothness("Layer1Smoothness", Range(-1, 1)) = 0
		_Layer1Metallic("Layer1Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer1UVSet("Layer1UVSet", float) = 0

        _Layer2Tex("Layer2Tex", 2D) = "black"{}
		_Layer2Mask("Layer2Mask", 2D) = "black"{}
		_Layer2Normal("Layer2Normal", 2D) = "bump"{}
		_Layer2NormalScale("Layer2NormalScale", float) = 1
		_Layer2Color("Layer2Color", Color) = (1,1,1,1)
		_Layer2Smoothness("Layer2Smoothness", Range(-1, 1)) = 0
		_Layer2Metallic("Layer2Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer2UVSet("Layer2UVSet", float) = 0

        _Layer3Tex("Layer3Tex", 2D) = "black"{}
		_Layer3Mask("Layer3Mask", 2D) = "black"{}
		_Layer3Normal("Layer3Normal", 2D) = "bump"{}
		_Layer3NormalScale("Layer3NormalScale", float) = 1
		_Layer3Color("Layer3Color", Color) = (1,1,1,1)
		_Layer3Smoothness("Layer3Smoothness", Range(-1, 1)) = 0
		_Layer3Metallic("Layer3Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer3UVSet("Layer3UVSet", float) = 0

        _Layer4Tex("Layer4Tex", 2D) = "black"{}
		_Layer4Mask("Layer4Mask", 2D) = "black"{}
		_Layer4Normal("Layer4Normal", 2D) = "bump"{}
		_Layer4NormalScale("Layer4NormalScale", float) = 1
		_Layer4Color("Layer4Color", Color) = (1,1,1,1)
		_Layer4Smoothness("Layer4Smoothness", Range(-1, 1)) = 0
		_Layer4Metallic("Layer4Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer4UVSet("Layer4UVSet", float) = 0

        _Layer5Tex("Layer5Tex", 2D) = "black"{}
		_Layer5Mask("Layer5Mask", 2D) = "black"{}
		_Layer5Normal("Layer5Normal", 2D) = "bump"{}
		_Layer5NormalScale("Layer5NormalScale", float) = 1
		_Layer5Color("Layer5Color", Color) = (1,1,1,1)
		_Layer5Smoothness("Layer5Smoothness", Range(-1, 1)) = 0
		_Layer5Metallic("Layer5Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer5UVSet("Layer5UVSet", float) = 0

        _Layer6Tex("Layer6Tex", 2D) = "black"{}
		_Layer6Mask("Layer6Mask", 2D) = "black"{}
		_Layer6Normal("Layer6Normal", 2D) = "bump"{}
		_Layer6NormalScale("Layer6NormalScale", float) = 1
		_Layer6Color("Layer6Color", Color) = (1,1,1,1)
		_Layer6Smoothness("Layer6Smoothness", Range(-1, 1)) = 0
		_Layer6Metallic("Layer6Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer6UVSet("Layer6UVSet", float) = 0

        _Layer7Tex("Layer7Tex", 2D) = "black"{}
		_Layer7Mask("Layer7Mask", 2D) = "black"{}
		_Layer7Normal("Layer7Normal", 2D) = "bump"{}
		_Layer7NormalScale("Layer7NormalScale", float) = 1
		_Layer7Color("Layer7Color", Color) = (1,1,1,1)
		_Layer7Smoothness("Layer7Smoothness", Range(-1, 1)) = 0
		_Layer7Metallic("Layer7Metallic", Range(-1, 1)) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3)] _Layer7UVSet("Layer7UVSet", float) = 0      
    }

    SubShader
    {
        // Universal Pipeline tag is required. If Universal render pipeline is not set in the graphics settings
        // this Subshader will fail. One can add a subshader below or fallback to Standard built-in to make this
        // material work with both Universal Render Pipeline and Builtin Unity Pipeline
        Tags{"RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" "IgnoreProjector" = "True"}
        LOD 300

        // ------------------------------------------------------------------
        //  Forward pass. Shades all light in a single pass. GI + emission + Fog
        Pass
        {
            // Lightmode matches the ShaderPassName set in UniversalRenderPipeline.cs. SRPDefaultUnlit and passes with
            // no LightMode tag are also rendered by Universal Render Pipeline
            Name "ForwardLit"
            Tags{"LightMode" = "UniversalForward"}

            Blend[_SrcBlend][_DstBlend]
            ZWrite[_ZWrite]
            Cull[_Cull]

            HLSLPROGRAM
            // Required to compile gles 2.0 with standard SRP library
            // All shaders must be compiled with HLSLcc and currently only gles is not using HLSLcc by default
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 3.5

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature _NORMALMAP
            #pragma shader_feature _ALPHATEST_ON
            #pragma shader_feature _ALPHAPREMULTIPLY_ON
            #pragma shader_feature _EMISSION
            #pragma shader_feature _METALLICSPECGLOSSMAP
            #pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
            #pragma shader_feature _OCCLUSIONMAP

            #pragma shader_feature _SPECULARHIGHLIGHTS_OFF
            #pragma shader_feature _ENVIRONMENTREFLECTIONS_OFF
            #pragma shader_feature _SPECULAR_SETUP
            #pragma shader_feature _RECEIVE_SHADOWS_OFF

            // 自定义 shader_feature
            #pragma shader_feature_local _LAYER_1_TEX
            #pragma shader_feature_local _LAYER_2_TEX
			#pragma shader_feature_local _LAYER_3_TEX
			#pragma shader_feature_local _LAYER_4_TEX
			#pragma shader_feature_local _LAYER_5_TEX
			#pragma shader_feature_local _LAYER_6_TEX
			#pragma shader_feature_local _LAYER_7_TEX
			

            #pragma shader_feature_local _LAYER_1_MASK
            #pragma shader_feature_local _LAYER_2_MASK
			#pragma shader_feature_local _LAYER_3_MASK
			#pragma shader_feature_local _LAYER_4_MASK
			#pragma shader_feature_local _LAYER_5_MASK
			#pragma shader_feature_local _LAYER_6_MASK
			#pragma shader_feature_local _LAYER_7_MASK

            // #pragma shader_feature_local _LAYER_0_NORMAL
            #pragma shader_feature_local _LAYER_1_NORMAL
            #pragma shader_feature_local _LAYER_2_NORMAL
			#pragma shader_feature_local _LAYER_3_NORMAL
			#pragma shader_feature_local _LAYER_4_NORMAL
			#pragma shader_feature_local _LAYER_5_NORMAL
			#pragma shader_feature_local _LAYER_6_NORMAL			
			#pragma shader_feature_local _LAYER_7_NORMAL			

            // #pragma shader_feature_local _Layer0UVSet_0 _Layer0UVSet_1 _Layer0UVSet_2 _Layer0UVSet_3
			#pragma shader_feature_local _Layer1UVSet_0 _Layer1UVSet_1 _Layer1UVSet_2 _Layer1UVSet_3
			#pragma shader_feature_local _Layer2UVSet_0 _Layer2UVSet_1 _Layer2UVSet_2 _Layer2UVSet_3
			#pragma shader_feature_local _Layer3UVSet_0 _Layer3UVSet_1 _Layer3UVSet_2 _Layer3UVSet_3
			#pragma shader_feature_local _Layer4UVSet_0 _Layer4UVSet_1 _Layer4UVSet_2 _Layer4UVSet_3
			#pragma shader_feature_local _Layer5UVSet_0 _Layer5UVSet_1 _Layer5UVSet_2 _Layer5UVSet_3
			#pragma shader_feature_local _Layer6UVSet_0 _Layer6UVSet_1 _Layer6UVSet_2 _Layer6UVSet_3
			#pragma shader_feature_local _Layer7UVSet_0 _Layer7UVSet_1 _Layer7UVSet_2 _Layer7UVSet_3

            
            
            

            // -------------------------------------
            // Universal Pipeline keywords
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
            #pragma multi_compile _ _SHADOWS_SOFT
            #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE

            // -------------------------------------
            // Unity defined keywords
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile_fog

            // --------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing

            #pragma vertex Cloth_LitPassVertex
            #pragma fragment Cloth_LitPassFragment
            
            // UV,metallic,smoothness,normal,layer
			#include "ClothLitInput.hlsl" 
            #include "Tools_URP.cginc" 
            // Attributes,Varyings,Attributes,vertex,frag
			#include "ClothLitForwardPass.hlsl"            
            ENDHLSL
        }

        // Pass
        // {
        //     Name "ShadowCaster"
        //     Tags{"LightMode" = "ShadowCaster"}

        //     ZWrite On
        //     ZTest LEqual
        //     Cull[_Cull]

        //     HLSLPROGRAM
        //     // Required to compile gles 2.0 with standard srp library
        //     #pragma prefer_hlslcc gles
        //     #pragma exclude_renderers d3d11_9x
        //     #pragma target 3.5

        //     // -------------------------------------
        //     // Material Keywords
        //     #pragma shader_feature_local _ALPHATEST_ON

        //     //--------------------------------------
        //     // GPU Instancing
        //     #pragma multi_compile_instancing
        //     #pragma shader_feature_local _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

        //     #pragma vertex ShadowPassVertex
        //     #pragma fragment ShadowPassFragment

        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/ShadowCasterPass.hlsl"
        //     ENDHLSL
        // }

        // Pass
        // {
        //     Name "DepthOnly"
        //     Tags{"LightMode" = "DepthOnly"}

        //     ZWrite On
        //     ColorMask 0
        //     Cull[_Cull]

        //     HLSLPROGRAM
        //     // Required to compile gles 2.0 with standard srp library
        //     #pragma prefer_hlslcc gles
        //     #pragma exclude_renderers d3d11_9x
        //     #pragma target 3.5

        //     #pragma vertex DepthOnlyVertex
        //     #pragma fragment DepthOnlyFragment

        //     // -------------------------------------
        //     // Material Keywords
        //     #pragma shader_feature_local _ALPHATEST_ON
        //     #pragma shader_feature_local _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

        //     //--------------------------------------
        //     // GPU Instancing
        //     #pragma multi_compile_instancing

        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/DepthOnlyPass.hlsl"
        //     ENDHLSL
        // }

        // // This pass it not used during regular rendering, only for lightmap baking.
        // Pass
        // {
        //     Name "Meta"
        //     Tags{"LightMode" = "Meta"}

        //     Cull Off

        //     HLSLPROGRAM
        //     // Required to compile gles 2.0 with standard srp library
        //     #pragma prefer_hlslcc gles
        //     #pragma exclude_renderers d3d11_9x

        //     #pragma vertex UniversalVertexMeta
        //     #pragma fragment UniversalFragmentMeta

        //     #pragma shader_feature_local _SPECULAR_SETUP
        //     #pragma shader_feature_local _EMISSION
        //     #pragma shader_feature_local _METALLICSPECGLOSSMAP
        //     #pragma shader_feature_local _ALPHATEST_ON
        //     #pragma shader_feature_local _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

        //     #pragma shader_feature_local _SPECGLOSSMAP

        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
        //     #include "Packages/com.unity.render-pipelines.universal/Shaders/LitMetaPass.hlsl"

        //     ENDHLSL
        // }

    }
    FallBack "Hidden/Universal Render Pipeline/FallbackError"
    CustomEditor "UnityEditor.Rendering.Universal.ShaderGUI.ClothShader"
}
