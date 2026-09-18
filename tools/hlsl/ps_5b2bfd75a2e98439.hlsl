// ps_5b2bfd75a2e98439.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r4.y = ps;
    r4.xy = r4.xy * abs(r6.xy);
    r5.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = OpacityOverride.x;
    r4.y = dot(r3.zxy, r3.zxy);
    r9.z = saturate(ps);
    ps = ConstantLighting.z;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.21952 * ps;
    r4.w = dot(r2.zxy, r2.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r4.w));
    r4.x = dot(r0.zxy, r0.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r4.x));
    r2.xyz = r4.www * r2.xyz;
    r4.x = ps;
    ps = -r2.x;
    r9.xyw = r4.xxx * r0.xyz;
    r0.y = ps;
    r0.x = r2.z * 2.0 - r2.z;
    ps = -r2.y;
    r4.x = r9.w + 0.1;
    r0.z = ps;
    ps = 5.0 * r4.x;
    r2.xyz = r6.xyz * UniformVector_1.xyz;
    r4.x = saturate(ps);
    ps = 1.0 - r4.x;
    r4.w = saturate(dot(r9.xyw, r0.yzx));
    r4.x = ps;
    ps = log2(r4.w);
    r9.xy = r4.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = rsqrt(abs(r4.y));
    r5.xzw = r5.xyz * float3(15.0, 0.875, 0.875);
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r4.xyw = -r9.xyz + 1.0;
    r5.x = ps;
    ps = r4.z;
    r0.zw = r5.zw * r4.xy;
    ps = r5.x * ps;
    r4.xyz = r5.yyx * float3(-0.5, 0.5, 0.21952);
    r5.z = ps;
    ps = ConstantLighting.x * r4.z;
    r4.w = float((r4.w >= 0.004));
    r5.x = ps;
    ps = ConstantLighting.y * r4.z;
    r0.xy = r4.xy * r3.zz;
    r5.y = ps;
    r5.xyz = r2.xyz * ConstantLighting.xyz + r5.xyz;
    r0 = r0.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    ps = r0.y * r0.z;
    r0.xw = abs(r0.wx) * abs(r0.wx);
    r4.x = ps;
    r4.xyz = r4.xxx * r8.xyz + ModShadowColor.xyz;
    r0.xyz = r2.xzy * r0.xxx;
    r2.xyz = r2.xzy * r0.www;
    r5.xyz = r2.xzy * LowerSkyColor.xyz + r5.xyz;
    r5.xyz = r0.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r7.xyz * r6.xyz + r5.xyz;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r4.xyz = r5.xyz * r4.xyz;
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
