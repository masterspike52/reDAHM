// ps_6859caa02308d184.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r10.w;
    r5.xz = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.yzw = UniformVector_4.xzy * 2e+01;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r16 = tex2D(Texture2D_2, r0.xy);
    r6.xyz = tex2D(Texture2D_3, r5.xz).xyz;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r14.xyz = UniformVector_3.xzy * 2e+01;
    ps = 0.0001 * ps;
    r3.w = float((UniformScalar_8.x >= 1.0));
    r12.x = saturate(ps);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r5.z = float((UniformScalar_8.x > 1.0));
    r0.w = ps;
    ps = r1.z;
    r5.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r4.xyz = r10.xyz * UniformScalar_9.xxx;
    r5.x = ps;
    r11.xyz = (-abs(r5.zzz) >= 0.0) ? r6.xyz : 1.0;
    ps = 5.0 * r5.x;
    r6.xyz = r16.xzy * r16.www;
    r2.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r13.xyz = r13.xzy * r13.www;
    r2.y = ps;
    r5.xyz = r15.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r1.xyz = r2.yyy * r1.xyz;
    r2.y = ps;
    ps = UniformVector_2.y * r5.z;
    r13.xyz = r14.xyz * r13.xyz;
    r2.z = ps;
    ps = UniformVector_2.z * r5.x;
    r6.xyz = r12.yzw * r6.xyz;
    r2.w = ps;
    r11.xyz = (-abs(r3.www) >= 0.0) ? 1.0 : r11.xyz;
    r4.xyz = r4.xyz * r11.xyz + UniformScalar_10.xxx;
    r12.yzw = (abs(r0.www) > 0.0) ? r13.xzy : r6.xzy;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r6.yxz : r13.yxz;
    r13.xyz = (-abs(r6.www) >= 0.0) ? r6.yxz : r5.xyz;
    ps = rsqrt(abs(r1.w));
    r5.xz = -r2.wx + 1.0;
    r5.y = ps;
    r6.xyw = (abs(r6.www) > 0.0) ? r12.zwy : r6.zyx;
    r10.xyz = r11.xyz * r10.xyz + r6.wxy;
    ps = ModShadowGroupColor.x * r5.z;
    r11.xyz = r5.yyy * r3.xyz;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = saturate(dot(r13.zxy, float3(0.59, 0.11, 0.3)));
    r12.z = ps;
    ps = r5.x;
    r6.z = dot(r6.ywx, float3(0.11, 0.3, 0.59));
    ps = r5.y * ps;
    r6.z = r6.z - r6.w;
    r5.z = ps;
    ps = r6.z;
    r5.xy = -r2.yz * r5.yy;
    ps = r6.w + ps;
    r6.xyz = r2.wyz + r5.zxy;
    r12.w = saturate(ps);
    ps = (-1.0) - -r6.x;
    r3 = -r12.wxyz + 1.0;
    r6.w = ps;
    r6.xyw = r6.yzw * r3.yyy;
    ps = 1.0 - r5.w;
    r6.z = r6.w + 1.0;
    r5.y = saturate(ps);
    r5.xzw = (r3.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.yyy >= 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    ps = log2(r5.y);
    r5.x = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r5.x = ps;
    r2.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r2.zxy, r11.zxy);
    r5.xzw = r2.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    r5.x = saturate(dot(r1.zxy, r5.wxz));
    ps = log2(r5.x);
    r0.xyz = r10.xyz * r0.xyz;
    r9.x = ps;
    r5.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r5.z);
    r6.xyz = r4.xyz * r3.xxx;
    r5.z = ps;
    r5.xw = r5.xw * r3.zw + 0.125;
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
