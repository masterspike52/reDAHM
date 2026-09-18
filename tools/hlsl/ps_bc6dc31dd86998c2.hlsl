// ps_bc6dc31dd86998c2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040F00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r11.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.w = dot(r5.zxy, r5.zxy);
    r15.xyz = r12.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r12.xyz = r9.xyz * r8.xyz;
    r7.y = ps;
    r0.xyz = r10.xyz * float3(0.5, 0.05, 1.0) + UniformVector_0.xyz;
    r10.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    ps = rsqrt(abs(r6.w));
    r13.xyz = r7.yyy * r4.xyz;
    r6.w = ps;
    r0.xyz = r6.www * r5.xyz;
    ps = rsqrt(abs(r7.x));
    r6.w = dot(r15.xyz, r15.xyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.zxy;
    r6.w = ps;
    ps = LightMapScale.x * r6.y;
    r4.xyz = r15.xyz * r6.www;
    r2.x = ps;
    ps = LightMapScale.y * r6.z;
    r14.x = dot(r0.zxy, r4.xyz);
    r2.y = ps;
    ps = LightMapScale.z * r6.x;
    r6.w = dot(r4.xyz, r13.zxy);
    r2.z = ps;
    ps = OpacityOverride.x;
    r6.xyz = r2.xyz * r4.xxx;
    r5.z = saturate(ps);
    ps = 0.1 - -r7.x;
    r0.xyz = r6.xzy * r8.xzy;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r5.xyw = r4.yzx * r6.www;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r4 = r14.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r5.xyw * 2.0 - r13.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r6.y = saturate(dot(r7.xyz, r6.wxy));
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4.xy = r4.xy + 0.5;
    r5.y = ps;
    ps = abs(r4.x) * abs(r4.x);
    r7.xyz = -r5.xyz + 1.0;
    r6.x = ps;
    ps = abs(r4.y) * abs(r4.y);
    r6.w = float((r7.z >= 0.004));
    r6.z = ps;
    r7.xy = r4.zw * r7.xy + 0.125;
    ps = r7.x * r7.y;
    r4.xyz = r12.xzy * r6.xxx;
    r6.x = ps;
    ps = log2(r6.y);
    r7.xyz = r12.xzy * r6.zzz;
    r11.w = ps;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r1 = r11 * float4(0.5, 3.0, 4.0, 3e+01);
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r10.xyz;
    r7.xyz = r4.xyz * LowerSkyColor.xzy + r7.xzy;
    ps = pow(2.0, r1.w);
    r1.xyz = r1.xyz * r8.xyz;
    r7.w = ps;
    r2.xyz = r2.xzy * r7.www;
    r7.xyz = r2.xyz * r1.xzy + r7.xyz;
    r7.xyz = r0.xzy * r9.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
