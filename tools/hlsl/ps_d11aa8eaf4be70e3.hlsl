// ps_d11aa8eaf4be70e3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 48 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000C0 18000400 00000008 00000000 000040A5 0007001F 00000011 00003050 00003151 0000F257 0000F3A0 0000F4A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 7

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float
sampler2D Texture2D_5 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
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
    float4 r2 = In.texcoord7;
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    // unhandled fetch opcode 18
    r3.x = tex2D(Texture2D_5, r0.xy).w;
    ps = (-0.5) + r3.x;
    r3.z = max(r3.y, r3.z);
    r3.y = ps;
    r3.x = r3.z * SlopeScaleDepthBias.x + DepthBias.x;
    r3.z = r2.z * InvMaxSubjectDepth.x + r3.x;
    // unhandled fetch opcode 18
    r3.x = tex2D(Texture2D_5, r0.xy).w;
    ps = (-0.5) + r3.x;
    r4.x = max(r4.x, r4.y);
    r3.w = ps;
    r3.x = r4.x * SlopeScaleDepthBias.x + DepthBias.x;
    r3.x = r2.z * InvMaxSubjectDepth.x + r3.x;
    r3.x = saturate((r3.w > 0.0) ? r3.x : 1e+02);
    ps = r3.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r3.yyyy > 0.0) ? r3.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
