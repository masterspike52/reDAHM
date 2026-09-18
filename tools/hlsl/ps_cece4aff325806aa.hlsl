// ps_cece4aff325806aa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040700 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.y = dot(r2.zxy, r2.zxy);
    r4.z = ps;
    r4.xz = r4.xz * abs(r6.xy);
    r5.yw = tex2D(ModShadowAccumTexture, r4.xz).xy;
    r5.z = ConstantLighting.z * 0.21952;
    ps = rsqrt(abs(r4.y));
    r4.x = dot(r0.zxy, r0.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r2.xyz = r4.yyy * r2.xyz;
    r4.x = ps;
    r4.yzw = r4.xxx * r0.xzy;
    r0.yz = -r2.xy;
    r0.x = r2.z * 2.0 - r2.z;
    ps = 0.1 - -r4.z;
    r5.x = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    ps = 5.0 * r4.x;
    r4.y = saturate(dot(r4.ywz, r0.yzx));
    r4.x = saturate(ps);
    ps = log2(r4.y);
    r4.x = -r4.x + 1.0;
    r4.y = ps;
    ps = 15.0 * r4.y;
    r0.x = -UniformVector_0.y + 1.0;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r4.xz = r4.xx * ModShadowGroupColor.xy;
    r4.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.z = r5.z * r4.y;
    r5.x = ps;
    r2 = r5.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    ps = OpacityOverride.x;
    r2.xy = r2.xy * r3.zz;
    r4.w = saturate(ps);
    r4.xzw = -r4.xzw + 1.0;
    r2.zw = r2.zw * r4.xz;
    ps = 0.21952 * r4.y;
    r4.w = float((r4.w >= 0.004));
    r4.x = ps;
    r5.xw = r4.xx * ConstantLighting.xy;
    r5.y = r0.x * ConstantLighting.y + r5.w;
    r2 = r2 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r2.z * r2.w;
    r0.yz = abs(r2.xy) * abs(r2.xy);
    r4.x = ps;
    r4.xyz = r4.xxx * r7.xyz + ModShadowColor.xyz;
    r0.yz = r0.yz * r0.xx;
    r5.y = r0.y * LowerSkyColor.y + r5.y;
    r5.y = r0.z * UpperSkyColor.y + r5.y;
    r5.y = r0.x * AmbientColorAndSkyFactor.y + r5.y;
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
