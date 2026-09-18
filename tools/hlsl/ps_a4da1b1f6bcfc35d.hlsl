// ps_a4da1b1f6bcfc35d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040E00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_4, r0.xy);
    r6.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r5.xw = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_2.x * UniformScalar_4.x;
    r8.x = ps;
    ps = 1.0 / r4.w;
    r8.yz = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r8.zw = r8.yz * r6.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r10.w - 0.5;
    r8.y = ps;
    ps = UniformVector_4.x * r5.y;
    r8.xy = r8.xy * abs(r7.xy);
    r6.x = ps;
    ps = UniformVector_4.x * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r6.z = ps;
    r6 = r6 + r0.xyxy;
    r7.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r14 = tex2D(Texture2D_1, r6.xy);
    r11 = tex2D(Texture2D_2, r6.zw);
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r12.xyw = tex2D(Texture2D_3, r5.xw).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = UniformVector_3.xyz * 2e+01;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r5.z = dot(r3.zxy, r3.zxy);
    ps = r4.w;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_8.x > 1.0));
    r12.z = saturate(ps);
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r4.xyz = r10.xyz * UniformScalar_9.xxx;
    r5.y = ps;
    r2.xyz = (-abs(r0.www) >= 0.0) ? r12.xyw : 1.0;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r13.xyz = r11.xyz * r11.www;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r1.xyz = r5.www * r1.xyz;
    r5.z = ps;
    ps = 5.0 * r5.y;
    r11.xyz = r5.zzz * r3.xyz;
    r12.x = saturate(ps);
    r5.yzw = r14.xyz * r14.www + r13.xyz;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r2.xyz;
    r4.xyz = r4.xyz * r2.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.x * r6.y;
    r0.xyz = r0.xyz * r5.yzw;
    r5.y = ps;
    r10.xyz = r2.xyz * r10.xyz + r0.xyz;
    ps = UniformVector_2.y * r6.z;
    r5.z = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r5.w = ps;
    ps = UniformVector_2.z * r6.x;
    r6.w = r5.z - r0.x;
    r5.z = ps;
    ps = 1.0 - r5.z;
    r12.y = saturate(r6.w + r0.x);
    r6.x = ps;
    ps = r6.x;
    r0.xy = -r5.yw * r12.yy;
    ps = r12.y * ps;
    r6.xyz = -r12.zxy + 1.0;
    r0.z = ps;
    r3.xy = -r6.yy * ModShadowGroupColor.xy + 1.0;
    r0.xyz = r5.ywz + r0.xyz;
    ps = -UniformVector_0.x;
    r0.w = r0.z - 1.0;
    ps = 1.0 + ps;
    r2.xyw = r0.xyw * r6.xxx;
    r0.x = ps;
    ps = 1.0 - r5.x;
    r2.z = r2.w + 1.0;
    r5.y = saturate(ps);
    r5.xzw = (r6.xxx > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r6.xxx >= 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    ps = log2(r5.y);
    r5.x = dot(r0.wyz, r0.wyz);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r0.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r11.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.xzw = r2.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r1.zxy, r5.wxz));
    r0.z = ps;
    ps = log2(r5.x);
    r0.xyz = r10.xyz * r0.xyz;
    r9.x = ps;
    r5.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r5.z);
    r6.xyz = r4.xyz * r6.zzz;
    r5.z = ps;
    r5.xw = r5.xw * r3.xy + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r2.zyx, r1.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
