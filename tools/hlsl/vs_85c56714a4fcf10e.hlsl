// vs_85c56714a4fcf10e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000288 0061000B 00000000 00000000 000068E7 00000001 00000007 00000007 00000290 00100006 00006007 00007008 00003009 0001A00A 0000500B 0020100C 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001032 0000102F 00001033 00001030 00001034 00001031 0000102E
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> COLOR1
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightDirection : register(c12); // float3
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
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;

    r5 = In.position0;
    r6.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r4 = In.color1;
    r1.xy = In.texcoord0.xy;
    r1.z = 0.0;
    r2.y = In.blendweight0.x;
    r2.x = 0.0;
    r3.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r8.xyz = r7.yxz * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r9.xyz = r6.zyx * 0.007843138 - 1.0;
    r3.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r3.xyz;
    r6 = r5.wwww * LocalToWorld[3].xwzy;
    r6 = r5.zzzz * LocalToWorld[2].xwzy + r6;
    r7.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r3.xzy;
    r3.x = dot(r9.xzy, r7.zxy);
    r3.y = dot(r0.zyw, r7.zxy);
    r3.z = dot(r8.zyx, r7.zxy);
    r6 = r5.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r10 = r5.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r7.xyw = -r10.wyx * CameraPosition.www + CameraPosition.zyx;
    r6 = r10.zzzz * ViewProjectionMatrix[3].xwzy;
    r6 = r10.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r11.xyz = r7.xxx * WorldToLocal[2].xzy;
    r7.xyz = r7.yyy * WorldToLocal[1].xzy + r11.xyz;
    r6 = r10.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r10.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    r7.xyz = r7.www * WorldToLocal[0].xyz + r7.xzy;
    r0.x = dot(r9.xzy, r7.zxy);
    r0.y = dot(r0.zyw, r7.zxy);
    r0.z = dot(r8.zyx, r7.zxy);
    r7 = r5.wwww * LocalToWorld[3].xwzy;
    r7 = r5.zzzz * LocalToWorld[2].xwzy + r7;
    r7 = r5.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r7 = r5.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r5 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r7.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r7.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    o6.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.yzw = 0.0;
    o1.xyz = r3.xyz;
    o3.xyz = r0.xyz;
    o5 = r4;
    o0 = r1.xyzz;
    o2 = r2.xxxy;
    o4 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color2 = o6;
    return Out;
}
