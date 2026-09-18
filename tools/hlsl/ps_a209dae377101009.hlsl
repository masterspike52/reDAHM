// ps_a209dae377101009.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r13.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.z = -r6.w + UniformScalar_9.x;
    r12.x = ps;
    r5.xy = r13.xy * r5.xx + ScreenPositionScaleBias.wz;
    r8.yzw = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r8.x = UniformScalar_13.x * 0.05;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    ps = 0.0001 * ps;
    r11 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r21.y = saturate(ps);
    ps = r4.w;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r8.yzw = r8.yzw * r2.www;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r21.xz = saturate(r5.wz * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r9.xyz = r5.yyy * r3.xyz;
    r21.w = ps;
    ps = -r0.z;
    r2 = r8.xywz * r21.zwww;
    r8.xy = r9.xy * r2.xx + r0.wz;
    ps = 1.0 + ps;
    r8.z = -r8.y + 1.0;
    r8.w = ps;
    ps = UniformVector_1.x * r0.w;
    r14.yzw = r8.wxz * UniformVector_1.yxy;
    r14.x = ps;
    r5 = r14.wzxy - 0.5;
    r10 = float4((r14.wzxy >= 0.5));
    ps = r0.w + r0.w;
    r5 = r5 - r14.wzxy;
    r4.y = ps;
    r5 = r5.yxzw * r10.yxzw + r14.zwxy;
    ps = r0.z + r0.z;
    r3 = r5.zwxy + r5.zwxy;
    r4.z = ps;
    r14 = tex2D(Texture2D_9, r0.xy);
    r19 = tex2D(Texture2D_4, r11.xy);
    r24.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r11 = tex2D(Texture2D_3, r3.xy);
    r5.yzw = tex2D(Texture2D_1, r4.yz).xzy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = float((UniformScalar_8.x >= 1.0));
    r12.y = ps;
    r5.x = r13.z * r5.x + r6.w;
    ps = -r5.x;
    r3.xy = r12.xy * abs(r7.xy);
    ps = r6.z + ps;
    r12.z = dot(r10.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r12.w = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r5.x = (r12.w == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_10.x;
    r10 = r12.zzww + float4(-3.0, -2.0, -3.0, -2.0);
    r7.y = ps;
    r5.x = (r10.w == 0.0) ? r11.z : r5.x;
    r0.z = (r10.z == 0.0) ? r11.w : r5.x;
    ps = max(r7.x, r7.y);
    r4.w = max(r0.z, 0.0);
    r4.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r4.xw = min(r4.xw, float2(1.0, 0.3));
    r5.x = ps;
    ps = 15.0 * r6.w;
    r5.x = saturate(r4.x * r5.x);
    r10.w = saturate(ps);
    ps = 1.0 - r5.x;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r5.x = ps;
    r24.x = r5.x * r6.w;
    r6.xy = r24.xw * r19.zw;
    ps = r5.y + r5.y;
    r0.w = float((r6.x >= 0.05));
    r5.x = ps;
    ps = r5.w + r5.w;
    r0.zw = -r0.zw + 1.0;
    r5.y = ps;
    r1.w = (UniformScalar_9.x > 0.0) ? r0.w : 1.0;
    r1.w = (UniformScalar_9.x >= 0.0) ? r1.w : r0.w;
    ps = r5.z + r5.z;
    r5.w = r1.w * r14.w;
    r5.z = ps;
    ps = r8.x + r8.x;
    r16 = r5 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.y = ps;
    ps = r8.y + r8.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.wwww)) clip(-1.0);
    r5.w = ps;
    r8 = tex2D(Texture2D_2, r4.yz);
    r7.xyz = tex2D(Texture2D_8, r5.yw).xyz;
    r20 = tex2D(Texture2D_3, r3.zw);
    r18 = tex2D(Texture2D_6, r0.xy);
    r17.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r15 = tex2D(Texture2D_7, r0.xy).xzyw;
    r5.xz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyw = tex2D(Texture2D_0, r5.yw).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r3.z = dot(r1.zxy, r1.zxy);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r23.xyz = UniformVector_4.xzy * 2e+01;
    r6.z = ps;
    r13.xyz = r14.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r4.xyz = r3.xyw * 2.0 - 1.0;
    r19.zw = r19.xy * 2.0 - 1.0;
    ps = r15.x * r15.w;
    r17.xyz = r17.xyz + r17.xyz;
    r15.x = ps;
    ps = r15.y * r15.w;
    r18.xyz = r18.xzy * r18.www;
    r15.y = ps;
    r5.yw = r24.yz * 2.0 - 1.0;
    ps = r15.z * r15.w;
    r18.xyz = r23.xyz * r18.xyz;
    r15.z = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r15.xyz = r22.xyz * r15.xyz;
    r6.w = ps;
    r22.xyz = (abs(r6.www) > 0.0) ? r18.xzy : r15.xzy;
    r18.xyz = (-abs(r6.www) >= 0.0) ? r15.yxz : r18.yxz;
    r18.xyz = (-abs(r6.zzz) >= 0.0) ? r15.yxz : r18.xyz;
    r15.xyz = (abs(r6.zzz) > 0.0) ? r22.xyz : r15.xzy;
    ps = 0.5 * r5.y;
    r6.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r12.x = ps;
    ps = 0.5 * r5.w;
    r6.z = r6.z - r15.x;
    r12.y = ps;
    ps = r6.z;
    r5.yw = -r21.yx + 1.0;
    r6.z = (r12.z == 0.0) ? r20.x : r20.y;
    r6.z = (r10.y == 0.0) ? r20.z : r6.z;
    r19.x = (r10.x == 0.0) ? r20.w : r6.z;
    ps = r15.x + ps;
    r19.y = r4.w * 3.3333333;
    r10.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.w;
    r6.zw = -r19.xy + 1.0;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r12.z = r10.w * r6.w;
    r10.z = ps;
    r6.z = dot(r10.ww, r6.zz) + r19.x;
    ps = r6.z;
    r12.w = saturate(dot(r18.zxy, float3(0.59, 0.11, 0.3)));
    ps = r19.x + ps;
    r18.xyz = r19.zyw + r12.xzy;
    r17.w = ps;
    ps = (-1.0) - -r6.y;
    r17 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r18.w = ps;
    r0.x = r18.w * r18.y + 1.0;
    ps = r17.w;
    r10 = -r10.wxyz + 1.0;
    ps = -r6.y + ps;
    r6.xzw = r17.zxy * UniformVector_3.zxy;
    r6.y = saturate(ps);
    ps = 0.875 * r5.x;
    r12.xyz = r6.yyy * r7.xyz;
    r17.z = ps;
    r7.xy = -r6.zw * r12.ww + r6.zw;
    r7.xy = r18.xy * r18.yz + r7.xy;
    ps = 2.5 * r0.z;
    r17.xyw = -r12.xyz + r8.xyz;
    r0.y = ps;
    r8.xyz = r17.xyw * r8.www + r12.xyz;
    ps = 0.875 * r5.z;
    r17.xy = r0.xy * r0.zx;
    r17.w = ps;
    ps = 1.0 - r6.x;
    r0 = r17.wxyz * r10.wxxz;
    r12.x = ps;
    ps = rsqrt(abs(r3.z));
    r1.w = saturate(r0.z - 0.5);
    r5.x = ps;
    ps = r0.w;
    r3.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = 0.125 + r5.x;
    r1.xyz = r16.xyz - r4.xyz;
    r12.y = ps;
    ps = 0.125 + r0.x;
    r5.x = float((r0.y >= 0.9));
    r12.z = ps;
    r4.w = r1.z * r8.w - 2.0;
    r4.xyz = r1.xyz * r8.www + r4.xyz;
    r0.xyz = r5.xxx * r15.xyz + r14.xyz;
    ps = r12.x * r12.w;
    r1.xyz = r13.xyz * r10.yyy;
    r5.x = ps;
    ps = r12.y * r12.z;
    r10.xyz = r0.xyz - r8.xyz;
    r5.z = ps;
    r0.xyz = r5.zzz * r11.xyz + ModShadowColor.xyz;
    r8.xyz = r10.xyz * r1.www + r8.xyz;
    r7.z = r6.x + r5.x;
    r6.xyz = -r4.xyz + r7.xyz;
    r6.xyz = r6.xyz * r1.www + r4.xyw;
    r6.w = r3.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r5.yyy;
    ps = 1.0 + r6.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r5.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r1.www;
    r5.x = ps;
    r4.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r4.zxy, r9.zxy);
    r5.xyz = r4.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r5.x);
    r6.xyz = r8.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r2.ywz * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
