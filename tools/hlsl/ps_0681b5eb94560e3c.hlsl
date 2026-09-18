// ps_0681b5eb94560e3c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 48 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000C0 18000400 00000004 00000000 000040A5 001F001F 00000011 00003050 00003151 0000F252 0000F353 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 2
// NOTE: unhandled fetch opcode 18 at 7

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    // unhandled fetch opcode 18
    r0.z = tex2D(Texture2D_0, r0.xy).w;
    ps = (-0.25) + r0.z;
    r0.w = max(r1.x, r1.y);
    r0.z = ps;
    r0.w = r0.w * SlopeScaleDepthBias.x + DepthBias.x;
    r0.w = r4.z * InvMaxSubjectDepth.x + r0.w;
    // unhandled fetch opcode 18
    r0.y = tex2D(Texture2D_0, r0.xy).w;
    ps = (-0.25) + r0.y;
    r0.x = max(r1.x, r1.y);
    r0.y = ps;
    r0.x = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.x = r4.z * InvMaxSubjectDepth.x + r0.x;
    r0.x = saturate((r0.y > 0.0) ? r0.x : 1e+02);
    ps = r0.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r0.zzzz > 0.0) ? r0.wwww : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
