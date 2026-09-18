// ps_9dd4102fd054ea36.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 18000400 00000008 00000000 000050A5 0003001F 00000011 0000F050 0000F157 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 5
// NOTE: unhandled fetch opcode 18 at 14

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
    float4 texcoord7 : TEXCOORD7; // r1
    float4 color0 : COLOR0; // r2
    float4 color1 : COLOR1; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r3 = In.color1;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    ps = r0.z;
    r2.z = saturate(ps);
    r2.y = tex2D(Texture2D_1, r0.xy).w;
    // unhandled fetch opcode 18
    r2.w = UniformScalar_4.x - UniformScalar_3.x;
    r2.x = -UniformScalar_3.x + 1.0;
    ps = 1.0 / r2.w;
    r2.x = r2.x - r2.z;
    r2.w = ps;
    ps = max(r3.x, r3.y);
    r2.w = saturate(r2.x * r2.w);
    r2.x = ps;
    r2.x = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.x = r1.z * InvMaxSubjectDepth.x + r2.x;
    r2.y = r2.w * r2.y - 0.5;
    r2.w = tex2D(Texture2D_1, r0.xy).w;
    // unhandled fetch opcode 18
    ps = UniformScalar_4.x;
    r3.y = -UniformScalar_3.x + 1.0;
    ps = -UniformScalar_3.x + ps;
    r3.z = max(r3.x, r3.z);
    r3.x = ps;
    ps = 1.0 / r3.x;
    r3.y = r3.y - r2.z;
    r3.x = ps;
    r2.z = r3.z * SlopeScaleDepthBias.x + DepthBias.x;
    r3.x = saturate(r3.y * r3.x);
    r2.w = r3.x * r2.w - 0.5;
    r2.z = r1.z * InvMaxSubjectDepth.x + r2.z;
    r2.z = saturate((r2.w > 0.0) ? r2.z : 1e+02);
    ps = r2.z;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.yyyy > 0.0) ? r2.xxxx : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
