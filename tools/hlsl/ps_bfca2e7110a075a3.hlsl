// ps_bfca2e7110a075a3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 546 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000888 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c19); // float3
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
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r6.w;
    r5.x = float((UniformScalar_7.x >= 1.0));
    ps = UniformScalar_8.x + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = r1.w * r5.x;
    r12.x = ps;
    ps = UniformVector_1.x * r0.w;
    r5.yz = r0.wz * 3.0;
    r13.y = ps;
    r12.yzw = r6.www * float3(0.16, -0.8, 1.0) + r5.yzx;
    r8 = r12.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r9.yzw = tex2D(Texture2D_3, r8.zw).xyw;
    r5.x = -r0.z + 1.0;
    ps = UniformVector_1.y * r5.x;
    r13.zw = r9.yz + r9.yz;
    r13.x = ps;
    r11 = r13.yxzw + float4(-0.5, -0.5, -1.0, -1.0);
    r10.zw = float2((r13.xy >= 0.5));
    r5.xy = r11.xy - r13.yx;
    r5.xy = r5.yx * r10.zw + r13.xy;
    r5.xy = r5.yx + r5.yx;
    r5 = tex2D(Texture2D_4, r5.xy).zwxy;
    r14 = tex2D(Texture2D_3, r12.yz).wxyz;
    r18.y = saturate(r6.w * 15.0);
    r3.w = r14.w * r6.w;
    r11.xy = r14.zy * 2.0 - 1.0;
    ps = -r12.w;
    r10.xy = r11.zw * 0.5;
    ps = r6.z + ps;
    r12.w = dot(r10.wzz, float3(1.0, 1.0, 1.0));
    r9.x = ps;
    r1.w = (r12.w == 0.0) ? r5.z : r5.w;
    r11.zw = r14.yz * 2.0 + r10.xy;
    r9.x = max(r9.x, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r10.z = min(r9.x, 1.0);
    r9.x = ps;
    ps = r10.z;
    r18.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = r9.x * ps;
    r15 = r11.xzwy + r10.yxyx;
    r18.x = saturate(ps);
    r11.xw = -r18.xy + 1.0;
    ps = r3.w;
    r9.x = r11.x * r6.w;
    ps = r11.x * ps;
    r12.xy = r9.xw * r14.wx;
    r12.z = ps;
    r13.yzw = r12.yww + float3(-1.0, -3.0, -2.0);
    r5.zw = float2((r12.xz >= 0.05));
    r5.x = (r13.w == 0.0) ? r5.x : r1.w;
    r6.x = (r13.z == 0.0) ? r5.y : r5.x;
    r5.x = max(r6.x, 0.0);
    r5.x = min(r5.x, 0.3);
    ps = r15.w;
    r5.y = r5.x * 3.3333333;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r24.xzw = -r5.zwy + 1.0;
    r5.x = ps;
    r10.w = r18.y * r24.w + r5.y;
    ps = r14.w;
    r9.w = r5.x * r10.w;
    r5.x = ps;
    ps = (-0.3) * r5.x;
    r3.w = r10.w * r15.x;
    r13.x = ps;
    ps = 0.025 * r3.w;
    r10.yz = r13.xy * r10.ww;
    r5.z = ps;
    ps = r9.w;
    r5.x = r10.y + r0.y;
    ps = r0.x + ps;
    r5.y = r5.x + r5.z;
    r5.x = ps;
    r13.xyz = tex2D(Texture2D_6, r5.xy).xyz;
    r20 = tex2D(Texture2D_5, r5.xy);
    ps = r0.z;
    r5.y = r4.w - 4e+02;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r20.w - 0.5;
    r9.x = ps;
    r13.xyz = r13.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.yzw = r13.xyz * UniformVector_5.xyz;
    r9.y = ps;
    ps = UniformScalar_11.x * r20.w;
    r17.x = UniformScalar_14.x * 0.05;
    r1.w = ps;
    ps = r9.x;
    r11.xy = saturate(r5.xy * float2(3.3333333, 0.00022222222));
    ps = abs(r7.x) * ps;
    r13.xyz = r17.yzx * r11.xxy;
    r5.x = ps;
    ps = r9.y;
    r8 = r8.yyyx * r3.xyzx;
    ps = abs(r7.y) * ps;
    r9.xy = r8.xy * r13.zz;
    r5.y = ps;
    ps = r8.w;
    r9.z = r5.z + r10.y;
    ps = r0.w + ps;
    r9 = r9.xzwy + r0.wyxz;
    r5.z = ps;
    r7.y = tex2D(Texture2D_7, r5.zw).z;
    r7.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.w = tex2D(Texture2D_5, r9.zy).w;
    r3.x = -r6.z + 1.0;
    r5.y = saturate(r4.w * 0.0001);
    ps = UniformVector_3.y;
    r5.x = r1.z + 0.1;
    r6.y = saturate(ps);
    ps = UniformVector_3.z;
    r7.x = -r20.w + 1.0;
    r6.z = saturate(ps);
    ps = 5.0 * r5.x;
    r6.yz = r6.zy * UniformScalar_5.xx;
    r5.x = saturate(ps);
    ps = 1.0 / UniformScalar_5.x;
    r6.zw = floor(-r6.yz);
    r5.z = ps;
    ps = 1.0 - r5.w;
    r7.yzw = r7.yzw * float3(0.5, 0.875, 0.875);
    r6.y = ps;
    ps = 1.0 - r5.x;
    r6.zw = -r6.zw * r5.zz;
    r5.z = ps;
    ps = 1.0 - r5.y;
    r3.yz = r6.zw + UniformScalar_6.xx;
    r0.x = ps;
    ps = 1.0 / r4.w;
    r16 = r3.xxyz - r6.zwzw;
    r6.w = ps;
    ps = 1.0 / r16.z;
    r3.xy = r15.yz - 2.0;
    r6.z = ps;
    r21.xy = r18.zw * r6.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 / r16.w;
    r25.yz = r3.xy + r14.yz;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.zw = saturate(r16.xy * r6.zw);
    r4.x = ps;
    r4.z = r6.w * r6.y + r5.w;
    r25.xw = r6.zw * r7.xx + r20.ww;
    ps = ModShadowGroupColor.y * r5.z;
    r3.xyz = r25.xyz + r14.wyz;
    r4.y = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r23.yzw = -r4.zxy + 1.0;
    r5.z = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r22.zw = r7.zw * r23.zw;
    r6.w = ps;
    ps = r0.w + r0.w;
    r24.y = float((r3.x >= 0.5));
    r19.x = ps;
    r5.xy = (-abs(r6.ww) >= 0.0) ? 1.0 : r24.xy;
    r22.xy = (-abs(r5.zz) >= 0.0) ? r24.zy : r5.xy;
    ps = r0.z + r0.z;
    r16.yzw = r22.xzw + float3(-0.5, 0.125, 0.125);
    r19.y = ps;
    ps = r9.x;
    r5.x = -r9.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.x = r5.x * UniformVector_1.y;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.yyyy)) clip(-1.0);
    r0.y = ps;
    ps = (-0.5) + r5.x;
    r6.yz = float2((r5.xy >= 0.5));
    r0.z = ps;
    ps = r9.x + r9.x;
    r0.yz = r0.yz - r5.yx;
    r19.z = ps;
    r5.xy = r0.yz * r6.zy + r5.yx;
    ps = r9.w + r9.w;
    r5.xy = r5.xy + r5.xy;
    r19.w = ps;
    r4.xyz = tex2D(Texture2D_8, r19.zw).xyz;
    r9 = tex2D(Texture2D_2, r19.xy);
    r0.yzw = tex2D(LightAttenuationTexture, r21.xy).xyz;
    r21 = tex2D(Texture2D_4, r5.xy);
    r5.xyw = tex2D(Texture2D_0, r19.zw).xyz;
    r26.xyz = tex2D(Texture2D_1, r19.xy).xyz;
    r19.xyz = r7.xxx * UniformVector_6.xzy + r1.www;
    ps = (-1.0) - -r17.w;
    r23.x = -r25.w + 1.0;
    r1.w = ps;
    r13.z = r11.x * r1.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r1.zxy, r1.zxy);
    r17.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r15.xyz = r26.xyz + r26.xyz;
    r14.yzw = r5.xyw + r5.xyw;
    r23 = r3.yzyz * r23.xxyy;
    r3.x = (abs(r6.w) > 0.0) ? r24.y : 1.0;
    r10.x = (abs(r5.z) > 0.0) ? r3.x : r24.y;
    r3.xy = (-abs(r6.ww) >= 0.0) ? 0.0 : r23.zw;
    r3.yz = (-abs(r5.zz) >= 0.0) ? r23.xy : r3.xy;
    ps = r14.x;
    r3.x = r15.w * r10.w;
    r5.x = ps;
    r13.x = dot(r3.xy, r22.yy) + r13.x;
    r13.y = dot(r3.wz, r22.yy) + r13.y;
    ps = 1.0 - r6.x;
    r10.w = dot(r6.zyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.z = (r10.w == 0.0) ? r21.x : r21.y;
    ps = 2.5 * r6.x;
    r6.yzw = r10.zww + float3(1.0, -3.0, -2.0);
    r3.x = ps;
    r17.w = saturate(r3.x * r6.y - 0.5);
    r5.z = (r6.w == 0.0) ? r21.z : r5.z;
    r14.x = (r6.z == 0.0) ? r21.w : r5.z;
    ps = 1.0 - r5.x;
    r3.xw = abs(r6.yx) * abs(r6.yx);
    r7.x = ps;
    ps = r3.x * r3.x;
    r6 = r17 * r20;
    r16.x = ps;
    ps = -r17.w;
    r0.yzw = r0.yzw * r2.www;
    ps = r6.w + ps;
    r10.yzw = r6.xyz * r20.www;
    r5.z = ps;
    ps = rsqrt(abs(r1.w));
    r14 = r14 - 1.0;
    r6.x = ps;
    r2.xyz = r10.yzw * UniformScalar_12.xxx + r19.xzy;
    ps = r14.x;
    r3.xyz = r6.xxx * r1.xyz;
    r6.w = r18.y * r5.z + r17.w;
    ps = r11.w * ps;
    r5.xy = r16.xz * r16.xw;
    r15.w = ps;
    r6.xyz = r5.yyy * r11.xyz + ModShadowColor.xyz;
    ps = r6.w;
    r11.xyz = r10.yzw - r7.yyy;
    ps = r10.x * ps;
    r1 = r15 + float4(-1.0, -1.0, -1.0, 2.25);
    r10.y = ps;
    ps = r1.w;
    r2.xyz = r5.xxx * r2.xzy;
    ps = r15.w + ps;
    r1.xyz = r1.xyz - r14.yzw;
    r5.z = ps;
    r4.w = r1.z * r9.w - 2.0;
    ps = r5.z;
    r2.xyz = r2.xzy * r3.www;
    r1.xyz = r1.xyz * r9.www + r14.yzw;
    ps = -r12.y + ps;
    r5.xyz = -r1.zxy + r13.zxy;
    r10.z = saturate(ps);
    ps = 1.0 - r7.x;
    r2.yzw = r2.yzx * r10.yyx;
    r11.w = ps;
    r1.xy = r5.yz * r6.ww + r1.xy;
    r7 = r11 * r10.xxxz + r7.yyyx;
    r4.xyz = r7.www * r4.xyz;
    ps = 1.0 + r5.x;
    r10.xyz = -r4.xyz + r9.xyz;
    r7.w = ps;
    r4.xyz = r10.xyz * r9.www + r4.xyz;
    r7.xyz = r3.www * r7.xyz - r4.xyz;
    r4 = r7 * r6.wwww + r4;
    r1.z = r5.w * 2.0 + r4.w;
    r5.xyz = r1.zxy * r0.xxx;
    ps = 1.0 + r5.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r0.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.x = r2.w * r6.w;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r1.xyz = r4.xyz * r1.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xzy * r5.xxx;
    r5.y = r1.z * r5.w + r5.y;
    r5.xz = r1.xy * r5.ww + r5.xz;
    r5.xyz = r0.ywz * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
