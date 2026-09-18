// ps_93ab91b1a8baee68.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 18000400 00000008 00000000 000050A5 0003001F 00000011 0000F050 0000F157 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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

    ps = UniformScalar_8.x - r4.w;
    r2.x = float((UniformScalar_7.x >= 1.0));
    r2.y = ps;
    r2.z = r2.y * r2.x;
    r2.xy = r0.zw * 3.0;
    r2.xyz = r4.www * float3(1.0, 0.16, -0.8) + r2.zyx;
    r2.z = tex2D(Texture2D_3, r2.yz).z;
    // unhandled fetch opcode 18
    ps = max(r2.y, r2.w);
    r2.x = -r2.x + r4.z;
    r2.y = ps;
    r2.y = r2.y * SlopeScaleDepthBias.x + DepthBias.x;
    r2.y = r1.z * InvMaxSubjectDepth.x + r2.y;
    r2.x = max(r2.x, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_0.x;
    r2.x = min(r2.x, 1.0);
    r2.w = ps;
    ps = r2.z;
    r2.x = saturate(r2.x * r2.w);
    ps = r4.w * ps;
    r2.x = -r2.x + 1.0;
    r2.z = ps;
    r2.x = r2.z * r2.x;
    r2.x = float((r2.x >= 0.05));
    ps = 1.0 - r2.x;
    r2.x = ps;
    r2.z = (UniformScalar_1.x > 0.0) ? r2.x : 1.0;
    r2.x = (UniformScalar_1.x >= 0.0) ? r2.z : r2.x;
    ps = (-0.5) - -r2.x;
    r2.x = ps;
    // unhandled fetch opcode 18
    ps = InvMaxSubjectDepth.x * r1.z;
    r4.x = -r4.w + UniformScalar_8.x;
    r3.w = ps;
    ps = max(r3.x, r3.y);
    r2.w = float((UniformScalar_7.x >= 1.0));
    r2.z = ps;
    ps = r4.x;
    r3.xyz = r4.www * float3(0.16, -0.8, 1.0);
    ps = r2.w * ps;
    r0.xy = r0.zw * 3.0;
    r0.z = ps;
    r0.w = r2.z * SlopeScaleDepthBias.x + DepthBias.x;
    r3 = r0.yxzw + r3;
    r2.w = tex2D(Texture2D_3, r3.xy).z;
    r2.z = -r3.z + r4.z;
    r2.z = max(r2.z, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_0.x;
    r2.z = min(r2.z, 1.0);
    r4.x = ps;
    ps = r2.w;
    r2.z = saturate(r2.z * r4.x);
    ps = r4.w * ps;
    r2.w = -r2.z + 1.0;
    r2.z = ps;
    r2.z = r2.z * r2.w;
    r2.z = float((r2.z >= 0.05));
    r2.z = -r2.z + 1.0;
    r2.w = (UniformScalar_1.x > 0.0) ? r2.z : 1.0;
    r2.z = (UniformScalar_1.x >= 0.0) ? r2.w : r2.z;
    r2.z = r2.z - 0.5;
    r2.z = saturate((r2.z > 0.0) ? r3.w : 1e+02);
    ps = r2.z;
    oDepth.x = saturate(ps);
    oC0 = saturate((r2.xxxx > 0.0) ? r2.yyyy : 1e+02);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
