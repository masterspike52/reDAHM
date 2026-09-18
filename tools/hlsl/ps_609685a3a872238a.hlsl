// ps_609685a3a872238a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 15 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000003C 10000100 00000004 00000000 00001C42 00030003 00000021 0000F056 00007157
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4

struct PS_INPUT
{
    float4 texcoord6 : TEXCOORD6; // r0
    float4 texcoord7 : TEXCOORD7; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord6;
    float4 r1 = In.texcoord7;
    float4 oC0 = 0.0;

    r1.x = UniformVector_1.w - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.xxxx)) clip(-1.0);
    oC0.w = r0.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
