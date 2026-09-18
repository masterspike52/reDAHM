// ps_7aa7bded697ce6a7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 537 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000864 10041A00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
sampler2D Texture2D_8 : register(s9);
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11.z = float((UniformScalar_7.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r0.w * UniformVector_1.x;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r5.w = ps;
    ps = UniformVector_1.y * r5.x;
    r6 = r0.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r5.x = ps;
    r7.xy = r7.ww * float2(0.16, -0.8) + r6.xy;
    ps = (-0.5) + r5.y;
    r5.zw = r5.zw * abs(r8.xy);
    r8.x = ps;
    ps = (-0.5) + r5.x;
    r11.xy = float2((r5.xy >= 0.5));
    r8.y = ps;
    ps = 6.0 * r7.x;
    r14.xy = r8.xy - r5.yx;
    r9.x = ps;
    ps = r0.z;
    r14.z = -r7.w + UniformScalar_8.x;
    r11.w = ps;
    r5.xy = r14.yx * r11.xy + r5.xy;
    ps = 6.0 * r7.y;
    r5.xy = r5.yx + r5.yx;
    r9.y = ps;
    r8 = tex2D(Texture2D_4, r5.xy).zxyw;
    r15.yzw = tex2D(Texture2D_3, r9.xy).xyw;
    r6.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r13 = tex2D(Texture2D_3, r7.xy).wxyz;
    ps = 0.0001 * r4.w;
    r9.x = saturate(ps);
    ps = r7.w;
    r1.w = UniformScalar_13.x * 0.05;
    ps = 15.0 * ps;
    r5.x = r1.z + 0.1;
    r19.z = saturate(ps);
    ps = r4.w;
    r12.x = r13.w * (-0.3);
    r10.xy = r13.zy * 2.0 - 1.0;
    ps = (-4e+02) + ps;
    r9.zw = r15.yz + r15.yz;
    r5.y = ps;
    ps = 0.875 * r6.x;
    r9.y = dot(r11.yxx, float3(1.0, 1.0, 1.0));
    r12.z = ps;
    r5.w = (r9.y == 0.0) ? r8.y : r8.z;
    r5.z = r14.z * r11.z + r7.w;
    ps = 0.875 * r6.y;
    r14 = r9.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r12.w = ps;
    ps = r13.w;
    r8.yz = r14.zw * 0.5;
    r5.w = (r14.y == 0.0) ? r8.x : r5.w;
    ps = r7.w * ps;
    r5.z = -r5.z + r7.z;
    r3.w = ps;
    ps = 5.0 * r5.x;
    r5.z = max(r5.z, UniformScalar_9.x);
    r8.x = saturate(ps);
    r26.z = (r14.x == 0.0) ? r8.w : r5.w;
    r10.zw = r13.yz * 2.0 + r8.yz;
    ps = 0.00022222222 * r5.y;
    r14 = r10 + r8.zyyz;
    r8.y = saturate(ps);
    ps = r14.y;
    r5.w = max(r26.z, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r5.yz = min(r5.wz, float2(0.3, 1.0));
    r5.w = ps;
    ps = 0.01 * r5.x;
    r8.z = saturate(r5.z * r5.w);
    r5.w = ps;
    ps = 3.3333333 * r5.y;
    r5.xz = -r8.zx + 1.0;
    r10.x = ps;
    ps = r3.w;
    r15.x = r5.x * r7.w;
    ps = r5.x * ps;
    r7.xy = r15.xw * r13.wx;
    r7.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.yz = float2((r7.xw >= 0.05));
    r9.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r25.xzw = -r10.yzx + 1.0;
    r9.w = ps;
    r10.w = r19.z * r25.w + r10.x;
    ps = (-1.0) - -r7.y;
    r5.w = r5.w * r10.w;
    r12.y = ps;
    ps = r14.y;
    r11.x = r5.w + r0.x;
    ps = r10.w * ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    ps = r10.w;
    r10.xyz = -r9.xzw + 1.0;
    ps = r14.x * ps;
    r18 = r12.zwxy * r10.yzww;
    r9.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r18.z + r0.y;
    r9.w = ps;
    ps = r1.w;
    r12.xyz = r9.zww * float3(0.025, -0.125, 1.0);
    ps = r8.y * ps;
    r11.y = r5.x + r12.x;
    r5.x = ps;
    ps = r12.x;
    r8 = r12.zzzy * r3.xyzx;
    ps = r18.z + ps;
    r5.xy = r8.xy * r5.xx;
    r5.z = ps;
    r12 = r5.xzwy + r0.wyxz;
    r6.x = tex2D(Texture2D_5, r12.zy).w;
    r5.xy = tex2D(Texture2D_6, r6.zw).yx;
    r17 = tex2D(Texture2D_5, r11.xy);
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r3.yz = r0.wz + r0.wz;
    r1.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r16.x = -r7.z + 1.0;
    r3.x = ps;
    ps = UniformVector_2.x;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = saturate(ps);
    ps = UniformVector_2.y;
    r6.z = r17.w - 0.5;
    r5.w = saturate(ps);
    ps = r5.y + r5.y;
    r5.zw = r5.wz * UniformScalar_4.xx;
    r6.y = ps;
    ps = 1.0 / UniformScalar_4.x;
    r15.xw = floor(-r5.zw);
    r5.z = ps;
    ps = r5.x + r5.x;
    r5.yz = -r15.xw * r5.zz;
    r6.w = ps;
    ps = UniformScalar_5.x + r5.y;
    r6.xyw = r6.ywx + float3(-1.0, -1.0, -0.5);
    r16.y = ps;
    ps = UniformScalar_5.x + r5.z;
    r19.xy = saturate(r6.zw * 3.3333333);
    r16.z = ps;
    ps = 1.0 / r4.w;
    r23.xyz = r18.xyw + float3(0.125, 0.125, 1.0);
    r15.w = ps;
    ps = abs(r23.z) * abs(r23.z);
    r4 = r16.xxyz - r5.yzyz;
    r15.x = ps;
    ps = 1.0 / r4.z;
    r11.z = r8.w + r0.w;
    r0.x = ps;
    ps = 1.0 / r4.w;
    r5.xyw = r15.xyz * r15.xww;
    r0.y = ps;
    ps = r5.x * r5.x;
    r0.xz = saturate(r4.xy * r0.xy);
    r19.w = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r4.xy = r14.zw - 2.0;
    r0.y = ps;
    ps = r12.x;
    r14.yz = r4.xy + r13.yz;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.x = -r12.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.y * r5.x;
    r15.xyz = -r19.xyz + 1.0;
    r5.x = ps;
    r14.x = r0.x * r15.x + r19.x;
    ps = (-0.5) + r5.x;
    r4.xy = float2((r5.xy >= 0.5));
    r4.z = ps;
    ps = (-0.5) + r5.y;
    r13.x = dot(r4.yxx, float3(1.0, 1.0, 1.0));
    r4.w = ps;
    ps = ScreenPositionScaleBias.z + r5.w;
    r4.zw = r4.zw - r5.xy;
    r0.w = ps;
    ps = r12.x + r12.x;
    r24.xyz = r14.xyz + r13.wyz;
    r5.z = ps;
    ps = r12.w + r12.w;
    r25.y = float((r24.x >= 0.5));
    r5.w = ps;
    r5.xy = r4.wz * r4.yx + r5.yx;
    r4.xy = (-abs(r3.xx) >= 0.0) ? 1.0 : r25.xy;
    r13.yz = (-abs(r1.ww) >= 0.0) ? r25.zy : r4.xy;
    ps = r5.x + r5.x;
    r21.xzw = r13.yxx + float3(-0.5, -3.0, -2.0);
    r5.x = ps;
    ps = r5.y + r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r21.xxxx)) clip(-1.0);
    r5.y = ps;
    r12.xyz = tex2D(Texture2D_8, r11.zw).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.yw).xyz;
    r16.xyz = tex2D(Texture2D_9, r5.zw).xyz;
    r14 = tex2D(Texture2D_2, r3.yz);
    r20.xyz = tex2D(Texture2D_1, r3.yz).xyz;
    r18 = tex2D(Texture2D_4, r5.xy);
    r0.xyw = tex2D(Texture2D_0, r5.zw).xyz;
    r11.xyw = tex2D(Texture2D_7, r11.xy).xyz;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = r17.w;
    r3.yzw = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.y = r17.w * UniformScalar_10.x;
    r5.x = ps;
    ps = r11.x + r11.x;
    r22.xyz = -ModShadowColor.xyz + 1.0;
    r21.x = ps;
    ps = r11.y + r11.y;
    r3.yzw = r3.yzw * r17.xyz;
    r21.y = ps;
    ps = r0.x + r0.x;
    r11.xyz = r3.yzw * r17.www;
    r3.y = ps;
    r5.xyw = r5.xxx * UniformVector_5.xzy + r5.yyy;
    r17.yzw = r11.xyz * UniformScalar_11.xxx + r5.xwy;
    r26.xy = r0.zz * r15.xy + r19.xy;
    ps = r0.y + r0.y;
    r5.xyw = -r26.xyz + 1.0;
    r3.z = ps;
    r7.z = (r13.x == 0.0) ? r18.x : r18.y;
    ps = 2.5 * r5.w;
    r24 = r24.yzyz * r5.xxyy;
    r23.w = ps;
    r5.xy = (-abs(r3.xx) >= 0.0) ? 0.0 : r24.zw;
    r0.z = (abs(r3.x) > 0.0) ? r25.y : 1.0;
    r16.w = (abs(r1.w) > 0.0) ? r0.z : r25.y;
    r15.xy = (-abs(r1.ww) >= 0.0) ? r24.xy : r5.xy;
    ps = r0.w + r0.w;
    r5.xy = r23.wx * r23.zy;
    r3.w = ps;
    r0.xyz = r5.yyy * r22.xyz + ModShadowColor.xyz;
    r7.z = (r21.w == 0.0) ? r18.z : r7.z;
    r3.x = (r21.z == 0.0) ? r18.w : r7.z;
    ps = r11.w + r11.w;
    r3 = r3 - 1.0;
    r21.z = ps;
    ps = 0.036 * r6.x;
    r21.w = r3.x * r15.z;
    r15.z = ps;
    ps = 0.036 * r6.y;
    r18 = r21.wxyz + float4(2.25, -1.0, -1.0, -1.0);
    r15.w = ps;
    r18.yz = r18.yz * UniformVector_4.xy - r15.zw;
    r18.w = r18.w * UniformVector_4.z - 1.0;
    ps = (-0.5) + r5.x;
    r7.z = r18.x + r21.w;
    r18.x = saturate(ps);
    ps = r7.z;
    r6 = r19.xxxx * r18.xywz;
    ps = -r7.y + ps;
    r17.x = -r18.x + r6.x;
    r9.x = saturate(ps);
    ps = r6.z;
    r6.xy = r15.zw + r6.yw;
    ps = r13.z * ps;
    r9.yz = r6.xy + r9.yz;
    r6.x = ps;
    ps = r9.y;
    r6.yzw = r20.xyz + r20.xyz;
    ps = r15.x + ps;
    r7 = r6.xzwy + float4(1.0, -1.0, -1.0, -1.0);
    r15.x = ps;
    ps = r9.z;
    r6 = r19.zwww * r17.xywz;
    ps = r15.y + ps;
    r9.yzw = r6.ywz * r5.www;
    r15.y = ps;
    ps = r18.x;
    r17.xyz = r7.wyz - r3.yzw;
    r7.w = r17.z * r14.w - 2.0;
    r3.yzw = r17.xyz * r14.www + r3.yzw;
    r15.xy = r15.xy * r13.zz - r3.yz;
    ps = r6.x + ps;
    r13 = r9.xxxy * r16;
    r11.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.x = r13.w * r11.w;
    r5.z = ps;
    r1.xyz = r5.zzz * r1.xyz;
    r11.xyz = r11.xyz - r12.xyz;
    r6 = r11 * r16.wwww;
    r3.yz = r15.xy * r11.ww + r3.yz;
    ps = r7.x;
    r12.xyz = r6.xyz + r12.xyz;
    ps = -r3.w + ps;
    r7.xyz = -r13.xyz + r14.xyz;
    r12.w = ps;
    r7.xyz = r7.xyz * r14.www + r13.xyz;
    r12.xyz = r5.www * r12.xyz - r7.xyz;
    r7 = r12 * r11.wwww + r7;
    r3.w = r0.w * 2.0 + r7.w;
    r5.xyz = r3.wyz * r10.xxx;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r10.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.yz = r6.ww * r9.zw;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r9.xyz = r5.yzw * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r1.zxy, r8.zxy));
    ps = log2(r5.x);
    r7.xyz = r7.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.xyz = r4.xyz * r2.www;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wyz, r1.zxy));
    r5.x = ps;
    r5.xyz = r3.xzy * r5.xxx;
    r5.y = r7.z * r5.w + r5.y;
    r5.xz = r7.xy * r5.ww + r5.xz;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
