// ps_f25849ff4d733562.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c17); // float3
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

    ps = UniformScalar_16.x;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r12.x = saturate(r6.w * 15.0);
    r5.x = ps;
    ps = r4.w;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r2.y = r1.z + 0.1;
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r12.yz = saturate(r2.yx * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.www * r3.xyz;
    r12.w = ps;
    r5.xyw = r5.xyz * r12.zww;
    ps = UniformScalar_12.x - r6.w;
    r15.xyz = UniformVector_5.xzy * 2e+01;
    r8.w = ps;
    r11.xy = r8.xy * r5.xx + r0.wz;
    ps = -r0.z;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = 1.0 + ps;
    r11.z = -r11.y + 1.0;
    r11.w = ps;
    r10.yzw = r11.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r24.xyz = UniformVector_4.xzy * 2e+01;
    r10.x = ps;
    r3 = r10.wzxy - 0.5;
    r2 = float4((r10.wzxy >= 0.5));
    r3 = r3 - r10.wzxy;
    r3 = r3.yxzw * r2.yxzw + r10.zwxy;
    r10 = r3 + r3;
    r14 = tex2D(Texture2D_9, r0.xy);
    r23 = tex2D(Texture2D_4, r9.xy);
    r25.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r13 = tex2D(Texture2D_3, r10.zw);
    r9.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.zw = r0.wz + r0.wz;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = float((UniformScalar_11.x >= 1.0));
    r3.y = ps;
    r5.x = r8.w * r5.x + r6.w;
    ps = -r5.x;
    r3.xy = r3.xy * abs(r7.xy);
    ps = r6.z + ps;
    r22.x = dot(r2.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r22.y = dot(r2.zww, float3(1.0, 1.0, 1.0));
    r2.x = ps;
    r5.x = (r22.y == 0.0) ? r13.x : r13.y;
    ps = UniformScalar_13.x;
    r21 = r22.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r2.y = ps;
    r5.x = (r21.y == 0.0) ? r13.z : r5.x;
    r2.w = (r21.z == 0.0) ? r13.w : r5.x;
    ps = max(r2.x, r2.y);
    r5.x = max(r2.w, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.xz = min(r5.zx, float2(1.0, 0.3));
    r1.w = ps;
    r5.x = saturate(r5.x * r1.w);
    ps = 1.0 - r5.x;
    r19.y = r5.z * 3.3333333;
    r5.z = ps;
    ps = r9.x + r9.x;
    r25.x = r5.z * r6.w;
    r7.x = ps;
    ps = r9.y + r9.y;
    r2.xy = r25.wx * r23.wz;
    r7.y = ps;
    ps = r9.z + r9.z;
    r2.z = float((r2.y >= 0.05));
    r7.z = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r2.yw = -r2.wz + 1.0;
    r6.x = ps;
    r5.z = (UniformScalar_12.x > 0.0) ? r2.w : 1.0;
    r5.z = (UniformScalar_12.x >= 0.0) ? r5.z : r2.w;
    ps = ScreenPositionScaleBias.z + r5.w;
    r7.w = r5.z * r14.w;
    r6.y = ps;
    ps = r11.x + r11.x;
    r9 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.y = ps;
    ps = r11.y + r11.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.wwww)) clip(-1.0);
    r5.w = ps;
    r13 = tex2D(Texture2D_2, r3.zw);
    r17.xyz = tex2D(Texture2D_8, r5.yw).xyz;
    r20 = tex2D(Texture2D_3, r10.xy);
    r7 = tex2D(Texture2D_6, r0.xy);
    r18.xyz = tex2D(Texture2D_1, r3.zw).xyz;
    r11 = tex2D(Texture2D_7, r0.xy).xzyw;
    r5.xz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r0.xyw = tex2D(Texture2D_0, r5.yw).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).zxy;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r5.y = dot(r1.zxy, r1.zxy);
    r16.xyz = r0.xyw * 2.0 - 1.0;
    r3.xyz = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r19.zw = r23.xy * 2.0 - 1.0;
    ps = r11.x * r11.w;
    r18.yzw = r18.xyz + r18.xyz;
    r11.x = ps;
    ps = rsqrt(abs(r5.y));
    r23.xyz = r7.xzy * r7.www;
    r0.z = ps;
    r5.yw = r25.yz * 2.0 - 1.0;
    ps = r11.y * r11.w;
    r7.xyz = r0.zzz * r1.xyz;
    r11.y = ps;
    ps = r11.z * r11.w;
    r1.xyz = r24.xyz * r23.xyz;
    r11.z = ps;
    r11.xyz = r15.xyz * r11.xyz;
    r15.xyz = (abs(r6.www) > 0.0) ? r1.xzy : r11.xzy;
    r1.xyz = (-abs(r6.www) >= 0.0) ? r11.yxz : r1.yxz;
    ps = r4.w;
    r11.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    ps = 0.0001 * ps;
    r6.w = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r1.x = saturate(ps);
    ps = 0.875 * r5.x;
    r0.xz = -r12.xy + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r6.w = r6.w - r15.x;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.w = saturate(r6.w + r15.x);
    r1.z = ps;
    ps = 0.875 * r5.z;
    r1 = -r1.xwyz + 1.0;
    r4.y = ps;
    r11.yz = r4.xy * r1.zw + 0.125;
    r5.x = (r22.x == 0.0) ? r20.x : r20.y;
    r5.x = (r21.w == 0.0) ? r20.z : r5.x;
    r19.x = (r21.x == 0.0) ? r20.w : r5.x;
    ps = 0.5 * r5.y;
    r5.xz = -r19.xy + 1.0;
    r4.x = ps;
    ps = 0.5 * r5.w;
    r4.z = r12.x * r5.z;
    r4.y = ps;
    r5.x = dot(r12.xx, r5.xx) + r19.x;
    ps = r5.x;
    r3.xyz = r3.xyz * r1.yyy;
    ps = r19.x + ps;
    r12.xyz = r19.zyw + r4.xzy;
    r18.x = ps;
    r5 = r18 + float4(0.25, -1.0, -1.0, -1.0);
    ps = (-1.0) - -r2.x;
    r4.xzw = r5.wyz - r16.zxy;
    r12.w = ps;
    r2.z = r12.w * r12.y + 1.0;
    r5.x = saturate(r5.x - r2.x);
    r5.xyz = r5.xxx * r17.xyz;
    ps = 2.5 * r2.y;
    r17.xy = -r5.xy + r13.xy;
    r2.x = ps;
    r13.xy = r17.xy * r13.ww + r5.xy;
    ps = -r5.z;
    r2.xy = r2.zx * r2.yz;
    ps = r13.z + ps;
    r5.xy = r2.yx * r0.xx;
    r4.y = ps;
    r2 = r4.zwyx * r13.wwww;
    ps = (-0.5) + r5.x;
    r4.xyz = r16.xyz + r2.xyw;
    r6.w = saturate(ps);
    ps = r5.z;
    r5.x = float((r5.y >= 0.9));
    r14.xyz = r5.xxx * r15.xyz + r14.xyz;
    ps = r2.z + ps;
    r5.xyz = r9.zxy * UniformVector_3.zxy;
    r13.z = ps;
    r9.xy = -r5.yz * r11.ww + r5.yz;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz - r13.xyz;
    r11.x = ps;
    r2.xyz = r14.xyz * r6.www + r13.xyz;
    r9.xy = r12.xy * r12.yz + r9.xy;
    r1.yz = r11.xy * r11.wz;
    r0.xyz = r1.zzz * r10.xyz + ModShadowColor.xyz;
    ps = r2.w;
    r9.z = r5.x + r1.y;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r5.yzw = -r4.xyz + r9.xyz;
    r4.w = ps;
    r5.xyz = r5.yzw * r6.www + r4.xyw;
    r5.w = r0.w * 2.0 + r5.z;
    r5.xyz = r5.wxy * r1.xxx;
    ps = 1.0 + r5.x;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r1.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r3.xyz * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r6.y;
    r5.x = saturate(dot(r7.zxy, r4.zxy));
    r1.x = ps;
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r1.yzw;
    r5.x = ps;
    ps = LightColor.y * r6.z;
    r5.x = r5.x * 15.0;
    r1.y = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r7.zyx));
    r5.x = ps;
    ps = LightColor.z * r6.x;
    r5.xyz = r3.xzy * r5.xxx;
    r1.z = ps;
    r5.y = r2.z * r5.w + r5.y;
    r5.xz = r2.xy * r5.ww + r5.xz;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
