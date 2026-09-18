// ps_667a72d0b8f735df.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040800 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.y = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r4.z = ps;
    r4.xz = r4.xz * abs(r6.xy);
    r4.zw = tex2D(ModShadowAccumTexture, r4.xz).xy;
    r2.xy = UniformVector_0.xy + float2(2.0, 0.45);
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r4.x = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r4.y));
    r7.xyz = r8.xyz * 0.21952;
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r6.xyz = r6.xyz * r8.xyz;
    r4.x = ps;
    r6.xyz = r7.xyz * ConstantLighting.xyz + r6.xyz;
    r4.x = r4.x * r0.z + 0.1;
    ps = 5.0 * r4.x;
    r0 = r4.zwyy * float4(0.875, 0.875, 0.5, -0.5);
    r4.x = saturate(ps);
    ps = OpacityOverride.x;
    r4.x = -r4.x + 1.0;
    r4.z = saturate(ps);
    ps = r0.z;
    r4.xy = r4.xx * ModShadowGroupColor.xy;
    ps = r3.z * ps;
    r4.xyz = -r4.xyz + 1.0;
    r0.z = ps;
    ps = r0.w;
    r0.xy = r0.xy * r4.xy;
    ps = r3.z * ps;
    r4.w = float((r4.z >= 0.004));
    r0.w = ps;
    r0 = r0 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r0.x * r0.y;
    r4.xy = abs(r0.zw) * abs(r0.zw);
    r4.z = ps;
    r5.xyz = r4.zzz * r5.xyz + ModShadowColor.xyz;
    r0.xyz = r7.xyz * r4.xxx;
    r4.xyz = r7.xyz * r4.yyy;
    r4.xyz = r4.xyz * LowerSkyColor.xyz + r6.xyz;
    r4.xyz = r0.zxy * UpperSkyColor.zxy + r4.zxy;
    ps = UniformVector_0.z + r4.x;
    r0.xy = r2.xy + r4.yz;
    r0.z = ps;
    ps = -r1.w;
    r4.xyz = r0.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r5.xyz = r4.xyz - r4.xyz;
    r5.w = ps;
    oC0.w = r5.w * r4.w + r1.w;
    r4.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
