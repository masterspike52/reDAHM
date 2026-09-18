// ps_e3d6647ce1d544e4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xzw = tex2D(Texture2D_2, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.y;
    r4.xyz = r0.xyz * r4.xyz;
    r5.y = saturate(ps);
    ps = 5.0 * r6.x;
    r0.xyz = r9.xyz * r2.www;
    r0.w = saturate(ps);
    ps = rsqrt(abs(r3.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r2.x = ps;
    ps = rsqrt(abs(r1.w));
    r2.xyz = r2.xxx * r1.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r1.xxx * r3.xyz;
    r6.x = ps;
    ps = log2(r5.y);
    r0.w = -r0.w + 1.0;
    r5.y = ps;
    r1.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = 3.5 * r5.x;
    r3.xyz = r6.xxx * r6.yzw;
    r6.x = ps;
    ps = 3.5 * r5.z;
    r6.z = dot(r3.zxy, r9.zxy);
    r6.y = ps;
    ps = 3.5 * r5.w;
    r10.xyz = r3.xzy * r6.zzz;
    r6.z = ps;
    r5.xzw = r10.xyz * 2.0 - r9.xzy;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.x = saturate(dot(r2.zxy, r5.zxw));
    r6.w = ps;
    ps = log2(r5.x);
    r5.w = saturate(dot(r3.zxy, r2.zxy));
    r8.z = ps;
    ps = pow(2.0, r6.w);
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    r6.w = ps;
    ps = pow(2.0, r5.z);
    r0.xyz = r0.xzy * r6.www;
    r5.z = ps;
    r5.xy = r5.xy * r1.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xy = r4.xy * r5.ww + r6.xy;
    r6.z = r4.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
