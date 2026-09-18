// vs_9af247387fac817d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 48 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 000000C0 00210004 00000000 00000000 00002863 00000001 00000004 00000003 00000290 00100003 00005004 0000A005 0021A006 00003050 0001F1A0 0002F2A1 0000100C 0000100D 0000100E
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   vertex element: instruction 5 -> COLOR0
//   vertex element: instruction 6 -> COLOR1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)

#include "xenos_common.hlsli"

float4 Transform[4] : register(c5); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    r2 = In.color0;
    r3 = In.color1;
    r4 = r1.wwww * Transform[3].xwzy;
    r4 = r1.zzzz * Transform[2].xwzy + r4;
    r4 = r1.yyyy * Transform[1].xzyw + r4.xzwy;
    r1 = r1.xxxx * Transform[0] + r4.xzyw;
    oPos = r1;
    o0.xy = r0.yz;
    o1 = r2;
    o2 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
