// ps_33599f331128244f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040C00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
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

    ps = 1.0 / r5.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
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
    r10.x = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r10.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r2.z;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.z));
    r12.x = saturate(r7.x * 5.0);
    r7.y = ps;
    ps = 1.0 - r6.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r7.x = saturate(ps);
    r0.xyw = r0.xyz * 2.0 - 1.0;
    ps = 0.7 * r0.w;
    r6.x = dot(r10.ywz, float3(1.0, 1.0, 1.0));
    r10.y = ps;
    ps = log2(r7.x);
    r1.xyz = r7.yyy * r4.xyz;
    r7.x = ps;
    ps = 1.0 * r0.x;
    r7.y = dot(r1.zxy, r0.wxy);
    r10.z = ps;
    ps = log2(abs(r6.x));
    r12.y = max(r7.y, 0.0);
    r0.z = ps;
    ps = 1.0 * r0.y;
    r3 = r0.wxyz * float4(0.7, 1.0, 1.0, 0.1);
    r10.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.y = dot(r3.xyz, r3.xyz);
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r6.xz = -r12.yx + float2(0.45, 1.0);
    r7.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r7.zzz * r2.xyz;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.xyz = r10.zwy * r7.yyy;
    r0.y = ps;
    ps = pow(2.0, r3.w);
    r7.z = dot(r3.zxy, r1.zxy);
    r0.z = ps;
    ps = 0.875 * r6.y;
    r0.xyw = -r0.xyz + 1.0;
    r7.y = ps;
    ps = 0.875 * r6.w;
    r4.xyz = r3.xzy * r7.zzz;
    r7.z = ps;
    r10.zw = r7.yz * r0.xy + 0.125;
    r7.yzw = r0.www * r8.xyz;
    r1.xyz = r4.xyz * 2.0 - r1.xzy;
    r10.y = saturate(dot(r2.zxy, r1.yxz));
    ps = 4.0 * r6.x;
    r1.xyz = r7.yzw * UniformVector_3.www;
    r6.w = saturate(ps);
    r6.xyz = r1.xyz * UniformVector_3.xyz - r7.yzw;
    r0.xyz = r6.www * r6.xyz + r7.yzw;
    r7.yzw = r10.zxy * r10.wxy;
    r6.xyz = r7.yyy * r11.xyz + ModShadowColor.xyz;
    r7.y = r7.w * r10.y;
    r1.xyz = r8.xyz * UniformScalar_0.xxx;
    r6.w = saturate(dot(r3.zxy, r2.zxy));
    r2.xyz = r1.xyz * r0.www;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r1.xyz = r0.xyz * r9.xyz;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r0.xyz = r7.zzz * r5.xyz;
    r7.x = ps;
    r0.xyz = r0.xzy * r7.xxx;
    r7.xyz = r2.xyz * r7.yyy;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
