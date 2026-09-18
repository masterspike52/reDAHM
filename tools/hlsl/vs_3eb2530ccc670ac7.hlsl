// vs_3eb2530ccc670ac7.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000001EC 00310007 00000000 00000000 00003C84 00000001 00000005 00000004 00000290 00100005 00006006 00007007 00003008 0031A009 0000F056 00017157 0002F2A0 0003F3A2 00001025 00001024 00001027 00001026
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> COLOR1
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c9); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord6 : TEXCOORD6;
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
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r4.xyz = In.normal0.xyz;
    r0 = In.color1;
    r5.xyz = r4.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r6.xyz = r2.zyx * 0.007843138 - 1.0;
    r2 = r1.wwww * LocalToWorld[3];
    r2 = r1.zzzz * LocalToWorld[2] + r2;
    r2 = r1.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xwyz + r2.xzwy;
    r4.xyw = -r2.wzx * CameraPosition.www + CameraPosition.zyx;
    r7.xyz = r4.xxx * WorldToLocal[2].xzy;
    r4.xyz = r4.yyy * WorldToLocal[1].xzy + r7.xyz;
    r4.xyz = r4.www * WorldToLocal[0].xyz + r4.xzy;
    r3.x = dot(r6.xzy, r4.zxy);
    r3.y = dot(r3.zyw, r4.zxy);
    r3.z = dot(r5.zyx, r4.zxy);
    r4 = r1.wwww * LocalToWorld[3];
    r4 = r1.zzzz * LocalToWorld[2] + r4;
    r4 = r1.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r4 = r1.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    r1 = r4.yyyy * ViewProjectionMatrix[3].xwzy;
    r1 = r4.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.yyyy * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    o1.xyz = r3.xyz;
    o0 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o2 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color2 = o3;
    return Out;
}
