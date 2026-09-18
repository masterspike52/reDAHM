// ps_d1a49967c3ac3bca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 48 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000C0 18000200 00000004 00000000 00001842 00030003 00000011 00003050 0000F157
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 7

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float
sampler2D Texture2D_1 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord7 : TEXCOORD7; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
    float depth : DEPTH;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord7;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    // unhandled fetch opcode 18
    r0.z = tex2D(Texture2D_1, r0.xy).w;
    r2.x = max(r2.x, r2.y);
    r0.w = (-0.5) + r0.z;
    r0.z = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.z = r1.z * InvMaxSubjectDepth.x + r0.z;
    // unhandled fetch opcode 18
    r0.x = tex2D(Texture2D_1, r0.xy).w;
    r1.x = max(r1.x, r1.y);
    r0.y = (-0.5) + r0.x;
    r0.x = r1.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.x = r1.z * InvMaxSubjectDepth.x + r0.x;
    r0.x = saturate((r0.y > 0.0) ? r0.x : 1e+02);
    oDepth.x = saturate(r0.x);
    oC0 = saturate((r0.wwww > 0.0) ? r0.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
