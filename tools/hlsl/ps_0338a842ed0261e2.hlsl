// ps_0338a842ed0261e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r7.y = dot(r4.zxy, r4.zxy);
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
    r8.y = tex2D(ShadowTexture, r0.xy).x;
    r10.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = r2.z;
    r7.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    r11.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r0.xyz = r9.xyz * r6.yzw;
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r9.xyz = r7.zzz * r2.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xzw = r7.yyy * r4.xyz;
    r7.y = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r7.yyy * -SpotDirection.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r7.x;
    r7.z = dot(r11.zxy, r11.zxy);
    r7.x = saturate(ps);
    ps = log2(r6.x);
    r7.x = -r7.x + 1.0;
    r6.x = ps;
    r4.xy = -r7.xx * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r7.z));
    r7.y = dot(r2.zxy, r3.zxy);
    r7.x = ps;
    r3.xyz = r11.xyz * r7.xxx;
    ps = UniformVector_1.x * r6.y;
    r7.x = dot(r3.zxy, r8.wxz);
    r2.x = ps;
    ps = UniformVector_1.y * r6.z;
    r7.xzw = r3.xzy * r7.xxx;
    r2.y = ps;
    r7.xzw = r7.xzw * 2.0 - r8.xwz;
    ps = -SpotAngles.x - -r7.y;
    r7.x = saturate(dot(r9.zxy, r7.zxw));
    r7.y = ps;
    ps = log2(r7.x);
    r8.x = saturate(r7.y * SpotAngles.y);
    r10.x = ps;
    ps = UniformVector_1.z * r6.w;
    r7.xyz = r10.yxz * float3(0.875, 15.0, 0.875);
    r2.z = ps;
    r8.zw = r7.xz * r4.xy + 0.125;
    ps = pow(2.0, r7.y);
    r7.x = saturate(dot(r3.zxy, r9.zxy));
    r6.y = ps;
    r6.yzw = r2.xyz * r6.yyy;
    r0.xy = r0.xy * r7.xx + r6.yz;
    r0.z = r0.z * r7.x + r6.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xyz = r8.zxy * r8.wxy;
    r6.w = ps;
    r6.xyz = r7.xxx * r1.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r7.zzz * r5.xyz;
    r6.w = ps;
    r1.xyz = r1.xzy * r6.www;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
