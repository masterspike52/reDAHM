// vs_e640b827e9f1852e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 30 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000078 00010001 00000000 00000000 00000000 00000001 00000001 00000000 00000290 00000003
//   vertex element: instruction 3 -> POSITION0

#include "xenos_common.hlsli"

float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 oPos = 0.0;

    r0 = In.position0;
    r1 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r1 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    return Out;
}
