// ps_a3380c830634b2d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041300 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r5.w = r4.w - 4e+02;
    r5.x = ps;
    ps = r0.z + r0.z;
    r9.xy = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = saturate(r5.w * 0.00022222222);
    r6.x = ps;
    ps = UniformVector_2.x * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r3.xyz = r5.xzw * float3(6.0, 6.0, -0.1);
    r5.y = ps;
    r9.xy = r8.xy * r3.zz + r9.xy;
    ps = 1.0 - r0.z;
    r11.w = UniformScalar_1.x * UniformVector_4.x;
    r6.y = ps;
    ps = r6.x;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = -r9.y * r5.y + 1.0;
    ps = r9.x * ps;
    r6.yw = r6.xy * UniformVector_2.yy;
    r6.x = ps;
    ps = UniformVector_2.x * r0.w;
    r16.xyz = UniformVector_5.xyz * 2e+01;
    r6.z = ps;
    r10 = r6 - 0.5;
    r14 = float4((r6.xywz >= 0.5));
    r10 = r10.xywz - r6.xywz;
    r6 = r10.xywz * r14.xywz + r6;
    r6 = r6.zwxy + r6.zwxy;
    r12 = tex2D(Texture2D_3, r6.xy);
    r10.xzw = tex2D(Texture2D_4, r3.xy).wxy;
    r5.xyw = tex2D(Texture2D_4, r5.xz).xyw;
    r6.xy = r0.wz * UniformVector_8.xy;
    ps = 1.0 / r4.w;
    r3.xy = UniformVector_1.xy + UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.yz = r0.wz - r0.xy;
    r11.x = ps;
    r3.zw = r5.xy * 2.0 - 1.0;
    r10.zw = r10.zw * 2.0 - 1.0;
    r5.xy = r11.zy * UniformScalar_4.xx + r0.yx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = r10.x * r5.w;
    r11.y = ps;
    ps = (-1.0) - -r5.w;
    r13.xy = r3.xy * r0.wz;
    r10.x = ps;
    r3.xy = r9.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = UniformVector_6.x * r5.y;
    r18.x = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = UniformVector_6.y * r5.x;
    r18.y = dot(r14.wzz, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.z = (r18.y == 0.0) ? r12.x : r12.y;
    ps = r11.x;
    r17 = r18.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r5.z = (r17.x == 0.0) ? r12.z : r5.z;
    r0.z = (r17.w == 0.0) ? r12.w : r5.z;
    ps = abs(r7.x) * ps;
    r5.z = max(r0.z, 0.0);
    r13.z = ps;
    ps = r11.y;
    r10.y = min(r5.z, 0.3);
    ps = abs(r7.y) * ps;
    r11.xyz = r10.yzw * float3(3.3333333, 0.5, 0.5);
    r13.w = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.yz = r3.zw + r11.yz;
    r10.w = ps;
    ps = UniformVector_7.y + r5.x;
    r12 = r11.xwxx * r10.xwyz;
    r5.z = ps;
    r5.x = r12.y * UniformScalar_3.x + r5.y;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r11 = tex2D(Texture2D_2, r13.xy).wxyz;
    r10.xyz = tex2D(Texture2D_8, r9.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r15 = tex2D(Texture2D_3, r6.zw);
    r19 = tex2D(Texture2D_7, r5.xz);
    r9.xyz = tex2D(Texture2D_9, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r0.yw = tex2D(ModShadowAccumTexture, r13.zw).xy;
    r13.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    ps = r4.w;
    r6.w = float((UniformScalar_17.x >= 1.0));
    ps = 0.0001 * ps;
    r5.z = float((UniformScalar_17.x > 1.0));
    r17.x = saturate(ps);
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r13.yzw = r13.zxy * 2.0 - 1.0;
    ps = 0.1 + ps;
    r4.xyz = r14.zxy * UniformScalar_18.xxx;
    r5.y = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r9.xyz = (-abs(r5.zzz) >= 0.0) ? r9.xyz : 1.0;
    ps = 5.0 * r5.y;
    r2.xyz = r19.xyz * r19.www;
    r0.x = saturate(ps);
    ps = r14.w;
    r2.xyz = r16.xyz * r2.xyz;
    r5.z = ps;
    r16.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r9.xyz;
    r4.xyz = r4.xyz * r16.wyz + UniformScalar_19.xxx;
    ps = 1.0 - r5.z;
    r2 = r2.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r5.y = ps;
    r16.x = dot(r2.yx, r5.yy) + 0.0;
    ps = 0.875 * r0.y;
    r9.xyw = r2.zwy * r5.yyy;
    r5.y = ps;
    r13.x = dot(r9.yx, float2(0.11, 0.59)) + 0.0;
    r5.z = (r18.x == 0.0) ? r15.x : r15.y;
    r5.z = (r17.z == 0.0) ? r15.z : r5.z;
    r2.w = (r17.y == 0.0) ? r15.w : r5.z;
    ps = 1.0 - r0.z;
    r2.xyz = r7.wxy + r7.wxy;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r15 = r2 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r5.z = r15.w + r2.w;
    r17.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r5.w = saturate(r5.z - r5.w);
    r17.z = ps;
    ps = 0.875 * r0.w;
    r7.xyz = -r17.xyz + 1.0;
    r5.z = ps;
    ps = 2.5 * r0.y;
    r10.xyz = r5.www * r10.xyz;
    r0.w = ps;
    r2.zw = r5.yz * r7.yz + 0.125;
    ps = -r10.z;
    r16.yzw = r16.yzw * r14.xyz;
    ps = r11.w + ps;
    r5.yz = -r10.xy + r11.yz;
    r14.y = ps;
    r11.yz = r5.yz * r11.xx + r10.xy;
    ps = r12.x;
    r14.xzw = r13.yzw - r15.xyz;
    r5.z = ps;
    ps = 1.0 + r5.z;
    r14 = r14.zwxy * r11.xxxx;
    r0.x = ps;
    ps = UniformVector_4.z * r6.x;
    r5.yw = r0.xw * r0.yx;
    r6.x = ps;
    ps = UniformVector_4.y * r6.z;
    r5.z = float((r5.y > 0.9));
    r6.z = ps;
    ps = UniformVector_4.x * r6.y;
    r13.yzw = r9.wxy * r5.zzz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r13 = r16 + r13;
    r2.y = ps;
    ps = r14.z;
    r4.w = r13.y - r11.y;
    r5.z = ps;
    ps = (-2.0) + r5.z;
    r0.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = r10.z;
    r10.xyw = -UniformVector_0.xyz + 1.0;
    ps = r14.w + ps;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = r13.x;
    r9.xyz = r15.xyz + r14.zxy;
    ps = -r9.w + ps;
    r12.xy = r13.wz - r11.xz;
    r2.x = saturate(ps);
    ps = (-0.5) + r5.w;
    r13.yz = -r6.yz * r2.xx;
    r10.z = saturate(ps);
    ps = 1.0 - r2.x;
    r13.xw = r2.yz * r2.xw;
    r5.y = ps;
    r0.xyz = r13.www * r0.xyz + ModShadowColor.xyz;
    ps = r4.x;
    r6.xyz = r6.xyz + r13.xyz;
    ps = r5.y * ps;
    r2.xy = r6.yz + r12.zw;
    r2.z = ps;
    ps = r6.x;
    r12.zw = r2.xy - r9.yz;
    ps = -r9.x + ps;
    r6 = r12 * r10.zzzz;
    r2.w = ps;
    ps = r11.z;
    r4.xy = r4.yz * r5.yy;
    ps = r6.y + ps;
    r4.z = r11.x + r6.x;
    r2.y = ps;
    ps = r9.y;
    r4 = r4.wxyz * r10.zzzw;
    ps = r6.z + ps;
    r2.x = r11.y + r4.x;
    r5.y = ps;
    ps = r9.z;
    r2 = r2.wxyz * r10.zxyz;
    ps = r6.w + ps;
    r5.w = r5.z + r2.x;
    r5.z = ps;
    r5.w = r7.w * 2.0 + r5.w;
    r6.xyz = r5.wyz * r7.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r5.yzw = (r7.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.xxx >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.w));
    r5.y = dot(r7.zxy, r7.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r5.zzz * r1.xyz;
    r5.y = ps;
    r1.xyz = r7.xyz * r5.yyy;
    r5.y = dot(r1.zxy, r8.zxy);
    ps = 1.0 - r5.x;
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = saturate(ps);
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    ps = log2(r5.x);
    r5.y = saturate(dot(r6.zxy, r5.wyz));
    r5.x = ps;
    ps = log2(r5.y);
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r1.zyx, r6.zyx));
    r6.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r4.yzw * r6.yyx;
    r5.x = ps;
    r5.yzw = r2.yzw * r6.xxy + r5.yzw;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
