// ps_3a603fd278ca60ec.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 18000500 00000004 00000000 000040A5 001F001F 00000011 00003050 00003151 0000F252 0000F353 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 5
// NOTE: unhandled fetch opcode 18 at 16

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
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    r0.z = tex2D(Texture2D_0, r0.xy).w;
    r0.w = tex2D(Texture2D_0, r1.xy).w;
    // unhandled fetch opcode 18
    r1.z = 5.0 * r3.w;
    r1.w = -r0.z + r0.w;
    r0.w = max(r5.x, r5.y);
    r0.z = r1.w * r2.x + r0.z;
    r0.w = r0.w * SlopeScaleDepthBias.x + DepthBias.x;
    r0.w = r4.z * InvMaxSubjectDepth.x + r0.w;
    r0.z = r1.z * r0.z;
    r0.z = min(r0.z, 1.0);
    r0.z = (-0.5) - -r0.z;
    r1.y = tex2D(Texture2D_0, r1.xy).w;
    r0.y = tex2D(Texture2D_0, r0.xy).w;
    // unhandled fetch opcode 18
    r1.y = -r0.y + r1.y;
    r0.x = InvMaxSubjectDepth.x * r4.z;
    ps = max(r1.x, r1.z);
    r1.y = r1.y * r2.x;
    r1.x = ps;
    r1.x = r1.x * SlopeScaleDepthBias.x + DepthBias.x;
    ps = 5.0 * r3.w;
    r0.xy = r1.xy + r0.xy;
    r1.x = ps;
    r1.x = r1.x * r0.y;
    r1.x = min(r1.x, 1.0);
    r1.x = r1.x - 0.5;
    r0.x = saturate((r1.x > 0.0) ? r0.x : 1e+02);
    ps = r0.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r0.zzzz > 0.0) ? r0.wwww : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
