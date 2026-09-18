// ps_70d0b458401b1428.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 10040800 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D LightMapTexture : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    ps = OpacityOverride.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = saturate(ps);
    ps = 0.21952 * r5.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r3.x = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xyz * LightMapScale.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xyz * r5.xyz;
    r5.x = ps;
    r5.x = r5.x * r1.z + 0.1;
    ps = 5.0 * r5.x;
    r1 = r6.xxyw * float4(0.5, -0.5, 0.875, 0.875);
    r5.w = saturate(ps);
    ps = 0.21952 * r5.y;
    r5.w = -r5.w + 1.0;
    r3.y = ps;
    ps = r1.x;
    r6.xy = r5.ww * ModShadowGroupColor.xy;
    ps = r4.z * ps;
    r6.xyw = -r6.xyz + 1.0;
    r6.z = ps;
    ps = r1.y;
    r6.xy = r1.zw * r6.xy;
    ps = r4.z * ps;
    r5.w = float((r6.w >= 0.004));
    r6.w = ps;
    ps = 0.21952 * r5.z;
    r6 = r6.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    r3.z = ps;
    ps = r6.z * r6.w;
    r6.xy = abs(r6.xy) * abs(r6.xy);
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r1.xyz = r3.xyz * r6.xxx;
    r6.xyz = r3.xyz * r6.yyy;
    r6.xyz = r6.xyz * LowerSkyColor.xyz;
    r6.xyz = r1.xyz * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.z = r0.z * 0.21952 + r6.z;
    r6.xy = r0.xy * 0.21952 + r6.xy;
    r6.xy = r6.xy + float2(2.0, 0.45);
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
