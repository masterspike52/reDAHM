// ps_3af7b14fce7fbb0c.bin
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

    r2.x = tex2D(Texture2D_2, r0.xy).x;
    r2.x = saturate(r2.x - UniformScalar_5.x);
    r2.y = 0.5;
    r3.x = tex2D(Texture2D_1, r0.xy).x;
    r3.y = tex2D(Texture2D_0, r0.xy).x;
    // unhandled fetch opcode 18
    r2.z = tex2D(Texture2D_3, r2.xy).x;
    r2.w = r2.z * UniformVector_1.x - 0.5;
    r2.z = max(r3.z, r3.w);
    r2.z = r2.z * SlopeScaleDepthBias.x + DepthBias.x;
    r3.x = dot(r3.yx, float2(5.0, 3e+01)) + 0.0;
    r2.y = r3.x * r2.x;
    r2.x = InvMaxSubjectDepth.x * r1.z;
    r2.yz = r2.zw + r2.xy;
    r2.x = tex2D(Texture2D_2, r0.xy).x;
    r3.y = saturate(r2.x - UniformScalar_5.x);
    r3.z = 0.5;
    r1.x = tex2D(Texture2D_0, r0.xy).x;
    r1.y = tex2D(Texture2D_1, r0.xy).x;
    // unhandled fetch opcode 18
    r3.x = tex2D(Texture2D_3, r3.yz).x;
    r0.w = r1.z * InvMaxSubjectDepth.x;
    r3.x = r3.x * UniformVector_1.x - 0.5;
    r0.xy = r1.xy * float2(5.0, 3e+01);
    r2.x = max(r2.x, r2.w);
    r0.z = r2.x * SlopeScaleDepthBias.x + DepthBias.x;
    r2.xw = r0.xz + r0.yw;
    r3.x = r2.x * r3.y + r3.x;
    r2.x = saturate((r3.x > 0.0) ? r2.w : 1e+02);
    oDepth.x = saturate(r2.x);
    oC0 = saturate((r2.zzzz > 0.0) ? r2.yyyy : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
