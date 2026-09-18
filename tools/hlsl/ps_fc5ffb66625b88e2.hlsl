// ps_fc5ffb66625b88e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10040600 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r4.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = UniformVector_0.xyz + float3(0.1, 2.0, 0.1);
    r4.x = ps;
    r4.xy = r4.xy * abs(r6.xy);
    r4.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = OpacityOverride.x;
    r4.x = dot(r0.zxy, r0.zxy);
    r4.w = saturate(ps);
    ps = rsqrt(abs(r4.x));
    r2.xy = r4.yz * 0.875;
    r4.x = ps;
    r4.x = r4.x * r0.z + 0.1;
    ps = -ModShadowColor.x;
    r4.x = saturate(r4.x * 5.0);
    ps = 1.0 + ps;
    r4.y = -r4.x + 1.0;
    r4.x = ps;
    ps = -ModShadowColor.y;
    r4.yz = r4.yy * ModShadowGroupColor.xy;
    ps = 1.0 + ps;
    r0.xyz = -r4.yzw + 1.0;
    r4.y = ps;
    ps = -ModShadowColor.z;
    r4.w = float((r0.z >= 0.004));
    r0.xy = r2.xy * r0.xy + 0.125;
    ps = 1.0 + ps;
    r5.w = r0.x * r0.y;
    r4.z = ps;
    r4.xyz = r5.www * r4.xyz + ModShadowColor.xyz;
    ps = -r1.w;
    r4.xyz = r5.xyz * r4.xyz;
    ps = OpacityOverride.x + ps;
    r5.xyz = r4.xyz - r4.xyz;
    r5.w = ps;
    oC0.w = r5.w * r4.w + r1.w;
    r4.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
