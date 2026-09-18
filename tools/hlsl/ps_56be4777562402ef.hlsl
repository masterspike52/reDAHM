// ps_56be4777562402ef.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 10040900 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r8.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1.x = tex2D(ShadowTexture, r0.xy).x;
    r0.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r2.z;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r6.z = saturate(-r6.z + 1.0);
    r7.w = ps;
    ps = 5.0 * r6.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r6.y));
    r3.xyz = r7.www * r2.zxy;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r1.yzw = r6.yyy * r4.zxy;
    r6.x = ps;
    r6.xy = -r6.xx * ModShadowGroupColor.xy + 1.0;
    r1.zw = -r1.zw;
    r1.y = r1.y * 2.0 - r1.y;
    r6.w = saturate(dot(r3.yzx, r1.zwy));
    ps = log2(r6.w);
    r8.x = saturate(r7.w * r2.z);
    r0.x = ps;
    ps = log2(r6.z);
    r0.xyw = r0.yzx * float3(0.875, 0.875, 15.0);
    r6.z = ps;
    ps = pow(2.0, r0.w);
    r6.w = r6.z * LightColorAndFalloffExponent.w;
    r0.w = ps;
    r1.yz = r0.xy * r6.xy + 0.125;
    ps = r1.x * r1.x;
    r0.xyz = r9.xyz * r8.yzw;
    r7.w = ps;
    ps = r1.y * r1.z;
    r0 = r0 * r8.xxxy;
    r6.x = ps;
    r6.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    r7.xyz = r0.xyw + r0.wwz;
    ps = pow(2.0, r6.w);
    r0.xyz = r7.www * r5.xyz;
    r6.w = ps;
    r0.xyz = r0.xzy * r6.www;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
