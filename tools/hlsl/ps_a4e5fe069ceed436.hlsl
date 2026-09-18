// ps_a4e5fe069ceed436.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000144 18000300 00000004 00000000 00001842 00030003 00000011 00003050 0000F157
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 5
// NOTE: unhandled fetch opcode 18 at 15

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

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
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    r0.z = tex2D(Texture2D_2, r0.xy).x;
    r2.z = saturate(r0.z - UniformScalar_5.x);
    r2.w = 0.5;
    // unhandled fetch opcode 18
    r0.z = tex2D(Texture2D_0, r0.xy).x;
    r0.w = tex2D(Texture2D_3, r2.zw).x;
    r2.y = r0.w * UniformVector_1.x - 0.5;
    ps = 5e+01 * r0.z;
    r0.w = max(r3.x, r3.y);
    r0.z = ps;
    r2.x = r0.w * SlopeScaleDepthBias.x + DepthBias.x;
    ps = InvMaxSubjectDepth.x * r1.z;
    r0.w = r0.z * r2.z;
    r0.z = ps;
    r0.zw = r2.xy + r0.zw;
    r1.x = tex2D(Texture2D_2, r0.xy).x;
    ps = 0.5;
    r2.x = saturate(r1.x - UniformScalar_5.x);
    r2.y = ps;
    // unhandled fetch opcode 18
    r0.x = tex2D(Texture2D_0, r0.xy).x;
    r0.y = tex2D(Texture2D_3, r2.xy).x;
    r1.y = r0.y * UniformVector_1.x - 0.5;
    ps = 5e+01 * r0.x;
    r0.y = max(r1.x, r1.w);
    r0.x = ps;
    r1.x = r0.y * SlopeScaleDepthBias.x + DepthBias.x;
    ps = InvMaxSubjectDepth.x * r1.z;
    r0.y = r0.x * r2.x;
    r0.x = ps;
    r0.xy = r1.xy + r0.xy;
    r0.x = saturate((r0.y > 0.0) ? r0.x : 1e+02);
    ps = r0.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r0.wwww > 0.0) ? r0.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
