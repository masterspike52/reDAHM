// ps_831b6e640613e17d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040F00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.w = dot(r5.zxy, r5.zxy);
    ps = LightMapScale.x * r6.y;
    r8.xyz = r1.xzy * UniformVector_1.xzy;
    r10.x = ps;
    r15.xyz = r10.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r11.xyz = r9.xyz * r1.xyz;
    r7.y = ps;
    r12.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r7.yyy * r4.xyz;
    r6.w = ps;
    ps = LightMapScale.y * r6.z;
    r4.xyz = r6.www * r5.xyz;
    r10.y = ps;
    ps = rsqrt(abs(r7.x));
    r6.w = dot(r15.xyz, r15.xyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.zxy;
    r6.w = ps;
    ps = LightMapScale.z * r6.x;
    r2.xyw = r15.xyz * r6.www;
    r10.z = ps;
    r5.xyz = r10.xyz * r2.xxx;
    ps = 0.1 - -r7.x;
    r14.x = dot(r4.zxy, r2.xyw);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.y = dot(r2.xyw, r0.zxy);
    r6.x = saturate(ps);
    ps = OpacityOverride.x;
    r6.z = -r6.x + 1.0;
    r2.z = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r2.ywx * r6.yyy;
    r2.x = ps;
    r4.xyz = r6.xyw * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r14.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r2.y = ps;
    ps = r0.y;
    r1.xyz = r5.xzy * r1.xzy;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r7.x = saturate(dot(r7.xyz, r4.zxy));
    r7.y = ps;
    ps = 0.5 + r0.x;
    r6.xyw = -r2.xyz + 1.0;
    r7.z = ps;
    r6.yz = r0.zw * r6.xy + 0.125;
    ps = log2(r7.x);
    r0.xy = abs(r7.yz) * abs(r7.yz);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    ps = r6.y * r6.z;
    r7.xyz = r11.xzy * r0.yyy;
    r6.x = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r12.xyz;
    ps = pow(2.0, r7.w);
    r2.xyz = r11.xzy * r0.xxx;
    r7.w = ps;
    r0.xyz = r10.xzy * r7.www;
    r7.xyz = r2.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r0.xyz * r8.xyz + r7.xyz;
    r7.xyz = r1.xzy * r9.xyz + r7.xzy;
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
