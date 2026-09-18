// ps_b4b9b5b4c75860ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040D00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
sampler2D LightMapTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r12.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r13.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r7.y = dot(r5.zxy, r5.zxy);
    r6.w = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r0.xyz = r13.xyz + UniformVector_0.xyz;
    r12.z = saturate(ps);
    ps = rsqrt(abs(r7.z));
    r11.xyz = r9.xyz * r13.xyz;
    r7.z = ps;
    r10.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    ps = rsqrt(abs(r7.y));
    r4.xyz = r7.zzz * r4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r7.yyy * r5.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.zxy;
    r6.w = ps;
    ps = LightMapScale.x * r6.y;
    r5.xyz = r6.www * r1.zxy;
    r2.x = ps;
    ps = LightMapScale.y * r6.z;
    r12.x = dot(r0.zxy, r5.xyz);
    r2.y = ps;
    ps = LightMapScale.z * r6.x;
    r6.w = dot(r5.xyz, r4.zxy);
    r2.z = ps;
    ps = 0.1 - -r7.x;
    r0.xyz = r2.xyz * r5.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r0.xyz = r0.xyz * r13.xyz;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r5.xyz = r5.yzx * r6.www;
    r6.z = ps;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r5 = r12.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r12.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.yw = r5.xy + 0.5;
    r12.y = ps;
    ps = abs(r6.y) * abs(r6.y);
    r6.x = saturate(dot(r7.xyz, r4.zxy));
    r6.z = ps;
    ps = abs(r6.w) * abs(r6.w);
    r7.xyz = -r12.xyz + 1.0;
    r6.y = ps;
    r4.xyz = r11.xzy * r6.zzz;
    ps = log2(r6.x);
    r6.w = float((r7.z >= 0.004));
    r6.x = ps;
    r5.xy = r5.zw * r7.xy + 0.125;
    ps = 15.0 * r6.x;
    r7.xyz = r11.xzy * r6.yyy;
    r6.y = ps;
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r10.xyz;
    ps = pow(2.0, r6.y);
    r6.x = r5.x * r5.y;
    r7.w = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xzy * r7.www;
    r7.xyz = r4.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r2.xzy * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r9.xzy + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
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
