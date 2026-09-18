// vs_6426d08947d288ee.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000264 00510009 00000000 00000000 000058C6 00000001 00000005 00000006 00000290 00100006 00006007 00007008 00003009 0031A00A 00007054 0001F155 00027256 0003F357 0004F4A0 0005F5A2 0000102E 0000102D 0000102F 00001031 00001030 0000102C
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> COLOR1
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;

    r2 = In.position0;
    r4.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r0 = In.color1;
    r1.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r6.xyz = r5.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r7.xyz = r4.zyx * 0.007843138 - 1.0;
    r1.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r1.xyz;
    r4 = r2.wwww * LocalToWorld[3];
    r4 = r2.zzzz * LocalToWorld[2] + r4;
    r5.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r1.xzy;
    r1.x = dot(r7.xzy, r5.zxy);
    r1.y = dot(r3.zyw, r5.zxy);
    r1.z = dot(r6.zyx, r5.zxy);
    r4 = r2.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r8 = r2.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    r5.xyw = -r8.wzx * CameraPosition.www + CameraPosition.zyx;
    r4 = r8.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r8.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r9.xyz = r5.xxx * WorldToLocal[2].xzy;
    r5.xyz = r5.yyy * WorldToLocal[1].xzy + r9.xyz;
    r4 = r8.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r8.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    r5.xyz = r5.www * WorldToLocal[0].xyz + r5.xzy;
    r3.x = dot(r7.xzy, r5.zxy);
    r3.y = dot(r3.zyw, r5.zxy);
    r3.z = dot(r6.zyx, r5.zxy);
    r5 = r2.wwww * LocalToWorld[3];
    r5 = r2.zzzz * LocalToWorld[2] + r5;
    r5 = r2.yyyy * LocalToWorld[1].xzwy + r5.xzwy;
    r5 = r2.xxxx * LocalToWorld[0].xwyz + r5.xzwy;
    r2 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o5.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.yzw = 0.0;
    o1.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o1.yzw = 0.0;
    o0.xyz = r1.xyz;
    o2.xyz = r3.xyz;
    o4 = r0;
    o3 = r4;

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
