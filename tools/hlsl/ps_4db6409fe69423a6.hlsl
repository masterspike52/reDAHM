// ps_4db6409fe69423a6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r12.w;
    r5.xz = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = r12.xyz * UniformScalar_12.xxx;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r10.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r17 = tex2D(Texture2D_2, r0.xy);
    r14 = tex2D(Texture2D_1, r0.xy);
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r5.xz).xyz;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = float((UniformScalar_11.x > 1.0));
    r13.xyz = (-abs(r5.zzz) >= 0.0) ? r0.xyz : 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.x = saturate(-r5.x + 1.0);
    r5.y = ps;
    r8.xyz = r5.yyy * r1.xyz;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    r16.xyz = UniformVector_4.xzy * 2e+01;
    r5.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    r5.w = float((UniformScalar_11.x >= 1.0));
    r14.xyz = r14.xzy * r14.www;
    ps = r4.w;
    r0.xyz = r17.xzy * r17.www;
    ps = 0.0001 * ps;
    r6.yzw = r6.xyz * UniformVector_2.xyz;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.xyz = r16.xyz * r0.xyz;
    r5.y = ps;
    r13.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = log2(r5.x);
    r14.xyz = r15.xyz * r14.xyz;
    r5.x = ps;
    r9.xyz = r9.xyz * r13.xyz + UniformScalar_13.xxx;
    r4.xyz = (-abs(r5.zzz) >= 0.0) ? r0.yxz : r14.yxz;
    r0.xyw = (abs(r5.zzz) > 0.0) ? r14.zyx : r0.zyx;
    r12.xyz = r13.xyz * r12.xyz + r0.wxy;
    ps = r6.w;
    r3.xyz = r5.yyy * r3.xyz;
    r5.z = ps;
    ps = 1.0 - r5.z;
    r5.y = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    r0.z = ps;
    ps = 1.0 - r6.x;
    r5.w = dot(r0.ywx, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = r0.z;
    r4.xy = -r6.yz * r5.yy;
    ps = r5.y * ps;
    r0.xyz = r12.xyz * r11.xyz;
    r4.z = ps;
    r6.xyz = r6.yzw + r4.xyz;
    ps = r1.z;
    r6.w = r6.z - 1.0;
    ps = 0.1 + ps;
    r6.xyw = r6.xyw * r5.zzz;
    r5.y = ps;
    ps = r5.w;
    r6.z = r6.w + 1.0;
    r6.xyz = (r5.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = -r0.w + ps;
    r5.z = dot(r6.wyz, r6.wyz);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r6.x = saturate(r5.w + r0.w);
    r5.z = ps;
    ps = 5.0 * r5.y;
    r1.xyz = r6.yzw * r5.zzz;
    r5.z = saturate(ps);
    ps = 1.0 - r5.z;
    r5.y = dot(r1.zxy, r3.zxy);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = r1.xyz * r5.yyy;
    r6.y = ps;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = saturate(dot(r8.zxy, r3.zxy));
    r6.z = ps;
    ps = log2(r5.y);
    r3.xyz = -r6.xyz + 1.0;
    r10.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.xyz = r10.xyz * float3(15.0, 0.875, 0.875);
    r5.y = ps;
    ps = pow(2.0, r4.x);
    r6.xyz = r9.xyz * r3.xxx;
    r5.z = ps;
    r5.xw = r4.yz * r3.yz + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r1.zyx, r8.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
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
