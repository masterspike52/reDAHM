// vs_a3c32c28e292d86e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 81 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000144 00210004 00000000 00000000 00002863 00000001 00000003 00000003 00000290 00100004 00005005 00215006 00003050 0001F151 0002F257 00001018 00001019 00001017
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> TEXCOORD0
//   vertex element: instruction 6 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ProjectionMatrix[4] : register(c13); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c9); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord7 : TEXCOORD7;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r0.yz = In.texcoord0.xy;
    r3 = In.texcoord1;
    r2 = r1.wwww * LocalToWorld[3];
    r2 = r1.zzzz * LocalToWorld[2] + r2;
    r2 = r1.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xwyz + r2.xzwy;
    r4 = r1.wwww * LocalToWorld[3];
    r4 = r1.zzzz * LocalToWorld[2] + r4;
    r4 = r1.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r4 = r1.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    r1 = r4.yyyy * ProjectionMatrix[3].xwzy;
    r1 = r4.wwww * ProjectionMatrix[2].xwzy + r1;
    r1 = r4.zzzz * ProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.yyyy * ShadowMatrix[3].xwzy;
    r1 = r2.wwww * ShadowMatrix[2].xwzy + r1;
    r1 = r2.zzzz * ShadowMatrix[1].xzyw + r1.xzwy;
    o2 = r2.xxxx * ShadowMatrix[0] + r1.xzyw;
    o0.xy = r0.yz;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    return Out;
}
