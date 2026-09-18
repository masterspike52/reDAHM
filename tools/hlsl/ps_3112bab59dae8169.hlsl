// ps_3112bab59dae8169.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
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

    r7 = tex2D(Texture2D_0, r1.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r7.x - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r6.xy = r6.xy * abs(r8.xy);
    r0.z = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r0.w = ps;
    r6.zw = r0.zw * r5.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r5.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r2.z;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r6.z = saturate(r6.z * 5.0);
    r6.y = ps;
    ps = 1.0 - r6.z;
    r7.yzw = r9.xyz * r7.yzw;
    r6.w = ps;
    ps = rsqrt(abs(r7.x));
    r3.xyz = r6.yyy * r2.xyz;
    r6.z = ps;
    r0.yz = -r6.ww * ModShadowGroupColor.xy + 1.0;
    ps = TwoSidedSign.x * r6.y;
    r8.xyz = r6.zzz * r4.xyz;
    r7.x = ps;
    ps = TwoSidedSign.x * r6.z;
    r9.xy = r3.xy * -r8.xy;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r9.z = r6.y * r4.z;
    r6.y = saturate(ps);
    ps = log2(r6.y);
    r6.xz = r9.xz + r9.yz;
    r6.y = ps;
    r6.w = r6.z * TwoSidedSign.x - r8.z;
    r6.x = saturate(r3.z * r6.w + r6.x);
    ps = log2(r6.x);
    r6.w = r6.y * LightColorAndFalloffExponent.w;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.x = saturate(r7.x * r2.z);
    r5.z = ps;
    r6.xyz = r5.xyz * float3(0.875, 0.875, 0.21952);
    r7.xyz = r7.yzw * r7.xxx + r6.zzz;
    r0.yz = r6.xy * r0.yz + 0.125;
    r0.xy = r0.xy * r0.xz;
    r6.xyz = r0.yyy * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r0.xyz = r0.xxx * r1.xyz;
    r6.w = ps;
    r0.xyz = r0.xyz * r6.www;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
