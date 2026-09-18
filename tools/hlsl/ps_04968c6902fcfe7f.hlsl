// ps_04968c6902fcfe7f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
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
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = -UniformVector_0.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.x = dot(r1.zxy, r1.zxy);
    r6.y = ps;
    ps = -UniformVector_0.y;
    r5.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r9.xyz = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r7.xyz = r7.xyz * UniformVector_1.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r5.xxx * r4.xyz;
    ps = 1.0 + ps;
    r5.w = dot(r9.xyz, r9.xyz);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r3.xyz = r7.xyz * r6.yzw;
    r6.x = ps;
    r4.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.w));
    r6.xyz = r6.xxx * r1.zxy;
    r5.w = ps;
    r1.xyz = r9.xyz * r5.www;
    ps = 0.1 - -r6.x;
    r11.x = dot(r5.zxy, r1.xyz);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.y = dot(r1.xyz, r0.zxy);
    r5.x = saturate(ps);
    ps = OpacityOverride.x;
    r5.z = -r5.x + 1.0;
    r9.z = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r5.xyw = r1.yzx * r5.yyy;
    r9.x = ps;
    r10.xyz = r5.xyw * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r0 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r9.y = ps;
    ps = r0.y;
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r6.z = saturate(dot(r6.xyz, r10.zxy));
    r6.x = ps;
    ps = 0.5 + r0.x;
    r5.xyw = -r9.xyz + 1.0;
    r6.y = ps;
    r5.yz = r0.zw * r5.xy + 0.125;
    ps = log2(r6.z);
    r6.xy = abs(r6.xy) * abs(r6.xy);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.w = float((r5.w >= 0.004));
    r6.w = ps;
    ps = r5.y * r5.z;
    r0.xyz = r3.xzy * r6.xxx;
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r6.xyz = r3.xzy * r6.yyy;
    r6.w = ps;
    r6.xyz = r6.xzy * UpperSkyColor.xyz + r4.xyz;
    r6.xyz = r0.xyz * LowerSkyColor.xzy + r6.xzy;
    r0.xyz = r6.www * ConstantLighting.xzy;
    r6.xyz = r0.xyz * r7.xzy + r6.xyz;
    r6.xyz = r1.xyz * r3.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
