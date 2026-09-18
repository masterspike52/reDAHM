// ps_b78f99bc6c54592a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000090 18000200 00000008 00000000 00003063 00010007 00000011 0000F057 0000F1A0 0000F2A1
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 6

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float

struct PS_INPUT
{
    float4 texcoord7 : TEXCOORD7; // r0
    float4 color0 : COLOR0; // r1
    float4 color1 : COLOR1; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
    float depth : DEPTH;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord7;
    float4 r1 = In.color0;
    float4 r2 = In.color1;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    // unhandled fetch opcode 18
    r1.x = max(r1.x, r1.y);
    r1.x = r1.x * SlopeScaleDepthBias.x + DepthBias.x;
    r1.x = saturate(r0.z * InvMaxSubjectDepth.x + r1.x);
    // unhandled fetch opcode 18
    oDepth.x = saturate(r1.x);
    r1.x = max(r1.y, r1.z);
    r1.x = r1.x * SlopeScaleDepthBias.x + DepthBias.x;
    oC0 = saturate(r0.zzzz * InvMaxSubjectDepth.xxxx + r1.xxxx);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
