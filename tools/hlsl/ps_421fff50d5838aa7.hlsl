// ps_421fff50d5838aa7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_8, r0.xy);
    ps = -r0.z;
    r5.xw = r0.wz * UniformVector_1.xy;
    ps = 1.0 + ps;
    r21.yzw = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.y = r4.w - 4e+02;
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r19.xz = saturate(r6.xy * float2(5.0, 0.00022222222));
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r8.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.x = r19.z * (-0.025);
    r21.x = ps;
    r3.xy = r8.xy * r6.xx + r5.xw;
    r5.x = -r3.y * r21.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r5.xyz * UniformVector_2.yyx;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r6.z * r3.x;
    r9.w = ps;
    ps = r0.w;
    r3.zw = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r9.xy = r0.wz * UniformVector_7.xy;
    r5.y = ps;
    ps = r11.w;
    r12.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = (-0.5) + r6.x;
    r9.zw = r9.zw * abs(r7.xy);
    r7.x = ps;
    ps = (-0.5) + r6.y;
    r14.zw = float2((r6.xy >= 0.5));
    r7.y = ps;
    ps = (-0.5) + r5.z;
    r7.xy = r7.xy - r6.xy;
    r5.z = ps;
    r10.yw = r7.xy * r14.zw + r6.xy;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.z = ps;
    ps = (-0.5) + r5.y;
    r7.yz = float2((r5.xy >= 0.5));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r12.zw = r5.zw - r5.xy;
    r7.x = ps;
    r6.xy = r12.xy * r7.xx + ScreenPositionScaleBias.wz;
    r10.xz = r12.zw * r7.yz + r5.xy;
    r5 = r10 + r10;
    r13.xyz = tex2D(Texture2D_6, r3.xy).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r18 = tex2D(Texture2D_1, r5.zw);
    r20 = tex2D(Texture2D_1, r5.xy);
    r23.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r5.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r10 = tex2D(Texture2D_5, r0.xy);
    r16 = tex2D(Texture2D_4, r0.xy);
    r12.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r9.xyw = tex2D(Texture2D_2, r3.zw).xyw;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    ps = r4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r6.x = saturate(ps);
    ps = UniformVector_6.x;
    r0.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r6.z = float((UniformScalar_11.x >= 1.0));
    r24.x = ps;
    ps = UniformVector_6.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r6.y = float((UniformScalar_11.x > 1.0));
    r24.y = ps;
    r15.xyz = r3.xyw * 2.0 - 1.0;
    r23.zw = r9.xy * 2.0 - 1.0;
    ps = UniformVector_6.y;
    r4.xyz = r11.xyz * UniformScalar_12.xxx;
    r12.xyz = (-abs(r6.yyy) >= 0.0) ? r12.xyz : 1.0;
    ps = 2e+01 * ps;
    r16.xyz = r16.xzy * r16.www;
    r24.z = ps;
    ps = 1.0 - r5.x;
    r10.xyz = r10.xzy * r10.www;
    r6.w = saturate(ps);
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = UniformVector_4.x * r5.y;
    r10.xyz = r24.xyz * r10.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r22.xyz = r22.xyz * r16.xyz;
    r5.x = ps;
    ps = log2(r6.w);
    r16.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r12.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r12.xyz;
    r9.xyz = r4.xyz * r12.xyz + UniformScalar_13.xxx;
    ps = UniformVector_4.y * r5.z;
    r4 = r23.xzyw * float4(0.875, 0.5, 0.875, 0.5);
    r6.z = ps;
    ps = UniformVector_4.z * r5.w;
    r5.y = dot(r16.zxy, r2.zxy);
    r6.w = ps;
    r16.xyz = (-abs(r0.zzz) >= 0.0) ? r10.yxz : r22.yxz;
    r10.xyz = (abs(r0.zzz) > 0.0) ? r22.xzy : r10.xzy;
    r5.z = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r7.w = saturate(dot(r16.zxy, float3(0.59, 0.11, 0.3)));
    r14.xy = -r6.yz * r7.ww + r6.yz;
    ps = r0.x + r0.x;
    r5.z = r5.z - r10.x;
    r16.z = ps;
    ps = r0.w + r0.w;
    r19.y = saturate(r5.z + r10.x);
    r16.w = ps;
    ps = r9.w;
    r0.xw = -r19.xy + 1.0;
    r5.zw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = r0.y * ps;
    r16.xy = r4.xz * r5.zw;
    r5.z = ps;
    r7.yz = r14.zw * 2.0 + r7.yz;
    ps = (-1.0) - -r5.z;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r7.x = ps;
    r0.y = (r7.y == 0.0) ? r20.x : r20.y;
    r5.w = (r7.z == 0.0) ? r18.x : r18.y;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r19 = r7.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r3.z = ps;
    r5.w = (r19.z == 0.0) ? r18.z : r5.w;
    r7.y = (r19.y == 0.0) ? r20.z : r0.y;
    ps = r6.w;
    r0.y = r16.x * r16.y;
    r5.x = ps;
    r0.xyz = r0.yyy * r21.yzw + ModShadowColor.xyz;
    r14.w = (r19.x == 0.0) ? r20.w : r7.y;
    r5.w = (r19.w == 0.0) ? r18.w : r5.w;
    ps = 1.0 - r5.x;
    r7.y = max(r5.w, 0.0);
    r4.x = ps;
    ps = 1.0 - r6.x;
    r5.x = min(r7.y, 0.3);
    r4.z = ps;
    ps = 3.3333333 * r5.x;
    r7.yz = r16.zw + r4.yw;
    r4.y = ps;
    ps = rsqrt(abs(r1.w));
    r16 = r4.xyyy * r7.wxyz;
    r1.w = ps;
    ps = pow(2.0, r3.z);
    r14.z = r6.w + r16.x;
    r6.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r2.xyz = r17.xyz * r2.www;
    r6.w = saturate(ps);
    ps = 1.0 - r5.w;
    r3.xyz = r1.www * r1.xyz;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r1.xyz = r2.xzy * r6.yyy;
    r6.z = ps;
    ps = r16.y;
    r9.xyz = r9.xyz * r0.www;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r14.xy = r14.xy + r16.zw;
    r6.y = ps;
    r5.xyw = r6.zwy * r6.ywx;
    r6.xyz = -r15.xyz + r14.xyz;
    ps = (-0.5) + r5.x;
    r1.w = float((r5.w > 0.9));
    r0.w = saturate(ps);
    r14.xyz = r6.xyz * r0.www;
    r6.xz = r14.wz + float2(0.25, -2.0);
    r6.z = r3.w * 2.0 + r6.z;
    r5.x = r6.x + r14.w;
    ps = r5.x;
    r6.xy = r15.xy + r14.xy;
    ps = -r5.z + ps;
    r6.xyz = r6.zxy * r4.zzz;
    r5.x = saturate(ps);
    ps = 1.0 + r6.x;
    r2.xyz = r5.xxx * r13.xyz;
    r6.w = ps;
    r10.xyz = r1.www * r10.xyz - r2.xyz;
    r10.xyz = r12.xyz * r11.xyz + r10.xyz;
    r2.xyz = r10.xyz * r0.www + r2.xyz;
    r6.xyz = (r4.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r4.xyz = (r4.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.x));
    r6.yzw = r9.xyz * r0.www;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r9.xyz = r4.xyz * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r8.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r7.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.z = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r2.xy * r5.zz + r6.xy;
    r6.z = r2.z * r5.z + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.yyy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
