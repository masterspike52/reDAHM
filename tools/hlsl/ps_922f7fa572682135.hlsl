// ps_922f7fa572682135.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r1.xy);
    ps = UniformVector_2.x * r1.w;
    r6.x = r10.w - 0.5;
    r7.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    ps = UniformScalar_2.x;
    r15.w = UniformVector_6.y * UniformScalar_5.x;
    ps = UniformVector_6.y * ps;
    r13.y = -r1.z + 1.0;
    r15.y = ps;
    ps = r5.w;
    r12.xy = r1.wz * 6.0;
    ps = (-4e+02) + ps;
    r6.y = r2.z + 0.1;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformScalar_1.x * UniformVector_4.x;
    r12.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r12.w = ps;
    ps = 1.0 / r5.w;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r11.zw = r7.zw * r6.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.x));
    r6.w = UniformVector_4.x * UniformScalar_4.x;
    r7.x = ps;
    ps = UniformVector_6.x * r6.z;
    r11.xy = r1.wz * UniformVector_7.xy;
    r15.x = ps;
    ps = 0.00022222222 * r6.x;
    r0.yz = r1.wz * UniformVector_1.xy;
    r7.w = saturate(ps);
    ps = 5.0 * r6.y;
    r9.xyz = r7.xxx * r4.xyz;
    r7.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.x = r7.w * (-0.025);
    r0.w = ps;
    r0.yz = r9.xy * r6.xx + r0.yz;
    ps = UniformVector_6.x * r6.w;
    r4.xw = r0.zx * r0.wx;
    r15.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r13.x = -r4.x + 1.0;
    r13.z = ps;
    ps = r12.z;
    r13.xyw = r13.zxy * UniformVector_2.xyy;
    ps = abs(r8.x) * ps;
    r14.xy = r13.yw - 0.5;
    r4.y = ps;
    ps = r13.x;
    r6 = r15 + r1.xyxy;
    ps = r0.y * ps;
    r20.zw = float2((r13.yw >= 0.5));
    r7.x = ps;
    ps = (-0.5) + r7.x;
    r14.zw = r14.xy - r13.yw;
    r14.x = ps;
    ps = (-0.5) + r7.y;
    r20.xy = float2((r7.xy >= 0.5));
    r14.y = ps;
    ps = r12.w;
    r14.xy = r14.xy - r7.xy;
    r13.xz = r14.xy * r20.xy + r7.xy;
    r13.yw = r14.zw * r20.zw + r13.yw;
    ps = abs(r8.y) * ps;
    r13 = r13 + r13;
    r4.z = ps;
    r16.xyz = tex2D(Texture2D_6, r0.yz).xyz;
    r8.yzw = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r17.xy = tex2D(ModShadowAccumTexture, r4.yz).xy;
    r15 = tex2D(Texture2D_1, r13.zw);
    r19 = tex2D(Texture2D_1, r13.xy);
    r18 = tex2D(Texture2D_4, r6.xy);
    r21 = tex2D(Texture2D_5, r6.zw);
    r14.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r11.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r4.xyz = tex2D(Texture2D_2, r12.xy).xyw;
    r1.xyw = tex2D(Texture2D_2, r1.wz).xwy;
    r0.xyw = tex2D(Texture2D_0, r0.yz).xyz;
    r6.y = dot(r2.zxy, r2.zxy);
    r12.xyz = UniformVector_5.xyz * 2e+01;
    r6.z = float((UniformScalar_8.x >= 1.0));
    r6.x = dot(r3.zxy, r3.zxy);
    r6.w = float((UniformScalar_8.x > 1.0));
    r13.xyz = r0.xyw * 2.0 - 1.0;
    r17.zw = r4.xy * 2.0 - 1.0;
    r11.xyz = (-abs(r6.www) >= 0.0) ? r11.xyz : 1.0;
    ps = 1.0 - r6.x;
    r14.yzw = r14.xyz + r14.xyz;
    r6.x = saturate(ps);
    ps = r4.z;
    r5.xyz = r10.xyz * UniformScalar_9.xxx;
    ps = r1.y * ps;
    r3.xyz = r21.xyz * r21.www;
    r1.z = ps;
    r3.xyz = r18.xyz * r18.www + r3.xyz;
    ps = log2(r6.x);
    r1.y = r1.z - 1.0;
    r6.x = ps;
    r11.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r11.xyz;
    r5.xyz = r5.xyz * r11.xyz + UniformScalar_10.xxx;
    ps = 0.0001 * r5.w;
    r12.xyz = r12.xyz * r3.xyz;
    r8.x = saturate(ps);
    ps = r1.x + r1.x;
    r6.z = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r18.z = ps;
    ps = r1.w + r1.w;
    r6.z = r6.z - r12.x;
    r18.w = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.x = saturate(r6.z + r12.x);
    r6.w = ps;
    r7.xy = r20.zw * 2.0 + r20.xy;
    r6.z = (r7.x == 0.0) ? r19.x : r19.y;
    r6.x = (r7.y == 0.0) ? r15.x : r15.y;
    ps = 1.0 - r1.x;
    r3 = r7.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r7.y = ps;
    r6.x = (r3.z == 0.0) ? r15.z : r6.x;
    r6.z = (r3.y == 0.0) ? r19.z : r6.z;
    r14.x = (r3.x == 0.0) ? r19.w : r6.z;
    r7.x = (r3.w == 0.0) ? r15.w : r6.x;
    ps = r7.x;
    r3 = r14 + float4(0.25, -1.0, -1.0, -1.0);
    r6.x = ps;
    ps = 0.0;
    r1.w = r3.x + r14.x;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r3.wyz * UniformVector_4.zxy;
    r6.y = ps;
    r15.xy = -r0.yz * r1.xx + r0.yz;
    ps = pow(2.0, r6.w);
    r2.w = saturate(r1.w - r1.z);
    r1.z = ps;
    ps = max(r6.x, r6.z);
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r7.z;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = 1.0 - r7.x;
    r3.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = r6.x;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r6.x = ps;
    ps = 0.3;
    r7.xzw = r4.www * r8.yzw;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r7.xwz * r1.zzz;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.xyz = r5.xyz * r7.yyy;
    r8.z = ps;
    ps = min(r6.x, r6.w);
    r8.xyz = -r8.xyz + 1.0;
    r6.x = ps;
    ps = 3.3333333 * r6.x;
    r18.xy = r17.xy * r8.yz;
    r6.w = ps;
    ps = 1.0 - r0.x;
    r7 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r6.x = ps;
    ps = r7.x * r7.y;
    r1.zw = r7.zw + r17.zw;
    r7.x = ps;
    r7.xyz = r7.xxx * r14.xyz + ModShadowColor.xyz;
    ps = 2.5 * r6.y;
    r14 = r6.wwxw * r1.zwxy;
    r6.w = ps;
    ps = r0.x;
    r1.xyz = r2.www * r16.xyz;
    ps = r14.z + ps;
    r6.x = r14.w + 1.0;
    r14.z = ps;
    ps = r6.x * r6.y;
    r14.xy = r15.xy + r14.xy;
    r6.y = ps;
    ps = r6.w * r6.x;
    r8.yzw = -r13.xyz + r14.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y > 0.9));
    r7.w = saturate(ps);
    r6.xy = r8.yz * r7.ww + r13.xy;
    r0.xyz = r12.xyz * r6.zzz - r1.xyz;
    r6.z = r8.w * r7.w - 2.0;
    r6.z = r0.w * 2.0 + r6.z;
    r0.xyz = r11.xyz * r10.xyz + r0.xyz;
    r0.xyz = r0.xyz * r7.www + r1.xyz;
    r6.xyz = r6.zxy * r8.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r8.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r8.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.xyz = r5.xyz * r7.www;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r4.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r2.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
