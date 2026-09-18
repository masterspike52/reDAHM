// ps_808ed6c77cf24c8a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_8, r0.xy);
    ps = r1.z;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r11.w - 0.5;
    r6.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.x = r4.w - 4e+02;
    r12.x = ps;
    ps = 0.00022222222 * r5.x;
    r10.xyz = r6.yyy * r3.xyz;
    r6.y = saturate(ps);
    ps = 5.0 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.z = saturate(ps);
    ps = (-0.025) * r6.y;
    r9.xyz = UniformVector_5.xyz * 2e+01;
    r5.x = ps;
    r8.xy = r10.xy * r5.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r13.y = UniformScalar_2.x * UniformVector_6.y;
    r13.w = UniformVector_6.y * UniformScalar_5.x;
    ps = 1.0 / UniformVector_1.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r12.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = UniformVector_4.x * UniformScalar_4.x;
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.zw = r6.xw * abs(r7.xy);
    r5.w = ps;
    r6.xw = r0.wz * 6.0;
    ps = -r0.z;
    r7.xy = r0.wz * UniformVector_7.xy;
    ps = 1.0 + ps;
    r8.zw = r4.xy * ScreenPositionScaleBias.xy;
    r12.z = ps;
    ps = UniformVector_6.x * r5.y;
    r15.xyz = r3.xyw + r3.xyw;
    r13.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r14.xyz = r5.www * -SpotDirection.xyz;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r5.y = dot(r14.zxy, r2.zxy);
    r1.w = ps;
    r2.zw = r8.zw * r1.ww + ScreenPositionScaleBias.wz;
    r12.y = -r8.y * r5.w + 1.0;
    ps = UniformVector_6.x * r5.z;
    r12.yzw = r12.zyw * UniformVector_2.yyx;
    r13.z = ps;
    ps = r12.w;
    r16 = r13 + r0.xyxy;
    ps = r8.x * ps;
    r13.xyz = r12.zxy - 0.5;
    r15.w = ps;
    r14.z = float((r15.w >= 0.5));
    r18.xyw = float3((r12.xzy >= 0.5));
    r14.xyw = r13.xzy - r12.zyx;
    ps = -SpotAngles.x - -r5.y;
    r13 = r15 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.z = ps;
    r12.yzw = r14.xwy * r18.yxw + r12.zxy;
    ps = SpotAngles.y * r5.z;
    r14.x = r13.w - r15.w;
    r14.y = saturate(ps);
    r2.xy = r14.xy * r14.zy;
    r12.x = r15.w + r2.x;
    r12 = r12.zwxy + r12.zwxy;
    r3.xyz = tex2D(LightAttenuationTexture, r2.zw).xyz;
    r15.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r17.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r8 = tex2D(Texture2D_1, r12.xy);
    r19 = tex2D(Texture2D_1, r12.zw);
    r12 = tex2D(Texture2D_4, r16.xy);
    r20 = tex2D(Texture2D_5, r16.zw);
    r7.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r5.yzw = tex2D(Texture2D_3, r0.xy).xzy;
    r2.xzw = tex2D(Texture2D_2, r6.xw).xyw;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r4.w;
    r6.x = float((UniformScalar_8.x >= 1.0));
    ps = 0.0001 * ps;
    r16.zw = r0.xy + r0.xy;
    r18.z = saturate(ps);
    r17.zw = r2.xz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r6.w = float((UniformScalar_8.x > 1.0));
    r5.x = saturate(ps);
    ps = r2.w;
    r4.xyz = r11.xyz * UniformScalar_9.xxx;
    r7.xyz = (-abs(r6.www) >= 0.0) ? r7.xyz : 1.0;
    ps = r0.w * ps;
    r0.xyz = r20.xyz * r20.www;
    r1.w = ps;
    r0.xzw = r12.xyz * r12.www + r0.xyz;
    r12.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r7.xyz;
    ps = log2(r5.x);
    r0.y = r1.w - 1.0;
    r5.x = ps;
    r7.xyz = r4.xyz * r12.xyz + UniformScalar_10.xxx;
    ps = r5.y + r5.y;
    r9.xyz = r9.xyz * r0.xzw;
    r4.x = ps;
    ps = r5.w + r5.w;
    r6.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r4.y = ps;
    ps = r5.z + r5.z;
    r5.y = r6.x - r9.x;
    r4.z = ps;
    ps = r5.y;
    r6.w = dot(r18.xww, float3(1.0, 1.0, 1.0));
    r6.x = r18.y * 2.0 + r14.z;
    r5.z = (r6.x == 0.0) ? r19.x : r19.y;
    r5.y = (r6.w == 0.0) ? r8.x : r8.y;
    ps = r9.x + ps;
    r14 = r6.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.x = saturate(ps);
    r5.y = (r14.z == 0.0) ? r8.z : r5.y;
    r5.z = (r14.y == 0.0) ? r19.z : r5.z;
    r4.w = (r14.x == 0.0) ? r19.w : r5.z;
    r6.x = (r14.w == 0.0) ? r8.w : r5.y;
    ps = 1.0 - r0.x;
    r6.w = max(r6.x, 0.0);
    r0.z = ps;
    ps = 1.0 - r6.x;
    r8 = r4 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.x = ps;
    ps = r8.w;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = r4.w + ps;
    r5.yzw = r8.xzy * UniformVector_4.xzy;
    r4.x = ps;
    r2.zw = -r5.yw * r0.xx + r5.yw;
    ps = rsqrt(abs(r0.w));
    r4.w = saturate(r4.x - r1.w);
    r5.y = ps;
    ps = 1.0 - r6.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = r6.w;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = 0.3;
    r4.xyz = r5.yyy * r1.xyz;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r18.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyz = r7.xyz * r0.zzz;
    r18.y = ps;
    ps = min(r6.y, r6.w);
    r1.xyw = -r18.xyz + 1.0;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r16.xy = r17.xy * r1.xy;
    r6.w = ps;
    ps = 1.0 - r5.z;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r6.y = ps;
    ps = r16.x * r16.y;
    r0.zw = r16.zw + r17.zw;
    r1.z = ps;
    r1.xyz = r1.zzz * r14.xyz + ModShadowColor.xyz;
    ps = 2.5 * r6.x;
    r14 = r6.wwyw * r0.zwxy;
    r6.w = ps;
    ps = r5.z;
    r0.xyz = r4.www * r15.xyz;
    ps = r14.z + ps;
    r6.y = r14.w + 1.0;
    r14.z = ps;
    ps = r6.y * r6.x;
    r14.xy = r2.zw + r14.xy;
    r5.z = ps;
    ps = r6.w * r6.y;
    r2.xzw = -r13.xyz + r14.xyz;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.w = float((r5.z > 0.9));
    r5.z = saturate(ps);
    r6.xy = r2.xz * r5.zz + r13.xy;
    r9.xyz = r9.xyz * r5.www - r0.xyz;
    r5.y = r2.w * r5.z - 2.0;
    r6.z = r3.w * 2.0 + r5.y;
    r9.xyz = r12.xyz * r11.xyz + r9.xyz;
    r9.xyz = r9.xyz * r5.zzz + r0.xyz;
    r6.xyz = r6.zxy * r1.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r0.xyz = r7.xyz * r5.zzz;
    r5.y = ps;
    r7.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r7.zxy, r10.zxy);
    r5.yzw = r7.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r10.xyz;
    r5.y = saturate(dot(r4.zxy, r5.wyz));
    ps = log2(r5.y);
    r6.yzw = r9.xyz * r8.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r7.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.yyy;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
