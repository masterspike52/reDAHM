// ps_5acf9499c9ae6af5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 18000400 00000008 00000000 000040A5 0007001F 00000011 00003050 00003151 0000F257 0000F3A0 0000F4A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 4
// NOTE: unhandled fetch opcode 18 at 13

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformScalar_3 : register(c3); // float
float4 UniformScalar_4 : register(c4); // float
sampler2D Texture2D_1 : register(s0);

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

    r3.x = tex2D(Texture2D_1, r0.xy).w;
    // unhandled fetch opcode 18
    r4.x = UniformScalar_4.x - UniformScalar_3.x;
    ps = r1.y;
    r3.z = -UniformScalar_3.x + 1.0;
    r4.y = saturate(ps);
    ps = 1.0 / r4.x;
    r3.z = r3.z - r4.y;
    r4.x = ps;
    ps = max(r3.y, r3.w);
    r3.z = saturate(r3.z * r4.x);
    r3.y = ps;
    r3.y = r3.y * SlopeScaleDepthBias.x + DepthBias.x;
    r3.y = r2.z * InvMaxSubjectDepth.x + r3.y;
    r3.z = r3.z * r3.x - 0.5;
    r3.w = tex2D(Texture2D_1, r0.xy).w;
    // unhandled fetch opcode 18
    r4.y = saturate(r1.y);
    ps = UniformScalar_4.x;
    r4.z = -UniformScalar_3.x + 1.0;
    ps = -UniformScalar_3.x + ps;
    r3.x = max(r4.x, r4.w);
    r4.x = ps;
    ps = 1.0 / r4.x;
    r4.y = r4.z - r4.y;
    r4.x = ps;
    r3.x = r3.x * SlopeScaleDepthBias.x + DepthBias.x;
    r4.x = saturate(r4.y * r4.x);
    r3.w = r4.x * r3.w - 0.5;
    r3.x = r2.z * InvMaxSubjectDepth.x + r3.x;
    r3.x = saturate((r3.w > 0.0) ? r3.x : 1e+02);
    ps = r3.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r3.zzzz > 0.0) ? r3.yyyy : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
