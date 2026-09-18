// ps_c2489d7d8142e690.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040700 0000070A 00000000 000070E7 001F007F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r0.z * 0.21952;
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r6.yw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    ps = rsqrt(abs(r5.x));
    r6.x = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.xzw = r5.xxx * r3.xyz;
    r6.x = ps;
    ps = -r5.x;
    r3.xyz = r6.xxx * r1.xyz;
    r1.y = ps;
    r1.x = r5.w * 2.0 - r5.w;
    ps = -r5.z;
    r5.x = r3.z + 0.1;
    r1.z = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r4.zxy, r4.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r5.z = saturate(dot(r3.xyz, r1.yzx));
    r5.w = ps;
    ps = log2(r5.z);
    r5.x = -r5.x + 1.0;
    r5.z = ps;
    r3.xyz = r5.zww * float3(15.0, -0.5, 0.5);
    ps = pow(2.0, r3.x);
    r1.xy = r5.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    r6.z = r5.y * r6.x;
    ps = OpacityOverride.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r1.z = saturate(ps);
    r1.xyz = -r1.xyz + 1.0;
    r3.zw = r3.yz * r4.zz;
    r5.w = float((r1.z >= 0.004));
    r6.xyw = r6.xyw * float3(0.21952, 0.875, 0.875);
    ps = -UniformVector_0.x;
    r3.xy = r6.yw * r1.xy;
    ps = 1.0 + ps;
    r6.yw = r6.xx * r0.yx;
    r1.x = ps;
    r6.x = r1.x * r0.x + r6.w;
    r0 = r3.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    ps = r0.z * r0.w;
    r0.xy = abs(r0.xy) * abs(r0.xy);
    r0.z = ps;
    r5.xyz = r0.zzz * r5.xyz + ModShadowColor.xyz;
    r0.xy = r0.xy * r1.xx;
    r6.x = r0.x * LowerSkyColor.x + r6.x;
    r6.x = r0.y * UpperSkyColor.x + r6.x;
    r6.x = r1.x * AmbientColorAndSkyFactor.x + r6.x;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
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
