// ps_dd84e118058a0647.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041800 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_7, r1.xy);
    ps = (-0.5) + r11.w;
    r10.x = r1.w * UniformVector_2.x;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r20.y = tex2D(ShadowTexture, r0.xy).x;
    r0.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    ps = -r1.z;
    r3.xy = r1.wz * UniformVector_7.xy;
    ps = 1.0 + ps;
    r6.y = saturate(r5.w * 0.0001);
    r9.y = ps;
    ps = r5.w;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r7.xy = r1.wz * UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.z = ps;
    ps = (-0.025) * r6.x;
    r0.xyz = r0.xyz + r0.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.xyz = r6.zzz * r4.xyz;
    r6.z = ps;
    r12.xy = r5.xy * r6.xx + r7.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xzw = r12.zyw * r6.wzw;
    r7.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xw = -r6.zy + 1.0;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.yzw = r9.yxz * UniformVector_2.yyx;
    r7.y = ps;
    ps = r10.w;
    r3.zw = r7.xy * abs(r8.xy);
    ps = r12.x * ps;
    r7.xyz = r10.zxy - 0.5;
    r0.w = ps;
    r20.z = float((r0.w >= 0.5));
    r8.yzw = float3((r10.xzy >= 0.5));
    ps = r1.w;
    r7.xzw = r7.xzy - r10.zyx;
    ps = 6.0 * ps;
    r15 = r0 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.y = ps;
    r4.yzw = r7.xwz * r8.zyw + r10.zxy;
    ps = r1.z;
    r20.x = r15.w - r0.w;
    ps = 6.0 * ps;
    r7.xw = r20.xy * r20.zy;
    r7.z = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r4.x = r0.w + r7.x;
    r0.x = ps;
    ps = ScreenPositionScaleBias.z + r6.w;
    r4 = r4.zwxy + r4.zwxy;
    r0.y = ps;
    r10.xyz = tex2D(Texture2D_6, r12.xy).xyz;
    r19.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r0 = tex2D(Texture2D_1, r4.xy).wyzx;
    r16 = tex2D(Texture2D_1, r4.zw).xzyw;
    r18.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r23 = tex2D(Texture2D_4, r1.xy);
    r13 = tex2D(Texture2D_5, r1.xy).xzyw;
    r21.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r7.yz).xyw;
    r3.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r1.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r1.z = float((UniformScalar_5.x > 0.0));
    r6.y = ps;
    ps = -ModShadowColor.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r17.x = ps;
    ps = -ModShadowColor.y;
    r24.xyz = UniformVector_5.xzy * 2e+01;
    ps = 1.0 + ps;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r17.y = ps;
    ps = -ModShadowColor.z;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r6.x = r2.z + 0.1;
    r17.z = ps;
    r14.xyz = r1.xyw * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r6.z = float((UniformScalar_8.x > 1.0));
    r15.w = saturate(ps);
    r12.yz = r3.xy * 2.0 - 1.0;
    r18.zw = r7.xy * 2.0 - 1.0;
    r21.xyz = (-abs(r6.zzz) >= 0.0) ? r21.xyz : 1.0;
    ps = r13.x * r13.w;
    r6.xz = r11.yz * UniformScalar_9.xx;
    r13.x = ps;
    ps = rsqrt(abs(r2.w));
    r23.xyz = r23.xzy * r23.www;
    r2.w = ps;
    ps = r13.y * r13.w;
    r3.xyz = r2.www * r2.xyz;
    r13.y = ps;
    ps = r13.z * r13.w;
    r2.xyz = r24.xyz * r23.xyz;
    r13.z = ps;
    ps = r7.z;
    r13.xyz = r22.xyz * r13.xyz;
    r7.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r21.yxz;
    ps = r3.w * ps;
    r6.zw = r6.xz * r7.xz;
    r6.x = ps;
    r21.xyz = (abs(r1.zzz) > 0.0) ? r2.xzy : r13.xzy;
    r2.xyz = (-abs(r1.zzz) >= 0.0) ? r13.yxz : r2.yxz;
    ps = (-1.0) - -r6.x;
    r18 = r18 * float4(0.875, 0.875, 0.5, 0.5);
    r12.x = ps;
    ps = UniformScalar_9.x * r7.y;
    r12.yz = r12.yz + r18.zw;
    r1.z = ps;
    r2.xyz = (-abs(r6.yyy) >= 0.0) ? r13.yxz : r2.xyz;
    r13.xyz = (abs(r6.yyy) > 0.0) ? r21.xyz : r13.xzy;
    ps = r1.z;
    r6.y = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    ps = r11.x * ps;
    r4.w = r6.y - r13.x;
    r6.y = ps;
    ps = UniformScalar_10.x + r6.y;
    r12.w = saturate(dot(r2.zxy, float3(0.59, 0.11, 0.3)));
    r8.x = ps;
    ps = UniformScalar_10.x + r6.z;
    r2.y = dot(r8.yww, float3(1.0, 1.0, 1.0));
    r8.y = ps;
    r2.x = r8.z * 2.0 + r20.z;
    r1.z = (r2.x == 0.0) ? r16.x : r16.z;
    r3.w = (r2.y == 0.0) ? r0.w : r0.y;
    ps = UniformScalar_10.x + r6.w;
    r15.xyz = r15.xyz * UniformVector_4.xyz;
    r8.z = ps;
    r6.zw = -r15.xy * r12.ww + r15.xy;
    ps = r4.w;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = (r2.z == 0.0) ? r0.z : r3.w;
    ps = r13.x + ps;
    r16.xz = -r15.zw + 1.0;
    r0.w = saturate(ps);
    r1.z = (r2.y == 0.0) ? r16.y : r1.z;
    r18.z = (r2.x == 0.0) ? r16.w : r1.z;
    r16.yw = -r16.zz * ModShadowGroupColor.xy + 1.0;
    r0.x = (r2.w == 0.0) ? r0.x : r6.y;
    ps = r0.x;
    r2.xyz = r7.www * r19.xyz;
    r0.y = ps;
    ps = 0.0;
    r18.xy = r18.xy * r16.yw;
    r0.z = ps;
    ps = max(r0.y, r0.z);
    r0.xw = -r0.xw + 1.0;
    r6.y = ps;
    ps = 2.5 * r0.x;
    r6.y = min(r6.y, 0.3);
    r0.z = ps;
    ps = 3.3333333 * r6.y;
    r1.xyz = r18.xyz + float3(0.125, 0.125, 0.25);
    r16.y = ps;
    ps = r1.x * r1.y;
    r6.y = r1.z + r18.z;
    r7.w = ps;
    r1.xyz = r7.www * r17.xyz + ModShadowColor.xyz;
    ps = r6.y;
    r12 = r16.yyxy * r12.xywz;
    ps = -r6.x + ps;
    r12.z = r15.z + r12.z;
    r6.y = saturate(ps);
    ps = r12.x;
    r8.xyz = r8.xyz * r0.www;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r12.xy = r6.zw + r12.yw;
    r0.y = ps;
    ps = r0.y * r0.x;
    r10.xyz = r6.yyy * r10.xyz;
    r6.y = ps;
    ps = r0.z * r0.y;
    r12.xyz = -r14.xyz + r12.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y > 0.9));
    r7.w = saturate(ps);
    r6.xy = r12.xy * r7.ww + r14.xy;
    r0.xyz = r6.zzz * r13.xyz - r10.xyz;
    r6.z = r12.z * r7.w - 2.0;
    r6.z = r1.w * 2.0 + r6.z;
    r7.xyz = r7.yxz * r11.xyz + r0.xyz;
    r7.xyz = r7.xyz * r7.www + r10.xyz;
    r6.xyz = r6.zxy * r9.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r9.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r9.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r8.xyz * r7.www;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r5.zxy);
    r8.xyz = r6.yzw * r6.xxx;
    r5.xyz = r8.xyz * 2.0 - r5.xyz;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r4.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r0.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r2.xzy * r6.xzy;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
