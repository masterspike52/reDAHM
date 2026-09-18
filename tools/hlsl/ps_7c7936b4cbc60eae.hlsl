// ps_7c7936b4cbc60eae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040A00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.xy * 2e+01;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = 0.21952 * r1.z;
    r6.zw = r6.zw * abs(r8.xy);
    r7.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r8.yzw = tex2D(Texture2D_0, r6.xy).xyz;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r6.yyy * r4.zxy;
    r6.x = ps;
    r6.yzw = r6.xxx * r2.xzy;
    r0.yz = -r0.yz;
    r0.x = r0.x * 2.0 - r0.x;
    ps = 0.1 - -r6.z;
    r7.x = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.y = saturate(dot(r6.ywz, r0.yzx));
    r6.x = saturate(ps);
    ps = log2(r6.y);
    r6.x = -r6.x + 1.0;
    r8.x = ps;
    r0 = r8 * float4(15.0, 0.5, 0.5, 0.5);
    ps = pow(2.0, r0.x);
    r6.xz = r6.xx * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r10.z = r7.w * r6.y;
    r7.x = ps;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r2.xyz = r8.yzw * AmbientColorAndSkyFactor.xyz;
    r8.xyz = r9.xyz * r8.yzw;
    r7 = r7.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    ps = OpacityOverride.x;
    r7.zw = r7.zw * r5.zz;
    r6.w = saturate(ps);
    r6.xzw = -r6.xzw + 1.0;
    r0.xyz = r0.yzw + UniformVector_0.xyz;
    r7.xy = r7.xy * r6.xz;
    ps = 0.21952 * r6.y;
    r6.w = float((r6.w >= 0.004));
    r6.x = ps;
    r10.xy = r6.xx * r1.xy;
    r7 = r7.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r7.y * r7.z;
    r7.xw = abs(r7.wx) * abs(r7.wx);
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r4.xyz = r8.xzy * r7.xxx;
    r7.xyz = r8.xyz * r1.xyz + r10.xyz;
    r1.xyz = r8.xzy * r7.www;
    r7.xyz = r1.xzy * LowerSkyColor.xyz + r7.xyz;
    r7.xyz = r4.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r2.xyz * r9.xyz + r7.xyz;
    r7.xyz = r0.xyz + r7.xyz;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
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
