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


            public static GUIContent layer1TexText = new GUIContent("Layer1[腮红]", "");
            public static GUIContent layer1MaskText = new GUIContent("Layer1Mask", "");
            public static GUIContent layer1ColorText = new GUIContent("Layer1Color", "");
            public static GUIContent layer1SmoothnessText = new GUIContent("Layer1Smoothness", "");
            public static GUIContent layer1MetallicText = new GUIContent("Layer1Metallic", "");        
            public static GUIContent layer1UVSetText = new GUIContent("Layer1UVSet", "");
            public static GUIContent layer1NormalText = new GUIContent("Layer1Normal", "");
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
            public MaterialProperty layer1Tex;
            public MaterialProperty layer1Mask;
            public MaterialProperty layer1Color;
            public MaterialProperty layer1Smoothness;
            public MaterialProperty layer1Metallic;
            public MaterialProperty layer1UVSet;
            public MaterialProperty layer1Normal;
            public MaterialProperty layer1NormalScale;   
        
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
                layer1Tex = Fun_BaseShaderGUI.FindProperty("_Layer1Tex", properties, false);
                layer1Mask = Fun_BaseShaderGUI.FindProperty("_Layer1Mask", properties, false);
                layer1UVSet = Fun_BaseShaderGUI.FindProperty("_Layer1UVSet", properties, false);
                layer1Normal = Fun_BaseShaderGUI.FindProperty("_Layer1Normal", properties, false);
                layer1NormalScale = Fun_BaseShaderGUI.FindProperty("_Layer1NormalScale", properties, false);
                layer1Color = Fun_BaseShaderGUI.FindProperty("_Layer1Color", properties, false);
                layer1Smoothness = Fun_BaseShaderGUI.FindProperty("_Layer1Smoothness", properties, false);
                layer1Metallic = Fun_BaseShaderGUI.FindProperty("_Layer1Metallic", properties, false);


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
                if (material.HasProperty("_Layer1Tex"))
                CoreUtils.SetKeyword(material, "_LAYER_1_TEX", material.GetTexture("_Layer1Tex"));

                if (material.HasProperty("_Layer1Normal"))
                CoreUtils.SetKeyword(material, "_LAYER_1_NORMAL", material.GetTexture("_Layer1Normal"));

                if (material.HasProperty("_Layer1Mask"))
                CoreUtils.SetKeyword(material, "_LAYER_1_MASK", material.GetTexture("_Layer1Mask"));
                
                // key for layer uv set
                CoreUtils.SetKeyword(material, "_Layer1UVSet_0", material.GetFloat("_Layer1UVSet") == 0);
                CoreUtils.SetKeyword(material, "_Layer1UVSet_1", material.GetFloat("_Layer1UVSet") == 1);
                CoreUtils.SetKeyword(material, "_Layer1UVSet_2", material.GetFloat("_Layer1UVSet") == 2);
                CoreUtils.SetKeyword(material, "_Layer1UVSet_3", material.GetFloat("_Layer1UVSet") == 3);

        }
        
        // 自定义布局
        static void DoLayerArea(LitProperties properties, MaterialEditor materialEditor, Material material)
        {            
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
