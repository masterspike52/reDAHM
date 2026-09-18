// ps_d455aa07a5f9a4b9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040700 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
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
    float4 r0 = In.texcoord0;
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
    r5.y = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r5.z = ps;
    r5.xz = r5.xz * abs(r7.xy);
    r5.zw = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.y));
    r0.xyz = r3.xyz * r0.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r0.xyz * r6.xyz;
    r5.x = ps;
    r5.x = r5.x * r1.z + 0.1;
    ps = 5.0 * r5.x;
    r0 = r5.zwyy * float4(0.875, 0.875, 0.5, -0.5);
    r5.x = saturate(ps);
    r5.yzw = r3.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r6.xyz = r3.xzy * ConstantLighting.xzy + r5.ywz;
    ps = OpacityOverride.x;
    r5.x = -r5.x + 1.0;
    r5.z = saturate(ps);
    ps = r0.z;
    r5.xy = r5.xx * ModShadowGroupColor.xy;
    ps = r4.z * ps;
    r5.xyz = -r5.xyz + 1.0;
    r0.z = ps;
    ps = r0.w;
    r0.xy = r0.xy * r5.xy;
    ps = r4.z * ps;
    r5.w = float((r5.z >= 0.004));
    r0.w = ps;
    r0 = r0.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r0.y * r0.z;
    r0.xw = abs(r0.xw) * abs(r0.xw);
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r0.xyz = r3.xzy * r0.xxx;
    r1.xyz = r3.xzy * r0.www;
    r6.xyz = r1.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r0.xyz * UpperSkyColor.xzy + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
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
