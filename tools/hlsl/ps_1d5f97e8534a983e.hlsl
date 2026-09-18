// ps_1d5f97e8534a983e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = 0.21952 * r1.z;
    r6.xy = r6.xy * abs(r8.xy);
    r6.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r7.y = dot(r5.zxy, r5.zxy);
    r8.xyz = r9.xyz * r6.yzx;
    ps = rsqrt(abs(r7.z));
    r7.w = dot(r10.zxy, r10.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r4.xyw = r7.zzz * r4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r0.yzw = r7.yyy * r5.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r7.xxx * r2.xzy;
    r7.w = ps;
    ps = OpacityOverride.x;
    r2.xyz = r7.www * r10.zxy;
    r4.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r10.xyz = r2.xxx * r1.xyz;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r12.x = dot(r0.wyz, r2.xyz);
    r0.y = ps;
    ps = 0.1 - -r7.y;
    r7.w = dot(r2.xyz, r4.wxy);
    r6.z = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r6.z = saturate(r6.z * 5.0);
    r0.z = ps;
    ps = 1.0 - r6.z;
    r2.xyz = r2.yzx * r7.www;
    r6.z = ps;
    r5.xyz = r2.xyz * 2.0 - r4.xyw;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r2.xy + 0.5;
    r4.y = ps;
    ps = abs(r2.x) * abs(r2.x);
    r6.x = saturate(dot(r7.yxz, r5.zxy));
    r7.w = ps;
    ps = log2(r6.x);
    r7.xyz = -r4.zxy + 1.0;
    r6.x = ps;
    r6.yz = r2.zw * r7.yz + 0.125;
    ps = abs(r2.y) * abs(r2.y);
    r6.x = r6.x * 15.0;
    r0.w = ps;
    ps = pow(2.0, r6.x);
    r2.xyz = r8.xzy * r0.www;
    r6.x = ps;
    ps = 0.21952 * r6.x;
    r4.xyz = r8.xzy * r7.www;
    r7.y = ps;
    ps = r6.w * r6.x;
    r7.x = float((r7.x >= 0.004));
    r5.z = ps;
    ps = r6.y * r6.z;
    r5.xy = r7.yy * r1.xy;
    r5.w = ps;
    r6.xyz = r5.www * r11.xyz + ModShadowColor.xyz;
    r7.yzw = r10.xyz * r8.xyz + r5.xyz;
    r7.yzw = r4.xzy * LowerSkyColor.xyz + r7.yzw;
    r7.yzw = r2.xzy * UpperSkyColor.xyz + r7.yzw;
    r7.yzw = r0.xyz * r9.xyz + r7.yzw;
    r7.yzw = r7.yzw + UniformVector_0.xyz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
