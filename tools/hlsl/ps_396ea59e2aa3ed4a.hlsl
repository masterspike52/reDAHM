// ps_396ea59e2aa3ed4a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 18000300 00000008 00000000 00004084 0003000F 00000011 0000F050 0000F157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 4
// NOTE: unhandled fetch opcode 18 at 16

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformScalar_0 : register(c3); // float
float4 UniformScalar_2 : register(c4); // float

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
    float ps = 0.0;

    // unhandled fetch opcode 18
    r2.yw = r0.yx * 2.0 - 1.0;
    r2.y = dot(r2.wy, r2.wy) + 0.0;
    ps = sqrt(abs(r2.y));
    r2.x = max(r2.x, r2.z);
    r2.y = ps;
    r2.x = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.z = r1.z * InvMaxSubjectDepth.x + r2.x;
    r3.x = float((r2.y >= UniformScalar_0.x));
    ps = UniformScalar_0.x - r2.y;
    r2.x = float((UniformScalar_0.x >= r2.y));
    r2.y = ps;
    r3.y = float((r2.y >= UniformScalar_2.x));
    r2.w = float((UniformScalar_2.x >= r2.y));
    r2.xy = (r3.xy > 0.0) ? r2.xw : 1.0;
    r2.x = r2.x * r2.y - 0.5;
    // unhandled fetch opcode 18
    r3.w = r1.z * InvMaxSubjectDepth.x;
    r3.xy = r0.yx * 2.0 - 1.0;
    ps = max(r2.y, r2.w);
    r3.xy = r3.xy * r3.xy;
    r2.y = ps;
    r3.z = r2.y * SlopeScaleDepthBias.x + DepthBias.x;
    r2.yw = r3.yz + r3.xw;
    ps = sqrt(abs(r2.y));
    r2.y = ps;
    r3.z = float((r2.y >= UniformScalar_0.x));
    ps = UniformScalar_0.x - r2.y;
    r3.x = float((UniformScalar_0.x >= r2.y));
    r3.y = ps;
    r3.w = float((r3.y >= UniformScalar_2.x));
    r3.y = float((UniformScalar_2.x >= r3.y));
    r3.xy = (r3.zw > 0.0) ? r3.xy : 1.0;
    r3.x = r3.x * r3.y - 0.5;
    r2.y = saturate((r3.x > 0.0) ? r2.w : 1e+02);
    ps = r2.y;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.xxxx > 0.0) ? r2.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
