// ps_db237fe6486ce73b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r10.w;
    r19.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.y = ps;
    r6.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    r14.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r12.xy = r0.wz * 6.0;
    ps = UniformScalar_5.x * ps;
    r15.y = -r0.z + 1.0;
    r14.w = ps;
    ps = r1.z;
    r12.zw = r0.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    ps = r4.w;
    r11.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r8.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.z = UniformVector_4.x * UniformScalar_4.x;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.zw = r6.yw + r6.yw;
    r8.x = ps;
    ps = UniformVector_6.x * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xz = saturate(r8.zy * float2(5.0, 0.00022222222));
    r8.y = ps;
    ps = rsqrt(abs(r5.x));
    r7.xy = r8.xy * abs(r7.xy);
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r6.z = r13.z * (-0.025);
    r5.w = ps;
    r11.xy = r8.xy * r6.zz + r11.xy;
    r7.zw = r11.zw * r5.ww + ScreenPositionScaleBias.wz;
    r15.x = -r11.y * r5.x + 1.0;
    ps = UniformVector_6.x * r5.z;
    r6.yzw = r15.zxy * UniformVector_2.xyy;
    r14.z = ps;
    ps = r6.y;
    r5 = r14 + r0.xyxy;
    ps = r11.x * ps;
    r13.yw = r6.zw - 0.5;
    r9.x = ps;
    ps = r13.y;
    r21.zw = float2((r6.zw >= 0.5));
    ps = -r6.z + ps;
    r3 = r9.xzwy + float4(-0.5, -1.0, -1.0, -0.5);
    r14.z = ps;
    ps = r13.w;
    r21.xy = float2((r9.xy >= 0.5));
    ps = -r6.w + ps;
    r14.xy = r3.xw - r9.xy;
    r14.w = ps;
    r9.xz = r14.xy * r21.xy + r9.xy;
    r9.yw = r14.zw * r21.zw + r6.zw;
    r9 = r9 + r9;
    r15.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r18.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r20 = tex2D(Texture2D_1, r9.zw);
    r22 = tex2D(Texture2D_1, r9.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9 = tex2D(Texture2D_4, r5.xy);
    r17 = tex2D(Texture2D_5, r5.zw);
    r5.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r6.yzw = tex2D(Texture2D_2, r12.xy).xwy;
    r7.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r7.z = dot(r1.zxy, r1.zxy);
    r14.xyz = UniformVector_5.xyz * 2e+01;
    ps = r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_8.x > 1.0));
    r13.y = saturate(ps);
    r12.xyz = r7.xyw * 2.0 - 1.0;
    r16.zw = r6.yw * 2.0 - 1.0;
    r11.xyz = (-abs(r0.www) >= 0.0) ? r0.xyz : 1.0;
    ps = 1.0 - r5.x;
    r6.y = float((UniformScalar_8.x >= 1.0));
    r6.w = saturate(ps);
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = r6.z * r6.x;
    r5.x = ps;
    ps = (-1.0) - -r6.x;
    r0.xzw = r17.xyz * r17.www;
    r0.y = ps;
    r0.xzw = r9.xyz * r9.www + r0.xzw;
    ps = UniformVector_4.x * r5.y;
    r9.xyz = r10.xyz * UniformScalar_9.xxx;
    r6.z = ps;
    ps = log2(r6.w);
    r4.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r11.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r11.xyz;
    r9.xyz = r9.xyz * r11.xyz + UniformScalar_10.xxx;
    ps = UniformVector_4.y * r5.z;
    r5.y = dot(r4.zxy, r2.zxy);
    r6.w = ps;
    ps = UniformVector_4.z * r5.w;
    r4.xyz = r14.xyz * r0.xzw;
    r6.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r4.w = ps;
    ps = 1.0 - r6.y;
    r3.xw = -r13.xy + 1.0;
    r13.x = ps;
    r0.zw = -r3.xx * ModShadowGroupColor.xy + 1.0;
    ps = -SpotAngles.x - -r5.y;
    r5.z = r5.z - r4.x;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r0.x = saturate(r5.z + r4.x);
    r5.w = saturate(ps);
    r14.xy = -r6.zw * r0.xx + r6.zw;
    ps = 1.0 - r0.x;
    r17 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r1.w = ps;
    ps = r3.y;
    r16.xy = r17.xy * r0.zw;
    r0.zw = r21.zw * 2.0 + r21.xy;
    r5.y = (r0.z == 0.0) ? r22.x : r22.y;
    r5.x = (r0.w == 0.0) ? r20.x : r20.y;
    ps = r17.z + ps;
    r21 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.z = ps;
    r5.x = (r21.z == 0.0) ? r20.z : r5.x;
    r5.y = (r21.y == 0.0) ? r22.z : r5.y;
    r16.z = (r21.x == 0.0) ? r22.w : r5.y;
    r5.x = (r21.w == 0.0) ? r20.w : r5.x;
    ps = r3.z;
    r5.y = max(r5.x, 0.0);
    ps = r17.w + ps;
    r17.xyz = r16.xyz + float3(0.125, 0.125, 0.25);
    r0.w = ps;
    ps = 1.0 - r5.x;
    r5.z = min(r5.y, 0.3);
    r5.y = ps;
    ps = 3.3333333 * r5.z;
    r5.x = r17.x * r17.y;
    r13.y = ps;
    r3.xyz = r5.xxx * r19.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r7.z));
    r13 = r13.xyyy * r0;
    r5.x = ps;
    ps = pow(2.0, r4.w);
    r6.w = r6.y + r13.x;
    r6.y = ps;
    ps = 2.5 * r5.y;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = r17.z;
    r0.xyz = r18.xyz * r2.www;
    ps = r16.z + ps;
    r2.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = r5.x;
    r0.xyz = r0.xzy * r6.yyy;
    ps = -r6.x + ps;
    r9.xyz = r9.xyz * r1.www;
    r5.x = saturate(ps);
    ps = r13.y;
    r1.xyz = r5.xxx * r15.xyz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r6.yz = r14.xy + r13.zw;
    r5.x = ps;
    r5.xyz = r5.zwx * r5.xwy;
    r6.xyz = -r12.xyz + r6.yzw;
    ps = (-0.5) + r5.x;
    r6.w = float((r5.z > 0.9));
    r5.w = saturate(ps);
    r6.xy = r6.xy * r5.ww + r12.xy;
    r4.xyz = r4.xyz * r6.www - r1.xyz;
    r5.x = r6.z * r5.w - 2.0;
    r6.z = r7.w * 2.0 + r5.x;
    r4.xyz = r11.xyz * r10.xyz + r4.xyz;
    r1.xyz = r4.xyz * r5.www + r1.xyz;
    r6.xyz = r6.zxy * r3.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r4.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.x));
    r6.yzw = r9.xyz * r5.www;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r9.xyz = r4.xyz * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r2.zxy, r8.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r7.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.w = saturate(dot(r4.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.yyy;
    r5.xyz = r5.xzy * r3.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
