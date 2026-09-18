// vs_2a87cd5a87e3a4e4.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000144 00100006 00000000 00000000 00001842 00000001 00000006 00000002 00000290 0010500A 0020000B 0011500C 0002500D 0003500E 0024500F 00003050 0001F156 00001018 00001019
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> TEXCOORD1
//   vertex element: instruction 13 -> TEXCOORD2
//   vertex element: instruction 14 -> TEXCOORD3
//   vertex element: instruction 15 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 texcoord0 : TEXCOORD0;
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;

    r0.y = r0.x + 0.5;
    r0.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.x = r0.y + r0.x;
    r1.xy = In.texcoord0.xy;
    r3 = In.position0;
    r0.xyz = In.texcoord1.xyz;
    r4.xyz = In.texcoord2.xyz;
    r5.xyz = In.texcoord3.xyz;
    r6.xyz = In.texcoord4.xyz;
    r2 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r0.xyz = r0.xyz * r3.www;
    r0.w = r3.w;
    r0.xyz = r6.xzy * r3.zzz + r0.xzy;
    r0.xyz = r5.xyz * r3.yyy + r0.xzy;
    r0.xyz = r4.xyz * r3.xxx + r0.xyz;
    r2 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    o0.xy = r1.xy;
    o1 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    return Out;
}
