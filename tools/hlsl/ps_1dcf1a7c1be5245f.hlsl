// ps_1dcf1a7c1be5245f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_16.x;
    r5.y = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r1.z + 0.1;
    r1.w = ps;
    ps = 0.00022222222 * r5.y;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.z = saturate(ps);
    ps = 5.0 * r5.x;
    r8.xyz = r1.www * r3.xyz;
    r5.y = saturate(ps);
    ps = UniformScalar_12.x - r6.w;
    r16.xyz = UniformVector_4.xzy * 2e+01;
    r8.w = ps;
    ps = -r0.z;
    r5.x = r5.w * r5.z;
    r22.xy = r8.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r22.z = -r22.y + 1.0;
    r22.w = ps;
    ps = UniformVector_1.x * r0.w;
    r5.x = float((UniformScalar_11.x >= 1.0));
    r10.x = ps;
    ps = 15.0 * r6.w;
    r10.yzw = r22.wxz * UniformVector_1.yxy;
    r17.y = saturate(ps);
    r11 = r10.wzxy - 0.5;
    r3 = float4((r10.wzxy >= 0.5));
    ps = r0.w + r0.w;
    r11 = r11 - r10.wzxy;
    r18.x = ps;
    r10 = r11.yxzw * r3.yxzw + r10.zwxy;
    ps = r0.z + r0.z;
    r12 = r10 + r10;
    r18.y = ps;
    r15 = tex2D(Texture2D_9, r0.xy);
    r19 = tex2D(Texture2D_4, r9.xy);
    r23.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r9 = tex2D(Texture2D_3, r12.zw);
    r10.xyz = tex2D(Texture2D_1, r18.xy).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r11 = tex2D(Texture2D_7, r0.xy).xzyw;
    r13.xyz = UniformVector_5.xzy * 2e+01;
    ps = r11.x * r11.w;
    r1.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r11.x = ps;
    ps = r11.y * r11.w;
    r14.xyz = r14.xzy * r14.www;
    r11.y = ps;
    ps = r11.z * r11.w;
    r20.xyz = r16.xyz * r14.xyz;
    r11.z = ps;
    r21.xyz = r13.xyz * r11.xyz;
    r16.xyz = (abs(r1.www) > 0.0) ? r20.xzy : r21.xzy;
    r5.w = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r5.x = r8.w * r5.x + r6.w;
    r5.w = r5.w - r16.x;
    r17.x = saturate(r5.w + r16.x);
    ps = -r5.x;
    r14.yzw = r10.xyz + r10.xyz;
    ps = r6.z + ps;
    r13.x = dot(r3.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r13.y = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r5.x = (r13.y == 0.0) ? r9.x : r9.y;
    ps = UniformScalar_13.x;
    r11 = r13.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r3.z = ps;
    r5.x = (r11.x == 0.0) ? r9.z : r5.x;
    r5.x = (r11.y == 0.0) ? r9.w : r5.x;
    ps = max(r3.y, r3.z);
    r3.x = max(r5.x, 0.0);
    r3.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r3.xy = min(r3.yx, float2(1.0, 0.3));
    r5.w = ps;
    ps = 0.0001 * r4.w;
    r17.z = saturate(r3.x * r5.w);
    r10.w = saturate(ps);
    ps = 1.0 - r5.y;
    r9.yzw = -r17.zxy + 1.0;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r23.x = r9.y * r6.w;
    r5.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.xw = r23.xw * r19.zw;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r10.x = float((r3.x >= 0.05));
    r10.z = ps;
    r10 = -r10.wxyz + 1.0;
    r5.x = (UniformScalar_12.x > 0.0) ? r10.y : 1.0;
    r5.x = (UniformScalar_12.x >= 0.0) ? r5.x : r10.y;
    r14.x = r5.x * r15.w;
    r14 = r14.yxzw + float4(-1.0, -0.5, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.yyyy)) clip(-1.0);
    r12 = tex2D(Texture2D_3, r12.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r19.zw = r19.xy * 2.0 - 1.0;
    r6.zw = r23.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xy = r6.zw * 0.5;
    r5.y = ps;
    r6.z = (r13.x == 0.0) ? r12.x : r12.y;
    r6.z = (r11.w == 0.0) ? r12.z : r6.z;
    r19.x = (r11.z == 0.0) ? r12.w : r6.z;
    ps = r5.x;
    r19.y = r3.y * 3.3333333;
    ps = abs(r7.x) * ps;
    r13.xw = -r19.yx + 1.0;
    r13.y = ps;
    ps = r5.y;
    r11.z = r17.y * r13.x;
    ps = abs(r7.y) * ps;
    r12.xyz = r19.zyw + r11.xzy;
    r13.z = ps;
    ps = 2.5 * r5.w;
    r12.w = r3.w - 1.0;
    r5.y = ps;
    r5.x = r12.w * r12.y + 1.0;
    ps = 1.0 / r4.w;
    r6.zw = r5.xy * r5.wx;
    r9.x = ps;
    ps = r22.x + r22.x;
    r11 = r6 * r9.xxww;
    r5.x = ps;
    ps = r22.y + r22.y;
    r5.zw = r11.xy + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4 = tex2D(Texture2D_2, r18.xy);
    r18.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r22.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r13.yz).xy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = -UniformVector_0.x;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    r7.yzw = r15.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = 1.0 - r5.x;
    r13.xyz = r6.xyw + r6.xyw;
    r5.x = saturate(ps);
    r2.xyz = r22.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r6.xyz = r2.zxy * UniformVector_3.zxy;
    r5.w = ps;
    ps = log2(r5.x);
    r2.xyz = r5.www * r1.xyz;
    r5.x = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r21.yxz : r20.yxz;
    ps = 0.875 * r5.y;
    r17.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r1.y = ps;
    r1.xw = -r6.yz * r17.ww + r6.yz;
    r5.w = dot(r17.yy, r13.ww) + r19.x;
    ps = 0.875 * r5.z;
    r13.w = r5.w + r19.x;
    r1.z = ps;
    ps = 1.0 - r6.x;
    r13 = r13 + float4(-1.0, -1.0, -1.0, 0.25);
    r17.x = ps;
    ps = r7.y;
    r5.y = saturate(r13.w - r3.w);
    r12.xy = r12.xy * r12.yz + r1.xw;
    ps = r9.z * ps;
    r5.yzw = r5.yyy * r18.xzy;
    r1.x = ps;
    r17.yz = r1.yz * r10.zw + 0.125;
    ps = -r5.z;
    r1.yz = -r5.yw + r4.xy;
    r1.yz = r1.yz * r4.ww + r5.yw;
    ps = r4.z + ps;
    r5.yw = r17.xy * r17.wz;
    r14.y = ps;
    r0.xyz = r5.www * r0.xyz + ModShadowColor.xyz;
    ps = r6.x;
    r0.w = float((r11.z >= 0.9));
    r11.xyz = r0.www * r16.xyz + r15.xyz;
    ps = r5.y + ps;
    r14.xzw = r14.wxz - r13.zxy;
    r12.z = ps;
    ps = r11.w;
    r4 = r14.zwyx * r4.wwww;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r1.w = r5.z + r4.z;
    r5.z = saturate(ps);
    ps = r4.w;
    r4.xyz = r13.xyz + r4.xyw;
    r5.y = ps;
    ps = (-2.0) + r5.y;
    r12.xyz = -r4.xyz + r12.xyz;
    r4.w = ps;
    r4.xyz = r12.xyz * r5.zzz + r4.xyw;
    ps = r7.z;
    r11.xyz = r11.xyz - r1.yzw;
    r6.xyz = r11.xyz * r5.zzz + r1.yzw;
    r4.w = r6.w * 2.0 + r4.z;
    ps = r9.z * ps;
    r4.xyw = r4.xyw * r10.xxx;
    r1.y = ps;
    ps = r7.w;
    r4.z = r4.w + 1.0;
    r4.xyz = (r10.xxx > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r10.xxx >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.z * ps;
    r5.y = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r1.xyz * r5.zzz;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r8.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r4.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r2.zxy, r5.wyz));
    r7.z = ps;
    ps = log2(r5.y);
    r6.yzw = r6.xyz * r7.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
