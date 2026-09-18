// ps_067e5432b226c62f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 18000400 00000004 00000000 000040A5 001F001F 00000011 00003050 00003151 0000F252 0000F353 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord7;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r0.z = ps;
    ps = r0.y;
    r0.w = ps;
    ps = UniformVector_1.y + r0.w;
    r2 = r0.zwzw * float4(3.0, 3.0, 4.0, 4.0);
    r1.x = ps;
    ps = UniformVector_1.x + r0.z;
    r1.yw = r2.zw + UniformVector_2.xy;
    r1.z = ps;
    r1.xz = r1.zx + r0.zw;
    r1.y = tex2D(Texture2D_1, r1.yw).w;
    r0.w = tex2D(Texture2D_2, r2.xy).x;
    r0.z = tex2D(Texture2D_0, r1.xz).w;
    // unhandled fetch opcode 18
    ps = max(r1.x, r1.z);
    r1.x = ps;
    ps = 4.0 - r0.z;
    r0.w = r0.w * r3.w;
    r1.z = ps;
    r0.z = r1.z * r1.y + r0.z;
    r1.x = r1.x * SlopeScaleDepthBias.x + DepthBias.x;
    r1.x = r4.z * InvMaxSubjectDepth.x + r1.x;
    r0.w = r0.w * r0.z - 0.5;
    r0.z = r0.x;
    r0.x = r0.y;
    ps = UniformVector_1.y + r0.x;
    r2 = r0.zxzx * float4(3.0, 3.0, 4.0, 4.0);
    r3.x = ps;
    ps = UniformVector_1.x + r0.z;
    r1.yz = r2.zw + UniformVector_2.xy;
    r3.y = ps;
    r0.xy = r3.yx + r0.zx;
    r1.w = tex2D(Texture2D_1, r1.yz).w;
    r1.y = tex2D(Texture2D_2, r2.xy).x;
    r0.y = tex2D(Texture2D_0, r0.xy).w;
    // unhandled fetch opcode 18
    r0.x = r4.z * InvMaxSubjectDepth.x;
    ps = max(r2.x, r2.y);
    r1.z = -r0.y + 4.0;
    r0.z = ps;
    ps = r1.y;
    r1.z = r1.z * r1.w;
    r1.y = r0.z * SlopeScaleDepthBias.x + DepthBias.x;
    ps = r3.w * ps;
    r0.xy = r1.yz + r0.xy;
    r0.z = ps;
    r0.z = r0.z * r0.y - 0.5;
    r0.x = saturate((r0.z > 0.0) ? r0.x : 1e+02);
    ps = r0.x;
    oDepth.x = saturate(ps);
    oC0 = saturate((r0.wwww > 0.0) ? r1.xxxx : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
