// ps_2d6c2d1a2e04c0d3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 18000300 00000004 00000000 00001842 00030003 00000011 00003050 0000F157
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 8
// NOTE: unhandled fetch opcode 18 at 20

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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

    r0.z = tex2D(Texture2D_2, r0.xy).x;
    r0.z = saturate(r0.z - UniformScalar_5.x);
    r0.w = 0.5;
    r2.z = tex2D(Texture2D_1, r0.xy).x;
    r2.w = tex2D(Texture2D_0, r0.xy).x;
    // unhandled fetch opcode 18
    r2.x = tex2D(Texture2D_3, r0.zw).x;
    r2.y = r2.x * UniformVector_1.x - 0.5;
    r2.x = max(r3.x, r3.y);
    r2.x = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.z = dot(r2.wz, float2(5.0, 3e+01)) + 0.0;
    r0.w = r2.z * r0.z;
    r0.z = InvMaxSubjectDepth.x * r1.z;
    r0.zw = r2.xy + r0.zw;
    r1.x = tex2D(Texture2D_2, r0.xy).x;
    r1.y = saturate(r1.x - UniformScalar_5.x);
    r1.w = 0.5;
    r2.x = tex2D(Texture2D_0, r0.xy).x;
    r2.y = tex2D(Texture2D_1, r0.xy).x;
    // unhandled fetch opcode 18
    r1.x = tex2D(Texture2D_3, r1.yw).x;
    r2.w = r1.z * InvMaxSubjectDepth.x;
    r1.x = r1.x * UniformVector_1.x - 0.5;
    r2.xy = r2.xy * float2(5.0, 3e+01);
    r0.x = max(r0.x, r0.y);
    r2.z = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.xy = r2.xz + r2.yw;
    r1.x = r0.x * r1.y + r1.x;
    r0.x = saturate((r1.x > 0.0) ? r0.y : 1e+02);
    oDepth.x = saturate(r0.x);
    oC0 = saturate((r0.wwww > 0.0) ? r0.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
