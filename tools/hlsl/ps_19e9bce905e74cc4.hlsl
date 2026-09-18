// ps_19e9bce905e74cc4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
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
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_7, r0.xy);
    ps = 1.0 - r0.z;
    r5.z = r10.w - 0.5;
    r11.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * UniformVector_7.xy;
    r5.z = ps;
    r6.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    ps = r1.z;
    r9.xy = r0.wz * 6.0;
    ps = 0.1 + ps;
    r9.zw = r0.wz * UniformVector_1.xy;
    r5.x = ps;
    ps = r4.w;
    r6.w = float((UniformScalar_8.x >= 1.0));
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r1.w = float((UniformScalar_8.x > 1.0));
    r5.w = ps;
    r6.xyz = (-abs(r1.www) >= 0.0) ? r6.xyz : 1.0;
    r6.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r6.xyz;
    ps = 5.0 * r5.x;
    r12.zw = r10.yz * UniformScalar_9.xx;
    r15.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r8.xyz = r5.www * r3.xyz;
    r15.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.x = r15.z * (-0.025);
    r6.x = ps;
    r12.xy = r8.xy * r5.xx + r9.zw;
    r16.yzw = r12.zwy * r6.zwx;
    ps = 1.0 / UniformVector_1.x;
    r11.x = -r16.w + 1.0;
    r11.z = ps;
    r3.xyz = r11.zxy * UniformVector_2.xyy;
    ps = r3.x;
    r13.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = r12.x * ps;
    r9.zw = r3.yz - 0.5;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r20.xy = float2((r3.yz >= 0.5));
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.zw = r9.zw - r3.yz;
    r5.w = ps;
    r11.yw = r9.zw * r20.xy + r3.yz;
    ps = (-0.5) + r5.x;
    r3.xy = r5.yw * abs(r7.xy);
    r5.y = ps;
    ps = (-0.5) + r5.z;
    r19.yz = float2((r5.xz >= 0.5));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r13.zw = r5.yw - r5.xz;
    r19.x = ps;
    r5.yw = r13.xy * r19.xx + ScreenPositionScaleBias.wz;
    r11.xz = r13.zw * r19.yz + r5.xz;
    r11 = r11 + r11;
    r7.xyz = tex2D(Texture2D_6, r12.xy).xyz;
    r13 = tex2D(Texture2D_1, r11.zw);
    r18 = tex2D(Texture2D_1, r11.xy);
    r14.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r23 = tex2D(Texture2D_5, r0.xy);
    r11 = tex2D(Texture2D_4, r0.xy);
    r24.xyz = tex2D(LightAttenuationTexture, r5.yw).xyz;
    r17.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r3.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r5.w = saturate(r4.w * 0.0001);
    r5.y = dot(r1.zxy, r1.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r12.xyz = r3.xyw * 2.0 - 1.0;
    r14.zw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.z = r9.z * r0.y;
    r5.y = ps;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r21.xyz = UniformVector_5.xzy * 2e+01;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r17.xyz = r17.xyz + r17.xyz;
    r4.xyz = r24.xyz * r2.www;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r11.xyz = r11.xzy * r11.www;
    r0.z = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r2.xyz = r23.xzy * r23.www;
    r1.w = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r5.yyy * r1.xyz;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r2.xyz = r22.xyz * r2.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r11.xyz = r21.xyz * r11.xyz;
    r5.x = ps;
    ps = UniformScalar_9.x * r6.y;
    r14 = r14 * float4(0.875, 0.875, 0.5, 0.5);
    r5.y = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r2.yxz : r11.yxz;
    r11.xyz = (abs(r1.www) > 0.0) ? r11.xzy : r2.xzy;
    r11.xyz = (abs(r0.zzz) > 0.0) ? r11.xyz : r2.xzy;
    r1.xyz = (-abs(r0.zzz) >= 0.0) ? r2.yxz : r1.xyz;
    ps = pow(2.0, r5.x);
    r16.x = r5.y * r10.x;
    r1.w = ps;
    r9.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.x = r5.x - r11.x;
    r15.y = saturate(r5.x + r11.x);
    ps = r0.x + r0.x;
    r2.xy = -r15.xy + 1.0;
    r0.z = ps;
    r5.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    ps = r0.w + r0.w;
    r0.xy = r14.xy * r5.xy;
    r0.w = ps;
    r15 = r0 + float4(0.125, 0.125, -1.0, -1.0);
    r0.xy = r20.xy * 2.0 + r19.yz;
    r5.y = (r0.x == 0.0) ? r18.x : r18.y;
    r5.x = (r0.y == 0.0) ? r13.x : r13.y;
    ps = r15.x * r15.y;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r1.x = ps;
    r1.xyz = r1.xxx * r9.xyz + ModShadowColor.xyz;
    r5.x = (r0.z == 0.0) ? r13.z : r5.x;
    r5.y = (r0.y == 0.0) ? r18.z : r5.y;
    r17.w = (r0.x == 0.0) ? r18.w : r5.y;
    r5.y = (r0.w == 0.0) ? r13.w : r5.x;
    r5.x = max(r5.y, 0.0);
    ps = (-1.0) - -r5.z;
    r0.xw = -r5.yw + 1.0;
    r9.x = ps;
    ps = 2.5 * r0.x;
    r5.x = min(r5.x, 0.3);
    r0.z = ps;
    ps = 3.3333333 * r5.x;
    r18 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r13.w = ps;
    ps = r18.w;
    r16.xyz = r16.xyz + UniformScalar_10.xxx;
    ps = r17.w + ps;
    r5.xyw = r18.zxy * UniformVector_4.zxy;
    r0.y = ps;
    r13.xy = -r5.yw * r9.ww + r5.yw;
    ps = 1.0 - r5.x;
    r2.yzw = r16.xyz * r2.yyy;
    r13.z = ps;
    ps = r0.y;
    r9.yz = r15.zw + r14.zw;
    ps = -r5.z + ps;
    r9 = r13.zwww * r9.wxyz;
    r5.z = saturate(ps);
    ps = r5.x;
    r7.xyz = r5.zzz * r7.xyz;
    ps = r9.x + ps;
    r0.y = r9.y + 1.0;
    r5.w = ps;
    ps = r0.y * r0.x;
    r5.xz = r13.xy + r9.zw;
    r5.y = ps;
    ps = r0.z * r0.y;
    r9.xyw = -r12.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r2.x = saturate(ps);
    r5.xy = r9.xy * r2.xx + r12.xy;
    r9.xyz = r5.zzz * r11.xyz - r7.xyz;
    r5.z = r9.w * r2.x - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r6.xyz = r6.yzw * r10.xyz + r9.xyz;
    r7.xyz = r6.xyz * r2.xxx + r7.xyz;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.yzw * r2.xxx;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r0.xyz = r5.yzw * r5.xxx;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r0.zxy));
    ps = log2(r5.x);
    r0.xyz = r7.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.xyz = r4.xzy * r1.www;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
