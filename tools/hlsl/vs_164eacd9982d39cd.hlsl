// vs_164eacd9982d39cd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 84 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000150 00310004 00000000 00000000 00004084 00000001 00000003 00000004 00000290 00100004 0001A005 00205006 0000F050 0001F157 0002F2A0 0003F3A2 0000101A 00001017 00001019 00001018
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> COLOR1
//   vertex element: instruction 6 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ProjectionMatrix[4] : register(c13); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c9); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color2 : COLOR2;
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
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r2 = In.position0;
    r1 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.z = 0.0;
    r0 = r2.wwww * LocalToWorld[3].xwzy;
    r0 = r2.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r3 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.wwww * LocalToWorld[3].xwzy;
    r0 = r2.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ShadowMatrix[3].xwzy;
    r0 = r3.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r3.xxxx * ShadowMatrix[0] + r0.xzyw;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o2 = r1;
    o0 = r4.xyzz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color2 = o3;
    return Out;
}
