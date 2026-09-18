// ps_b6d4ab9e9c6e71bb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 537 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000864 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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

    ps = -r6.w;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = UniformScalar_8.x + ps;
    r5.x = -r0.z + 1.0;
    r3.w = ps;
    ps = UniformVector_1.y * r5.x;
    r1.w = float((UniformScalar_7.x >= 1.0));
    r9.y = ps;
    ps = UniformVector_1.x * r0.w;
    r12.xy = r0.wz + r0.wz;
    r9.x = ps;
    ps = r3.w;
    r5.zw = r0.wz * 3.0;
    ps = r1.w * ps;
    r8.yz = float2((r9.xy >= 0.5));
    r5.x = ps;
    r13.yzw = r6.www * float3(0.16, -0.8, 1.0) + r5.zwx;
    r5.xz = r9.xy - 0.5;
    ps = rsqrt(abs(r5.y));
    r9.zw = r5.xz - r9.xy;
    r13.x = ps;
    ps = r0.z;
    r5 = r13.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r8.w = ps;
    r9.xy = r9.zw * r8.yz + r9.xy;
    ps = r9.x + r9.x;
    r15 = r5.yyyx * r3.xyzx;
    r3.y = ps;
    ps = r9.y + r9.y;
    r8.x = r15.w + r0.w;
    r3.z = ps;
    r3.x = tex2D(Texture2D_7, r8.xw).z;
    r11 = tex2D(Texture2D_4, r3.yz);
    r10.yzw = tex2D(Texture2D_3, r5.zw).xyw;
    r17 = tex2D(Texture2D_3, r13.yz).wxyz;
    ps = UniformScalar_14.x;
    r8.x = saturate(r6.w * 15.0);
    ps = 0.05 * ps;
    r5.y = r4.w - 4e+02;
    r3.z = ps;
    r9.xy = r17.zy * 2.0 - 1.0;
    ps = 0.00022222222 * r5.y;
    r5.zw = r10.yz + r10.yz;
    r12.w = saturate(ps);
    ps = -r13.w;
    r5.x = dot(r8.yzz, float3(1.0, 1.0, 1.0));
    r3.y = (r5.x == 0.0) ? r11.x : r11.y;
    ps = r6.z + ps;
    r5 = r5.zxxw + float4(-1.0, -2.0, -3.0, -1.0);
    r1.w = ps;
    r5.y = (r5.y == 0.0) ? r11.z : r3.y;
    ps = r1.w;
    r3.yw = r5.xw * 0.5;
    r5.x = ps;
    r9.zw = r17.yz * 2.0 + r3.yw;
    r5.w = (r5.z == 0.0) ? r11.w : r5.y;
    ps = UniformScalar_9.x;
    r5.y = max(r5.w, 0.0);
    r5.z = ps;
    ps = max(r5.x, r5.z);
    r21 = r9 + r3.wyyw;
    r5.x = ps;
    ps = 1.0 / UniformScalar_1.x;
    r3.yw = min(r5.yx, float2(0.3, 1.0));
    r5.x = ps;
    ps = r17.w;
    r16.y = saturate(r3.w * r5.x);
    r5.y = ps;
    ps = r21.y;
    r16.xz = r3.yx * float2(3.3333333, 0.5);
    r5.x = ps;
    ps = 0.01 * r5.x;
    r8.yz = -r16.xy + 1.0;
    r5.x = ps;
    r12.z = r8.x * r8.y + r16.x;
    ps = r8.z;
    r3.w = r5.x * r12.z;
    ps = r6.w * ps;
    r9.x = r3.w + r0.x;
    r10.x = ps;
    ps = (-0.3) * r5.y;
    r23.xy = r10.xw * r17.wx;
    r3.x = ps;
    ps = r12.z;
    r3.y = r23.y - 1.0;
    ps = r21.x * ps;
    r24.yzw = r3.xyz * r12.zzw;
    r4.z = ps;
    ps = 0.025 * r4.z;
    r11.x = r24.y + r0.y;
    r11.w = ps;
    ps = r11.w;
    r25.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = r24.y + ps;
    r3.xy = r15.xy * r24.ww;
    r3.z = ps;
    r10 = r3.xzwy + r0.wyxz;
    ps = r10.x + r10.x;
    r5.x = r10.x * UniformVector_1.x;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = -r10.w + 1.0;
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r5.y * UniformVector_1.y;
    r0.z = ps;
    ps = (-0.5) + r5.x;
    r0.zw = r0.yz * abs(r7.xy);
    r3.x = ps;
    ps = (-0.5) + r5.z;
    r3.zw = float2((r5.xz >= 0.5));
    r3.y = ps;
    ps = 1.0 / r4.w;
    r25.zw = r3.xy - r5.xz;
    r3.y = ps;
    r11.yz = r25.zw * r3.zw + r5.xz;
    ps = r10.w + r10.w;
    r9.yzw = r11.xyz + r11.wyz;
    r0.y = ps;
    r14.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r11.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r22 = tex2D(Texture2D_2, r12.xy);
    r18.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r8.y = tex2D(Texture2D_5, r10.zy).w;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r19 = tex2D(Texture2D_4, r9.zw);
    r0.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    r7 = tex2D(Texture2D_5, r9.xy);
    r13.x = -r6.z + 1.0;
    ps = r1.z;
    r5.yz = saturate(UniformVector_3.yz);
    r13.yzw = r0.xyz * 2.0 - 1.0;
    ps = 0.1 + ps;
    r6.z = r17.w * r6.w;
    r6.x = ps;
    ps = r7.w;
    r20.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.yz = r5.zy * UniformScalar_5.xx;
    r6.y = ps;
    ps = 1.0 / UniformScalar_5.x;
    r5.yz = floor(-r5.yz);
    r5.x = ps;
    r5.yz = -r5.yz * r5.xx;
    ps = r7.w;
    r23.z = r6.z * r8.z;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0.xy = float2((r23.xz >= 0.05));
    r9.y = ps;
    ps = 1.0 - r5.w;
    r24.x = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r5.x = (r24.x == 0.0) ? r19.x : r19.y;
    r12.xy = r25.xy * r3.yy + ScreenPositionScaleBias.wz;
    ps = 2.5 * r3.x;
    r3.yzw = r24.xxz + float3(-3.0, -2.0, 1.0);
    r5.w = ps;
    r20.w = saturate(r5.w * r3.w - 0.5);
    r5.x = (r3.z == 0.0) ? r19.z : r5.x;
    r24.x = (r3.y == 0.0) ? r19.w : r5.x;
    ps = r17.x;
    r19 = r20.xywz * r7.xywz;
    r5.x = ps;
    ps = abs(r3.x) * abs(r3.x);
    r21.x = -r20.w + r19.z;
    r8.z = ps;
    ps = abs(r3.w) * abs(r3.w);
    r24.yzw = r10.xyw + r10.xyw;
    r8.w = ps;
    ps = 1.0 - r5.x;
    r9.xw = -r8.yx + 1.0;
    r5.x = ps;
    ps = 3.3333333 * r6.y;
    r3 = r24 - 1.0;
    r6.z = saturate(ps);
    ps = r3.x;
    r24.xyz = r18.xyz + r18.xyz;
    ps = r9.w * ps;
    r13.yzw = r13.yzw - r3.yzw;
    r24.w = ps;
    r11.w = r13.w * r22.w - 2.0;
    r18.xyz = r13.yzw * r22.www + r3.yzw;
    ps = 5.0 * r6.x;
    r3 = r24 + float4(-1.0, -1.0, -1.0, 2.25);
    r6.y = saturate(ps);
    ps = UniformScalar_6.x + r5.y;
    r5.w = r3.w + r24.w;
    r13.y = ps;
    ps = UniformScalar_6.x + r5.z;
    r3.xyz = r3.zxy * UniformVector_5.zxy;
    r13.z = ps;
    ps = (-1.0) - -r3.x;
    r13 = r13.xxyz - r5.yzyz;
    r5.z = ps;
    ps = 1.0 / r13.z;
    r9.z = saturate(r5.w - r23.y);
    r5.y = ps;
    ps = 1.0 / r13.w;
    r19.z = r6.z * r5.z;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r5.zw = saturate(r13.xy * r5.yz);
    r5.y = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r13 = r5.wyzw * r9.xzyy;
    r0.z = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r6.x = r13.x + r8.y;
    r0.w = ps;
    ps = r4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r5.yz = r21.zw - 2.0;
    r17.x = saturate(ps);
    ps = r21.y;
    r5.yz = r5.yz + r17.yz;
    ps = r12.z * ps;
    r10.xyz = r19.xyw * r7.www;
    r4.x = ps;
    ps = 1.0 - r0.x;
    r19.xyw = r10.xyz - r16.zzz;
    r13.x = ps;
    ps = r5.x;
    r3.yz = r3.yz * r6.zz;
    ps = r13.y + ps;
    r5.xw = r13.zw + r7.ww;
    r6.w = ps;
    ps = 1.0 - r0.y;
    r11.xyz = r6.www * r11.xyz;
    r13.z = ps;
    ps = 1.0 - r5.w;
    r7.xyz = r5.xyz + r17.wyz;
    r5.x = ps;
    ps = 1.0 - r6.x;
    r17.yzw = -r11.xyz + r22.xyz;
    r5.y = ps;
    r11.xyz = r17.yzw * r22.www + r11.xyz;
    ps = 1.0 - r6.y;
    r13.y = float((r7.x >= 0.5));
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6 = r7.yzyz * r5.xxyy;
    r17.y = ps;
    r5.x = (abs(r0.w) > 0.0) ? r13.y : 1.0;
    r3.x = (abs(r0.z) > 0.0) ? r5.x : r13.y;
    r5.xy = (-abs(r0.ww) >= 0.0) ? 0.0 : r6.zw;
    r0.xy = (-abs(r0.ww) >= 0.0) ? 1.0 : r13.xy;
    r13.zw = (-abs(r0.zz) >= 0.0) ? r13.zy : r0.xy;
    r4.yw = (-abs(r0.zz) >= 0.0) ? r6.xy : r5.xy;
    r21.yzw = r19.xyw * r3.xxx + r16.zzz;
    r16.xyz = r8.zzz * r21.yzw - r11.xyz;
    r0.w = r8.x * r21.x + r20.w;
    r19.x = dot(r4.xy, r13.ww) + r3.y;
    r19.y = dot(r4.zw, r13.ww) + r3.z;
    ps = ModShadowGroupColor.y * r5.z;
    r5.xyw = -r18.zxy + r19.zxy;
    r17.z = ps;
    r6.xy = r5.yw * r0.ww + r18.xy;
    ps = 1.0 + r5.x;
    r0.xyz = -r17.xyz + 1.0;
    r16.w = ps;
    r11 = r16 * r0.wwww + r11;
    r6.z = r10.w * 2.0 + r11.w;
    r6.xyz = r6.zxy * r0.xxx;
    ps = 1.0 + r6.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    r5.yzw = (r0.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r0.xxx >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.yzw = r5.yyy * r1.xyz;
    r6.x = ps;
    r7.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r7.zxy, r15.zxy);
    r6.xyz = r7.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r15.xyz;
    r6.x = saturate(dot(r5.wyz, r6.zxy));
    ps = log2(r6.x);
    r3.yzw = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    r6.xyz = r14.xyz * float3(15.0, 0.875, 0.875);
    r13.xy = r6.yz * r0.yz;
    r4.xyz = r13.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.zzzz)) clip(-1.0);
    r0.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    ps = 1.0 - r5.x;
    r6.w = r7.w * UniformScalar_11.x;
    r5.x = saturate(ps);
    r9.xyz = r9.yyy * UniformVector_6.xzy + r6.www;
    ps = log2(r5.x);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r11.xyz * r1.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyz * r2.www;
    r5.x = ps;
    r0.xyz = r0.xzy * r5.xxx;
    r2.xyz = r10.xyz * UniformScalar_12.xxx + r9.xzy;
    ps = r8.w * r8.w;
    r5.w = saturate(dot(r7.zyx, r5.wzy));
    r4.w = ps;
    r6.yz = r4.xw * r4.yw;
    r5.xyz = r6.yyy * r3.yzw + ModShadowColor.xyz;
    ps = r0.w;
    r2.xyz = r6.zzz * r2.xzy;
    ps = r3.x * ps;
    r2.xyz = r2.xzy * r8.zzz;
    r3.y = ps;
    r2.yzw = r2.yzx * r3.yyx;
    ps = pow(2.0, r6.x);
    r2.x = r2.w * r0.w;
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
