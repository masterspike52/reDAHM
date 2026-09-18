// ps_bb1d11950c1e4d4e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_7, r0.xy);
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = r4.w;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r12.w - 0.5;
    r6.y = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r6.yyy * r3.xyz;
    r6.z = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    r6.yw = r0.wz * 6.0;
    r5.x = ps;
    r8.xy = r9.xy * r5.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    ps = r0.w;
    r10.xy = r0.wz * UniformVector_7.xy;
    ps = UniformVector_2.x * ps;
    r11.y = -r0.z + 1.0;
    r13.x = ps;
    ps = 1.0 / r4.w;
    r5.w = saturate(r4.w * 0.0001);
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = r8.zwy * r5.yyx;
    r4.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r11.xw = -r5.zw + 1.0;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r11.yxz * UniformVector_2.yyx;
    r4.y = ps;
    ps = r13.w;
    r4.xy = r4.xy * abs(r7.xy);
    ps = r8.x * ps;
    r14.xyz = r13.zxy - 0.5;
    r7.w = ps;
    ps = r3.x + r3.x;
    r22.x = float((r7.w >= 0.5));
    r7.x = ps;
    ps = r3.y + r3.y;
    r22.yzw = float3((r13.xzy >= 0.5));
    r7.y = ps;
    ps = r3.w + r3.w;
    r15.yzw = r14.xzy - r13.zyx;
    r7.z = ps;
    r14 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = ScreenPositionScaleBias.w + r5.x;
    r15.x = r14.w - r7.w;
    r4.z = ps;
    r7.x = r15.x * r22.x + r7.w;
    r7.yzw = r15.ywz * r22.zyw + r13.zxy;
    ps = ScreenPositionScaleBias.z + r5.y;
    r7 = r7.zwxy + r7.zwxy;
    r4.w = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r4.zw).xyz;
    r8.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r20 = tex2D(Texture2D_1, r7.xy);
    r21 = tex2D(Texture2D_1, r7.zw);
    r19.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r23 = tex2D(Texture2D_4, r0.xy);
    r24 = tex2D(Texture2D_5, r0.xy);
    r25.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r6.yw).xyw;
    r16.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r5.w = float((UniformScalar_5.x > 0.0));
    r5.y = ps;
    ps = -ModShadowColor.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r13.xyz = UniformVector_6.xzy * 2e+01;
    r17.x = ps;
    ps = -ModShadowColor.y;
    r15.xyz = UniformVector_5.xzy * 2e+01;
    ps = 1.0 + ps;
    r0.w = float((UniformScalar_8.x >= 1.0));
    r17.y = ps;
    ps = -ModShadowColor.z;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.x = float((UniformScalar_8.x > 1.0));
    r17.z = ps;
    ps = r4.x + r4.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r18.z = ps;
    ps = r4.y + r4.y;
    r16.xyz = r16.xyz + r16.xyz;
    r18.w = ps;
    r19.zw = r10.xy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r6.yw = r12.yz * UniformScalar_9.xx;
    r5.x = saturate(ps);
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r25.xyz : 1.0;
    ps = rsqrt(abs(r5.z));
    r2.xyz = r24.xzy * r24.www;
    r5.z = ps;
    ps = r10.w;
    r10.xyz = r23.xzy * r23.www;
    ps = r4.w * ps;
    r4.xyz = r5.zzz * r1.xyz;
    r5.z = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.yxz;
    ps = (-1.0) - -r5.z;
    r10.xyz = r15.xyz * r10.xyz;
    r15.x = ps;
    ps = log2(r5.x);
    r1.xyz = r13.xyz * r2.xyz;
    r5.x = ps;
    r2.xyz = (abs(r5.www) > 0.0) ? r10.xzy : r1.xzy;
    r13.xyz = (-abs(r5.www) >= 0.0) ? r1.yxz : r10.yxz;
    ps = UniformScalar_9.x * r0.y;
    r10.yz = r6.yw * r0.xz;
    r5.w = ps;
    ps = r5.w;
    r19 = r19 * float4(0.875, 0.875, 0.5, 0.5);
    r15.yzw = (-abs(r5.yyy) >= 0.0) ? r1.yxz : r13.xyz;
    r13.xyz = (abs(r5.yyy) > 0.0) ? r2.xyz : r1.xzy;
    ps = r12.x * ps;
    r5.y = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r10.x = ps;
    ps = r5.y;
    r1.y = dot(r22.yww, float3(1.0, 1.0, 1.0));
    r1.x = r22.z * 2.0 + r22.x;
    r6.y = (r1.x == 0.0) ? r21.x : r21.y;
    r5.y = (r1.y == 0.0) ? r20.x : r20.y;
    ps = -r13.x + ps;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.w = ps;
    r5.y = (r1.z == 0.0) ? r20.z : r5.y;
    r6.y = (r1.y == 0.0) ? r21.z : r6.y;
    r16.w = (r1.x == 0.0) ? r21.w : r6.y;
    r6.y = (r1.w == 0.0) ? r20.w : r5.y;
    ps = r5.w;
    r5.y = max(r6.y, 0.0);
    ps = r13.x + ps;
    r1.xw = -r6.yz + 1.0;
    r2.z = saturate(ps);
    ps = r5.y;
    r6 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.y = ps;
    ps = 0.3;
    r2.xy = r1.ww * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = r6.w;
    r15.w = saturate(dot(r15.wyz, float3(0.59, 0.11, 0.3)));
    ps = r16.w + ps;
    r6.xyz = r6.zxy * UniformVector_4.zxy;
    r6.w = ps;
    r16.xy = -r6.yz * r15.ww + r6.yz;
    ps = r6.w;
    r10.xyz = r10.xyz + UniformScalar_10.xxx;
    ps = -r5.z + ps;
    r2.xyw = -r2.xyz + 1.0;
    r5.z = saturate(ps);
    ps = min(r5.y, r5.w);
    r8.xyz = r5.zzz * r8.xyz;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r18.xy = r19.xy * r2.xy;
    r5.z = ps;
    ps = 1.0 - r6.x;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r5.y = ps;
    ps = r18.x * r18.y;
    r15.yz = r18.zw + r19.zw;
    r5.w = ps;
    r2.xyz = r5.www * r17.xyz + ModShadowColor.xyz;
    ps = 2.5 * r1.x;
    r15 = r5.yzzz * r15.wxyz;
    r1.z = ps;
    ps = r6.x;
    r10.xyz = r10.xyz * r2.www;
    ps = r15.x + ps;
    r1.y = r15.y + 1.0;
    r6.z = ps;
    ps = r1.y * r1.x;
    r6.xy = r16.xy + r15.zw;
    r5.y = ps;
    ps = r1.z * r1.y;
    r6.xyz = -r14.xyz + r6.xyz;
    r5.z = ps;
    ps = (-0.5) + r5.z;
    r5.y = float((r5.y > 0.9));
    r5.z = saturate(ps);
    r6.xy = r6.xy * r5.zz + r14.xy;
    r1.xyz = r5.yyy * r13.xyz - r8.xyz;
    r5.y = r6.z * r5.z - 2.0;
    r6.z = r3.w * 2.0 + r5.y;
    r0.xyz = r0.yxz * r12.xyz + r1.xyz;
    r8.xyz = r0.xyz * r5.zzz + r8.xyz;
    r6.xyz = r6.zxy * r11.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r11.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r11.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r0.xyz = r10.xyz * r5.zzz;
    r5.y = ps;
    r1.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r1.zxy, r9.zxy);
    r5.yzw = r1.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r9.xyz;
    r5.y = saturate(dot(r4.zxy, r5.wyz));
    ps = log2(r5.y);
    r6.yzw = r8.xyz * r7.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r1.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
