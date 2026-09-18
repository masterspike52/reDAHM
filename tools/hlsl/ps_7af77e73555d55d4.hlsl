// ps_7af77e73555d55d4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 18000400 00000008 00000000 00004084 0003000F 00000011 0000F050 0000F157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 8
// NOTE: unhandled fetch opcode 18 at 27

#include "xenos_common.hlsli"

float4 DepthBias : register(c8); // float
float4 InvMaxSubjectDepth : register(c7); // float
float4 SlopeScaleDepthBias : register(c9); // float
float4 UniformScalar_11 : register(c3); // float
float4 UniformScalar_12 : register(c4); // float
float4 UniformScalar_13 : register(c5); // float
float4 UniformScalar_14 : register(c6); // float
sampler2D Texture2D_4 : register(s0);
sampler2D Texture2D_9 : register(s1);

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
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    r2.yz = r0.wz * 3.0;
    r2.x = tex2D(Texture2D_9, r0.xy).w;
    r2.w = tex2D(Texture2D_4, r2.yz).z;
    // unhandled fetch opcode 18
    ps = UniformScalar_12.x - r3.w;
    r2.y = float((UniformScalar_11.x >= 1.0));
    r2.z = ps;
    r2.y = r2.z * r2.y + r3.w;
    ps = max(r4.x, r4.y);
    r2.y = -r2.y + r3.z;
    r2.z = ps;
    r2.z = r2.z * SlopeScaleDepthBias.x + DepthBias.x;
    r2.z = r1.z * InvMaxSubjectDepth.x + r2.z;
    r2.y = max(r2.y, UniformScalar_13.x);
    ps = 1.0 / UniformScalar_14.x;
    r2.y = min(r2.y, 1.0);
    r4.x = ps;
    ps = r2.w;
    r2.y = saturate(r2.y * r4.x);
    ps = r3.w * ps;
    r2.y = -r2.y + 1.0;
    r2.w = ps;
    r2.y = r2.w * r2.y;
    r2.y = float((r2.y >= 0.05));
    ps = 1.0 - r2.y;
    r2.y = ps;
    r2.w = (UniformScalar_12.x > 0.0) ? r2.y : 1.0;
    r2.y = (UniformScalar_12.x >= 0.0) ? r2.w : r2.y;
    r2.y = r2.y * r2.x - 0.5;
    r3.xy = r0.wz * 3.0;
    r2.w = tex2D(Texture2D_9, r0.xy).w;
    r3.y = tex2D(Texture2D_4, r3.xy).z;
    // unhandled fetch opcode 18
    ps = UniformScalar_12.x - r3.w;
    r2.x = float((UniformScalar_11.x >= 1.0));
    r3.x = ps;
    r2.x = r3.x * r2.x + r3.w;
    ps = max(r0.x, r0.y);
    r3.x = -r2.x + r3.z;
    r2.x = ps;
    r2.x = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.x = r1.z * InvMaxSubjectDepth.x + r2.x;
    r3.x = max(r3.x, UniformScalar_13.x);
    ps = 1.0 / UniformScalar_14.x;
    r3.x = min(r3.x, 1.0);
    r3.z = ps;
    ps = r3.y;
    r3.x = saturate(r3.x * r3.z);
    ps = r3.w * ps;
    r3.y = -r3.x + 1.0;
    r3.x = ps;
    r3.x = r3.x * r3.y;
    r3.x = float((r3.x >= 0.05));
    r3.x = -r3.x + 1.0;
    r3.y = (UniformScalar_12.x > 0.0) ? r3.x : 1.0;
    r3.x = (UniformScalar_12.x >= 0.0) ? r3.y : r3.x;
    r2.w = r3.x * r2.w - 0.5;
    r2.x = saturate((r2.w > 0.0) ? r2.x : 1e+02);
    ps = r2.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.yyyy > 0.0) ? r2.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
