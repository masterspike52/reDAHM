// ps_b48b7bc7da47410c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040A00 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.y = dot(r0.zxy, r0.zxy);
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = dot(r3.zxy, r3.zxy);
    r4.w = ps;
    r4.zw = r4.zw * abs(r6.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r5.x = ConstantLighting.z * 0.21952;
    r6.xyz = UniformVector_0.xyz + float3(5e+01, 0.1, 7e+01);
    r7.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r4.y));
    r5.y = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r5.y));
    r4.yzw = r4.yyy * r0.xyz;
    r5.y = ps;
    ps = OpacityOverride.x;
    r0.xyz = r5.yyy * r2.xyz;
    r5.w = saturate(ps);
    ps = rsqrt(abs(r4.x));
    r9.yz = -r0.xy;
    r10.x = ps;
    r9.x = r0.z * 2.0 - r0.z;
    ps = 0.1 - -r4.w;
    r2.yzw = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = 5.0 * r4.x;
    r0 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.x = saturate(ps);
    ps = 1.0 - r4.x;
    r4.y = saturate(dot(r4.yzw, r9.yzx));
    r4.x = ps;
    ps = log2(r4.y);
    r5.yz = r4.xx * ModShadowGroupColor.xy;
    r4.y = ps;
    ps = 15.0 * r4.y;
    r0.xy = r0.xy * r3.zz;
    r4.w = ps;
    ps = pow(2.0, r4.w);
    r4.xyz = -r5.yzw + 1.0;
    r2.x = ps;
    r0.zw = r0.zw * r4.xy;
    ps = r5.x;
    r4.w = float((r4.z >= 0.004));
    ps = r2.x * ps;
    r5 = r2 * 0.21952;
    r9.z = ps;
    ps = r5.x;
    r0 = r0 + float4(0.5, 0.5, 0.125, 0.125);
    r4.y = ps;
    ps = r0.z * r0.w;
    r4.xz = abs(r0.xy) * abs(r0.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.x * r4.y;
    r3.xyz = r5.ywz * r4.zzz;
    r9.x = ps;
    ps = ConstantLighting.y * r5.x;
    r8.xyz = r5.ywz * r4.xxx;
    r9.y = ps;
    r4.xyz = r5.yzw * ConstantLighting.xyz + r9.xyz;
    r4.xyz = r8.xzy * LowerSkyColor.xyz + r4.xyz;
    r4.xyz = r3.xzy * UpperSkyColor.xyz + r4.xyz;
    r4.xyz = r7.xyz * r2.yzw + r4.xyz;
    r4.xyz = r6.xyz + r4.xyz;
    ps = -r1.w;
    r4.xyz = r4.xyz * r0.xyz;
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
