// ps_d3da0a83d8ddda38.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040A00 0000090A 00000000 00008129 007F01FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r6.w;
    r7.z = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r7.xx * ScreenPositionScaleBias.xy;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r7.y = ps;
    r7.yw = r7.yw * abs(r9.xy);
    r8.xy = r8.xy * r6.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r6.z = tex2D(ShadowTexture, r0.xy).x;
    r9.yz = tex2D(ModShadowAccumTexture, r7.yw).xy;
    r7.w = tex2D(Texture2D_1, r2.xy).w;
    r8 = tex2D(Texture2D_2, r1.xy).xwzy;
    r2.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r5.zxy, r5.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r2.xyz * 2.0 - 1.0;
    r2.xyz = r7.www * r8.xwz;
    ps = rsqrt(abs(r7.z));
    r0.xyz = r2.xyz * r0.xyz;
    r7.z = ps;
    ps = 0.1 - -r3.z;
    r2.xyz = r7.zzz * r3.xyz;
    r7.y = ps;
    ps = 5.0 * r7.y;
    r7.z = dot(r10.zxy, r10.zxy);
    r7.y = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r7.w = -r7.y + 1.0;
    r7.y = ps;
    r6.xy = -r7.ww * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r7.z));
    r5.xyz = r7.yyy * r5.xyz;
    r7.y = ps;
    r3.xyz = r10.xyz * r7.yyy;
    r7.y = dot(r3.zxy, r5.zxy);
    ps = 1.0 - r7.x;
    r10.xyz = r3.xzy * r7.yyy;
    r7.y = saturate(ps);
    r7.xzw = r10.xyz * 2.0 - r5.xzy;
    ps = log2(r7.y);
    r7.x = saturate(dot(r2.zxy, r7.zxw));
    r7.y = ps;
    ps = log2(r7.x);
    r7.w = r7.y * LightColorAndFalloffExponent.w;
    r9.x = ps;
    r7.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r6.xy = r7.yz * r6.xy + 0.125;
    ps = pow(2.0, r7.x);
    r7.y = saturate(dot(r3.zxy, r2.zxy));
    r7.x = ps;
    ps = r7.x;
    r0.xyw = r0.xyz * r7.yyy;
    ps = r8.y * ps;
    r8.xw = r6.xz * r6.yz;
    r0.z = ps;
    r7.xyz = r8.xxx * r1.xyz + ModShadowColor.xyz;
    r8.xyz = r0.xyz + r0.zzw;
    ps = pow(2.0, r7.w);
    r0.xyz = r8.www * r4.xyz;
    r7.w = ps;
    r0.xyz = r0.xyz * r7.www;
    r8.xyz = r0.xyz * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xyz * r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
