// ps_48558af156c020ac.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 12 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000030 10000000 00000000 00000000 00000000 00000000 00000001

#include "xenos_common.hlsli"

float4 NormalizedComplexity : register(c3); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main()
{
    float4 r0 = 0.0;
    float4 oC0 = 0.0;

    r0.x = NormalizedComplexity.x + NormalizedComplexity.x;
    oC0.xyz = r0.xxx * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
