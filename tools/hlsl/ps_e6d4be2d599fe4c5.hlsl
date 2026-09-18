// ps_e6d4be2d599fe4c5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.xy + UniformVector_2.xy;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r6.xy = r0.xy + UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.zw = r6.zw * abs(r7.xy);
    r4.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r9.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.y;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.y = saturate(ps);
    ps = 5.0 * r5.x;
    r8.xyz = r8.xyz * r2.www;
    r5.x = saturate(ps);
    r0.xyz = r0.xyz * 2.0 - 2.0;
    ps = rsqrt(abs(r5.w));
    r10.xyz = r10.xyz * UniformVector_3.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r2.xyz = r5.www * r1.xyz;
    r5.w = ps;
    ps = r5.w;
    r7.xyz = r10.xyz * r7.xyz;
    r1.xyz = r9.xyz * 2.0 + r0.xyz;
    ps = r3.x * ps;
    r5.z = -r5.x + 1.0;
    r5.x = ps;
    r0.xy = -r5.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r5.y);
    r5.z = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r5.z = ps;
    ps = r5.w;
    r1.xyz = r1.xyz * r5.zzz;
    ps = r3.y * ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r7.xyz * r6.xyz;
    r6.w = ps;
    ps = r5.w;
    r1.xyz = r1.xyz * r6.www;
    ps = r3.z * ps;
    r7.xyz = r1.xyz * TwoSidedSign.xxx;
    r5.w = ps;
    r6.w = dot(r7.zxy, r5.wxz);
    r1.xyz = r7.xzy * r6.www;
    r5.xzw = r1.xyz * 2.0 - r5.xwz;
    ps = pow(2.0, r5.y);
    r5.x = saturate(dot(r2.zxy, r5.zxw));
    r5.y = ps;
    ps = log2(r5.x);
    r1.xyz = r8.xyz * r5.yyy;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.xzw = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.y = saturate(dot(r7.zxy, r2.zxy));
    r4.x = ps;
    r2.xyz = r4.xyz * float3(0.1, 0.875, 0.875);
    r6.xyz = r6.xyz * r5.yyy + r2.xxx;
    r0.xy = r2.yz * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r6.xyz = r1.xyz * r6.xyz;
    r5.y = ps;
    r5.xyz = r5.yyy * r5.xzw + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
