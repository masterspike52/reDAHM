// ps_00af92a8b3bc9433.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 18000300 00000008 00000000 00004084 0003000F 00000011 0000F050 0000F157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 9
// NOTE: unhandled fetch opcode 18 at 21

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformVector_2 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
sampler2D Texture2D_1 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord7 : TEXCOORD7; // r1
    float4 color0 : COLOR0; // r2
    float4 color2 : COLOR2; // r3
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
    float4 r2 = In.color0;
    float4 r3 = In.color2;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    r2.yz = r0.yx - 0.5;
    r3.y = dot(r2.yz, UniformVector_3.yx) + 0.5;
    r3.x = dot(r2.yz, UniformVector_2.yx) + 0.5;
    r2.y = tex2D(Texture2D_1, r0.xy).x;
    r2.z = tex2D(Texture2D_1, r3.xy).x;
    // unhandled fetch opcode 18
    r2.z = r2.z * r2.x;
    r2.y = r2.z * r2.y;
    r2.z = max(r3.x, r3.y);
    r2.z = r2.z * SlopeScaleDepthBias.x + DepthBias.x;
    r2.z = r1.z * InvMaxSubjectDepth.x + r2.z;
    r2.y = min(r2.y, 1.0);
    r2.y = (-0.5) - -r2.y;
    r3.xz = r0.yx - 0.5;
    r3.y = dot(r3.xz, UniformVector_3.yx) + 0.5;
    r3.x = dot(r3.xz, UniformVector_2.yx) + 0.5;
    r2.w = tex2D(Texture2D_1, r0.xy).x;
    r3.z = tex2D(Texture2D_1, r3.xy).x;
    // unhandled fetch opcode 18
    r2.x = r3.z * r2.x;
    r2.w = r2.x * r2.w;
    r2.x = max(r3.x, r3.y);
    r2.x = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.x = r1.z * InvMaxSubjectDepth.x + r2.x;
    r2.w = min(r2.w, 1.0);
    r2.w = r2.w - 0.5;
    r2.x = saturate((r2.w > 0.0) ? r2.x : 1e+02);
    oDepth.x = saturate(r2.x);
    oC0 = saturate((r2.yyyy > 0.0) ? r2.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
