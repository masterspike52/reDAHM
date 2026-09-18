// ps_c3aaa21a3f1a95e0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10040400 00000406 00000000 00004084 000F000F 00000001 0000F054 0000F156 0000F257 0000F358
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
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
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = UniformVector_0.xyz + float3(0.1, 1e+01, 0.1);
    r3.x = ps;
    r3.xy = r3.xy * abs(r4.xy);
    r3.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    ps = OpacityOverride.x;
    r2.w = dot(r0.zxy, r0.zxy);
    r3.z = saturate(ps);
    ps = rsqrt(abs(r2.w));
    r4.xy = r3.xy * 0.875;
    r2.w = ps;
    r0.x = r2.w * r0.z + 0.1;
    ps = -ModShadowColor.x;
    r0.x = saturate(r0.x * 5.0);
    ps = 1.0 + ps;
    r0.y = -r0.x + 1.0;
    r0.x = ps;
    ps = -ModShadowColor.y;
    r3.xy = r0.yy * ModShadowGroupColor.xy;
    ps = 1.0 + ps;
    r3.xyz = -r3.xyz + 1.0;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r0.w = float((r3.z >= 0.004));
    r3.xy = r4.xy * r3.xy + 0.125;
    ps = 1.0 + ps;
    r2.w = r3.x * r3.y;
    r0.z = ps;
    r0.xyz = r2.www * r0.xyz + ModShadowColor.xyz;
    ps = -r1.w;
    r0.xyz = r2.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r0.w + r1.w;
    r0.xyz = r2.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
