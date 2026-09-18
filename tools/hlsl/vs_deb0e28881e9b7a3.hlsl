// vs_deb0e28881e9b7a3.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000001D4 00310007 00000000 00000000 00004084 00000001 00000004 00000004 00000290 00100005 00006006 00007007 00303008 0000F057 0001F1A0 0002F2A1 0003F3A2 00001022 00001025 00001024 00001023
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ProjectionMatrix[4] : register(c13); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c9); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
    float4 color2 : COLOR2;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r2 = In.position0;
    r1.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r0.xyz = In.normal0.xyz;
    r4.xyz = r0.xyz * 0.003921569;
    r5.y = -r1.y * 0.007843138 + 1.0;
    r5.xz = r1.xz * 0.007843138 - 1.0;
    r7.xyz = r3.zxy * 0.007843138 - 1.0;
    r3.xyw = r0.yxz * 0.007843138 - 1.0;
    r0 = r2.wwww * LocalToWorld[3];
    r3.z = 0.003921569 * r1.z;
    r0 = r2.zzzz * LocalToWorld[2] + r0;
    r6.xyz = r7.xxz * r3.xyy;
    r3.y = 0.003921569 * r1.y;
    r6.xyz = r7.zyy * r3.wwx - r6.xyz;
    r0 = r2.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r0 = r2.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    ps = 0.003921569 * r1.x;
    r1.w = dot(r5.xyz, r6.xyz);
    r3.x = ps;
    r4.w = r1.w * 0.5 + 0.5;
    r1 = r2.wwww * LocalToWorld[3];
    r1 = r2.zzzz * LocalToWorld[2] + r1;
    r1 = r2.yyyy * LocalToWorld[1].xzwy + r1.xzwy;
    r2 = r2.xxxx * LocalToWorld[0].xwyz + r1.xzwy;
    r1 = r2.yyyy * ProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ProjectionMatrix[2].xwzy + r1;
    r1 = r2.zzzz * ProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r0.yyyy * ShadowMatrix[3].xwzy;
    r1 = r0.wwww * ShadowMatrix[2].xwzy + r1;
    r1 = r0.zzzz * ShadowMatrix[1].xzyw + r1.xzwy;
    o0 = r0.xxxx * ShadowMatrix[0] + r1.xzyw;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o2.xyz = r3.xyz;
    o2.w = 0.0;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    Out.color2 = o3;
    return Out;
}
