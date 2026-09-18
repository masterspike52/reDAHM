// ps_1ca3c45289300930.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040600 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = ConstantLighting.z * 0.21952;
    r0.z = ps;
    r0.xz = r0.xz * abs(r6.xy);
    r0.zw = tex2D(ModShadowAccumTexture, r0.xz).xy;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r1.xyw = r0.yyy * r4.xyz;
    r0.x = ps;
    ps = -r1.x;
    r4.xyz = r0.xxx * r2.xyz;
    r2.y = ps;
    r2.x = r1.w * 2.0 - r1.w;
    ps = -r1.y;
    r0.x = r4.z + 0.1;
    r2.z = ps;
    ps = 5.0 * r0.x;
    r1.x = dot(r5.zxy, r5.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r1.x));
    r0.y = saturate(dot(r4.xyz, r2.yzx));
    r1.y = ps;
    ps = log2(r0.y);
    r0.x = -r0.x + 1.0;
    r1.x = ps;
    r2.xyz = r1.xyy * float3(15.0, -0.5, 0.5);
    ps = pow(2.0, r2.x);
    r1.xy = r0.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    r1.z = r1.z * r0.y;
    ps = OpacityOverride.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = saturate(ps);
    r1.xyw = -r1.xyw + 1.0;
    ps = -UniformVector_0.x;
    r5.zw = r2.yz * r5.zz;
    ps = 1.0 + ps;
    r0.xyz = r0.zwy * float3(0.875, 0.875, 0.21952);
    r2.x = ps;
    ps = ConstantLighting.x * r0.z;
    r0.w = float((r1.w >= 0.004));
    r1.w = ps;
    ps = ConstantLighting.y * r0.z;
    r5.xy = r0.xy * r1.xy;
    r1.y = ps;
    r1.x = r2.x * ConstantLighting.x + r1.w;
    r5 = r5 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r5.x * r5.y;
    r2.yz = abs(r5.zw) * abs(r5.zw);
    r0.x = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r2.yz = r2.yz * r2.xx;
    r1.x = r2.y * LowerSkyColor.x + r1.x;
    r1.x = r2.z * UpperSkyColor.x + r1.x;
    r1.x = r2.x * AmbientColorAndSkyFactor.x + r1.x;
    r1.xyz = r1.xyz + UniformVector_0.xyz;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
