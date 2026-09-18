// ps_4e46a33c60636d1c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10040700 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ShadowTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = r1.z + 0.1;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.ww * ScreenPositionScaleBias.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    r5.xy = r6.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r6.z = tex2D(ShadowTexture, r0.xy).x;
    r6.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = -ModShadowColor.x;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.y = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = saturate(-r0.y + 1.0);
    r2.x = ps;
    ps = 5.0 * r0.z;
    r0.y = dot(r3.zxy, r3.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r5.yzw = r2.xxx * r1.zxy;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r2.yzw = r0.yyy * r3.zxy;
    r0.x = ps;
    r0.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = -ModShadowColor.y;
    r2.zw = -r2.zw;
    r2.y = r2.y * 2.0 - r2.y;
    ps = 1.0 + ps;
    r1.w = saturate(dot(r5.zwy, r2.zwy));
    r5.y = ps;
    ps = log2(r1.w);
    r0.z = saturate(r2.x * r1.z);
    r7.x = ps;
    ps = log2(r0.w);
    r1 = r7 * float4(15.0, 0.21952, 0.21952, 0.21952);
    r0.w = ps;
    ps = pow(2.0, r1.x);
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r6.w = ps;
    ps = -ModShadowColor.z;
    r2.xyz = r6.xyw * float3(0.875, 0.875, 0.21952);
    r1.xyz = r1.yzw * r0.zzz + r2.zzz;
    r6.xy = r2.xy * r0.xy + 0.125;
    ps = 1.0 + ps;
    r2.xy = r6.xz * r6.yz;
    r5.z = ps;
    r0.xyz = r2.xxx * r5.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r2.xyz = r2.yyy * r4.xyz;
    r0.w = ps;
    r2.xyz = r2.xyz * r0.www;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
