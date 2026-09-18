// vs_75f7243909fd1692.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000210 00410009 00000000 00000000 00004CA5 00000001 00000006 00000005 00000290 00100005 00006006 00007007 00003008 0001A009 0020500A 0000F050 0001F155 00027256 0003F3A0 0004F4A2 00001029 0000102A 00001027 00001028 00001026
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> COLOR1
//   vertex element: instruction 10 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord5 : TEXCOORD5;
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
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;

    r2 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.color1;
    r3.xy = In.texcoord0.xy;
    r3.z = 0.0;
    r6.xyz = r5.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r7.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r2.wwww * LocalToWorld[3].xwzy;
    r0 = r2.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r8 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r5.xyw = -r8.wyx * CameraPosition.www + CameraPosition.zyx;
    r0 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r8.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r9.xyz = r5.xxx * WorldToLocal[2].xzy;
    r5.xyz = r5.yyy * WorldToLocal[1].xzy + r9.xyz;
    r0 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r8.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    r5.xyz = r5.www * WorldToLocal[0].xyz + r5.xzy;
    r4.x = dot(r7.xzy, r5.zxy);
    r4.y = dot(r4.zyw, r5.zxy);
    r4.z = dot(r6.zyx, r5.zxy);
    r5 = r2.wwww * LocalToWorld[3].xwzy;
    r5 = r2.zzzz * LocalToWorld[2].xwzy + r5;
    r5 = r2.yyyy * LocalToWorld[1].xzyw + r5.xzwy;
    r5 = r2.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o4.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.yzw = 0.0;
    o2.xyz = r4.xyz;
    o3 = r1;
    o0 = r3.xyzz;
    o1 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
