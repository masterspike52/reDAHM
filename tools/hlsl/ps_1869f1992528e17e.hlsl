// ps_1869f1992528e17e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000090 18000100 00000004 00000000 00001021 00010001 00000011 0000F057
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 6

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float

struct PS_INPUT
{
    float4 texcoord7 : TEXCOORD7; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
    float depth : DEPTH;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord7;
    float4 r1 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    // unhandled fetch opcode 18
    r0.x = max(r1.x, r1.y);
    r0.x = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.x = saturate(r0.z * InvMaxSubjectDepth.x + r0.x);
    // unhandled fetch opcode 18
    oDepth.x = saturate(r0.x);
    r0.x = max(r0.y, r0.w);
    r0.x = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    oC0 = saturate(r0.zzzz * InvMaxSubjectDepth.xxxx + r0.xxxx);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
