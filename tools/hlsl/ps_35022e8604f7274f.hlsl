// ps_35022e8604f7274f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 12 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000030 10000000 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

sampler2D Texture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 oC0 = 0.0;

    r0 = tex2D(Texture, r0.xy);
    oC0 = r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
