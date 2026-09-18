// vs_83f6828cd5b7fb2d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000288 0051000A 00000000 00000000 000058C6 00000001 00000006 00000006 00000290 00100006 00006007 00007008 00003009 0001A00A 0020100B 00007054 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001030 00001033 00001031 00001034 00001032 0000102F
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> COLOR1
//   vertex element: instruction 11 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c12); // float4
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
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 oPos = 0.0;

    r4 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.color1;
    r2.w = In.blendweight0.x;
    r7.xyz = r3.yxz * 0.007843138 - 1.0;
    r3.yzw = r2.xzy * 0.007843138 - 1.0;
    r8.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1] + r0;
    r9 = r4.xxxx * LocalToWorld[0] + r0;
    r0.xyw = -r9.zyx * CameraPosition.www + CameraPosition.zyx;
    r2.xyz = -r9.xyz + LightPositionAndInvRadius.xyz;
    r5 = r9.wwww * ViewProjectionMatrix[3].xwzy;
    r5 = r9.zzzz * ViewProjectionMatrix[2].xwzy + r5;
    r6.xyz = r2.zzz * WorldToLocal[2].xzy;
    r10.xyz = r0.xxx * WorldToLocal[2].xyz;
    r0.xyz = r0.yyy * WorldToLocal[1].xyz + r10.xyz;
    r6.xyz = r2.yyy * WorldToLocal[1].xzy + r6.xyz;
    r5 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r9.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    r6.xyz = r2.xxx * WorldToLocal[0].xyz + r6.xzy;
    r9.xyz = r0.www * WorldToLocal[0].xzy + r0.xzy;
    r0.x = dot(r8.xzy, r9.yxz);
    r0.y = dot(r3.zyw, r9.yxz);
    r0.z = dot(r7.zyx, r9.yxz);
    r3.x = dot(r8.xzy, r6.zxy);
    r3.y = dot(r3.zyw, r6.zxy);
    r3.z = dot(r7.zyx, r6.zxy);
    r6 = r4.wwww * LocalToWorld[3];
    r6 = r4.zzzz * LocalToWorld[2] + r6;
    r6 = r4.yyyy * LocalToWorld[1].xzwy + r6.xzwy;
    r6 = r4.xxxx * LocalToWorld[0].xwyz + r6.xzwy;
    r4 = r6.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r6.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    r2.xyz = r2.xyz * LightPositionAndInvRadius.www;
    o5.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.yzw = 0.0;
    o0.xyz = r3.xyz;
    o2.xyz = r0.xyz;
    o4 = r1;
    o1 = r2;
    o3 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color2 = o5;
    return Out;
}
