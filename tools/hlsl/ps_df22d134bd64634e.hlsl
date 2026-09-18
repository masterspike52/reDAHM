// ps_df22d134bd64634e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c16); // float3
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

    ps = UniformScalar_13.x;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r4.y = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = r4.w;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r2.y = r1.z + 0.1;
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r4.xz = saturate(r2.yx * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.www * r3.xyz;
    r4.w = ps;
    ps = UniformScalar_9.x - r6.w;
    r10 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.w = ps;
    ps = -r0.z;
    r5.xyw = r5.xyz * r4.zww;
    r8.xy = r9.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r8.z = -r8.y + 1.0;
    r8.w = ps;
    ps = UniformVector_1.x * r0.w;
    r11.yzw = r8.wxz * UniformVector_1.yxy;
    r11.x = ps;
    r3 = r11.wzxy - 0.5;
    r12 = float4((r11.wzxy >= 0.5));
    r3 = r3 - r11.wzxy;
    r3 = r3.yxzw * r12.yxzw + r11.zwxy;
    r3 = r3.zxwy + r3.zxwy;
    r15 = tex2D(Texture2D_9, r0.xy);
    r16 = tex2D(Texture2D_4, r10.xy);
    r11 = tex2D(Texture2D_3, r3.xz);
    r13.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.zw = r0.wz + r0.wz;
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = float((UniformScalar_8.x >= 1.0));
    r2.y = ps;
    r5.x = r9.w * r5.x + r6.w;
    ps = -r5.x;
    r10.xy = r2.xy * abs(r7.xy);
    ps = r6.z + ps;
    r18.x = dot(r12.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r18.y = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r5.x = (r18.y == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_10.x;
    r12 = r18.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r7.y = ps;
    r5.x = (r12.y == 0.0) ? r11.z : r5.x;
    r2.x = (r12.z == 0.0) ? r11.w : r5.x;
    ps = max(r7.x, r7.y);
    r5.x = max(r2.x, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r3.xz = min(r5.zx, float2(1.0, 0.3));
    r5.x = ps;
    r5.x = saturate(r3.x * r5.x);
    ps = 1.0 - r5.x;
    r5.z = ps;
    r13.x = r5.z * r6.w;
    ps = r13.y + r13.y;
    r6.xy = r13.xw * r16.zw;
    r11.x = ps;
    ps = r13.z + r13.z;
    r2.y = float((r6.x >= 0.05));
    r11.y = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r2.xy = -r2.xy + 1.0;
    r7.x = ps;
    r5.z = (UniformScalar_9.x > 0.0) ? r2.y : 1.0;
    r5.z = (UniformScalar_9.x >= 0.0) ? r5.z : r2.y;
    ps = ScreenPositionScaleBias.z + r5.w;
    r11.z = r5.z * r15.w;
    r7.y = ps;
    ps = r8.x + r8.x;
    r11.xzw = r11.zxy + float3(-0.5, -1.0, -1.0);
    r6.x = ps;
    ps = r8.y + r8.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r11.xxxx)) clip(-1.0);
    r6.z = ps;
    r20 = tex2D(Texture2D_2, r10.zw);
    r8.xyz = tex2D(Texture2D_8, r6.xz).xyz;
    r13.xyz = tex2D(Texture2D_1, r10.zw).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r7 = tex2D(Texture2D_3, r3.yw);
    r24 = tex2D(Texture2D_6, r0.xy);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0 = tex2D(Texture2D_7, r0.xy);
    r3.xyw = tex2D(Texture2D_0, r6.xz).xyz;
    r6.xz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    ps = r6.w;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 15.0 * ps;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r21.w = saturate(ps);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r23.xyz = UniformVector_4.xzy * 2e+01;
    r6.w = ps;
    r14.xyz = r3.xyw * 2.0 - 1.0;
    r10.xyz = r15.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r19.zw = r16.xy * 2.0 - 1.0;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r16.xyz = r0.xzy * r0.www;
    r0.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformVector_3.x * r5.y;
    r21.xyz = r24.xzy * r24.www;
    r0.y = ps;
    ps = UniformVector_3.y * r5.z;
    r21.xyz = r23.xyz * r21.xyz;
    r0.z = ps;
    ps = UniformVector_3.z * r5.x;
    r16.xyz = r22.xyz * r16.xyz;
    r0.x = ps;
    r5.xyz = (abs(r0.www) > 0.0) ? r21.xzy : r16.xzy;
    r21.xyz = (-abs(r0.www) >= 0.0) ? r16.yxz : r21.yxz;
    r21.xyz = (-abs(r6.www) >= 0.0) ? r16.yxz : r21.xyz;
    r16.xyz = (abs(r6.www) > 0.0) ? r5.xyz : r16.xzy;
    ps = r4.x;
    r5.y = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = 1.0 - r5.x;
    r13.w = saturate(dot(r21.zxy, float3(0.59, 0.11, 0.3)));
    r5.z = ps;
    r11.xy = -r0.yz * r13.ww + r0.yz;
    r5.x = (r18.x == 0.0) ? r7.x : r7.y;
    r5.x = (r12.w == 0.0) ? r7.z : r5.x;
    r19.x = (r12.x == 0.0) ? r7.w : r5.x;
    ps = 1.0 - r4.y;
    r19.y = r3.z * 3.3333333;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xw = -r19.yx + 1.0;
    r21.y = ps;
    ps = rsqrt(abs(r5.w));
    r18.z = r21.w * r4.x;
    r5.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r21.z = ps;
    ps = r5.y;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = -r16.x + ps;
    r3.xyz = r17.xyz * r2.www;
    r5.y = ps;
    ps = r5.y;
    r17.yzw = r13.xyz + r13.xyz;
    ps = r16.x + ps;
    r4.xyz = r5.xxx * r1.xyz;
    r21.x = saturate(ps);
    r5 = -r21.wyzx + 1.0;
    r0.w = dot(r21.ww, r4.ww) + r19.x;
    r17.x = r0.w + r19.x;
    r1 = r17 + float4(0.25, -1.0, -1.0, -1.0);
    ps = 0.875 * r6.x;
    r0.w = saturate(r1.x - r6.y);
    r17.z = ps;
    ps = 0.875 * r6.z;
    r8.xyz = r0.www * r8.xyz;
    r17.w = ps;
    ps = -r8.z;
    r1.xzw = r1.wyz - r14.zxy;
    ps = r20.z + ps;
    r2.zw = -r8.xy + r20.xy;
    r1.y = ps;
    r8.xy = r2.zw * r20.ww + r8.xy;
    ps = 1.0 - r0.x;
    r1 = r1.zwyx * r20.wwww;
    r13.x = ps;
    ps = (-1.0) - -r6.y;
    r18.xy = r11.zw * 0.5;
    r18.w = ps;
    ps = 2.5 * r2.x;
    r18.xyz = r19.zyw + r18.xzy;
    r2.w = ps;
    r11.xy = r18.xy * r18.yz + r11.xy;
    r2.z = r18.w * r18.y + 1.0;
    ps = r8.z;
    r17.xy = r2.zw * r2.xz;
    ps = r1.z + ps;
    r2 = r17 * r5.xxyz;
    r8.z = ps;
    ps = r2.y;
    r13.yz = r2.zw + 0.125;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r6.x = float((r2.x >= 0.9));
    r0.w = saturate(ps);
    r6.xyz = r6.xxx * r16.xyz + r15.xyz;
    ps = r13.x * r13.w;
    r1.xyz = r14.xyz + r1.xyw;
    r2.x = ps;
    ps = r13.y * r13.z;
    r2.yzw = r6.xyz - r8.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r12.xyz + ModShadowColor.xyz;
    r8.xyz = r2.yzw * r0.www + r8.xyz;
    ps = r1.w;
    r11.z = r0.x + r2.x;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r0.xyz = -r1.xyz + r11.xyz;
    r1.w = ps;
    r1.xyz = r0.xyz * r0.www + r1.xyw;
    r1.w = r3.w * 2.0 + r1.z;
    r5.xyz = r1.wxy * r6.www;
    ps = 1.0 + r5.x;
    r0.xyz = r10.xyz * r5.www;
    r5.w = ps;
    r5.xyz = (r6.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r0.xyz * r0.www;
    r5.x = ps;
    r2.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r2.zxy, r9.zxy);
    r5.xyz = r2.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r8.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r3.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
