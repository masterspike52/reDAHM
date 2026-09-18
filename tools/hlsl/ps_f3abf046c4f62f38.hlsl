// ps_f3abf046c4f62f38.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 9 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000024 10000000 00000000 00000000 00000000 00000000 00000001

#include "xenos_common.hlsli"

float4 DrawColor : register(c3); // float4 // default: 1.0, 1.0, 1.0, 1.0

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main()
{
    float4 oC0 = 0.0;

    oC0 = DrawColor;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
