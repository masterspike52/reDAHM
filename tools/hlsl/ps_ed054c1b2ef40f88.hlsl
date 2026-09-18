// ps_ed054c1b2ef40f88.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 561 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000008C4 10041A00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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

    r5 = r0.wwzz * float4(0.5, 3.0, 0.5, 3.0);
    r9.xy = tex2D(Texture2D_6, r5.xz).xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xy = r4.xy * ScreenPositionScaleBias.xy;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r9.w = ps;
    r6.yz = r7.ww * float2(0.16, -0.8) + r5.yw;
    ps = UniformVector_1.y * r5.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.xw = r9.zw * abs(r8.xy);
    r6.x = ps;
    ps = UniformVector_1.x * r0.w;
    r18.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.z = ps;
    ps = (-0.5) + r5.z;
    r11 = r6.xxzy * float4(-0.125, 1.0, 6.0, 6.0);
    r8.x = ps;
    ps = (-0.5) + r5.y;
    r15.yz = float2((r5.yz >= 0.5));
    r8.y = ps;
    ps = 1.0 / r4.w;
    r10.zw = r8.xy - r5.zy;
    r15.x = ps;
    r8.xy = r10.xy * r15.xx + ScreenPositionScaleBias.wz;
    r9.zw = r10.wz * r15.yz + r5.yz;
    r17 = r9.xywz + r9.xywz;
    r10 = tex2D(Texture2D_4, r17.zw);
    r14.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r12.yzw = tex2D(Texture2D_3, r11.wz).xyw;
    r5.yw = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r8 = tex2D(Texture2D_3, r6.yz);
    r20.z = saturate(r7.w * 15.0);
    ps = -r7.w;
    r6.x = r1.z + 0.1;
    ps = UniformScalar_8.x + ps;
    r9.y = r8.z * r7.w;
    r14.w = ps;
    ps = r4.w;
    r6.w = float((UniformScalar_7.x >= 1.0));
    ps = (-4e+02) + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r13.xy = r8.yx * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r2.www;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r6.xz = saturate(r6.xy * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = r12.y + r12.y;
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r2.y = ps;
    ps = pow(2.0, r5.x);
    r2.x = dot(r15.zyy, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r5.x = (r2.x == 0.0) ? r10.x : r10.y;
    ps = 0.0001 * r4.w;
    r9.z = UniformScalar_13.x * 0.05;
    r9.x = saturate(ps);
    ps = r12.z + r12.z;
    r4 = r14.xzyw * r6.yyyw;
    r2.z = ps;
    ps = r4.w;
    r2 = r2.xzxy + float4(-3.0, -1.0, -2.0, -1.0);
    r5.z = (r2.z == 0.0) ? r10.z : r5.x;
    ps = r7.w + ps;
    r2.zw = r2.wy * 0.5;
    r5.x = ps;
    r13.zw = r8.xy * 2.0 + r2.zw;
    r6.y = (r2.x == 0.0) ? r10.w : r5.z;
    r5.x = -r5.x + r7.z;
    ps = r8.z;
    r2.x = max(r5.x, UniformScalar_9.x);
    r5.x = ps;
    ps = (-0.3) * r5.x;
    r2.y = max(r6.y, 0.0);
    r10.x = ps;
    ps = 0.875 * r5.y;
    r13 = r13.yxzw + r2.zwzw;
    r10.z = ps;
    ps = 1.0 / UniformScalar_0.x;
    r5.xy = min(r2.xy, float2(1.0, 0.3));
    r5.z = ps;
    ps = 0.875 * r5.w;
    r5.x = saturate(r5.x * r5.z);
    r10.w = ps;
    ps = r13.x;
    r6.w = -r5.x + 1.0;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r12.x = r6.w * r7.w;
    r1.w = ps;
    ps = 3.3333333 * r5.y;
    r2.zw = r9.yz * r6.wz;
    r9.y = ps;
    ps = r6.y;
    r2.xy = r12.wx * r8.wz;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r9.zw = float2((r2.yz >= 0.05));
    r5.z = ps;
    ps = 1.0 - r6.x;
    r21.xzw = -r9.zwy + 1.0;
    r5.w = ps;
    r9.w = r20.z * r21.w + r9.y;
    ps = ModShadowGroupColor.x * r5.w;
    r11.w = r1.w * r9.w;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r14.x = r11.w + r0.x;
    r9.z = ps;
    ps = (-1.0) - -r2.x;
    r3 = r11.yyyx * r3.xyzx;
    r10.y = ps;
    ps = r9.w;
    r11.xy = r3.xy * r2.ww;
    ps = r13.y * ps;
    r9.xyz = -r9.xyz + 1.0;
    r6.x = ps;
    ps = 0.025 * r6.x;
    r12 = r10.zwxy * r9.yzww;
    r10.w = ps;
    r11.z = r10.w + r12.z;
    r11 = r11.xzwy + r0.wyxz;
    ps = r11.x;
    r5.x = -r11.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r6.z = r5.x * UniformVector_1.y;
    r6.y = ps;
    r10.xy = r6.yz - 0.5;
    ps = r12.z;
    r5.xy = float2((r6.yz >= 0.5));
    ps = r0.y + ps;
    r10.yz = r10.xy - r6.yz;
    r10.x = ps;
    r10.yz = r10.yz * r5.xy + r6.yz;
    r14.yzw = r10.xyz + r10.wyz;
    r19.y = tex2D(Texture2D_5, r11.zy).w;
    r10 = tex2D(Texture2D_5, r14.xy);
    r6.yz = saturate(UniformVector_2.xy);
    r6.yz = r6.zy * UniformScalar_4.xx;
    ps = 1.0 / UniformScalar_4.x;
    r6.zw = floor(-r6.yz);
    r6.y = ps;
    ps = -r7.z;
    r6.yz = -r6.zw * r6.yy;
    ps = 1.0 + ps;
    r7.yz = r6.yz + UniformScalar_5.xx;
    r7.x = ps;
    r7 = r7.xxyz - r6.yzyz;
    ps = 1.0 / r7.z;
    r24.x = r10.w - 0.5;
    r6.y = ps;
    ps = 1.0 / r7.w;
    r15.x = r3.w + r0.w;
    r6.z = ps;
    r6.yw = saturate(r7.xy * r6.yz);
    r7.xy = r13.zw - 2.0;
    r7.zw = r7.xy + r8.xy;
    ps = r0.z;
    r26.yzw = r12.xyw + float3(0.125, 0.125, 1.0);
    r15.y = ps;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r26.x = abs(r26.w) * abs(r26.w);
    r1.w = ps;
    ps = r26.x * r26.x;
    r19.z = dot(r5.xyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r26.y * r26.z;
    r24.yzw = r19.yzz + float3(-0.5, -3.0, -2.0);
    r7.y = ps;
    ps = r5.x * r5.x;
    r20.xy = saturate(r24.xy * 3.3333333);
    r20.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r12.xyz = -r20.xyz + 1.0;
    r6.z = ps;
    r7.x = r6.y * r12.x + r20.x;
    ps = r0.w + r0.w;
    r8.xyw = r7.zwx + r8.xyz;
    r5.x = ps;
    ps = r0.z + r0.z;
    r21.y = float((r8.w >= 0.5));
    r5.y = ps;
    r7.xz = (-abs(r6.zz) >= 0.0) ? 1.0 : r21.xy;
    r7.xw = (-abs(r1.ww) >= 0.0) ? r21.zy : r7.xz;
    ps = r11.x + r11.x;
    r7.z = r7.x - 0.5;
    r16.x = ps;
    ps = r11.w + r11.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r16.y = ps;
    r11 = tex2D(Texture2D_2, r5.xy);
    r15.xyz = tex2D(Texture2D_8, r15.xy).xyz;
    r0.yzw = tex2D(Texture2D_0, r16.xy).xyz;
    r16.yzw = tex2D(Texture2D_9, r16.xy).xyz;
    r23 = tex2D(Texture2D_4, r14.zw);
    r13.yzw = tex2D(Texture2D_7, r14.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r14.xyz = r14.xyz * 2.0 - 1.0;
    ps = UniformScalar_10.x * r10.w;
    r5.y = ps;
    ps = r10.w;
    r25.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r18.xyz = r18.xyz * r10.xyz;
    r5.x = ps;
    ps = r13.y + r13.y;
    r10.xyz = r18.xyz * r10.www;
    r22.x = ps;
    r18.xyz = r5.xxx * UniformVector_5.xzy + r5.yyy;
    r18.xyz = r10.xyz * UniformScalar_11.xxx + r18.xzy;
    ps = r13.z + r13.z;
    r5.xy = r17.xy - 1.0;
    r22.y = ps;
    ps = r13.w + r13.w;
    r17.xyz = r5.xyz * float3(0.036, 0.036, 2.5);
    r22.z = ps;
    r19.x = saturate(r17.z * r26.w - 0.5);
    r7.xyz = r7.yyy * r25.xyz + ModShadowColor.xyz;
    r0.x = (r19.z == 0.0) ? r23.x : r23.y;
    r0.x = (r24.w == 0.0) ? r23.z : r0.x;
    r22.w = (r24.z == 0.0) ? r23.w : r0.x;
    r22 = r22 - 1.0;
    r19.yz = r22.xy * UniformVector_4.xy - r17.xy;
    r19.w = r22.z * UniformVector_4.z - 1.0;
    r6.yw = r6.ww * r12.xy + r20.xy;
    r0.x = dot(r22.ww, r12.zz) + 2.25;
    r8.w = saturate(r0.x - r2.x);
    r2.xy = -r6.yw + 1.0;
    r12 = r20.xxxx * r19.xywz;
    ps = -r19.x;
    r6.y = dot(r1.zxy, r1.zxy);
    ps = r12.x + ps;
    r2 = r8.xyxy * r2.xxyy;
    r18.w = ps;
    r0.x = (abs(r6.z) > 0.0) ? r21.y : 1.0;
    r6.zw = (-abs(r6.zz) >= 0.0) ? 0.0 : r2.zw;
    r6.zw = (-abs(r1.ww) >= 0.0) ? r2.xy : r6.zw;
    r16.x = (abs(r1.w) > 0.0) ? r0.x : r21.y;
    r18 = r20.wwwz * r18.xzyw;
    ps = r19.x;
    r8.xyz = r18.xzy * r5.zzz;
    ps = r18.w + ps;
    r2 = r8.xwww * r16;
    r10.w = ps;
    ps = rsqrt(abs(r6.y));
    r0.x = r2.x * r10.w;
    r6.y = ps;
    r13.yzw = r0.yzw + r0.yzw;
    r1.xyz = r6.yyy * r1.xyz;
    ps = r13.x;
    r10.xyz = r10.xyz - r15.xyz;
    ps = r9.w * ps;
    r17.xy = r17.xy + r12.yw;
    r6.y = ps;
    r6.xy = r17.xy + r6.yx;
    r12.xy = r6.xy + r6.zw;
    r6 = r10 * r16.xxxx;
    ps = r12.z;
    r15.xyz = r6.xyz + r15.xyz;
    ps = r7.w * ps;
    r16.xyz = -r2.yzw + r11.xyz;
    r13.x = ps;
    r13 = r13 + float4(1.0, -1.0, -1.0, -1.0);
    r14.xyz = r14.xyz - r13.yzw;
    r2.xyz = r16.xyz * r11.www + r2.yzw;
    r11.xyz = r5.zzz * r15.xyz - r2.xyz;
    r2.w = r14.z * r11.w - 2.0;
    r5.xyz = r14.xyz * r11.www + r13.yzw;
    r11.w = r13.x - r5.z;
    r12.xy = r12.xy * r7.ww - r5.xy;
    r5.xy = r12.xy * r10.ww + r5.xy;
    r2 = r11 * r10.wwww + r2;
    r5.z = r0.w * 2.0 + r2.w;
    r5.xyz = r5.zxy * r9.xxx;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.yz = r6.ww * r8.yz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r3.zxy);
    r8.xyz = r5.yzw * r5.xxx;
    r3.xyz = r8.xyz * 2.0 - r3.xyz;
    r5.x = saturate(dot(r1.zxy, r3.zxy));
    ps = log2(r5.x);
    r6.xyz = r2.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wyz, r1.zxy));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r4.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
