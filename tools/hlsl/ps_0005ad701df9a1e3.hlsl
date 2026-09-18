// ps_0005ad701df9a1e3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 15 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 0000003C 10000200 00000004 00000000 00002C63 00070007 00000001 0000F055 00007156 0000F257
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4

struct PS_INPUT
{
    float4 texcoord5 : TEXCOORD5; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord5;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.w;
    r0.xyz = UniformVector_1.xyz + UniformVector_0.xyz;
    r0.xyz = r0.xyz * r2.www + r2.xyz;
    ps = OpacityOverride.x * ps;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
