// ps_5a6da7e928aab5b5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040700 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D ShadowTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.x = r1.z + 0.1;
    r5.y = 1.0 / r4.w;
    r6.xy = r5.yy * ScreenPositionScaleBias.xy;
    r5.w = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r5.zw * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.z = tex2D(ShadowTexture, r0.xy).x;
    r6.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r4.zw = -UniformVector_0.xy + 1.0;
    r5.y = rsqrt(abs(r5.y));
    ps = 5.0 * r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r0.xyz = r5.yyy * r1.zxy;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r5.zzz * r3.xyz;
    r5.x = ps;
    r4.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.zw = -r3.xy;
    r5.x = r3.z * 2.0 - r3.z;
    r5.x = saturate(dot(r0.yzx, r5.zwx));
    ps = log2(r5.x);
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r3.xyz = r6.xyw * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r3.z);
    r3.w = saturate(r5.y * r1.z);
    r5.x = ps;
    r6.xy = r3.xy * r4.xy + 0.125;
    ps = 0.21952 * r5.x;
    r5.y = ps;
    r5.yz = r3.ww * r4.zw + r5.yy;
    r6.xw = r6.xz * r6.yz;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r2.xyz;
    r0.xyz = r0.zxy * float3(0.21952, 1.0, 1.0);
    r5.xyz = r0.yxz * r5.yxz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
