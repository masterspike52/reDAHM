// ps_279f459d6e553faa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c5); // float3
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
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
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r5.ww * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r8.zw = r6.xz * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r4.xy = r6.xy * abs(r7.xy);
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    ps = r1.z;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r0.w = saturate(r0.w * 5.0);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xyz * r2.www;
    r6.w = ps;
    ps = r6.w;
    r5.w = dot(r4.wyz, r4.wyz);
    ps = r1.x * ps;
    r3.xyz = r1.www * r3.xyz;
    r4.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.w = -r0.w + 1.0;
    r5.w = ps;
    r2.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = r6.w;
    r4.yzw = r5.www * r4.yzw;
    ps = r1.y * ps;
    r7.xyz = r4.yzw * TwoSidedSign.xxx;
    r4.y = ps;
    ps = r6.w;
    r5.w = dot(r7.zxy, r3.zxy);
    ps = r1.z * ps;
    r11.xyz = r7.xzy * r5.www;
    r4.z = ps;
    r1.xyz = r11.xyz * 2.0 - r3.xzy;
    r5.w = saturate(dot(r4.zxy, r1.yxz));
    ps = log2(r5.w);
    r1.xyz = r10.xyz * r9.xyz;
    r8.z = ps;
    r3.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r3.z);
    r5.w = saturate(dot(r7.zxy, r4.zxy));
    r6.w = ps;
    r2.xy = r3.xy * r2.xy + 0.125;
    ps = r2.x * r2.y;
    r6.xyz = r6.www * r6.xyz;
    r6.w = ps;
    r5.xyz = r6.www * r5.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
