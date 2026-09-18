// ps_2a10b5181fe382bf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 18000200 00000004 00000000 00001842 00030003 00000011 00003050 0000F157
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
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
    float ps = 0.0;

    // unhandled fetch opcode 18
    r0.zw = r0.yx * 2.0 - 1.0;
    r0.z = dot(r0.wz, r0.wz) + 0.0;
    ps = sqrt(abs(r0.z));
    r0.w = max(r2.x, r2.y);
    r0.z = ps;
    r0.w = r0.w * SlopeScaleDepthBias.x + DepthBias.x;
    r0.w = r1.z * InvMaxSubjectDepth.x + r0.w;
    r2.z = float((r0.z >= UniformScalar_0.x));
    ps = UniformScalar_0.x - r0.z;
    r2.x = float((UniformScalar_0.x >= r0.z));
    r0.z = ps;
    r2.w = float((r0.z >= UniformScalar_2.x));
    r2.y = float((UniformScalar_2.x >= r0.z));
    r2.xy = (r2.zw > 0.0) ? r2.xy : 1.0;
    r0.z = r2.x * r2.y - 0.5;
    // unhandled fetch opcode 18
    r1.w = r1.z * InvMaxSubjectDepth.x;
    r0.xy = r0.yx * 2.0 - 1.0;
    ps = max(r2.x, r2.y);
    r1.xy = r0.xy * r0.xy;
    r0.x = ps;
    r1.z = r0.x * SlopeScaleDepthBias.x + DepthBias.x;
    r0.xy = r1.zy + r1.wx;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r1.z = float((r0.y >= UniformScalar_0.x));
    ps = UniformScalar_0.x - r0.y;
    r1.x = float((UniformScalar_0.x >= r0.y));
    r1.y = ps;
    r1.w = float((r1.y >= UniformScalar_2.x));
    r1.y = float((UniformScalar_2.x >= r1.y));
    r1.xy = (r1.zw > 0.0) ? r1.xy : 1.0;
    r1.x = r1.x * r1.y - 0.5;
    r0.x = saturate((r1.x > 0.0) ? r0.x : 1e+02);
    ps = r0.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r0.zzzz > 0.0) ? r0.wwww : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
