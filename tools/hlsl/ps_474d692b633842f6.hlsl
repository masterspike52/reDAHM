// ps_474d692b633842f6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040800 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
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
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = UniformVector_0.xyz + float3(32.0, 2e+01, 0.5);
    r4.y = ps;
    r4.xy = r4.xy * abs(r6.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r4.x = dot(r3.zxy, r3.zxy);
    r4.y = dot(r0.zxy, r0.zxy);
    r8.xyz = AmbientColorAndSkyFactor.xyz * float3(32.0, 2e+01, 0.5);
    r5.xyz = r8.xyz * r7.yzw + r5.xyz;
    ps = rsqrt(abs(r4.y));
    r5.w = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r5.w));
    r4.yzw = r4.yyy * r0.zxy;
    r5.w = ps;
    ps = rsqrt(abs(r4.x));
    r0.xyz = r5.www * r2.zxy;
    r6.z = ps;
    r0.x = r0.x * 2.0 - r0.x;
    ps = -r0.y;
    r2 = r6.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r0.y = ps;
    ps = -r0.z;
    r2.zw = r2.zw * r3.zz;
    r0.z = ps;
    ps = 0.1 - -r4.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = 5.0 * r4.x;
    r4.w = saturate(dot(r4.zwy, r0.yzx));
    r4.x = saturate(ps);
    ps = 1.0 - r4.x;
    r4.x = ps;
    ps = OpacityOverride.x;
    r4.xy = r4.xx * ModShadowGroupColor.xy;
    r4.z = saturate(ps);
    ps = log2(r4.w);
    r4.xyz = -r4.xyz + 1.0;
    r7.x = ps;
    r0 = r7 * float4(15.0, 32.0, 2e+01, 0.5);
    r2.xy = r2.xy * r4.xy;
    r4.w = float((r4.z >= 0.004));
    r2 = r2.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r2.y * r2.z;
    r2.xw = abs(r2.xw) * abs(r2.xw);
    r4.x = ps;
    r4.xyz = r4.xxx * r3.xyz + ModShadowColor.xyz;
    r2.xyz = r0.ywz * r2.xxx;
    ps = pow(2.0, r0.x);
    r3.xyz = r0.ywz * r2.www;
    r5.w = ps;
    r5.xyz = r3.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r2.xyz * LowerSkyColor.xzy + r5.xzy;
    r5.xyz = r5.www * ConstantLighting.xyz + r5.xzy;
    r5.xyz = r0.ywz * ConstantLighting.xzy + r5.xzy;
    ps = -r1.w;
    r4.xyz = r5.xzy * r4.xyz;
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
