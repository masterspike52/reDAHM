// ps_7bd7c3b3d9e11ec0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_1, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r11.w - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r6.xy = r6.xy * abs(r8.xy);
    r7.x = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r7.y = ps;
    r6.zw = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r7.w = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r10.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = r2.z;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = 1.0 - r6.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.x = saturate(ps);
    r1.yzw = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r6.y = saturate(r6.y * 5.0);
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyw = r12.xyz * r11.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.zzz * r4.xyz;
    r6.x = ps;
    ps = r6.w;
    r11.xyz = r6.xxx * -SpotDirection.xyz;
    ps = r2.x * ps;
    r6.z = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    ps = log2(r7.x);
    r6.y = -r6.y + 1.0;
    r6.x = ps;
    r7.xy = -r6.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r11.zxy, r3.zxy);
    r6.z = ps;
    ps = r6.w;
    r1.yzw = r1.yzw * r6.zzz;
    ps = r2.y * ps;
    r3.xyz = r1.yzw * TwoSidedSign.xxx;
    r1.y = ps;
    ps = r6.w;
    r6.z = dot(r3.zxy, r4.zxy);
    ps = r2.z * ps;
    r11.xyz = r3.xzy * r6.zzz;
    r1.z = ps;
    r2.xyz = r11.xyz * 2.0 - r4.xzy;
    ps = -SpotAngles.x - -r6.y;
    r6.z = saturate(dot(r1.zxy, r2.yxz));
    r6.y = ps;
    ps = log2(r6.z);
    r7.z = saturate(r6.y * SpotAngles.y);
    r10.x = ps;
    r6.yzw = r10.xyz * float3(15.0, 0.875, 0.875);
    r7.xy = r6.zw * r7.xy + 0.125;
    ps = pow(2.0, r6.y);
    r0.z = saturate(dot(r3.zxy, r1.zxy));
    r6.y = ps;
    r6.yzw = r6.yyy * r8.xyz;
    r0.xy = r0.xy * r0.zz + r6.yz;
    r0.z = r0.w * r0.z + r6.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xyz = r7.wxz * r7.wyz;
    r6.w = ps;
    r6.xyz = r7.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r7.xxx * r5.xyz;
    r6.w = ps;
    r1.xyz = r1.xyz * r6.www;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xyz * r7.zzz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
