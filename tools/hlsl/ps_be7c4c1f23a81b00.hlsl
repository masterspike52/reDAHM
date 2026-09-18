// ps_be7c4c1f23a81b00.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040800 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r4.zxy, r4.zxy);
    r3.xyz = r6.yzw * r0.xyz;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r8.zxy, r8.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.x = ps;
    r6.yzw = r0.xyz * r6.yzw + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.y));
    r4.xyz = r6.xxx * r4.xyz;
    r5.y = ps;
    r6.x = r5.z * r1.z + 0.1;
    ps = OpacityOverride.x;
    r0.xyw = r5.yyy * r8.xyz;
    r0.z = saturate(ps);
    ps = 5.0 * r6.x;
    r5.z = dot(r4.zxy, r0.wxy);
    r5.y = saturate(ps);
    ps = 1.0 - r5.y;
    r0.xyw = r0.www * ConstantLighting.xyz;
    r5.y = ps;
    r6.xyz = r0.xwy * r3.xzy + r6.ywz;
    ps = 0.875 * r5.x;
    r0.xy = r5.yy * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = 0.875 * r5.w;
    r0.xyw = -r0.xyz + 1.0;
    r1.y = ps;
    ps = 0.5 * r5.z;
    r0.xy = r1.xy * r0.xy;
    r0.z = ps;
    ps = (-0.5) * r5.z;
    r5.w = float((r0.w >= 0.004));
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
