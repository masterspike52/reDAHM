// ps_95af991cc4c1ff24.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040700 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = ps;
    ps = 1.0 / r5.w;
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r1.xy = r1.xy * 2e+01;
    r7.x = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r7.y = ps;
    r0.zw = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r7.z = tex2D(ShadowTexture, r0.xy).x;
    r7.xy = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = -ModShadowColor.x;
    r0.y = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = r2.z;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.w = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r0.w = saturate(-r0.w + 1.0);
    r0.z = ps;
    ps = 5.0 * r0.x;
    r1.xyz = r6.yzw * r1.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r6.yzw = r0.zzz * r2.zxy;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r3.xyz = r0.yyy * r4.zxy;
    r0.x = ps;
    r0.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = -ModShadowColor.y;
    r3.yz = -r3.yz;
    r3.x = r3.x * 2.0 - r3.x;
    ps = 1.0 + ps;
    r1.w = saturate(dot(r6.zwy, r3.yzx));
    r6.y = ps;
    ps = log2(r1.w);
    r0.z = saturate(r0.z * r2.z);
    r1.w = ps;
    ps = log2(r0.w);
    r1.w = r1.w * 15.0;
    r0.w = ps;
    ps = pow(2.0, r1.w);
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r7.w = ps;
    ps = -ModShadowColor.z;
    r2.xyz = r7.xyw * float3(0.875, 0.875, 0.21952);
    r1.xyz = r1.xyz * r0.zzz + r2.zzz;
    r7.xy = r2.xy * r0.xy + 0.125;
    ps = 1.0 + ps;
    r2.xy = r7.xz * r7.yz;
    r6.z = ps;
    r0.xyz = r2.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r2.xyz = r2.yyy * r5.xyz;
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
