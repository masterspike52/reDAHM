// ps_3f88684bd6c4f0ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 18000300 00000004 00000000 00002863 00070007 00000011 00003050 0000F151 0000F257
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord7 : TEXCOORD7; // r2
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
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    r0.zw = r0.yx - 0.5;
    r3.y = dot(r0.zw, UniformVector_3.yx) + 0.5;
    r3.x = dot(r0.zw, UniformVector_2.yx) + 0.5;
    r0.z = tex2D(Texture2D_1, r0.xy).x;
    r0.w = tex2D(Texture2D_1, r3.xy).x;
    // unhandled fetch opcode 18
    r0.w = r0.w * r1.x;
    r0.z = r0.w * r0.z;
    r0.w = max(r3.x, r3.y);
    r0.w = r0.w * SlopeScaleDepthBias.x + DepthBias.x;
    r0.w = r2.z * InvMaxSubjectDepth.x + r0.w;
    r0.z = min(r0.z, 1.0);
    r0.z = (-0.5) - -r0.z;
    r1.yw = r0.yx - 0.5;
    r1.z = dot(r1.yw, UniformVector_3.yx) + 0.5;
    r1.y = dot(r1.yw, UniformVector_2.yx) + 0.5;
    r0.x = tex2D(Texture2D_1, r0.xy).x;
    r0.y = tex2D(Texture2D_1, r1.yz).x;
    // unhandled fetch opcode 18
    r0.y = r0.y * r1.x;
    r0.y = r0.y * r0.x;
    r0.x = max(r1.y, r1.z);
    r0.x = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.x = r2.z * InvMaxSubjectDepth.x + r0.x;
    r0.y = min(r0.y, 1.0);
    r0.y = r0.y - 0.5;
    r0.x = saturate((r0.y > 0.0) ? r0.x : 1e+02);
    oDepth.x = saturate(r0.x);
    oC0 = saturate((r0.zzzz > 0.0) ? r0.wwww : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
