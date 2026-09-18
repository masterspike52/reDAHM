// ps_a2278ca2acabc730.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10000300 00000004 00000000 00001042 00030003 00000001 00003050 00003151
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 GammaColorScaleAndInverse : register(c9); // float4
float4 GammaOverlayColor : register(c10); // float4
float4 MinMaxBlurClamp : register(c4); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 PackedParameters : register(c3); // float4
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 SceneInverseHighLights : register(c6); // float4
float4 SceneMidTones : register(c7); // float4
float4 SceneScaledLuminanceWeights : register(c8); // float4
float4 SceneShadowsAndDesaturation : register(c5); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D BlurredImage : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xyz = tex2D(SceneColorTexture, r1.xy).xyz;
    r2 = tex2D(BlurredImage, r0.xy);
    r0.x = tex2D(SceneDepthTexture, r1.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r0.y = 1.0 / r0.x;
    r0.x = -PackedParameters.x - -r0.y;
    r0.y = (-r0.x > 0.0) ? MinMaxBlurClamp.x : MinMaxBlurClamp.y;
    r0.x = saturate(abs(r0.x) * PackedParameters.y);
    r0.x = log2(r0.x);
    r0.x = PackedParameters.z * r0.x;
    r0.x = pow(2.0, r0.x);
    r0.y = min(r0.y, r0.x);
    r0.y = saturate(1.0 - r0.y);
    r0.x = r2.w * 2.0 + r0.y;
    ps = 1.0 / r0.x;
    r0.yzw = r0.yyy * r3.xyz;
    r0.x = ps;
    r0.yzw = r2.xyz * 2.0 + r0.yzw;
    r0.xyz = saturate(r0.yzw * r0.xxx - SceneShadowsAndDesaturation.xyz);
    r0.xyz = r0.xyz * SceneInverseHighLights.xyz;
    ps = log2(abs(r0.x));
    r0.x = ps;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = log2(abs(r0.z));
    r0.z = ps;
    r0.xyz = r0.xyz * SceneMidTones.xyz;
    ps = pow(2.0, r0.x);
    r1.x = ps;
    ps = pow(2.0, r0.y);
    r1.y = ps;
    ps = pow(2.0, r0.z);
    r1.z = ps;
    r0.yzw = r1.xyz * SceneShadowsAndDesaturation.www + GammaOverlayColor.xyz;
    r0.x = dot(r1.zxy, SceneScaledLuminanceWeights.zxy);
    r0.xyz = r0.yzw + r0.xxx;
    r0.xyz = saturate(r0.xyz * GammaColorScaleAndInverse.xyz);
    ps = log2(r0.x);
    r0.x = ps;
    ps = log2(r0.y);
    r0.y = ps;
    ps = log2(r0.z);
    r0.z = ps;
    r0.xyz = r0.xyz * GammaColorScaleAndInverse.www;
    ps = pow(2.0, r0.x);
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r0.z = ps;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
