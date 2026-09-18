// ps_1761c185978d9c30.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040800 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.x = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyw = tex2D(Texture2D_0, r0.xy).yxz;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = dot(r6.wyx, r6.wyx);
    ps = rsqrt(abs(r4.x));
    r0.xyz = r6.yxw * AmbientColorAndSkyFactor.xyz;
    r8.z = ps;
    ps = rsqrt(abs(r7.w));
    r4.xyz = r7.xyz * r6.yxw;
    r7.w = ps;
    r7.w = r7.w * r2.z + 0.1;
    r7.xyz = r0.xyz * r7.xyz + UniformVector_0.xyz;
    r7.xyz = r4.xzy * r1.xzy + r7.xzy;
    ps = rsqrt(abs(r6.z));
    r6.x = saturate(r7.w * 5.0);
    r6.z = ps;
    ps = 0.70710677 * r6.z;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = ps;
    ps = 1.0 * r6.z;
    r0 = r8.xyzz * float4(0.875, 0.875, 0.5, -0.5);
    r2.y = ps;
    ps = 1.0 - r6.x;
    r2.xy = r2.xy * r6.yw;
    r6.x = ps;
    ps = OpacityOverride.x;
    r6.yz = r6.xx * ModShadowGroupColor.xy;
    r6.w = saturate(ps);
    r6.x = r2.y * 0.70710677 + r2.x;
    ps = r0.z;
    r6 = -r6 + 1.0;
    ps = r5.z * ps;
    r2.w = float((abs(r6.x) >= 0.0345));
    r0.z = ps;
    r2.yz = r0.xy * r6.yz + 0.125;
    ps = r0.w;
    r2.x = float((abs(r6.x) > 0.0345));
    ps = r5.z * ps;
    r0.xy = r2.xy * r2.wz;
    r0.w = ps;
    r6.xyz = r0.yyy * r1.xyz + ModShadowColor.xyz;
    r0.xyz = r0.zxw + float3(0.5, -0.1, 0.5);
    ps = abs(r0.x) * abs(r0.x);
    r6.w = float((r6.w >= 0.004));
    r0.x = ps;
    ps = abs(r0.z) * abs(r0.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.yyyy)) clip(-1.0);
    r7.w = ps;
    r0.xyz = r4.xzy * r0.xxx;
    r1.xyz = r4.xzy * r7.www;
    r7.xyz = r1.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r0.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
