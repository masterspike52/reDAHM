// vs_17769f777d914a8e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000001F8 00410008 00000000 00000000 000050A5 00000001 00000006 00000005 00000290 00100005 00006006 00007007 00003008 00005009 0021500A 0000F050 0001F157 0002F2A0 0003F3A1 0004F4A2 00001028 00001024 00001027 00001026 00001025
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 r8 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r2 = In.position0;
    r1.xyz = In.tangent0.xyz;
    r6.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r3.xy = In.texcoord0.xy;
    r3.zw = In.texcoord1.yx;
    r4.xyz = r0.yzw * 0.003921569;
    r5.y = -r1.y * 0.007843138 + 1.0;
    r5.xz = r1.xz * 0.007843138 - 1.0;
    r8.xyz = r6.zxy * 0.007843138 - 1.0;
    r7.xyz = r0.zwy * 0.007843138 - 1.0;
    r0 = r2.wwww * LocalToWorld[3].xwzy;
    r1.x = 0.003921569 * r1.x;
    r0 = r2.zzzz * LocalToWorld[2].xwzy + r0;
    r6.xyz = r8.xxz * r7.xzz;
    r1.y = 0.003921569 * r1.y;
    r6.xyz = r8.zyy * r7.yyx - r6.xyz;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    ps = 0.003921569 * r1.z;
    r1.w = dot(r5.xyz, r6.xyz);
    r1.z = ps;
    r4.w = r1.w * 0.5 + 0.5;
    r5 = r2.wwww * LocalToWorld[3].xwzy;
    r5 = r2.zzzz * LocalToWorld[2].xwzy + r5;
    r5 = r2.yyyy * LocalToWorld[1].xzyw + r5.xzwy;
    r5 = r2.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    r2 = r5.zzzz * ProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ProjectionMatrix[2].xwzy + r2;
    r2 = r5.yyyy * ProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    r2 = r0.zzzz * ShadowMatrix[3].xwzy;
    r2 = r0.wwww * ShadowMatrix[2].xwzy + r2;
    r2 = r0.yyyy * ShadowMatrix[1].xzyw + r2.xzwy;
    o1 = r0.xxxx * ShadowMatrix[0] + r2.xzyw;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o3.xyz = r1.xyz;
    o3.w = 0.0;
    o2 = r4;
    o0 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    Out.color2 = o4;
    return Out;
}
