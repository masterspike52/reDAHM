// ps_fe9bd803232981ad.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r1.zw = r1.xy * 2e+01;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.x = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r6.xy = r7.yz * abs(r6.xy);
    r7.y = ps;
    r5.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r1.y = tex2D(ShadowTexture, r0.xy).x;
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r1.zw).xyz;
    ps = rsqrt(abs(r1.x));
    r0.y = saturate(-r0.w + 1.0);
    r1.z = ps;
    ps = r2.z;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r7.xyz = r9.xyz * r7.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r9.xyz = r1.zzz * r2.zxy;
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r4.xyz = r0.zzz * r4.xyz;
    r0.z = ps;
    ps = log2(r0.y);
    r10.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    r0.zw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r1.x = dot(r10.zxy, r3.zxy);
    r3.yz = -r4.xy;
    r3.x = r4.z * 2.0 - r4.z;
    r0.x = saturate(dot(r9.yzx, r3.yzx));
    ps = log2(r0.x);
    r1.x = r1.x - SpotAngles.x;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r1.z = saturate(r1.z * r2.z);
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1.x = saturate(r1.x * SpotAngles.y);
    r8.z = ps;
    r3.xyz = r8.xyz * float3(0.875, 0.875, 0.21952);
    r2.xyz = r7.xyz * r1.zzz + r3.zzz;
    r1.zw = r3.xy * r0.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r1.xyz = r1.zxy * r1.wxy;
    r0.w = ps;
    r0.xyz = r1.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r3.xyz = r1.zzz * r5.xyz;
    r0.w = ps;
    r3.xyz = r3.xyz * r0.www;
    r2.xyz = r3.xyz * r2.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r2.xyz * r1.yyy;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
