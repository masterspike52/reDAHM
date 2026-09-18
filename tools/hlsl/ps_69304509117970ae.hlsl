// ps_69304509117970ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10041100 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c6); // float
float4 UniformScalar_15 : register(c7); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r7.yw = r1.xy + UniformVector_1.xy;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -UniformVector_0.xzy + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.yw = r6.yw * abs(r9.xy);
    r8.y = ps;
    r8.xy = r8.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r13.x = tex2D(ShadowTexture, r0.xy).x;
    r7.z = tex2D(Texture2D_4, r1.xy).w;
    r14.xyz = tex2D(Texture2D_3, r7.yw).xyz;
    r15.x = tex2D(Texture2D_2, r1.xy).w;
    r10.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r15.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.zw = tex2D(ModShadowAccumTexture, r6.yw).xy;
    r11.xyz = r0.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r0.xyz = r15.zyw * UniformScalar_8.xxx;
    r6.x = saturate(ps);
    r1.yz = r10.yz * UniformScalar_11.xx + r0.xz;
    ps = log2(r6.x);
    r1.xw = r15.xw * 0.5;
    r6.y = ps;
    r9.z = r1.w * r14.z;
    ps = r2.z;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 0.875 * r6.z;
    r9.xyw = r7.zzz * float3(0.2, 3.0, 0.5);
    r13.y = ps;
    ps = 0.875 * r6.w;
    r7.z = dot(r11.zxy, r11.zxy);
    r13.z = ps;
    ps = 5.0 * r6.x;
    r16.xyz = r9.xwy * r14.xzy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r17 = r15.xyxz * float4(0.2, 0.2, 3.0, 3.0);
    r7.w = ps;
    ps = r1.x;
    r9.xy = r17.yw * r14.xy;
    ps = r16.y * ps;
    r6.xz = r17.xz * r16.xz;
    r6.w = ps;
    r1.xw = -r7.ww * ModShadowGroupColor.xy + 1.0;
    r13.yz = r13.yz * r1.xw + 0.125;
    r6.xzw = r15.xxx * r14.xyz + r6.xzw;
    r1.xw = r13.yx * r13.zx;
    ps = rsqrt(abs(r7.y));
    r9.xyz = r6.xzw + r9.xyz;
    r7.y = ps;
    r6.xzw = r1.xxx * r12.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r7.z));
    r0.w = r9.y + r1.y;
    r8.w = ps;
    r7.yzw = r7.yyy * r4.xyz;
    r4.xyz = r11.xyz * r8.www;
    r8.w = dot(r4.zxy, r7.wyz);
    r11.xyz = r4.xzy * r8.www;
    r7.yzw = r11.xyz * 2.0 - r7.ywz;
    ps = rsqrt(abs(r7.x));
    r8.w = r9.z + r1.z;
    r7.x = ps;
    r1.xyz = r7.xxx * r2.xyz;
    r2.xyz = r10.xyz * UniformScalar_11.xxx + r9.xyz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r7.x = saturate(dot(r4.zxy, r1.zxy));
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r8.xyz = r1.www * r8.xyz;
    r6.y = ps;
    r8.xyz = r8.xzy * r6.yyy;
    ps = r8.w;
    r0.xyz = r2.xyz + r0.yxz;
    ps = r5.z + ps;
    r7.y = saturate(dot(r1.zxy, r7.zyw));
    r6.y = ps;
    ps = r7.y * r7.y;
    r2 = r0 + r5.xyzy;
    r1.w = ps;
    ps = r6.y;
    r0.xyz = r2.xyz * UniformScalar_15.xxx;
    ps = r3.y * ps;
    r1.xy = r2.xw * r3.xz;
    r1.z = ps;
    r7 = r1 * r7.xxxy;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xwz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
