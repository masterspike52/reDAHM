// ps_4c0e4e75975b17ee.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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

    r5.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = UniformScalar_16.x;
    r10 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = 0.05 * ps;
    r22.y = saturate(r4.w * 0.0001);
    r5.z = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.y = r4.w - 4e+02;
    r8.x = ps;
    ps = rsqrt(abs(r5.w));
    r22.xz = saturate(r8.xy * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.www * r3.xyz;
    r22.w = ps;
    ps = -r0.z;
    r5.xyz = r5.xyz * r22.wwz;
    r9.xy = r8.xy * r5.zz + r0.wz;
    ps = 1.0 + ps;
    r9.z = -r9.y + 1.0;
    r9.w = ps;
    r11.yzw = r9.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r20.xyz = UniformVector_4.xzy * 2e+01;
    r11.x = ps;
    ps = r0.w + r0.w;
    r3 = r11.wzxy - 0.5;
    r4.x = ps;
    ps = r0.z + r0.z;
    r12 = float4((r11.wzxy >= 0.5));
    r4.y = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r3 = r3 - r11.wzxy;
    r4.z = ps;
    r3 = r3.yxzw * r12.yxzw + r11.zwxy;
    ps = ScreenPositionScaleBias.z + r5.y;
    r3 = r3.zwxy + r3.zwxy;
    r4.w = ps;
    r14 = tex2D(Texture2D_9, r0.xy);
    r25 = tex2D(Texture2D_4, r10.xy);
    r24.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    r11 = tex2D(Texture2D_3, r3.xy);
    r13.xyz = tex2D(LightAttenuationTexture, r4.zw).xyz;
    r5.yzw = tex2D(Texture2D_1, r4.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r5.x;
    r13.w = -r6.w + UniformScalar_12.x;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r10.xyz = r5.yzw + r5.yzw;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = float((UniformScalar_11.x >= 1.0));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r13.xyz = r13.xyz * r2.www;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2 = r13.xzyw * r5.yyyz;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r2.w + r6.w;
    r5.z = ps;
    ps = -r5.x;
    r5.zw = r5.yz * abs(r7.xy);
    ps = r6.z + ps;
    r19.x = dot(r12.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r19.y = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r4.z = ps;
    r5.x = (r19.y == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_13.x;
    r7 = r19.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r4.w = ps;
    r5.x = (r7.x == 0.0) ? r11.z : r5.x;
    r0.z = (r7.y == 0.0) ? r11.w : r5.x;
    ps = max(r4.z, r4.w);
    r5.y = max(r0.z, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r3.xy = min(r5.xy, float2(1.0, 0.3));
    r5.x = ps;
    r5.x = saturate(r3.x * r5.x);
    ps = 1.0 - r5.x;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r5.x = ps;
    r24.x = r5.x * r6.w;
    r6.xy = r24.xw * r25.zw;
    r0.w = float((r6.x >= 0.05));
    r0.zw = -r0.zw + 1.0;
    r5.x = (UniformScalar_12.x > 0.0) ? r0.w : 1.0;
    r5.x = (UniformScalar_12.x >= 0.0) ? r5.x : r0.w;
    r10.w = r5.x * r14.w;
    ps = r9.x + r9.x;
    r17 = r10 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r9.y + r9.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r17.wwww)) clip(-1.0);
    r5.y = ps;
    r9 = tex2D(Texture2D_2, r4.xy);
    r12.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r21 = tex2D(Texture2D_3, r3.zw);
    r18.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r10 = tex2D(Texture2D_7, r0.xy);
    r15 = tex2D(Texture2D_6, r0.xy).xzyw;
    r5.zw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r4.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r1.zxy, r1.zxy);
    r13.xyz = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r16.xyz = r4.xyw * 2.0 - 1.0;
    r19.zw = r25.xy * 2.0 - 1.0;
    ps = r15.x * r15.w;
    r0.x = float((UniformScalar_8.x >= UniformScalar_1.x));
    r15.x = ps;
    ps = r15.y * r15.w;
    r10.xyz = r10.xzy * r10.www;
    r15.y = ps;
    r5.xy = r24.yz * 2.0 - 1.0;
    ps = r15.z * r15.w;
    r10.xyz = r23.xyz * r10.xyz;
    r15.z = ps;
    ps = r6.w;
    r15.xyz = r20.xyz * r15.xyz;
    r20.xyz = (-abs(r0.xxx) >= 0.0) ? r10.yxz : r15.yxz;
    r15.xyz = (abs(r0.xxx) > 0.0) ? r15.xzy : r10.xzy;
    ps = 15.0 * ps;
    r6.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r10.w = saturate(ps);
    ps = 0.5 * r5.x;
    r3.xw = -r22.xy + 1.0;
    r7.x = ps;
    ps = 0.5 * r5.y;
    r10.yz = r3.xx * ModShadowGroupColor.xy;
    r7.y = ps;
    ps = r6.z;
    r18.xyz = r18.xyz + r18.xyz;
    r5.x = (r19.x == 0.0) ? r21.x : r21.y;
    r5.x = (r7.w == 0.0) ? r21.z : r5.x;
    r19.x = (r7.z == 0.0) ? r21.w : r5.x;
    ps = -r15.x + ps;
    r19.y = r3.y * 3.3333333;
    r6.z = ps;
    ps = r6.z;
    r5.xy = -r19.xy + 1.0;
    ps = r15.x + ps;
    r7.z = r10.w * r5.y;
    r10.x = saturate(ps);
    r5.x = dot(r10.ww, r5.xx) + r19.x;
    ps = r5.x;
    r12.w = saturate(dot(r20.zxy, float3(0.59, 0.11, 0.3)));
    ps = r19.x + ps;
    r7.xyz = r19.zyw + r7.xzy;
    r18.w = ps;
    ps = (-1.0) - -r6.y;
    r18 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.w = ps;
    r0.x = r7.w * r7.y + 1.0;
    ps = r18.w;
    r10 = -r10.wxyz + 1.0;
    ps = -r6.y + ps;
    r6.xzw = r18.zxy * UniformVector_3.zxy;
    r5.x = saturate(ps);
    ps = 0.875 * r5.z;
    r12.xyz = r5.xxx * r12.xyz;
    r18.z = ps;
    r5.xy = -r6.zw * r12.ww + r6.zw;
    r7.xy = r7.xy * r7.yz + r5.xy;
    ps = 2.5 * r0.z;
    r18.xyw = -r12.xyz + r9.xyz;
    r0.y = ps;
    r9.xyz = r18.xyw * r9.www + r12.xyz;
    ps = 0.875 * r5.w;
    r18.xy = r0.xy * r0.zx;
    r18.w = ps;
    ps = 1.0 - r6.x;
    r5 = r18.yxwz * r10.xxwz;
    r12.x = ps;
    ps = rsqrt(abs(r1.w));
    r6.y = saturate(r5.x - 0.5);
    r0.x = ps;
    ps = r5.w;
    r1.xyz = r0.xxx * r1.xyz;
    r5.x = ps;
    ps = 0.125 + r5.x;
    r0.xyz = r17.xyz - r16.xyz;
    r12.y = ps;
    ps = 0.125 + r5.z;
    r1.w = float((r5.y >= 0.9));
    r12.z = ps;
    r0.w = r0.z * r9.w - 2.0;
    r0.xyz = r0.xyz * r9.www + r16.xyz;
    r5.xzw = r1.www * r15.xyz + r14.xyz;
    ps = r12.x * r12.w;
    r3.xyz = r13.xyz * r10.yyy;
    r5.y = ps;
    ps = r12.y * r12.z;
    r10.xyz = r5.xzw - r9.xyz;
    r5.x = ps;
    r5.xzw = r5.xxx * r11.xyz + ModShadowColor.xyz;
    r4.xyz = r10.xyz * r6.yyy + r9.xyz;
    r7.z = r6.x + r5.y;
    r6.xzw = -r0.xyz + r7.xyz;
    r0.xyz = r6.xzw * r6.yyy + r0.xyw;
    r0.w = r4.w * 2.0 + r0.z;
    r0.xyw = r0.xyw * r3.www;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r6.xzw = (r3.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r3.www >= 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r3.xyz * r6.yyy;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r8.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r3.xyz * r5.yyy;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r1.zxy, r7.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r4.xyz * r0.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.y = saturate(dot(r3.zyx, r1.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.yy + r6.xy;
    r6.z = r0.z * r5.y + r6.z;
    r6.xyz = r2.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xwz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
