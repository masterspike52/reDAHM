// ps_698c19b959de506a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 10040700 0000070A 00000000 000070E7 001F007F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
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
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord3 : TEXCOORD3; // r0
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
    float4 r0 = In.texcoord3;
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
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.25;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r5.zw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    ps = OpacityOverride.x;
    r5.y = dot(r4.zxy, r4.zxy);
    r3.z = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r3.xyw = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    r6.xyz = r6.xyz * r3.xyw + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.x));
    r3.xyw = r3.xyw * 0.25;
    r5.x = ps;
    r7.xyz = r3.xwy * r0.xzy + r6.xzy;
    ps = r5.x;
    r0 = r5.yyzw * float4(0.5, -0.5, 0.875, 0.875);
    ps = r1.z * ps;
    r5.yz = r0.xy * r4.zz;
    r5.x = ps;
    ps = -ModShadowColor.x;
    r5.xyz = r5.xyz + float3(0.1, 0.5, 0.5);
    ps = 1.0 + ps;
    r6.xw = abs(r5.yz) * abs(r5.yz);
    r0.x = ps;
    ps = 5.0 * r5.x;
    r6.xyz = r3.xwy * r6.xxx;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.yzw = r3.xwy * r6.www;
    r5.x = ps;
    ps = -ModShadowColor.y;
    r3.xy = r5.xx * ModShadowGroupColor.xy;
    r5.xyz = r5.ywz * LowerSkyColor.xyz + r7.xzy;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r5.xzy;
    ps = 1.0 + ps;
    r5.xyw = -r3.xyz + 1.0;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r5.w = float((r5.w >= 0.004));
    r5.xy = r0.zw * r5.xy + 0.125;
    ps = 1.0 + ps;
    r5.x = r5.x * r5.y;
    r0.z = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
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
