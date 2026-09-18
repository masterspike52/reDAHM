// ps_e62bc64712abcab2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 10040900 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D LightMapTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r5.zxy, r5.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = r7.xzy * LightMapScale.xzy;
    ps = rsqrt(abs(r6.y));
    r9.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    r6.y = ps;
    r7.xyz = r1.xyz * 0.1 + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r8.xyz * r1.xyz;
    r6.x = ps;
    r6.x = r6.x * r2.z + 0.1;
    r7.xyz = r9.xyz * r8.xyz + r7.xyz;
    r7.xyz = r0.xyz * r1.xzy + r7.xzy;
    ps = 5.0 * r6.x;
    r0 = r6.zwyy * float4(0.875, 0.875, 0.5, -0.5);
    r6.x = saturate(ps);
    ps = OpacityOverride.x;
    r6.x = -r6.x + 1.0;
    r6.z = saturate(ps);
    ps = r0.z;
    r6.xy = r6.xx * ModShadowGroupColor.xy;
    ps = r5.z * ps;
    r6.xyz = -r6.xyz + 1.0;
    r0.z = ps;
    ps = r0.w;
    r0.xy = r0.xy * r6.xy;
    ps = r5.z * ps;
    r6.w = float((r6.z >= 0.004));
    r0.w = ps;
    r0 = r0.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r0.y * r0.z;
    r0.xw = abs(r0.xw) * abs(r0.xw);
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r0.xyz = r1.xzy * r0.xxx;
    r1.xyz = r1.xzy * r0.www;
    r7.xyz = r1.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r0.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
