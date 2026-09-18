// ps_11b8a17b2a0cff1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040700 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r0.w = r0.z + 0.1;
    r2.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r2.ww * ScreenPositionScaleBias.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    r4.xy = r6.zw * abs(r4.xy);
    r3.xy = r6.xy * r3.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = -UniformVector_0.x;
    r2.w = dot(r0.zxy, r0.zxy);
    ps = 1.0 + ps;
    r1.x = dot(r1.zxy, r1.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r2.w));
    r1.x = saturate(-r1.x + 1.0);
    r1.y = ps;
    ps = 5.0 * r0.w;
    r1.z = dot(r2.zxy, r2.zxy);
    r0.w = saturate(ps);
    ps = rsqrt(abs(r1.z));
    r7.xyz = r1.yyy * r0.zxy;
    r1.z = ps;
    ps = 1.0 - r0.w;
    r2.xyz = r1.zzz * r2.zxy;
    r0.w = ps;
    r4.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = -UniformVector_0.y;
    r2.yz = -r2.yz;
    r2.x = r2.x * 2.0 - r2.x;
    ps = 1.0 + ps;
    r0.w = saturate(dot(r7.yzx, r2.yzx));
    r4.w = ps;
    ps = log2(r0.w);
    r2.w = saturate(r1.y * r0.z);
    r6.z = ps;
    ps = log2(r1.x);
    r2.xyz = r6.xyz * float3(0.875, 0.875, 15.0);
    r0.x = ps;
    ps = pow(2.0, r2.z);
    r0.y = r0.x * LightColorAndFalloffExponent.w;
    r0.x = ps;
    r0.zw = r2.xy * r4.xy + 0.125;
    ps = 0.21952 * r0.x;
    r1.z = ps;
    r1.xy = r2.ww * r4.zw + r1.zz;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.w;
    r0.w = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r3.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
