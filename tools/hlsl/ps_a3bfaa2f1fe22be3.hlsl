// ps_a3bfaa2f1fe22be3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 18000300 00000008 00000000 00004084 0003000F 00000011 0000F050 0000F157 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 10
// NOTE: unhandled fetch opcode 18 at 24

#include "xenos_common.hlsli"

float4 DepthBias : register(c9); // float
float4 InvMaxSubjectDepth : register(c8); // float
float4 SlopeScaleDepthBias : register(c10); // float
float4 UniformScalar_0 : register(c3); // float
float4 UniformScalar_1 : register(c4); // float
float4 UniformScalar_7 : register(c5); // float
float4 UniformScalar_8 : register(c6); // float
float4 UniformScalar_9 : register(c7); // float
sampler2D Texture2D_3 : register(s0);

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

    ps = UniformScalar_8.x - r3.w;
    r2.x = float((UniformScalar_7.x >= 1.0));
    r2.y = ps;
    r2.z = r2.y * r2.x;
    r2.xy = r0.zw * 3.0;
    r2.xyz = r3.www * float3(1.0, 0.16, -0.8) + r2.zyx;
    r2.y = tex2D(Texture2D_3, r2.yz).z;
    // unhandled fetch opcode 18
    ps = max(r2.z, r2.w);
    r2.x = -r2.x + r3.z;
    r2.z = ps;
    r2.z = r2.z * SlopeScaleDepthBias.x + DepthBias.x;
    r2.z = r1.z * InvMaxSubjectDepth.x + r2.z;
    r2.x = max(r2.x, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r2.x = min(r2.x, 1.0);
    r2.w = ps;
    ps = r2.y;
    r2.x = saturate(r2.x * r2.w);
    ps = r3.w * ps;
    r2.x = -r2.x + 1.0;
    r2.y = ps;
    r2.x = r2.y * r2.x;
    r2.x = float((r2.x >= 0.05));
    ps = 1.0 - r2.x;
    r2.x = ps;
    r2.y = (UniformScalar_0.x > 0.0) ? r2.x : 1.0;
    r2.x = (UniformScalar_0.x >= 0.0) ? r2.y : r2.x;
    ps = (-0.5) - -r2.x;
    r2.x = ps;
    // unhandled fetch opcode 18
    ps = InvMaxSubjectDepth.x * r1.z;
    r3.x = -r3.w + UniformScalar_8.x;
    r1.w = ps;
    ps = max(r0.x, r0.y);
    r2.w = float((UniformScalar_7.x >= 1.0));
    r2.y = ps;
    ps = r3.x;
    r1.xyz = r3.www * float3(0.16, -0.8, 1.0);
    ps = r2.w * ps;
    r0.xy = r0.zw * 3.0;
    r0.z = ps;
    r0.w = r2.y * SlopeScaleDepthBias.x + DepthBias.x;
    r0 = r0.yxzw + r1;
    r2.w = tex2D(Texture2D_3, r0.xy).z;
    r2.y = -r0.z + r3.z;
    r2.y = max(r2.y, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r2.y = min(r2.y, 1.0);
    r3.x = ps;
    ps = r2.w;
    r2.y = saturate(r2.y * r3.x);
    ps = r3.w * ps;
    r2.w = -r2.y + 1.0;
    r2.y = ps;
    r2.y = r2.y * r2.w;
    r2.y = float((r2.y >= 0.05));
    r2.y = -r2.y + 1.0;
    r2.w = (UniformScalar_0.x > 0.0) ? r2.y : 1.0;
    r2.y = (UniformScalar_0.x >= 0.0) ? r2.w : r2.y;
    r2.y = r2.y - 0.5;
    r2.y = saturate((r2.y > 0.0) ? r0.w : 1e+02);
    ps = r2.y;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.xxxx > 0.0) ? r2.zzzz : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
