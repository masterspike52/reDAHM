// ps_b13216b6dd765f77.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000090 18000600 00000008 00000000 000060E7 001F007F 00000011 00003050 00003151 0000F252 0000F353 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 6

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
    float depth : DEPTH;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    // unhandled fetch opcode 18
    r5.x = max(r5.x, r5.y);
    r5.x = r5.x * SlopeScaleDepthBias.x + DepthBias.x;
    r5.x = saturate(r4.z * InvMaxSubjectDepth.x + r5.x);
    // unhandled fetch opcode 18
    oDepth.x = saturate(r5.x);
    r5.x = max(r5.y, r5.z);
    r5.x = r5.x * SlopeScaleDepthBias.x + DepthBias.x;
    oC0 = saturate(r4.zzzz * InvMaxSubjectDepth.xxxx + r5.xxxx);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
