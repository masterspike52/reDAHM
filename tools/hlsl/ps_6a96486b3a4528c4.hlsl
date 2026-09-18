// ps_6a96486b3a4528c4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 18000400 00000008 00000000 000050A5 0007001F 00000011 0000F050 0000F151 0000F257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 5
// NOTE: unhandled fetch opcode 18 at 16

#include "xenos_common.hlsli"

float4 DepthBias : register(c4); // float
float4 InvMaxSubjectDepth : register(c3); // float
float4 SlopeScaleDepthBias : register(c5); // float
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord7;
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    r3.x = tex2D(Texture2D_0, r0.xy).w;
    r3.y = tex2D(Texture2D_0, r0.wz).w;
    // unhandled fetch opcode 18
    r4.x = 5.0 * r3.w;
    ps = max(r4.z, r4.w);
    r4.y = -r3.x + r3.y;
    r3.y = ps;
    r3.x = r4.y * r1.x + r3.x;
    r3.y = r3.y * SlopeScaleDepthBias.x + DepthBias.x;
    r3.y = r2.z * InvMaxSubjectDepth.x + r3.y;
    r3.x = r4.x * r3.x;
    r3.x = min(r3.x, 1.0);
    ps = (-0.5) - -r3.x;
    r3.x = ps;
    r3.z = tex2D(Texture2D_0, r0.wz).w;
    r4.y = tex2D(Texture2D_0, r0.xy).w;
    // unhandled fetch opcode 18
    ps = InvMaxSubjectDepth.x * r2.z;
    r3.z = -r4.y + r3.z;
    r4.x = ps;
    ps = max(r0.x, r0.y);
    r4.w = r3.z * r1.x;
    r3.z = ps;
    r4.z = r3.z * SlopeScaleDepthBias.x + DepthBias.x;
    ps = 5.0 * r3.w;
    r4.xy = r4.zw + r4.xy;
    r3.z = ps;
    r3.z = r3.z * r4.y;
    r3.z = min(r3.z, 1.0);
    r3.z = r3.z - 0.5;
    r3.z = saturate((r3.z > 0.0) ? r4.x : 1e+02);
    ps = r3.z;
    oDepth.x = saturate(ps);
    oC0 = saturate((r3.xxxx > 0.0) ? r3.yyyy : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
