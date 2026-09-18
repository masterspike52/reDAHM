// vs_9a59eb473019269e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000114 00010003 00000000 00000000 00000000 00000001 00000002 00000000 00000290 00100004 00305005
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> TEXCOORD0
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 BaseExtrusion : register(c6); // float
float4 LightPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c7); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r0.x = In.texcoord0.x;
    r0.yzw = r1.www * LocalToWorld[3].xzy;
    r1.w = float((r0.x > 0.5));
    r0.x = float((0.5 >= r0.x));
    r0.yzw = r1.zzz * LocalToWorld[2].xyz + r0.ywz;
    r0.yzw = r1.yyy * LocalToWorld[1].xzy + r0.ywz;
    r1.xyz = r1.xxx * LocalToWorld[0].xyz + r0.ywz;
    r2.xyz = r1.xyz * LightPosition.www - LightPosition.xyz;
    r2.w = dot(r2.zxy, r2.zxy);
    r0 = r0.xxxx * ViewProjectionMatrix[3].xwzy;
    r2.w = rsqrt(abs(r2.w));
    r3.xyz = r2.xzy * r2.www;
    r1.xyz = r3.xyz * BaseExtrusion.xxx + r1.xzy;
    r1.xyz = (r1.www > 0.0) ? r2.xyz : r1.xzy;
    r0 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    return Out;
}
