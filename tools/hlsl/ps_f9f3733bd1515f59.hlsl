// ps_f9f3733bd1515f59.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10040600 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r3.w = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r3.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r0.x = dot(r4.zxy, r4.zxy);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r0.yzw = r5.xyw * AmbientColorAndSkyFactor.xyz;
    r3.x = ps;
    ps = rsqrt(abs(r3.w));
    r5.xyw = r6.xyz * r5.xyw;
    r0.x = ps;
    r0.yzw = r0.yzw * r6.xyz + UniformVector_0.xyz;
    r6.xyz = r5.xwy * ConstantLighting.xzy + r0.ywz;
    ps = r0.x;
    r3 = r3.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    ps = r1.z * ps;
    r0.yz = r3.xy * r4.zz;
    r0.x = ps;
    ps = -ModShadowColor.x;
    r0.xyz = r0.xyz + float3(0.1, 0.5, 0.5);
    ps = 1.0 + ps;
    r1.xw = abs(r0.yz) * abs(r0.yz);
    r3.x = ps;
    ps = 5.0 * r0.x;
    r1.xyz = r5.xwy * r1.xxx;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.yzw = r5.xwy * r1.www;
    r0.x = ps;
    ps = -ModShadowColor.y;
    r5.xy = r0.xx * ModShadowGroupColor.xy;
    r0.xyz = r0.ywz * LowerSkyColor.xyz + r6.xzy;
    r1.xyz = r1.xyz * UpperSkyColor.xzy + r0.xzy;
    ps = 1.0 + ps;
    r0.xyw = -r5.xyz + 1.0;
    r3.y = ps;
    ps = -ModShadowColor.z;
    r0.w = float((r0.w >= 0.004));
    r0.xy = r3.zw * r0.xy + 0.125;
    ps = 1.0 + ps;
    r0.x = r0.x * r0.y;
    r3.z = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
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
