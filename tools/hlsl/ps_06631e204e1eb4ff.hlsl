// ps_06631e204e1eb4ff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = 1.0 - r5.w;
    r0.y = dot(r1.zxy, r1.zxy);
    r5.w = saturate(ps);
    ps = 0.875 * r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r2.x = ps;
    ps = 0.875 * r5.y;
    r7.xyz = r11.xyz * UniformScalar_0.xxx;
    r2.y = ps;
    r10.yzw = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r5.x = saturate(r6.w * 5.0);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r6.w = dot(r9.xzy, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    ps = rsqrt(abs(r0.y));
    r0.xzw = r10.wyz * float3(0.7, 1.0, 1.0);
    r5.x = ps;
    ps = log2(r5.w);
    r9.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.xyz = r5.yyy * r3.xyz;
    r0.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.w = dot(r0.xzw, r0.xzw);
    r0.z = ps;
    ps = log2(abs(r6.w));
    r5.y = dot(r3.zxy, r10.wyz);
    r10.x = ps;
    ps = rsqrt(abs(r5.w));
    r1 = r10.xwyz * float4(0.1, 0.7, 1.0, 1.0);
    r5.z = ps;
    ps = r5.y;
    r10.xyz = r1.zwy * r5.zzz;
    r5.z = ps;
    ps = 0.0;
    r6.w = saturate(dot(r10.zxy, r9.zxy));
    r5.w = ps;
    ps = max(r5.z, r5.w);
    r5.y = dot(r10.zxy, r3.zxy);
    r0.x = ps;
    ps = pow(2.0, r1.x);
    r10.xyz = r10.xzy * r5.yyy;
    r0.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0 = -r0.wxyz + float4(1.0, 0.45, 1.0, 1.0);
    r5.w = ps;
    r2.xy = r2.xy * r0.zw + 0.125;
    ps = r0.y;
    r1.xyz = r0.xxx * r11.xyz;
    r5.x = ps;
    r3.xyz = r10.xyz * 2.0 - r3.xzy;
    ps = 4.0 * r5.x;
    r2.w = saturate(dot(r9.zxy, r3.yxz));
    r1.w = saturate(ps);
    ps = r2.w * r2.w;
    r5.xyz = r1.xyz * UniformVector_3.www;
    r2.z = ps;
    r5.xyz = r5.xyz * UniformVector_3.xyz - r1.xyz;
    r1.xyz = r1.www * r5.xyz + r1.xyz;
    ps = r2.x * r2.y;
    r0.yzw = r7.xyz * r0.xxx;
    r5.x = ps;
    ps = r2.z * r2.w;
    r1.xyz = r1.xyz * r4.xyz;
    r0.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r0.xyz = r0.yzw * r0.xxx;
    r5.w = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
