// ps_5074e2aac4c6dbcd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 9 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000024 10000000 00000000 00000000 00000000 00000000 00000001

#include "xenos_common.hlsli"

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main()
{
    float4 r0 = 0.0;
    float4 oC0 = 0.0;

    oC0.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    oC0.yzw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
