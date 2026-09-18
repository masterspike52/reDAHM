// vs_485e7392e2e6db1e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 78 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000138 00210003 00000000 00000000 00003063 00000001 00000002 00000003 00000290 00100004 0021A005 0000F055 0001F1A0 0002F2A2 00001016 00001018 00001017
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> COLOR1
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 color1 : COLOR1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord5 : TEXCOORD5;
    float4 color0 : COLOR0;
    float4 color2 : COLOR2;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r3 = In.color1;
    r0 = r1.wwww * LocalToWorld[3];
    r0 = r1.zzzz * LocalToWorld[2] + r0;
    r0 = r1.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0 = r1.wwww * LocalToWorld[3];
    r0 = r1.zzzz * LocalToWorld[2] + r0;
    r0 = r1.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0 = r1.yyyy * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r2.yyyy * ViewProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o0 = r2.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o2.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.yzw = 0.0;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.color0 = o1;
    Out.color2 = o2;
    return Out;
}
