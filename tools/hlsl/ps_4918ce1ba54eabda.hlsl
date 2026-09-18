// ps_4918ce1ba54eabda.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
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

    ps = UniformScalar_18.x - r6.w;
    r10.y = ps;
    ps = UniformScalar_22.x;
    r5.zw = r0.wz - r0.xy;
    ps = 0.05 * ps;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r10.x = ps;
    ps = r4.w;
    r12 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = (-4e+02) + ps;
    r8.y = float((UniformScalar_17.x >= 1.0));
    r5.y = ps;
    ps = 0.00022222222 * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r8.x = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r5.zw = r5.zw * UniformScalar_6.xx;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.xxx * r3.xyz;
    r8.z = ps;
    r8 = r10.wxyz * r8.zxyz;
    ps = -r0.z;
    r5.xy = r9.xy * r8.yy;
    ps = 1.0 + ps;
    r3 = r5.wxzy + r0.ywxz;
    r5.z = ps;
    ps = r3.y;
    r5.x = -r3.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r11.yz = r5.zx * UniformVector_1.yy;
    r11.w = ps;
    ps = UniformVector_1.x * r0.w;
    r19.x = saturate(r4.w * 0.0001);
    r11.x = ps;
    r5 = r11.wzxy - 0.5;
    r17 = float4((r11.wzxy >= 0.5));
    ps = r3.y + r3.y;
    r5 = r5 - r11.wzxy;
    r10.x = ps;
    r5 = r5 * r17 + r11.wzxy;
    ps = r3.w + r3.w;
    r13 = r5 + r5;
    r10.y = ps;
    r11.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r16.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    r5 = tex2D(Texture2D_3, r13.zw).zwxy;
    r18 = tex2D(Texture2D_3, r13.xy);
    r14 = tex2D(Texture2D_4, r12.xy);
    r10.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r12.y = UniformScalar_1.x * UniformVector_3.x;
    r13.xyz = r10.xyw + r10.xyw;
    r15.zw = r14.xy * 2.0 - 1.0;
    ps = r6.w;
    r1.w = r8.z + r6.w;
    ps = 15.0 * ps;
    r1.w = -r1.w + r6.z;
    r6.y = saturate(ps);
    ps = r1.w;
    r15.y = dot(r17.zww, float3(1.0, 1.0, 1.0));
    r12.x = ps;
    ps = UniformScalar_19.x;
    r15.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r12.z = ps;
    r1.w = (r15.x == 0.0) ? r18.x : r18.y;
    r9.w = (r15.y == 0.0) ? r5.z : r5.w;
    ps = max(r12.x, r12.z);
    r17 = r15.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.x = (r17.y == 0.0) ? r5.x : r9.w;
    r1.w = (r17.w == 0.0) ? r18.z : r1.w;
    r15.x = (r17.x == 0.0) ? r18.w : r1.w;
    r1.w = (r17.z == 0.0) ? r5.y : r5.x;
    ps = r3.z;
    r5.x = max(r1.w, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_20.x;
    r5.xz = min(r5.zx, float2(1.0, 0.3));
    r5.w = ps;
    ps = UniformVector_5.x * r5.y;
    r5.w = saturate(r5.x * r5.w);
    r5.y = ps;
    ps = 3.3333333 * r5.z;
    r5.w = -r5.w + 1.0;
    r15.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.x = r5.w * r6.w;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = -r15.xy + 1.0;
    r5.w = ps;
    r5.x = dot(r6.yy, r6.xx) + r15.x;
    ps = r5.x;
    r5.zw = r5.zw * abs(r7.xy);
    ps = r15.x + ps;
    r6.xw = r16.xw * r14.zw;
    r13.w = ps;
    ps = UniformVector_5.y * r3.x;
    r14 = r13 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r12.x = saturate(r14.w - r6.w);
    r11.w = ps;
    ps = UniformVector_6.y + r5.x;
    r13 = r12.xxyx * r11.xywz;
    r3.y = ps;
    r3.x = r13.z * UniformScalar_3.x + r5.y;
    r12 = tex2D(Texture2D_7, r3.xy);
    r17.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r11 = tex2D(Texture2D_6, r0.xy);
    r5.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r3.xy = r5.yz * 0.875;
    r18.w = saturate(ps);
    ps = r11.w;
    r7.xyz = UniformVector_4.xyz * 2e+01;
    r5.y = ps;
    r5.xzw = r17.yxz * 2.0 - 1.0;
    ps = UniformVector_3.x * r5.z;
    r4.xyz = r12.xyz * r12.www;
    r18.x = ps;
    ps = UniformVector_3.y * r5.x;
    r4.xyz = r7.xyz * r4.xyz;
    r18.y = ps;
    ps = UniformVector_3.z * r5.w;
    r4 = r4.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r18.z = ps;
    ps = 1.0 - r5.y;
    r5.zw = -r18.zw + 1.0;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r12.xyz = r4.yzw * r5.yyy;
    r19.y = ps;
    r5.x = dot(r12.zy, float2(0.11, 0.59)) + 0.0;
    r5.x = dot(r4.yx, r5.yy) + r5.x;
    ps = ModShadowGroupColor.y * r5.w;
    r19.w = saturate(r5.x - r12.x);
    r19.z = ps;
    ps = r16.y + r16.y;
    r4 = -r19 + 1.0;
    r3.z = ps;
    ps = r16.z + r16.z;
    r3.xy = r3.xy * r4.yz;
    r3.w = ps;
    ps = r0.w + r0.w;
    r17 = r3 + float4(0.125, 0.125, -1.0, -1.0);
    r7.x = ps;
    ps = r0.z + r0.z;
    r3.xy = r17.zw * 0.5;
    r7.y = ps;
    ps = r8.w;
    r3.z = r6.y * r6.z;
    r5.x = ps;
    ps = (-1.0) - -r6.w;
    r6.z = float((r6.x >= 0.05));
    r0.w = ps;
    ps = 1.0 - r6.z;
    r0.xyz = r15.zyw + r3.xzy;
    r6.x = ps;
    ps = 1.0 - r6.y;
    r15.xyz = r0.wxy * r0.yyz;
    r5.y = ps;
    r6.y = (UniformScalar_18.x > 0.0) ? r6.x : 1.0;
    r15.w = (UniformScalar_18.x >= 0.0) ? r6.y : r6.x;
    ps = ScreenPositionScaleBias.w + r5.x;
    r6.yw = r15.xw + float2(1.0, -0.5);
    r6.x = ps;
    ps = ScreenPositionScaleBias.z + r8.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.z = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r8 = tex2D(Texture2D_2, r7.xy);
    r0.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    ps = -UniformVector_0.x;
    r6.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    r16.xyz = r0.xyz * 2.0 - 1.0;
    r7.yzw = r11.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = rsqrt(abs(r6.x));
    r5.x = saturate(-r5.x + 1.0);
    r6.x = ps;
    ps = log2(r5.x);
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r13.z = r5.z * r19.w + r18.z;
    r5.zw = -r18.xy * r19.ww + r18.xy;
    ps = r7.y;
    r2.xyz = r6.xxx * r1.xyz;
    ps = r4.w * ps;
    r6.x = r17.x * r17.y;
    r1.x = ps;
    r0.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    ps = -r13.w;
    r16.xzw = r16.zxy - r14.zxy;
    ps = r8.z + ps;
    r6.xz = -r13.xy + r8.xy;
    r16.y = ps;
    r10.xy = r6.xz * r8.ww + r13.xy;
    ps = 1.0 - r1.w;
    r8 = r16.zwyx * r8.wwww;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r10.z = r13.w + r8.z;
    r6.z = ps;
    ps = r6.y * r6.x;
    r13.xy = r5.zw + r15.yz;
    r5.z = ps;
    ps = r6.z * r6.y;
    r8.xyz = r14.xyz + r8.xyw;
    r5.w = ps;
    ps = r8.w;
    r5.zw = r5.zw * r5.yy;
    r5.y = ps;
    ps = (-2.0) + r5.y;
    r1.yzw = -r8.xyz + r13.xyz;
    r8.w = ps;
    ps = (-0.5) + r5.w;
    r5.y = float((r5.z >= 0.9));
    r5.z = saturate(ps);
    r6.xyz = r12.xyz * r5.yyy + r11.xyz;
    r8.xyz = r1.yzw * r5.zzz + r8.xyw;
    r8.w = r10.w * 2.0 + r8.z;
    ps = r7.z;
    r6.xyz = r6.xyz - r10.xyz;
    r6.xyz = r6.xyz * r5.zzz + r10.xyz;
    ps = r4.w * ps;
    r8.xyw = r8.xyw * r4.xxx;
    r1.y = ps;
    ps = r7.w;
    r8.z = r8.w + 1.0;
    r7.yzw = (r4.xxx > 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r4.xxx >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = r4.w * ps;
    r5.y = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r1.xyz * r5.zzz;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r9.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r4.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r9.xyz;
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
