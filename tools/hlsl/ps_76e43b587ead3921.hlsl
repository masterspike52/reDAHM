// ps_76e43b587ead3921.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040700 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
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
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r0.xz = r0.xz * abs(r6.xy);
    r1.yw = tex2D(ModShadowAccumTexture, r0.xz).xy;
    r1.z = ConstantLighting.z * 0.21952;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r0.yyy * r4.xyz;
    r0.x = ps;
    r0.yzw = r0.xxx * r2.xzy;
    r2.yz = -r4.xy;
    r2.x = r4.z * 2.0 - r4.z;
    ps = 0.1 - -r0.z;
    r1.x = dot(r5.zxy, r5.zxy);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = saturate(dot(r0.ywz, r2.yzx));
    r0.x = saturate(ps);
    ps = log2(r0.y);
    r0.x = -r0.x + 1.0;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r2.x = -UniformVector_0.y + 1.0;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.xz = r0.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = rsqrt(abs(r1.x));
    r1.z = r1.z * r0.y;
    r1.x = ps;
    r4 = r1.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    ps = OpacityOverride.x;
    r4.xy = r4.xy * r5.zz;
    r0.w = saturate(ps);
    r0.xzw = -r0.xzw + 1.0;
    r4.zw = r4.zw * r0.xz;
    ps = 0.21952 * r0.y;
    r0.w = float((r0.w >= 0.004));
    r0.x = ps;
    r1.xw = r0.xx * ConstantLighting.xy;
    r1.y = r2.x * ConstantLighting.y + r1.w;
    r4 = r4 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r4.z * r4.w;
    r2.yz = abs(r4.xy) * abs(r4.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r2.yz = r2.yz * r2.xx;
    r1.y = r2.y * LowerSkyColor.y + r1.y;
    r1.y = r2.z * UpperSkyColor.y + r1.y;
    r1.y = r2.x * AmbientColorAndSkyFactor.y + r1.y;
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
