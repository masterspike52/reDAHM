// vs_27ed871d70e09fc4.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 42 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 000000A8 00010001 00000000 00000000 00001021 00000001 00000001 00000001 00000290 00000003 0000F050 0000100C
//   vertex element: instruction 3 -> POSITION0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)

#include "xenos_common.hlsli"

float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r0 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    return Out;
}
