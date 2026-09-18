// ps_5b535d5738a9baf4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040700 00000506 00000000 000050A5 001F001F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    r5.xy = r7.xy * abs(r5.xy);
    r5.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = 0.21952 * r0.z;
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.z = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r0.z));
    r3.xyz = r5.www * r3.zxy;
    r0.z = ps;
    r1.xyz = r0.zzz * r1.zxy;
    r3.yz = -r3.yz;
    r3.x = r3.x * 2.0 - r3.x;
    ps = 0.1 - -r1.x;
    r1.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = 5.0 * r0.z;
    r1.y = saturate(dot(r1.yzx, r3.yzx));
    r0.z = saturate(ps);
    ps = log2(r1.y);
    r1.x = -r0.z + 1.0;
    r0.z = ps;
    ps = 15.0 * r0.z;
    r1.y = -UniformVector_0.y + 1.0;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r1.xz = r1.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r3.z = r5.x * r0.z;
    r5.x = ps;
    r5 = r5.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    ps = OpacityOverride.x;
    r4.xy = r5.xy * r4.zz;
    r1.w = saturate(ps);
    r1.xzw = -r1.xzw + 1.0;
    r4.zw = r5.zw * r1.xz;
    ps = 0.21952 * r0.z;
    r1.x = float((r1.w >= 0.004));
    r1.z = ps;
    r3.xw = r1.zz * r0.xy;
    r0.w = r1.y * r0.y + r3.w;
    r4 = r4 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r4.z * r4.w;
    r1.zw = abs(r4.xy) * abs(r4.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.zw = r1.zw * r1.yy;
    r0.w = r1.z * LowerSkyColor.y + r0.w;
    r0.w = r1.w * UpperSkyColor.y + r0.w;
    r3.y = r1.y * AmbientColorAndSkyFactor.y + r0.w;
    r1.yzw = r3.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r1.yzw * r0.xyz;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
