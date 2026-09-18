// vs_0472a0b39e494a96.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000027C 0061000A 00000000 00000000 000068E7 00000001 00000006 00000007 00000290 00100006 00006007 00007008 00003009 0001A00A 0030500B 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001032 0000102F 0000102E 00001030 00001033 00001031 0000102D
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> COLOR1
//   vertex element: instruction 11 -> TEXCOORD0
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;

    r3 = In.position0;
    r5.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r2 = In.color1;
    r0.xy = In.texcoord0.xy;
    r0.z = 0.0;
    r1.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r7.xyz = r6.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r8.xyz = r5.zyx * 0.007843138 - 1.0;
    r1.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r1.xyz;
    r5 = r3.wwww * LocalToWorld[3].xwzy;
    r5 = r3.zzzz * LocalToWorld[2].xwzy + r5;
    r6.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r1.xzy;
    r1.x = dot(r8.xzy, r6.zxy);
    r1.y = dot(r4.zyw, r6.zxy);
    r1.z = dot(r7.zyx, r6.zxy);
    r5 = r3.yyyy * LocalToWorld[1].xzyw + r5.xzwy;
    r9 = r3.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    r6.xyw = -r9.wyx * CameraPosition.www + CameraPosition.zyx;
    r5 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r9.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r10.xyz = r6.xxx * WorldToLocal[2].xzy;
    r6.xyz = r6.yyy * WorldToLocal[1].xzy + r10.xyz;
    r5 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r9.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    r6.xyz = r6.www * WorldToLocal[0].xyz + r6.xzy;
    r4.x = dot(r8.xzy, r6.zxy);
    r4.y = dot(r4.zyw, r6.zxy);
    r4.z = dot(r7.zyx, r6.zxy);
    r6 = r3.wwww * LocalToWorld[3].xwzy;
    r6 = r3.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r3.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r3.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r6.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    o6.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.yzw = 0.0;
    o2.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.yzw = 0.0;
    o1.xyz = r1.xyz;
    o3.xyz = r4.xyz;
    o5 = r2;
    o0 = r0.xyzz;
    o4 = r5;

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
