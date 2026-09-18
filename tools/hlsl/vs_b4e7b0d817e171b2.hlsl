// vs_b4e7b0d817e171b2.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 60 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 000000F0 00310003 00000000 00000000 00004084 00000001 00000004 00000004 00000290 00100003 0001A004 00005005 00215006 0000F050 0001F156 0002F2A0 0003F3A2 00001011 00001012 00001010 0000100F
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> COLOR1
//   vertex element: instruction 5 -> TEXCOORD0
//   vertex element: instruction 6 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord6 : TEXCOORD6;
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
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r3 = In.position0;
    r2 = In.color1;
    r1.xy = In.texcoord0.xy;
    r1.zw = In.texcoord1.yx;
    r0 = r3.wwww * LocalToWorld[3];
    r0 = r3.zzzz * LocalToWorld[2] + r0;
    r0 = r3.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r0 = r3.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r3 = r0.yyyy * ViewProjectionMatrix[3].xwzy;
    r3 = r0.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o2 = r2;
    o0 = r1;
    o1 = r0.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.color0 = o2;
    Out.color2 = o3;
    return Out;
}
