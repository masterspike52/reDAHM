// ps_855b09552d6b0b34.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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

    r11.y = UniformScalar_2.x * UniformVector_5.y;
    r12.y = UniformVector_5.y * UniformScalar_5.x;
    ps = UniformScalar_13.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = UniformScalar_1.x * UniformVector_3.x;
    r5.w = ps;
    ps = r1.z;
    r3.w = UniformVector_3.x * UniformScalar_4.x;
    ps = 0.1 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r12.x = r3.w * UniformVector_5.x;
    r1.w = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r21.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r1.www * r3.xyz;
    r21.x = saturate(ps);
    ps = 1.0 - r0.z;
    r5.x = r5.w * r21.w;
    r10.z = ps;
    ps = UniformVector_5.x * r5.z;
    r11.zw = r8.xy * r5.xx;
    r11.x = ps;
    ps = UniformVector_1.x * r0.w;
    r15 = r11.zxyw + r0.wxyz;
    r10.y = ps;
    ps = r15.x;
    r10.x = -r15.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r10.zw = r10.xz * UniformVector_1.yy;
    r10.x = ps;
    ps = r12.x;
    r11 = r10.xzwy - 0.5;
    ps = r0.x + ps;
    r3 = float4((r10.zwxy >= 0.5));
    r5.x = ps;
    ps = r12.y;
    r11 = r11 - r10.xzwy;
    r10 = r11 * r3.zxyw + r10.xzwy;
    ps = r0.y + ps;
    r12 = r10.xywz + r10.xywz;
    r5.y = ps;
    r24 = tex2D(Texture2D_4, r9.xy);
    r17 = tex2D(Texture2D_3, r12.zw);
    r11 = tex2D(Texture2D_6, r15.yz);
    r5 = tex2D(Texture2D_7, r5.xy);
    r10 = tex2D(Texture2D_9, r0.xy);
    r13.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r9.xzw = UniformVector_4.xyz * 2e+01;
    ps = r4.w;
    r9.y = float((UniformScalar_8.x >= 1.0));
    r14.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = 0.0001 * ps;
    r5.xyz = r5.xyz * r5.www;
    r21.y = saturate(ps);
    r5.xyz = r11.xyz * r11.www + r5.xyz;
    ps = r6.w;
    r11.xyz = r9.xzw * r5.xyz;
    ps = 15.0 * ps;
    r5.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r21.z = saturate(ps);
    r5.yzw = -r21.zxy + 1.0;
    ps = -r6.w;
    r5.x = r5.x - r11.x;
    ps = UniformScalar_9.x + ps;
    r18.w = saturate(r5.x + r11.x);
    r14.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r9.x = -r18.w + 1.0;
    r16.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9 = r14 * r9.xxxy;
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r9.w + r6.w;
    r14.y = ps;
    ps = -r5.x;
    r14.zw = r14.xy * abs(r7.xy);
    ps = r6.z + ps;
    r14.x = dot(r3.zxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r14.y = dot(r3.wyy, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r5.x = (r14.y == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_10.x;
    r7 = r14.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r3.w = ps;
    r5.x = (r7.x == 0.0) ? r17.z : r5.x;
    r3.z = (r7.y == 0.0) ? r17.w : r5.x;
    ps = max(r3.x, r3.w);
    r3.y = max(r3.z, 0.0);
    r3.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r3.xy = min(r3.xy, float2(1.0, 0.3));
    r5.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r16.z = saturate(r3.x * r5.x);
    r16.y = ps;
    r19.xyz = -r16.xyz + 1.0;
    r13.x = r19.z * r6.w;
    r5.xz = r13.xw * r24.zw;
    r3.w = float((r5.x >= 0.05));
    ps = r13.y + r13.y;
    r3.xw = -r3.zw + 1.0;
    r6.x = ps;
    r5.x = (UniformScalar_9.x > 0.0) ? r3.w : 1.0;
    r5.x = (UniformScalar_9.x >= 0.0) ? r5.x : r3.w;
    ps = r13.z + r13.z;
    r6.z = r5.x * r10.w;
    r6.y = ps;
    r13.xyz = r6.xyz + float3(-1.0, -1.0, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r13.zzzz)) clip(-1.0);
    r6.yz = tex2D(ModShadowAccumTexture, r14.zw).xy;
    ps = r0.w + r0.w;
    r20.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    ps = r0.z + r0.z;
    r20.xy = r6.yz * 0.875;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r14.zw = r15.xw + r15.xw;
    r19.w = ps;
    r4.xy = r20.zw * r19.ww + ScreenPositionScaleBias.wz;
    r16.xyz = tex2D(Texture2D_8, r14.zw).xyz;
    r15 = tex2D(Texture2D_2, r6.xy);
    r22.xyz = tex2D(Texture2D_1, r6.xy).xyz;
    r23 = tex2D(Texture2D_3, r12.xy);
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r12.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r14.zw).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = dot(r1.zxy, r1.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r17.xyz = r0.xyw * 2.0 - 1.0;
    r14.zw = r24.xy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r12.xyz = r12.xyz * r2.www;
    r5.x = saturate(ps);
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = log2(r5.x);
    r6.xyz = r6.zxy * UniformVector_3.zxy;
    r5.x = ps;
    r7.xy = -r6.yz * r18.ww + r6.yz;
    r6.w = (r14.x == 0.0) ? r23.x : r23.y;
    r6.w = (r7.w == 0.0) ? r23.z : r6.w;
    r14.x = (r7.z == 0.0) ? r23.w : r6.w;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r14.y = r3.y * 3.3333333;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r0.xy = -r14.xy + 1.0;
    r18.x = ps;
    ps = r21.z;
    r2.xyz = r22.xyz + r22.xyz;
    r1.w = dot(r21.zz, r0.xx) + r14.x;
    ps = r0.y * ps;
    r2.w = r1.w + r14.x;
    r13.z = ps;
    r18.yz = r20.xy * r19.xy + 0.125;
    ps = (-1.0) - -r5.z;
    r3.yz = r18.xy * r18.wz;
    r13.w = ps;
    ps = rsqrt(abs(r0.z));
    r2 = r2 + float4(-1.0, -1.0, -1.0, 0.25);
    r1.w = ps;
    r0.xyz = r3.zzz * r4.xyz + ModShadowColor.xyz;
    ps = r2.w;
    r4.xyz = r1.www * r1.xyz;
    ps = -r5.z + ps;
    r1.xyz = r2.xyz - r17.xyz;
    r5.x = saturate(ps);
    r2.w = r1.z * r15.w - 2.0;
    r2.xyz = r1.xyz * r15.www + r17.xyz;
    ps = r6.x;
    r1.xyz = r5.xxx * r16.xyz;
    ps = r3.y + ps;
    r6.xyz = -r1.xyz + r15.xyz;
    r7.z = ps;
    r1.xyz = r6.xyz * r15.www + r1.xyz;
    ps = 2.5 * r3.x;
    r13.xy = r13.xy * 0.5;
    r3.z = ps;
    ps = pow(2.0, r6.w);
    r13.xyz = r14.zyw + r13.xzy;
    r5.x = ps;
    r7.xy = r13.xy * r13.yz + r7.xy;
    r3.y = r13.w * r13.y + 1.0;
    ps = r3.y * r3.x;
    r6.xyz = r12.xzy * r5.xxx;
    r12.x = ps;
    ps = r3.z * r3.y;
    r7.xyz = -r2.xyz + r7.xyz;
    r12.y = ps;
    r5.xy = r12.yx * r5.yy;
    ps = (-0.5) + r5.x;
    r1.w = float((r5.y >= 0.9));
    r6.w = saturate(ps);
    r3.xyz = r11.xyz * r1.www + r10.xyz;
    r2.xyz = r7.xyz * r6.www + r2.xyw;
    r2.w = r0.w * 2.0 + r2.z;
    r3.xyz = r3.xyz - r1.xyz;
    r1.xyz = r3.xyz * r6.www + r1.xyz;
    r2.xyw = r2.xyw * r5.www;
    ps = -UniformVector_0.x;
    r2.z = r2.w + 1.0;
    r2.xyz = (r5.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r5.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r2.xyz = r9.xyz * r6.www;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r3.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r3.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r7.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
