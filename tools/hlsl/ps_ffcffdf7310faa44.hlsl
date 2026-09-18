// ps_ffcffdf7310faa44.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_6, r1.xy);
    r13 = tex2D(Texture2D_8, r1.xy);
    ps = r5.w;
    r11.xyz = UniformVector_4.xyz * 2e+01;
    ps = (-4e+02) + ps;
    r15 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r6.y = ps;
    ps = 1.0 / r5.w;
    r6.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r6.xz = r6.zw * r6.xx + ScreenPositionScaleBias.wz;
    r9.xyz = r13.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = 0.00022222222 * r6.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.w = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r10.xyz = r10.xyz * r10.www;
    r0.w = ps;
    ps = r0.w;
    r14.xyz = r11.xyz * r10.xyz;
    ps = r4.x * ps;
    r6.y = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r10.x = ps;
    ps = r0.w;
    r6.y = r6.y - r14.x;
    ps = r4.y * ps;
    r0.z = saturate(r6.y + r14.x);
    r10.y = ps;
    ps = 1.0 - r1.z;
    r9.w = UniformScalar_8.x * 0.05;
    r18.w = ps;
    ps = r0.w;
    r6.y = -r0.z + 1.0;
    ps = r4.z * ps;
    r11 = r9 * r6.yyyw;
    r10.z = ps;
    r18.xy = r10.xy * r11.ww + r1.wz;
    ps = r1.w;
    r18.z = -r18.y + 1.0;
    ps = UniformVector_1.x * ps;
    r9.xyz = r18.xzw * UniformVector_1.xyy;
    r9.w = ps;
    r12 = r9 - 0.5;
    r4 = float4((r9 >= 0.5));
    ps = r1.w + r1.w;
    r16 = r12 - r9;
    r12.x = ps;
    r9 = r16 * r4 + r9;
    ps = r1.z + r1.z;
    r9 = r9.wxyz + r9.wxyz;
    r12.y = ps;
    r21 = tex2D(Texture2D_4, r15.xy);
    r19.yzw = tex2D(Texture2D_4, r15.zw).xyw;
    r22 = tex2D(Texture2D_3, r9.xw);
    r16.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r1.xzw = tex2D(Texture2D_5, r1.xy).xyz;
    r15.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    ps = 0.1 - -r2.z;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.y = dot(r3.zxy, r3.zxy);
    r20.w = saturate(ps);
    ps = 1.0 - r6.y;
    r1.y = float((UniformScalar_3.x >= 1.0));
    r6.x = saturate(ps);
    r6.yzw = r1.xzw * 2.0 - 1.0;
    ps = log2(r6.x);
    r20.xyz = r6.yzw * UniformVector_3.xyz;
    r6.x = ps;
    r0.xw = -r20.zw + 1.0;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.yw = r0.yx * r0.yz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r16.xyz = r6.yyy * r16.xyz;
    r1.x = ps;
    ps = UniformScalar_4.x - r7.w;
    r12.z = r20.z + r6.w;
    r16.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1 = r16.xzyw * r1.xxxy;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r1.w + r7.w;
    r3.y = ps;
    ps = -r6.x;
    r3.zw = r3.xy * abs(r8.xy);
    ps = r7.z + ps;
    r17.x = dot(r4.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r17.y = dot(r4.wzz, float3(1.0, 1.0, 1.0));
    r4.x = ps;
    r6.x = (r17.y == 0.0) ? r22.x : r22.y;
    ps = UniformScalar_5.x;
    r16 = r17.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r4.y = ps;
    r6.x = (r16.x == 0.0) ? r22.z : r6.x;
    r6.x = (r16.y == 0.0) ? r22.w : r6.x;
    ps = max(r4.x, r4.y);
    r3.x = max(r6.x, 0.0);
    r3.y = ps;
    ps = 1.0 / UniformScalar_6.x;
    r6.yz = min(r3.yx, float2(1.0, 0.3));
    r2.w = ps;
    ps = r5.w;
    r2.w = saturate(r6.y * r2.w);
    ps = 0.0001 * ps;
    r2.w = -r2.w + 1.0;
    r4.w = saturate(ps);
    ps = r15.x + r15.x;
    r19.x = r2.w * r7.w;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r0.w;
    r7.xy = r19.xw * r21.zw;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r0.w;
    r4.x = float((r7.x >= 0.05));
    r4.z = ps;
    ps = r15.y + r15.y;
    r4 = -r4.wxyz + 1.0;
    r5.y = ps;
    r2.w = (UniformScalar_4.x > 0.0) ? r4.y : 1.0;
    r2.w = (UniformScalar_4.x >= 0.0) ? r2.w : r4.y;
    ps = r15.z + r15.z;
    r5.w = r2.w * r13.w;
    r5.z = ps;
    ps = r18.x + r18.x;
    r15 = r5 + float4(-1.0, -1.0, -1.0, -0.5);
    r3.x = ps;
    ps = r18.y + r18.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r15.wwww)) clip(-1.0);
    r3.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r5 = tex2D(Texture2D_2, r12.xy);
    r12.xyw = tex2D(Texture2D_7, r3.xy).xyz;
    r18 = tex2D(Texture2D_3, r9.yz);
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r6.y = saturate(r7.w * 15.0);
    r9.xyz = r3.xyw * 2.0 - 1.0;
    r17.zw = r21.xy * 2.0 - 1.0;
    r8.zw = -r20.xy * r0.zz + r20.xy;
    ps = r19.y + r19.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r16.x = ps;
    ps = r19.z + r19.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r16.y = ps;
    r6.w = (r17.x == 0.0) ? r18.x : r18.y;
    r6.w = (r16.w == 0.0) ? r18.z : r6.w;
    r17.x = (r16.z == 0.0) ? r18.w : r6.w;
    ps = 1.0 - r6.x;
    r0.w = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = 1.0 - r6.y;
    r17.y = r6.z * 3.3333333;
    r7.w = ps;
    ps = 2.5 * r7.x;
    r6.zw = -r17.xy + 1.0;
    r7.z = ps;
    r2.w = dot(r6.yy, r6.zz) + r17.x;
    ps = r6.y;
    r16.z = r2.w + r17.x;
    ps = r6.w * ps;
    r6.xyz = r16.xyz + float3(-1.0, -1.0, 0.25);
    r16.z = ps;
    ps = 0.5 * r6.x;
    r6.w = saturate(r6.z - r7.y);
    r16.x = ps;
    ps = 0.5 * r6.y;
    r12.xyw = r6.www * r12.xyw;
    r16.y = ps;
    ps = (-1.0) - -r7.y;
    r16.xyz = r17.zyw + r16.xzy;
    r16.w = ps;
    ps = rsqrt(abs(r0.w));
    r6.yzw = -r12.xyw + r5.xyz;
    r6.x = ps;
    r5.xyz = r6.yzw * r5.www + r12.xyw;
    r12.xy = r16.xy * r16.yz + r8.zw;
    r7.y = r16.w * r16.y + 1.0;
    ps = r7.y * r7.x;
    r2.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    ps = r7.z * r7.y;
    r15.xyz = r15.xyz - r9.xyz;
    r6.y = ps;
    r9.w = r15.z * r5.w - 2.0;
    r9.xyz = r15.xyz * r5.www + r9.xyz;
    r6.xy = r6.yx * r7.ww;
    r12.xyz = -r9.xyz + r12.xyz;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y >= 0.9));
    r7.x = saturate(ps);
    r7.yzw = r14.xyz * r6.zzz + r13.xyz;
    r6.xyz = r12.xyz * r7.xxx + r9.xyw;
    r6.w = r3.w * 2.0 + r6.z;
    r7.yzw = r7.yzw - r5.xyz;
    r9.xyz = r7.yzw * r7.xxx + r5.xyz;
    r6.xyz = r6.wxy * r4.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r4.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r11.xyz * r7.xxx;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r0.xyz = r9.xyz * r0.xyz;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r4.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
