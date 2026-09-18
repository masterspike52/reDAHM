// ps_c75ed662f1d368e3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r7.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = 0.875 * r5.x;
    r0.xyz = r0.xyz * r2.www;
    r7.x = ps;
    ps = 0.875 * r5.y;
    r2.xyz = r7.yzw * r4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r6 = r6.xxyz * float4(5e+01, 5.0, 5.0, 5.0);
    r0.w = ps;
    ps = 5.0 * r5.z;
    r5.y = dot(r9.zxy, r9.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r4.xyz = r0.www * r1.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r5.yyy * r9.xyz;
    r5.x = ps;
    r5.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.yz = r7.xy * r5.xy + 0.125;
    r3.xyz = r3.xyz * TwoSidedSign.xxx;
    r5.x = dot(r3.zxy, r1.zxy);
    r7.xyz = r3.xzy * r5.xxx;
    r1.xyz = r7.xyz * 2.0 - r1.xzy;
    r5.w = saturate(dot(r4.zxy, r1.yxz));
    ps = log2(r5.w);
    r5.x = max(r6.x, 0.0001);
    r5.w = ps;
    r1.xy = r5.xy * r5.wz;
    r5.xyz = r1.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r5.w = saturate(dot(r3.zxy, r4.zxy));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
