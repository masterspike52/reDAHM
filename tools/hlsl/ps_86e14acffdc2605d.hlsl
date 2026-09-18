// ps_86e14acffdc2605d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 18 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000048 10000400 00000008 00000000 00004CA5 0007001F 00000001 0000F055 00007156 0000F257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4

struct PS_INPUT
{
    float4 texcoord5 : TEXCOORD5; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r2.w;
    r3.x = float((UniformScalar_7.x >= UniformScalar_0.x));
    r3.xyz = (r3.xxx > 0.0) ? UniformVector_1.xyz : UniformVector_2.xyz;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r3.xyz = r3.xyz + UniformVector_0.xyz;
    r3.w = ps;
    ps = OpacityOverride.x;
    oC0.xyz = r3.www * r3.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
