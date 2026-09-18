// ps_169793972384174b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040800 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
sampler2D LightMapTexture : register(s0);
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
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.y = -UniformVector_0.y + 1.0;
    ps = rsqrt(abs(r6.y));
    r0.zw = r0.xy * 0.875;
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.xzw = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = OpacityOverride.x;
    r1.xyz = r0.xxx * r3.xyz;
    r1.w = saturate(ps);
    r3.x = r1.z * 2.0 - r1.z;
    ps = -r1.x;
    r0.x = r5.w + 0.1;
    r3.y = ps;
    ps = -r1.y;
    r0.x = saturate(r0.x * 5.0);
    r3.z = ps;
    ps = 1.0 - r0.x;
    r1.y = dot(r4.zxy, r4.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.y));
    r0.y = saturate(dot(r5.xzw, r3.yzx));
    r0.x = ps;
    ps = log2(r0.y);
    r1.yz = r1.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = (-0.5) * r0.x;
    r6.xyz = -r1.yzw + 1.0;
    r1.y = ps;
    ps = 0.5 * r0.x;
    r3.xy = r0.zw * r6.xy;
    r1.z = ps;
    r3.zw = r1.yz * r4.zz;
    ps = pow(2.0, r1.x);
    r0 = r3.xzwy + float4(0.125, 0.5, 0.5, 0.125);
    r5.x = ps;
    ps = r0.x * r0.w;
    r1.xyz = r8.xzy * LightMapScale.xzy;
    r0.x = ps;
    ps = abs(r0.y) * abs(r0.y);
    r1 = r1.xyzz * r5.xxyx;
    r3.x = ps;
    ps = abs(r0.z) * abs(r0.z);
    r1.xyw = r1.xyw * 0.21952;
    r3.y = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = r1.z;
    r0.w = float((r6.z >= 0.004));
    ps = r1.w + ps;
    r3.xy = r3.xy * r5.yy;
    r1.z = ps;
    r1.z = r3.x * LowerSkyColor.y + r1.z;
    r1.z = r3.y * UpperSkyColor.y + r1.z;
    r1.z = r5.y * AmbientColorAndSkyFactor.y + r1.z;
    r1.xyz = r1.xzy + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
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
