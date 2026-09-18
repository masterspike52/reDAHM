// ps_06852705bb9d846e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040700 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r6.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r0.y = -UniformVector_0.y + 1.0;
    ps = rsqrt(abs(r5.y));
    r5.zw = r5.zw * 0.875;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = OpacityOverride.x;
    r0.xzw = r5.xxx * r3.xyz;
    r1.z = saturate(ps);
    r1.x = r0.w * 2.0 - r0.w;
    ps = -r0.x;
    r5.x = r7.z + 0.1;
    r1.y = ps;
    ps = -r0.z;
    r5.x = saturate(r5.x * 5.0);
    r1.w = ps;
    ps = 1.0 - r5.x;
    r0.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r0.x));
    r5.y = saturate(dot(r7.xyz, r1.ywx));
    r5.x = ps;
    ps = log2(r5.y);
    r1.xy = r6.ww * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = (-0.5) * r5.x;
    r1.xyz = -r1.xyz + 1.0;
    r0.z = ps;
    ps = 0.5 * r5.x;
    r7.xy = r5.zw * r1.xy;
    r0.w = ps;
    r7.zw = r0.zw * r4.zz;
    ps = pow(2.0, r0.x);
    r5 = r7.xzwy + float4(0.125, 0.5, 0.5, 0.125);
    r0.x = ps;
    ps = r5.x * r5.w;
    r6.xyz = r6.xzy * LightMapScale.xzy;
    r5.x = ps;
    ps = abs(r5.y) * abs(r5.y);
    r6 = r6.xyzz * r0.xxyx;
    r0.z = ps;
    ps = abs(r5.z) * abs(r5.z);
    r6.xyw = r6.xyw * 0.21952;
    r0.w = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    ps = r6.z;
    r5.w = float((r1.z >= 0.004));
    ps = r6.w + ps;
    r0.zw = r0.zw * r0.yy;
    r6.z = ps;
    r6.z = r0.z * LowerSkyColor.y + r6.z;
    r6.z = r0.w * UpperSkyColor.y + r6.z;
    r6.z = r0.y * AmbientColorAndSkyFactor.y + r6.z;
    r6.xyz = r6.xzy + UniformVector_0.xyz;
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
