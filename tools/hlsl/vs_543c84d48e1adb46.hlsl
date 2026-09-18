// vs_543c84d48e1adb46.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 54 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 000000D8 00210003 00000000 00000000 00002863 00000001 00000003 00000003 00000290 00100003 00005004 00215005 00003050 0001F151 0002F256 0000100E 0000100F 00001010
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   vertex element: instruction 5 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 texcoord6 : TEXCOORD6;
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

    r3 = In.position0;
    r2.xy = In.texcoord0.xy;
    r1 = In.texcoord1;
    r0 = r3.wwww * LocalToWorld[3].xwzy;
    r0 = r3.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r3.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r3.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r3 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r0.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    o0.xy = r2.xy;
    o1 = r1;
    o2 = r0.xywz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
