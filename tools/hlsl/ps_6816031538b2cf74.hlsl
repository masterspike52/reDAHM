// ps_6816031538b2cf74.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5 = tex2D(Texture2D_1, r0.xy);
    ps = -UniformVector_0.x;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.x = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = -UniformVector_0.y;
    r0.y = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r6.xyz = r5.xyz * 0.05;
    r9.y = ps;
    r8.xyz = r8.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r11.xyz = r5.xyz * UniformVector_1.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r0.yyy * r3.xyz;
    r0.x = ps;
    ps = -UniformVector_0.z;
    r0.xyz = r0.xxx * r4.xyz;
    ps = 1.0 + ps;
    r0.w = dot(r8.xyz, r8.xyz);
    r9.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r11.xyz * r9.xyz;
    r3.w = ps;
    r6.xyz = r6.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r6.xyz = r4.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r3.www * r1.xzy;
    r0.w = ps;
    r5.xyz = r8.xyz * r0.www;
    ps = 0.1 - -r1.y;
    r10.x = dot(r0.zxy, r5.xyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = dot(r5.xyz, r3.zxy);
    r0.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.z = -r0.x + 1.0;
    r8.z = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r5.yzx * r0.yyy;
    r8.x = ps;
    r9.xyz = r0.xyw * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r3 = r10.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r8.y = ps;
    ps = r3.y;
    r5.xyz = r5.xxx * ConstantLighting.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r1.z = saturate(dot(r1.yxz, r9.zxy));
    r1.x = ps;
    ps = 0.5 + r3.x;
    r0.xyw = -r8.xyz + 1.0;
    r1.y = ps;
    r0.yz = r3.zw * r0.xy + 0.125;
    ps = log2(r1.z);
    r1.xy = abs(r1.xy) * abs(r1.xy);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r1.w = ps;
    ps = r0.y * r0.z;
    r3.xyz = r4.xzy * r1.xxx;
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r1.xyz = r4.xzy * r1.yyy;
    r1.w = ps;
    r1.xyz = r1.xzy * UpperSkyColor.xyz + r6.xyz;
    r1.xyz = r3.xyz * LowerSkyColor.xzy + r1.xzy;
    r3.xyz = r1.www * ConstantLighting.xzy;
    r1.xyz = r3.xzy * r5.www + r1.xzy;
    r1.xyz = r5.xzy * r4.xzy + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
