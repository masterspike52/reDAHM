// ps_181247cee7473be0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040800 00000406 00000000 00004084 000F000F 00000001 0000F054 0000F156 0000F257 0000F358
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
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
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r2.y = ps;
    r2.xy = r2.xy * abs(r4.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r4.xy = UniformVector_0.xy + float2(2.0, 0.45);
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r2.w = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r5.w));
    r6.xyz = r5.xyz * 0.21952;
    r7.x = ps;
    ps = rsqrt(abs(r2.w));
    r5.xyz = r8.xyz * r5.xyz;
    r2.w = ps;
    r5.xyz = r6.xyz * ConstantLighting.xyz + r5.xyz;
    r0.x = r2.w * r0.z + 0.1;
    ps = 5.0 * r0.x;
    r7 = r7.yzxx * float4(0.875, 0.875, 0.5, -0.5);
    r0.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.x = -r0.x + 1.0;
    r0.z = saturate(ps);
    ps = r7.z;
    r0.xy = r0.xx * ModShadowGroupColor.xy;
    ps = r3.z * ps;
    r0.xyz = -r0.xyz + 1.0;
    r7.z = ps;
    ps = r7.w;
    r7.xy = r7.xy * r0.xy;
    ps = r3.z * ps;
    r0.w = float((r0.z >= 0.004));
    r7.w = ps;
    r3 = r7 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r3.x * r3.y;
    r0.xy = abs(r3.zw) * abs(r3.zw);
    r0.z = ps;
    r2.xyz = r0.zzz * r2.xyz + ModShadowColor.xyz;
    r3.xyz = r6.xyz * r0.xxx;
    r0.xyz = r6.xyz * r0.yyy;
    r0.xyz = r0.xyz * LowerSkyColor.xyz + r5.xyz;
    r0.xyz = r3.zxy * UpperSkyColor.zxy + r0.zxy;
    ps = UniformVector_0.z + r0.x;
    r3.xy = r4.xy + r0.yz;
    r3.z = ps;
    ps = -r1.w;
    r0.xyz = r3.xyz * r2.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r0.w + r1.w;
    r0.xyz = r2.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
