// ps_fc0a0f7619758934.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 18000400 00000008 00000000 00004084 0003000F 00000011 0000F050 0000F157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 12
// NOTE: unhandled fetch opcode 18 at 27

#include "xenos_common.hlsli"

float4 DepthBias : register(c6); // float
float4 InvMaxSubjectDepth : register(c5); // float
float4 SlopeScaleDepthBias : register(c7); // float
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);

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

    ps = r0.x;
    r2.y = ps;
    ps = r0.y;
    r2.x = ps;
    ps = UniformVector_1.y + r2.x;
    r3 = r2.yyxx * float4(4.0, 3.0, 4.0, 3.0);
    r4.z = ps;
    ps = UniformVector_1.x + r2.y;
    r4.xy = r3.xz + UniformVector_2.xy;
    r4.w = ps;
    r3.xz = r4.wz + r2.yx;
    r2.z = tex2D(Texture2D_1, r4.xy).w;
    r3.y = tex2D(Texture2D_2, r3.yw).x;
    r2.x = tex2D(Texture2D_0, r3.xz).w;
    // unhandled fetch opcode 18
    ps = max(r3.x, r3.z);
    r3.x = ps;
    ps = 4.0 - r2.x;
    r3.y = r3.y * r2.w;
    r3.z = ps;
    r2.z = r3.z * r2.z + r2.x;
    r3.x = r3.x * SlopeScaleDepthBias.x + DepthBias.x;
    r3.x = r1.z * InvMaxSubjectDepth.x + r3.x;
    r2.z = r3.y * r2.z - 0.5;
    r2.y = r0.x;
    r2.x = r0.y;
    ps = UniformVector_1.y + r2.x;
    r0 = r2.yyxx * float4(4.0, 3.0, 3.0, 4.0);
    r1.x = ps;
    ps = UniformVector_1.x + r2.y;
    r3.yz = r0.xw + UniformVector_2.xy;
    r1.y = ps;
    r2.xy = r1.yx + r2.yx;
    r0.x = tex2D(Texture2D_1, r3.yz).w;
    r3.w = tex2D(Texture2D_2, r0.yz).x;
    r2.y = tex2D(Texture2D_0, r2.xy).w;
    // unhandled fetch opcode 18
    r2.x = r1.z * InvMaxSubjectDepth.x;
    ps = max(r0.y, r0.z);
    r3.z = -r2.y + 4.0;
    r3.y = ps;
    ps = r3.w;
    r3.z = r3.z * r0.x;
    r3.y = r3.y * SlopeScaleDepthBias.x + DepthBias.x;
    ps = r2.w * ps;
    r2.xy = r3.yz + r2.xy;
    r2.w = ps;
    r2.w = r2.w * r2.y - 0.5;
    r2.x = saturate((r2.w > 0.0) ? r2.x : 1e+02);
    ps = r2.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.zzzz > 0.0) ? r3.xxxx : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
