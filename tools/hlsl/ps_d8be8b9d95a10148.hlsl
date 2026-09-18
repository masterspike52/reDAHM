// ps_d8be8b9d95a10148.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ShadowTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.zz * ScreenPositionScaleBias.xy;
    r1.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r1.z = ps;
    r3.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r7.z = tex2D(ShadowTexture, r0.xy).x;
    ps = 0.1 - -r2.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.x = ps;
    r8.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r6 = tex2D(Texture2D_1, r1.xy);
    r7.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r4.zxy, r4.zxy);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r7.xyw * 2.0 - 1.0;
    r7.xyw = r6.xyz * UniformVector_1.xyz;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r7.xyw * r1.xyz;
    r0.y = ps;
    r2.xyz = r0.yyy * r2.xyz;
    ps = 5.0 * r0.x;
    r0.y = dot(r10.zxy, r10.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.w = -r0.x + 1.0;
    r0.x = ps;
    r7.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.y));
    r9.xyz = r0.xxx * r4.xyz;
    r0.x = ps;
    r4.xyz = r10.xyz * r0.xxx;
    r0.x = dot(r4.zxy, r9.zxy);
    ps = 1.0 - r0.z;
    r10.xyz = r4.xzy * r0.xxx;
    r0.y = saturate(ps);
    r0.xzw = r10.xyz * 2.0 - r9.xzy;
    ps = log2(r0.y);
    r0.x = saturate(dot(r2.zxy, r0.zxw));
    r0.y = ps;
    ps = log2(r0.x);
    r0.w = r0.y * LightColorAndFalloffExponent.w;
    r8.x = ps;
    r0.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    r7.xy = r0.yz * r7.xy + 0.125;
    ps = pow(2.0, r0.x);
    r0.y = saturate(dot(r4.zxy, r2.zxy));
    r0.x = ps;
    ps = r0.x;
    r2.xyw = r1.xyz * r0.yyy;
    ps = r6.w * ps;
    r1.xw = r7.xz * r7.yz;
    r2.z = ps;
    r0.xyz = r1.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xyz = r2.xyz + r2.zzw;
    ps = pow(2.0, r0.w);
    r2.xyz = r1.www * r3.xyz;
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
