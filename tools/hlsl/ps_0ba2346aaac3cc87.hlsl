// ps_0ba2346aaac3cc87.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (-4e+02) - -r4.w;
    r5.z = UniformScalar_22.x * 0.05;
    r5.x = ps;
    ps = r1.z;
    r2.xy = r0.wz - r0.xy;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r2.zw = r2.xy * UniformScalar_6.xx;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r15.w = saturate(ps);
    ps = 5.0 * r5.y;
    r11.xyz = r5.www * r3.xyz;
    r15.x = saturate(ps);
    r5.x = r5.z * r15.w;
    ps = -r0.z;
    r2.xy = r11.xy * r5.xx;
    ps = 1.0 + ps;
    r2 = r2.wxzy + r0.ywxz;
    r5.z = ps;
    ps = r2.y;
    r5.x = -r2.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r8.yz = r5.zx * UniformVector_1.yy;
    r8.w = ps;
    ps = UniformVector_1.x * r0.w;
    r15.y = saturate(r6.w * 15.0);
    r8.x = ps;
    ps = r0.w + r0.w;
    r5 = r8.wzxy - 0.5;
    r3.z = ps;
    ps = r0.z + r0.z;
    r14 = float4((r8.wxzy >= 0.5));
    r3.w = ps;
    ps = r2.y + r2.y;
    r5 = r5 - r8.wzxy;
    r3.x = ps;
    r5 = r5 * r14.xzyw + r8.wzxy;
    ps = r2.w + r2.w;
    r10 = r5 + r5;
    r3.y = ps;
    r8.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r19.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r5 = tex2D(Texture2D_3, r10.zw).zwxy;
    r17 = tex2D(Texture2D_3, r10.xy);
    r13 = tex2D(Texture2D_4, r9.xy);
    r10.xzw = tex2D(Texture2D_1, r3.zw).xyz;
    r10.y = UniformScalar_1.x * UniformVector_3.x;
    r9.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = -r6.w;
    r1.w = float((UniformScalar_17.x >= 1.0));
    ps = UniformScalar_18.x + ps;
    r12.xyz = r10.xzw + r10.xzw;
    r9.x = ps;
    r16.zw = r13.xy * 2.0 - 1.0;
    r1.w = r9.x * r1.w + r6.w;
    r1.w = -r1.w + r6.z;
    ps = r1.w;
    r14.y = dot(r14.yww, float3(1.0, 1.0, 1.0));
    r10.x = ps;
    ps = UniformScalar_19.x;
    r14.x = dot(r14.xzz, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r1.w = (r14.x == 0.0) ? r17.x : r17.y;
    r2.w = (r14.y == 0.0) ? r5.z : r5.w;
    ps = max(r10.x, r10.z);
    r14 = r14.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.x = (r14.y == 0.0) ? r5.x : r2.w;
    r1.w = (r14.w == 0.0) ? r17.z : r1.w;
    r16.x = (r14.x == 0.0) ? r17.w : r1.w;
    r2.w = (r14.z == 0.0) ? r5.y : r5.x;
    ps = r2.z;
    r5.x = max(r2.w, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_20.x;
    r5.xz = min(r5.xz, float2(0.3, 1.0));
    r5.w = ps;
    ps = UniformVector_5.x * r5.y;
    r5.w = saturate(r5.z * r5.w);
    r5.y = ps;
    ps = 3.3333333 * r5.x;
    r5.w = -r5.w + 1.0;
    r16.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r19.x = r5.w * r6.w;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xw = -r16.xy + 1.0;
    r5.w = ps;
    r5.x = dot(r15.yy, r6.xx) + r16.x;
    ps = r5.x;
    r7.xy = r5.zw * abs(r7.xy);
    ps = r16.x + ps;
    r5.zw = r19.xw * r13.zw;
    r12.w = ps;
    ps = UniformVector_5.y * r2.x;
    r14 = r12 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.x = saturate(r14.w - r5.w);
    r8.w = ps;
    ps = UniformVector_6.y + r5.x;
    r12 = r10.xxyx * r8.xywz;
    r6.z = ps;
    r6.y = r12.z * UniformScalar_3.x + r5.y;
    r10.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r13 = tex2D(Texture2D_2, r3.zw);
    r18 = tex2D(Texture2D_7, r6.yz);
    r2.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r8 = tex2D(Texture2D_6, r0.xy);
    r7.xyz = tex2D(Texture2D_0, r3.xy).xyz;
    r17.xyz = UniformVector_4.xyz * 2e+01;
    r3.yzw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / r4.w;
    r0.y = -r8.w + 1.0;
    r0.x = ps;
    r6.xyz = r2.zxy * 2.0 - 1.0;
    r5.xy = r19.yz * 2.0 - 1.0;
    r9.xy = r9.yz * r0.xx + ScreenPositionScaleBias.wz;
    ps = 0.5 * r5.x;
    r2.xyz = r18.xyz * r18.www;
    r0.x = ps;
    ps = UniformVector_3.x * r6.y;
    r17.xyz = r17.xyz * r2.xyz;
    r2.x = ps;
    ps = UniformVector_3.y * r6.z;
    r17 = r17.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r2.y = ps;
    r14.w = dot(r17.yx, r0.yy) + 0.0;
    ps = UniformVector_3.z * r6.x;
    r7.xyw = r17.yzw * r0.yyy;
    r2.z = ps;
    r3.x = dot(r7.wy, float2(0.11, 0.59)) + 0.0;
    ps = 0.5 * r5.y;
    r0.z = r15.y * r6.w;
    r0.y = ps;
    ps = r2.z;
    r6.xyz = r16.zyw + r0.xzy;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r15.z = float((r5.z >= 0.05));
    r0.w = ps;
    ps = (-1.0) - -r5.w;
    r5.xyz = -r15.zyx + 1.0;
    r6.w = ps;
    ps = 1.0 - r2.w;
    r6.xyz = r6.wxy * r6.yyz;
    r0.x = ps;
    r5.w = (UniformScalar_18.x > 0.0) ? r5.x : 1.0;
    r10.z = (UniformScalar_18.x >= 0.0) ? r5.w : r5.x;
    ps = 2.5 * r0.x;
    r15.y = -r12.w + r13.z;
    r0.z = ps;
    ps = 1.0 + r6.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = r0.y * r0.x;
    r15.xzw = r14.zxy - r3.wyz;
    r9.z = ps;
    ps = r0.z * r0.y;
    r14.xy = -r12.xy + r13.xy;
    r9.w = ps;
    r14.xy = r14.xy * r13.ww + r12.xy;
    r5.xy = r9.wz * r5.yy;
    r13 = r15.zwxy * r13.wwww;
    r5.w = float((r5.y >= 0.9));
    r12.xyz = r3.yzw + r13.xyz;
    r3.yzw = r7.xyw * r5.www + r8.xyz;
    r14.z = r12.w + r13.w;
    ps = (-0.5) + r5.x;
    r3.yzw = r3.yzw - r14.xyz;
    r6.w = saturate(ps);
    ps = r4.w;
    r3.yzw = r3.yzw * r6.www;
    ps = 0.0001 * ps;
    r3 = r14.wxyz + r3;
    r14.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r14.w = saturate(r3.x - r7.x);
    r14.y = ps;
    r4.z = r0.w * r14.w + r2.z;
    r0.xy = -r2.xy * r14.ww + r2.xy;
    ps = ModShadowGroupColor.y * r5.z;
    r4.xy = r0.xy + r6.yz;
    r14.z = ps;
    ps = r13.z;
    r0 = -r14 + 1.0;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r5.yzw = -r12.xyz + r4.xyz;
    r12.w = ps;
    r5.xyz = r5.yzw * r6.www + r12.xyw;
    r5.w = r7.z * 2.0 + r5.z;
    r5.xyz = r5.wxy * r0.xxx;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r0.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r1.w = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r1.www * r1.xyz;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r11.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r11.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r3.xyz = r3.yzw * r6.xyz;
    r10.w = ps;
    r6.xyz = r10.xyw * float3(0.875, 0.875, 15.0);
    r10.xy = r6.xy * r0.yz;
    r1.xyz = r10.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r5.xyz = tex2D(LightAttenuationTexture, r9.xy).zxy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r2.xyz = r8.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = LightColor.x * r5.y;
    r2.xyz = r2.xyz * r0.www;
    r6.x = ps;
    ps = LightColor.y * r5.z;
    r2.xyz = r2.xyz * r6.www;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r2.xyz = r2.xyz * r6.zzz;
    r6.z = ps;
    r5.y = r3.z * r5.w + r2.z;
    r5.xz = r3.xy * r5.ww + r2.xy;
    ps = r1.x * r1.y;
    r6.xyz = r6.xzy * r5.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
