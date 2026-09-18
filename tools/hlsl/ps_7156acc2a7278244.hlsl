// ps_7156acc2a7278244.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 15 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000003C 10000300 00000008 00000000 00003C84 0003000F 00000021 0000F056 00007157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4

struct PS_INPUT
{
    float4 texcoord6 : TEXCOORD6; // r0
    float4 texcoord7 : TEXCOORD7; // r1
    float4 color0 : COLOR0; // r2
    float4 color2 : COLOR2; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord6;
    float4 r1 = In.texcoord7;
    float4 r2 = In.color0;
    float4 r3 = In.color2;
    float4 oC0 = 0.0;

    r2.x = UniformVector_1.w - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.xxxx)) clip(-1.0);
    oC0.w = r0.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
