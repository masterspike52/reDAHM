// ps_af5b047b8cd7d274.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 354 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000588 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * UniformVector_6.xy;
    r6.yzw = tex2D(Texture2D_7, r5.xy).xyz;
    r11.xyw = tex2D(Texture2D_6, r0.xy).yzx;
    r5.z = float((UniformScalar_4.x >= 1.0));
    ps = r1.z;
    r5.w = float((UniformScalar_4.x > 1.0));
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r10.zw = r11.yx * UniformScalar_5.xx;
    r6.x = ps;
    r6.yzw = (-abs(r5.www) >= 0.0) ? r6.yzw : 1.0;
    r8.yzw = (-abs(r5.zzz) >= 0.0) ? 1.0 : r6.yzw;
    ps = (-4e+02) - -r4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r19.w = saturate(ps);
    ps = 5.0 * r5.y;
    r9.xyz = r6.xxx * r3.xyz;
    r19.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.x = r19.w * (-0.025);
    r8.x = ps;
    r10.xy = r9.xy * r5.xx + r5.zw;
    r15.yzw = r10.wzy * r8.zwx;
    ps = 1.0 / UniformVector_1.x;
    r5.y = -r15.w + 1.0;
    r5.x = ps;
    r5.yz = r5.yx * UniformVector_2.yx;
    r5.x = r5.z * r10.x;
    r3 = tex2D(Texture2D_1, r5.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r0.w * UniformVector_2.x;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r18.y = trunc(UniformScalar_1.x);
    r5.w = ps;
    r5.y = (r18.y == 0.0) ? r3.x : r3.y;
    ps = -r0.z;
    r6.zw = r5.zw * abs(r7.xy);
    ps = 1.0 + ps;
    r6.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.y * r5.z;
    r12.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = (-0.5) + r5.x;
    r7.yz = float2((r5.xz >= 0.5));
    r7.x = ps;
    ps = (-0.5) + r5.z;
    r18.x = dot(r7.yzz, float3(1.0, 1.0, 1.0));
    r7.w = ps;
    ps = 1.0 / r4.w;
    r12.zw = r7.xw - r5.xz;
    r7.x = ps;
    r13.xy = r12.xy * r7.xx + ScreenPositionScaleBias.wz;
    r5.zw = r12.zw * r7.yz + r5.xz;
    r14 = r18.yyxx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.x = (r14.y == 0.0) ? r3.z : r5.y;
    r5.x = (r14.x == 0.0) ? r3.w : r5.x;
    ps = 0.25 + r5.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    r3.xyz = r5.yzw + r5.xzw;
    r12.yzw = tex2D(Texture2D_5, r10.xy).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r17.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r13 = tex2D(Texture2D_1, r3.yz);
    r20 = tex2D(Texture2D_4, r0.xy);
    r21.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r6.xy).xyw;
    r5.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    ps = r4.w;
    r6.x = dot(r2.zxy, r2.zxy);
    r10.xyw = r10.xyz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r18.zw = r5.xy + r5.xy;
    r19.y = saturate(ps);
    r17.zw = r6.yz * 2.0 - 1.0;
    r5.xyz = r21.zxy * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r5.w = r6.w * r5.w;
    r0.x = saturate(ps);
    ps = (-1.0) - -r5.w;
    r4.xyz = UniformVector_5.xzy * 2e+01;
    r0.y = ps;
    ps = UniformVector_4.x * r5.y;
    r6.xzw = r20.xyz * r20.www;
    r6.y = ps;
    ps = log2(r0.x);
    r6.xzw = r4.zyx * r6.zwx;
    r5.y = ps;
    r11.xyz = r8.yzw * r11.wxy + r6.wxz;
    ps = UniformVector_4.y * r5.z;
    r0.x = dot(r6.zwx, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = UniformVector_4.z * r5.x;
    r0.x = r0.x - r6.w;
    r6.x = ps;
    r5.x = (r18.x == 0.0) ? r13.x : r13.y;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r0.x = saturate(r0.x + r6.w);
    r6.w = ps;
    r14.xy = -r6.yz * r0.xx + r6.yz;
    r5.x = (r14.w == 0.0) ? r13.z : r5.x;
    r19.z = (r14.z == 0.0) ? r13.w : r5.x;
    ps = 1.0 - r6.x;
    r5.x = max(r19.z, 0.0);
    r13.x = ps;
    ps = r5.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 0.3;
    r3.yzw = -r19.zxy + 1.0;
    r0.w = ps;
    r5.yz = -r3.zz * ModShadowGroupColor.xy + 1.0;
    ps = min(r0.z, r0.w);
    r13.w = saturate(r3.x - r5.w);
    r3.x = ps;
    ps = r3.y;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r18.xy = r17.xy * r5.yz;
    r13.z = ps;
    ps = 3.3333333 * r3.x;
    r5 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r13.y = ps;
    ps = r5.x * r5.y;
    r0.zw = r5.zw + r17.zw;
    r5.x = ps;
    r4.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r1.w));
    r5 = r13.yyyx * r0.yzwx;
    r4.w = ps;
    ps = pow(2.0, r6.w);
    r5.w = r6.x + r5.w;
    r6.x = ps;
    ps = UniformScalar_5.x * r8.y;
    r6.yzw = r16.xyz * r2.www;
    r1.w = ps;
    ps = r1.w;
    r2.xyz = r4.www * r1.xyz;
    ps = r11.w * ps;
    r6.xyz = r6.ywz * r6.xxx;
    r15.x = ps;
    ps = 1.0 - r0.x;
    r1.xyz = r15.xyz + UniformScalar_6.xxx;
    r6.w = ps;
    ps = r5.x;
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r5.yz = r14.xy + r5.yz;
    r12.x = ps;
    r0 = r13.zwww * r12;
    ps = r0.x;
    r5.yzw = -r10.xwy + r5.ywz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r8.xyz = r11.xyz - r0.yzw;
    r6.w = saturate(ps);
    r0.xyz = r8.xyz * r6.www + r0.yzw;
    r5.xy = r5.yw * r6.ww + r10.xy;
    r5.z = r5.z * r6.w - 2.0;
    r5.z = r10.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r3.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r3.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r3.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    r3.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r3.zxy, r9.zxy);
    r5.xyz = r3.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r2.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zyx, r2.zyx));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r4.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
