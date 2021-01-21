using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Scripting.APIUpdating;

namespace UnityEditor.Rendering.Universal.ShaderGUI
{
    [MovedFrom("UnityEditor.Rendering.LWRP.ShaderGUI")] public static class ClothGUI
    {
        public enum WorkflowMode
        {
            Specular = 0,
            Metallic
        }

        public enum SmoothnessMapChannel
        {
            SpecularMetallicAlpha,
            AlbedoAlpha,
        }

        public static class Styles
        {
            public static GUIContent workflowModeText = new GUIContent("Workflow Mode",
                "Select a workflow that fits your textures. Choose between Metallic or Specular.");

            public static GUIContent specularMapText =
                new GUIContent("Specular Map", "Sets and configures the map and color for the Specular workflow.");

            public static GUIContent metallicMapText =
                new GUIContent("Metallic Map", "Sets and configures the map for the Metallic workflow.");

            public static GUIContent smoothnessText = new GUIContent("Smoothness",
                "Controls the spread of highlights and reflections on the surface.");

            public static GUIContent smoothnessMapChannelText =
                new GUIContent("Source",
                    "Specifies where to sample a smoothness map from. By default, uses the alpha channel for your map.");

            public static GUIContent highlightsText = new GUIContent("Specular Highlights",
                "When enabled, the Material reflects the shine from direct lighting.");

            public static GUIContent reflectionsText =
                new GUIContent("Environment Reflections",
                    "When enabled, the Material samples reflections from the nearest Reflection Probes or Lighting Probe.");

            public static GUIContent occlusionText = new GUIContent("Occlusion Map",
                "Sets an occlusion map to simulate shadowing from ambient lighting.");

            public static readonly string[] metallicSmoothnessChannelNames = {"Metallic Alpha", "Albedo Alpha"};
            public static readonly string[] specularSmoothnessChannelNames = {"Specular Alpha", "Albedo Alpha"};

            public static GUIContent layer0NormalText = new GUIContent("Layer0[]", "");

            public static GUIContent layer1TexText = new GUIContent("Layer1[]", "");
            public static GUIContent layer1MaskText = new GUIContent("Layer1Mask", "");
            public static GUIContent layer1ColorText = new GUIContent("Layer1Color", "");
            public static GUIContent layer1SmoothnessText = new GUIContent("Layer1Smoothness", "");
            public static GUIContent layer1MetallicText = new GUIContent("Layer1Metallic", "");        
            public static GUIContent layer1UVSetText = new GUIContent("Layer1UVSet", "");
            public static GUIContent layer1NormalText = new GUIContent("Layer1Normal", "");

            public static GUIContent layer2TexText = new GUIContent("Layer2[]", "");
            public static GUIContent layer2MaskText = new GUIContent("Layer2Mask", "");
            public static GUIContent layer2ColorText = new GUIContent("Layer2Color", "");
            public static GUIContent layer2SmoothnessText = new GUIContent("Layer2Smoothness", "Layer2 Smoothness");
            public static GUIContent layer2MetallicText = new GUIContent("Layer2Metallic", "Layer2 Metallic");        
            public static GUIContent layer2UVSetText = new GUIContent("Layer2UVSet", "Layer2 UVSet");
            public static GUIContent layer2NormalText = new GUIContent("Layer2Normal", "Layer2 Normal Texture");
                        
            public static GUIContent layer3TexText = new GUIContent("Layer3[]", "");
            public static GUIContent layer3MaskText = new GUIContent("Layer3Mask", "");
            public static GUIContent layer3ColorText = new GUIContent("Layer3Color", "");
            public static GUIContent layer3SmoothnessText = new GUIContent("Layer3Smoothness", "");
            public static GUIContent layer3MetallicText = new GUIContent("Layer3Metallic", "");
            public static GUIContent layer3UVSetText = new GUIContent("Layer3UVSet", "");
            public static GUIContent layer3NormalText = new GUIContent("Layer3Normal", "");
            

            public static GUIContent layer4TexText = new GUIContent("Layer4[]", "");
            public static GUIContent layer4MaskText = new GUIContent("Layer4Mask", "");
            public static GUIContent layer4ColorText = new GUIContent("Layer4Color", "");
            public static GUIContent layer4SmoothnessText = new GUIContent("Layer4Smoothness", "");
            public static GUIContent layer4MetallicText = new GUIContent("Layer4Metallic", "");
            public static GUIContent layer4UVSetText = new GUIContent("Layer4UVSet", "");
            public static GUIContent layer4NormalText = new GUIContent("Layer4Normal", "");
            

            public static GUIContent layer5TexText = new GUIContent("Layer5[]", "Layer5 Texture");
            public static GUIContent layer5MaskText = new GUIContent("Layer5Mask", "");
            public static GUIContent layer5ColorText = new GUIContent("Layer5Color", "Layer5 Color");
            public static GUIContent layer5SmoothnessText = new GUIContent("Layer5Smoothness", "Layer5 Smoothness");
            public static GUIContent layer5MetallicText = new GUIContent("Layer5Metallic", "Layer5 Metallic");
            public static GUIContent layer5UVSetText = new GUIContent("Layer5UVSet", "Layer5 UVSet");
            public static GUIContent layer5NormalText = new GUIContent("Layer5Normal", "Layer5 Normal Texture");
            

            public static GUIContent layer6TexText = new GUIContent("Layer6[]", "Layer6 Texture");
            public static GUIContent layer6MaskText = new GUIContent("Layer6Mask", "");
            public static GUIContent layer6ColorText = new GUIContent("Layer6Color", "Layer6 Color");
            public static GUIContent layer6SmoothnessText = new GUIContent("Layer6Smoothness", "Layer6 Smoothness");
            public static GUIContent layer6MetallicText = new GUIContent("Layer6Metallic", "Layer6 Metallic");
            public static GUIContent layer6UVSetText = new GUIContent("Layer6UVSet", "Layer6 UVSet");
            public static GUIContent layer6NormalText = new GUIContent("Layer6Normal", "Layer6 Normal Texture");
            
            
            public static GUIContent layer7TexText = new GUIContent("Layer7[待定]", "Layer7 Texture");
            public static GUIContent layer7MaskText = new GUIContent("Layer7Mask", "");
            public static GUIContent layer7ColorText = new GUIContent("Layer7Color", "Layer7 Color");
            public static GUIContent layer7SmoothnessText = new GUIContent("Layer7Smoothness", "Layer7 Smoothness");
            public static GUIContent layer7MetallicText = new GUIContent("Layer7Metallic", "Layer7 Metallic");
            public static GUIContent layer7UVSetText = new GUIContent("Layer7UVSet", "Layer7 UVSet");
            public static GUIContent layer7NormalText = new GUIContent("Layer7Normal", "Layer7 Normal Texture");
        }

        public struct LitProperties
        {
            // Surface Option Props
            public MaterialProperty workflowMode;

            // Surface Input Props
            public MaterialProperty metallic;
            public MaterialProperty specColor;
            public MaterialProperty metallicGlossMap;
            public MaterialProperty specGlossMap;
            public MaterialProperty smoothness;
            public MaterialProperty smoothnessMapChannel;
            public MaterialProperty bumpMapProp;
            public MaterialProperty bumpScaleProp;
            public MaterialProperty occlusionStrength;
            public MaterialProperty occlusionMap; 

            // Advanced Props
            public MaterialProperty highlights;
            public MaterialProperty reflections;

            #region AddLayer
            // Layer
            public MaterialProperty layer0Normal;            
            public MaterialProperty layer0NormalScale;

            public MaterialProperty layer1Tex;
            public MaterialProperty layer1Mask;
            public MaterialProperty layer1Color;
            public MaterialProperty layer1Smoothness;
            public MaterialProperty layer1Metallic;
            public MaterialProperty layer1UVSet;
            public MaterialProperty layer1Normal;
            public MaterialProperty layer1NormalScale;

            public MaterialProperty layer2Tex;
            public MaterialProperty layer2Mask;
            public MaterialProperty layer2Color;
            public MaterialProperty layer2Smoothness;
            public MaterialProperty layer2Metallic;
            public MaterialProperty layer2UVSet;
            public MaterialProperty layer2Normal;
            public MaterialProperty layer2NormalScale;

            public MaterialProperty layer3Tex;
            public MaterialProperty layer3Mask;
            public MaterialProperty layer3Color;
            public MaterialProperty layer3Smoothness;
            public MaterialProperty layer3Metallic;
            public MaterialProperty layer3UVSet;
            public MaterialProperty layer3Normal;
            public MaterialProperty layer3NormalScale;

            public MaterialProperty layer4Tex;
            public MaterialProperty layer4Mask;
            public MaterialProperty layer4Color;
            public MaterialProperty layer4Smoothness;
            public MaterialProperty layer4Metallic;
            public MaterialProperty layer4UVSet;
            public MaterialProperty layer4Normal;
            public MaterialProperty layer4NormalScale;

            public MaterialProperty layer5Tex;
            public MaterialProperty layer5Mask;
            public MaterialProperty layer5Color;
            public MaterialProperty layer5Smoothness;
            public MaterialProperty layer5Metallic;
            public MaterialProperty layer5UVSet;
            public MaterialProperty layer5Normal;
            public MaterialProperty layer5NormalScale;

            public MaterialProperty layer6Tex;
            public MaterialProperty layer6Mask;
            public MaterialProperty layer6Color;
            public MaterialProperty layer6Smoothness;
            public MaterialProperty layer6Metallic;
            public MaterialProperty layer6UVSet;
            public MaterialProperty layer6Normal;
            public MaterialProperty layer6NormalScale;

            public MaterialProperty layer7Tex;
            public MaterialProperty layer7Mask;
            public MaterialProperty layer7Color;
            public MaterialProperty layer7Smoothness;
            public MaterialProperty layer7Metallic;
            public MaterialProperty layer7UVSet;
            public MaterialProperty layer7Normal;
            public MaterialProperty layer7NormalScale;                                                                                                
        
            #endregion

            public LitProperties(MaterialProperty[] properties)
            {
                // Surface Option Props
                workflowMode = Fun_BaseShaderGUI.FindProperty("_WorkflowMode", properties, false);
                // Surface Input Props
                metallic = Fun_BaseShaderGUI.FindProperty("_Metallic", properties);
                specColor = Fun_BaseShaderGUI.FindProperty("_SpecColor", properties, false);
                metallicGlossMap = Fun_BaseShaderGUI.FindProperty("_MetallicGlossMap", properties);
                specGlossMap = Fun_BaseShaderGUI.FindProperty("_SpecGlossMap", properties, false);
                smoothness = Fun_BaseShaderGUI.FindProperty("_Smoothness", properties, false);
                smoothnessMapChannel = Fun_BaseShaderGUI.FindProperty("_SmoothnessTextureChannel", properties, false);
                bumpMapProp = Fun_BaseShaderGUI.FindProperty("_BumpMap", properties, false);
                bumpScaleProp = Fun_BaseShaderGUI.FindProperty("_BumpScale", properties, false);
                occlusionStrength = Fun_BaseShaderGUI.FindProperty("_OcclusionStrength", properties, false);
                occlusionMap = Fun_BaseShaderGUI.FindProperty("_OcclusionMap", properties, false);
                // Advanced Props
                highlights = Fun_BaseShaderGUI.FindProperty("_SpecularHighlights", properties, false);
                reflections = Fun_BaseShaderGUI.FindProperty("_EnvironmentReflections", properties, false);

                // Cloth Layer 
                layer0Normal = Fun_BaseShaderGUI.FindProperty("_Layer0Normal", properties, false);
                layer0NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer0NormalScale", properties, false);

                layer1Tex = Fun_BaseShaderGUI.FindProperty("_Layer1Tex", properties, false);
                layer1Mask = Fun_BaseShaderGUI.FindProperty("_Layer1Mask", properties, false);
                layer1UVSet = Fun_BaseShaderGUI.FindProperty("_Layer1UVSet", properties, false);
                layer1Normal = Fun_BaseShaderGUI.FindProperty("_Layer1Normal", properties, false);
                layer1NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer1NormalScale", properties, false);
                layer1Color = Fun_BaseShaderGUI.FindProperty("_Layer1Color", properties, false);
                layer1Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer1Smoothness", properties, false);
                layer1Metallic = Fun_BaseShaderGUI.FindProperty("_Layer1Metallic", properties, false);

                layer2Tex = Fun_BaseShaderGUI.FindProperty("_Layer2Tex", properties, false);
                layer2Mask = Fun_BaseShaderGUI.FindProperty("_Layer2Mask", properties, false);
                layer2UVSet = Fun_BaseShaderGUI.FindProperty("_Layer2UVSet", properties, false);
                layer2Normal = Fun_BaseShaderGUI.FindProperty("_Layer2Normal", properties, false);
                layer2NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer2NormalScale", properties, false);
                layer2Color = Fun_BaseShaderGUI.FindProperty("_Layer2Color", properties, false);
                layer2Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer2Smoothness", properties, false);
                layer2Metallic = Fun_BaseShaderGUI.FindProperty("_Layer2Metallic", properties, false);

                layer3Tex = Fun_BaseShaderGUI.FindProperty("_Layer3Tex", properties, false);
                layer3Mask = Fun_BaseShaderGUI.FindProperty("_Layer3Mask", properties, false);
                layer3UVSet = Fun_BaseShaderGUI.FindProperty("_Layer3UVSet", properties, false);
                layer3Normal = Fun_BaseShaderGUI.FindProperty("_Layer3Normal", properties, false);
                layer3NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer3NormalScale", properties, false);
                layer3Color = Fun_BaseShaderGUI.FindProperty("_Layer3Color", properties, false);
                layer3Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer3Smoothness", properties, false);
                layer3Metallic = Fun_BaseShaderGUI.FindProperty("_Layer3Metallic", properties, false);

                layer4Tex = Fun_BaseShaderGUI.FindProperty("_Layer4Tex", properties, false);
                layer4Mask = Fun_BaseShaderGUI.FindProperty("_Layer4Mask", properties, false);
                layer4UVSet = Fun_BaseShaderGUI.FindProperty("_Layer4UVSet", properties, false);
                layer4Normal = Fun_BaseShaderGUI.FindProperty("_Layer4Normal", properties, false);
                layer4NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer4NormalScale", properties, false);
                layer4Color = Fun_BaseShaderGUI.FindProperty("_Layer4Color", properties, false);
                layer4Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer4Smoothness", properties, false);
                layer4Metallic = Fun_BaseShaderGUI.FindProperty("_Layer4Metallic", properties, false);


                layer5Tex = Fun_BaseShaderGUI.FindProperty("_Layer5Tex", properties, false);
                layer5Mask = Fun_BaseShaderGUI.FindProperty("_Layer5Mask", properties, false);
                layer5UVSet = Fun_BaseShaderGUI.FindProperty("_Layer5UVSet", properties, false);
                layer5Normal = Fun_BaseShaderGUI.FindProperty("_Layer5Normal", properties, false);
                layer5NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer5NormalScale", properties, false);
                layer5Color = Fun_BaseShaderGUI.FindProperty("_Layer5Color", properties, false);
                layer5Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer5Smoothness", properties, false);
                layer5Metallic = Fun_BaseShaderGUI.FindProperty("_Layer5Metallic", properties, false);


                layer6Tex = Fun_BaseShaderGUI.FindProperty("_Layer6Tex", properties, false);
                layer6Mask = Fun_BaseShaderGUI.FindProperty("_Layer6Mask", properties, false);
                layer6UVSet = Fun_BaseShaderGUI.FindProperty("_Layer6UVSet", properties, false);
                layer6Normal = Fun_BaseShaderGUI.FindProperty("_Layer6Normal", properties, false);
                layer6NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer6NormalScale", properties, false);
                layer6Color = Fun_BaseShaderGUI.FindProperty("_Layer6Color", properties, false);
                layer6Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer6Smoothness", properties, false);
                layer6Metallic = Fun_BaseShaderGUI.FindProperty("_Layer6Metallic", properties, false);

                layer7Tex = Fun_BaseShaderGUI.FindProperty("_Layer7Tex", properties, false);
                layer7Mask = Fun_BaseShaderGUI.FindProperty("_Layer7Mask", properties, false);
                layer7UVSet = Fun_BaseShaderGUI.FindProperty("_Layer7UVSet", properties, false);
                layer7Normal = Fun_BaseShaderGUI.FindProperty("_Layer7Normal", properties, false);
                layer7NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer7NormalScale", properties, false);
                layer7Color = Fun_BaseShaderGUI.FindProperty("_Layer7Color", properties, false);
                layer7Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer7Smoothness", properties, false);
                layer7Metallic = Fun_BaseShaderGUI.FindProperty("_Layer7Metallic", properties, false);              
            }
        }

        public static void Inputs(LitProperties properties, MaterialEditor materialEditor, Material material)
        {
            DoMetallicSpecularArea(properties, materialEditor, material);
            Fun_BaseShaderGUI.DrawNormalArea(materialEditor, properties.bumpMapProp, properties.bumpScaleProp);

            if (properties.occlusionMap != null)
            {
                materialEditor.TexturePropertySingleLine(Styles.occlusionText, properties.occlusionMap,
                    properties.occlusionMap.textureValue != null ? properties.occlusionStrength : null);
            }

            DoLayerArea(properties, materialEditor, material);
        }

        public static void DoMetallicSpecularArea(LitProperties properties, MaterialEditor materialEditor, Material material)
        {
            string[] smoothnessChannelNames;
            bool hasGlossMap = false;
            if (properties.workflowMode == null ||
                (WorkflowMode) properties.workflowMode.floatValue == WorkflowMode.Metallic)
            {
                hasGlossMap = properties.metallicGlossMap.textureValue != null;
                smoothnessChannelNames = Styles.metallicSmoothnessChannelNames;
                materialEditor.TexturePropertySingleLine(Styles.metallicMapText, properties.metallicGlossMap,
                    hasGlossMap ? null : properties.metallic);
            }
            else
            {
                hasGlossMap = properties.specGlossMap.textureValue != null;
                smoothnessChannelNames = Styles.specularSmoothnessChannelNames;
                Fun_BaseShaderGUI.TextureColorProps(materialEditor, Styles.specularMapText, properties.specGlossMap,
                    hasGlossMap ? null : properties.specColor);
            }
            EditorGUI.indentLevel++;
            DoSmoothness(properties, material, smoothnessChannelNames);
            EditorGUI.indentLevel--;
        }

        public static void DoSmoothness(LitProperties properties, Material material, string[] smoothnessChannelNames)
        {
            var opaque = ((Fun_BaseShaderGUI.SurfaceType) material.GetFloat("_Surface") ==
                          Fun_BaseShaderGUI.SurfaceType.Opaque);
            EditorGUI.indentLevel++;
            EditorGUI.BeginChangeCheck();
            EditorGUI.showMixedValue = properties.smoothness.hasMixedValue;
            var smoothness = EditorGUILayout.Slider(Styles.smoothnessText, properties.smoothness.floatValue, 0f, 1f);
            if (EditorGUI.EndChangeCheck())
                properties.smoothness.floatValue = smoothness;
            EditorGUI.showMixedValue = false;

            if (properties.smoothnessMapChannel != null) // smoothness channel
            {
                EditorGUI.indentLevel++;
                EditorGUI.BeginDisabledGroup(!opaque);
                EditorGUI.BeginChangeCheck();
                EditorGUI.showMixedValue = properties.smoothnessMapChannel.hasMixedValue;
                var smoothnessSource = (int) properties.smoothnessMapChannel.floatValue;
                if (opaque)
                    smoothnessSource = EditorGUILayout.Popup(Styles.smoothnessMapChannelText, smoothnessSource,
                        smoothnessChannelNames);
                else
                    EditorGUILayout.Popup(Styles.smoothnessMapChannelText, 0, smoothnessChannelNames);
                if (EditorGUI.EndChangeCheck())
                    properties.smoothnessMapChannel.floatValue = smoothnessSource;
                EditorGUI.showMixedValue = false;
                EditorGUI.EndDisabledGroup();
                EditorGUI.indentLevel--;
            }
            EditorGUI.indentLevel--;
        }

        public static SmoothnessMapChannel GetSmoothnessMapChannel(Material material)
        {
            int ch = (int) material.GetFloat("_SmoothnessTextureChannel");
            if (ch == (int) SmoothnessMapChannel.AlbedoAlpha)
                return SmoothnessMapChannel.AlbedoAlpha;

            return SmoothnessMapChannel.SpecularMetallicAlpha;
        }

        public static void SetMaterialKeywords(Material material)
        {
            // Note: keywords must be based on Material value not on MaterialProperty due to multi-edit & material animation
            // (MaterialProperty value might come from renderer material property block)
            var hasGlossMap = false;
            var isSpecularWorkFlow = false;
            var opaque = ((Fun_BaseShaderGUI.SurfaceType) material.GetFloat("_Surface") ==
                          Fun_BaseShaderGUI.SurfaceType.Opaque);
            if (material.HasProperty("_WorkflowMode"))
            {
                isSpecularWorkFlow = (WorkflowMode) material.GetFloat("_WorkflowMode") == WorkflowMode.Specular;
                if (isSpecularWorkFlow)
                    hasGlossMap = material.GetTexture("_SpecGlossMap") != null;
                else
                    hasGlossMap = material.GetTexture("_MetallicGlossMap") != null;
            }
            else
            {
                hasGlossMap = material.GetTexture("_MetallicGlossMap") != null;
            }

            CoreUtils.SetKeyword(material, "_SPECULAR_SETUP", isSpecularWorkFlow);

            CoreUtils.SetKeyword(material, "_METALLICSPECGLOSSMAP", hasGlossMap);

            if (material.HasProperty("_SpecularHighlights"))
                CoreUtils.SetKeyword(material, "_SPECULARHIGHLIGHTS_OFF",
                    material.GetFloat("_SpecularHighlights") == 0.0f);
            if (material.HasProperty("_EnvironmentReflections"))
                CoreUtils.SetKeyword(material, "_ENVIRONMENTREFLECTIONS_OFF",
                    material.GetFloat("_EnvironmentReflections") == 0.0f);
            if (material.HasProperty("_OcclusionMap"))
                CoreUtils.SetKeyword(material, "_OCCLUSIONMAP", material.GetTexture("_OcclusionMap"));

            if (material.HasProperty("_SmoothnessTextureChannel"))
            {
                CoreUtils.SetKeyword(material, "_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A",
                    GetSmoothnessMapChannel(material) == SmoothnessMapChannel.AlbedoAlpha && opaque);
            }            
            SetClothMaterialKeywords(material);
        }

        // 自定义Keywords
        public static void SetClothMaterialKeywords(Material material)
        {

            if (material.HasProperty("_Layer0Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_0_NORMAL", material.GetTexture("_Layer0Normal"));

            if (material.HasProperty("_Layer1Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_1_TEX", material.GetTexture("_Layer1Tex"));
            if (material.HasProperty("_Layer1Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_1_NORMAL", material.GetTexture("_Layer1Normal"));
            if (material.HasProperty("_Layer1Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_1_MASK", material.GetTexture("_Layer1Mask"));

            if (material.HasProperty("_Layer2Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_2_TEX", material.GetTexture("_Layer2Tex"));
            if (material.HasProperty("_Layer2Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_2_NORMAL", material.GetTexture("_Layer2Normal"));
            if (material.HasProperty("_Layer2Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_2_MASK", material.GetTexture("_Layer2Mask"));

            if (material.HasProperty("_Layer3Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_3_TEX", material.GetTexture("_Layer3Tex"));
            if (material.HasProperty("_Layer3Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_3_NORMAL", material.GetTexture("_Layer3Normal"));
            if (material.HasProperty("_Layer3Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_3_MASK", material.GetTexture("_Layer3Mask"));

            if (material.HasProperty("_Layer4Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_4_TEX", material.GetTexture("_Layer4Tex"));
            if (material.HasProperty("_Layer4Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_4_NORMAL", material.GetTexture("_Layer4Normal"));
            if (material.HasProperty("_Layer4Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_4_MASK", material.GetTexture("_Layer4Mask"));

            if (material.HasProperty("_Layer5Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_5_TEX", material.GetTexture("_Layer5Tex"));
            if (material.HasProperty("_Layer5Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_5_NORMAL", material.GetTexture("_Layer5Normal"));
            if (material.HasProperty("_Layer5Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_5_MASK", material.GetTexture("_Layer5Mask"));

            if (material.HasProperty("_Layer6Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_6_TEX", material.GetTexture("_Layer6Tex"));
            if (material.HasProperty("_Layer6Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_6_NORMAL", material.GetTexture("_Layer6Normal"));
            if (material.HasProperty("_Layer6Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_6_MASK", material.GetTexture("_Layer6Mask"));

            if (material.HasProperty("_Layer7Tex"))
            CoreUtils.SetKeyword(material, "_LAYER_7_TEX", material.GetTexture("_Layer7Tex"));
            if (material.HasProperty("_Layer7Normal"))
            CoreUtils.SetKeyword(material, "_LAYER_7_NORMAL", material.GetTexture("_Layer7Normal"));
            if (material.HasProperty("_Layer7Mask"))
            CoreUtils.SetKeyword(material, "_LAYER_7_MASK", material.GetTexture("_Layer7Mask"));
            

            // key for layer uv set
            CoreUtils.SetKeyword(material, "_Layer1UVSet_0", material.GetFloat("_Layer1UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer1UVSet_1", material.GetFloat("_Layer1UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer1UVSet_2", material.GetFloat("_Layer1UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer1UVSet_3", material.GetFloat("_Layer1UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer2UVSet_0", material.GetFloat("_Layer2UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer2UVSet_1", material.GetFloat("_Layer2UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer2UVSet_2", material.GetFloat("_Layer2UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer2UVSet_3", material.GetFloat("_Layer2UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer3UVSet_0", material.GetFloat("_Layer3UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer3UVSet_1", material.GetFloat("_Layer3UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer3UVSet_2", material.GetFloat("_Layer3UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer3UVSet_3", material.GetFloat("_Layer3UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer4UVSet_0", material.GetFloat("_Layer4UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer4UVSet_1", material.GetFloat("_Layer4UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer4UVSet_2", material.GetFloat("_Layer4UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer4UVSet_3", material.GetFloat("_Layer4UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer5UVSet_0", material.GetFloat("_Layer5UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer5UVSet_1", material.GetFloat("_Layer5UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer5UVSet_2", material.GetFloat("_Layer5UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer5UVSet_3", material.GetFloat("_Layer5UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer6UVSet_0", material.GetFloat("_Layer6UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer6UVSet_1", material.GetFloat("_Layer6UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer6UVSet_2", material.GetFloat("_Layer6UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer6UVSet_3", material.GetFloat("_Layer6UVSet") == 3);

            CoreUtils.SetKeyword(material, "_Layer7UVSet_0", material.GetFloat("_Layer7UVSet") == 0);
            CoreUtils.SetKeyword(material, "_Layer7UVSet_1", material.GetFloat("_Layer7UVSet") == 1);
            CoreUtils.SetKeyword(material, "_Layer7UVSet_2", material.GetFloat("_Layer7UVSet") == 2);
            CoreUtils.SetKeyword(material, "_Layer7UVSet_3", material.GetFloat("_Layer7UVSet") == 3);

        }

        // 自定义布局        
        static void DoLayerArea(LitProperties properties, MaterialEditor materialEditor, Material material)
        {      

            materialEditor.TexturePropertySingleLine(Styles.layer0NormalText, properties.layer0Normal, properties.layer0NormalScale);         
            if (material.GetTexture("_Layer0Normal"))
            {            
                materialEditor.TextureScaleOffsetProperty(properties.layer0Normal);                  
            }

            materialEditor.TexturePropertySingleLine(Styles.layer1TexText, properties.layer1Tex);    
            if (material.GetTexture("_Layer1Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer1NormalText, properties.layer1Normal, properties.layer1NormalScale); 
                TextureLayout(materialEditor, Styles.layer1MaskText, properties.layer1Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer1Tex);
                materialEditor.ShaderProperty(properties.layer1Color, Styles.layer1ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer1Smoothness, Styles.layer1SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer1Metallic, Styles.layer1MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer1UVSet, Styles.layer1UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer1Normal", null);
                material.SetTexture("_Layer1Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer2TexText, properties.layer2Tex);    
            if (material.GetTexture("_Layer2Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer2NormalText, properties.layer2Normal, properties.layer2NormalScale); 
                TextureLayout(materialEditor, Styles.layer2MaskText, properties.layer2Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer2Tex);
                materialEditor.ShaderProperty(properties.layer2Color, Styles.layer2ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer2Smoothness, Styles.layer2SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer2Metallic, Styles.layer2MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer2UVSet, Styles.layer2UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer2Normal", null);
                material.SetTexture("_Layer2Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer3TexText, properties.layer3Tex);    
            if (material.GetTexture("_Layer3Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer3NormalText, properties.layer3Normal, properties.layer3NormalScale); 
                TextureLayout(materialEditor, Styles.layer3MaskText, properties.layer3Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer3Tex);
                materialEditor.ShaderProperty(properties.layer3Color, Styles.layer3ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer3Smoothness, Styles.layer3SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer3Metallic, Styles.layer3MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer3UVSet, Styles.layer3UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer3Normal", null);
                material.SetTexture("_Layer3Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer4TexText, properties.layer4Tex);    
            if (material.GetTexture("_Layer4Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer4NormalText, properties.layer4Normal, properties.layer4NormalScale); 
                TextureLayout(materialEditor, Styles.layer4MaskText, properties.layer4Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer4Tex);
                materialEditor.ShaderProperty(properties.layer4Color, Styles.layer4ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer4Smoothness, Styles.layer4SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer4Metallic, Styles.layer4MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer4UVSet, Styles.layer4UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer4Normal", null);
                material.SetTexture("_Layer4Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer5TexText, properties.layer5Tex);    
            if (material.GetTexture("_Layer5Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer5NormalText, properties.layer5Normal, properties.layer5NormalScale); 
                TextureLayout(materialEditor, Styles.layer5MaskText, properties.layer5Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer5Tex);
                materialEditor.ShaderProperty(properties.layer5Color, Styles.layer5ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer5Smoothness, Styles.layer5SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer5Metallic, Styles.layer5MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer5UVSet, Styles.layer5UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer5Normal", null);
                material.SetTexture("_Layer5Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer6TexText, properties.layer6Tex);    
            if (material.GetTexture("_Layer6Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer6NormalText, properties.layer6Normal, properties.layer6NormalScale); 
                TextureLayout(materialEditor, Styles.layer6MaskText, properties.layer6Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer6Tex);
                materialEditor.ShaderProperty(properties.layer6Color, Styles.layer6ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer6Smoothness, Styles.layer6SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer6Metallic, Styles.layer6MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer6UVSet, Styles.layer6UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer6Normal", null);
                material.SetTexture("_Layer6Mask", null);            
            }

            materialEditor.TexturePropertySingleLine(Styles.layer7TexText, properties.layer7Tex);    
            if (material.GetTexture("_Layer7Tex"))
            {    
                TextureLayout(materialEditor, Styles.layer7NormalText, properties.layer7Normal, properties.layer7NormalScale); 
                TextureLayout(materialEditor, Styles.layer7MaskText, properties.layer7Mask);  
                materialEditor.TextureScaleOffsetProperty(properties.layer7Tex);
                materialEditor.ShaderProperty(properties.layer7Color, Styles.layer7ColorText.text, 2);
                materialEditor.ShaderProperty(properties.layer7Smoothness, Styles.layer7SmoothnessText.text, 2);
                materialEditor.ShaderProperty(properties.layer7Metallic, Styles.layer7MetallicText.text, 2);            
                materialEditor.ShaderProperty(properties.layer7UVSet, Styles.layer7UVSetText.text, 2);                    
            }
            else
            {        
                material.SetTexture("_Layer7Normal", null);
                material.SetTexture("_Layer7Mask", null);            
            }
            
        }

        static void TextureLayout(MaterialEditor materialEditor,GUIContent content, MaterialProperty propert1, MaterialProperty propert2 = null)
        {
            GUILayout.BeginHorizontal();
            GUILayout.Space(20);
            if (propert2 != null)
                materialEditor.TexturePropertySingleLine(content, propert1, propert2);
            else
                materialEditor.TexturePropertySingleLine(content, propert1);
            GUILayout.EndHorizontal();
        }
    }
}
