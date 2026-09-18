// vs_5c585f068a52dbe1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 144 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000240 0051000A 00000000 00000000 00005CC6 00000001 00000005 00000006 00000290 00100005 00006006 00007007 00003008 00305009 0000F050 0001F155 00027256 0003F3A0 0004F4A1 0005F5A2 0000102D 0000102E 0000102B 0000102C 0000102A 00001029
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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

    r3 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r0.xy = In.texcoord0.xy;
    r0.z = 0.0;
    r5.yzw = r4.xzy * 0.007843138 - 1.0;
    r7.xyz = r1.yxz * 0.007843138 - 1.0;
    r4 = r3.wwww * LocalToWorld[3].xwzy;
    r8.xzw = r2.xzy * 0.007843138 - 1.0;
    r6 = r3.zzzz * LocalToWorld[2].xwzy + r4;
    r4.xyz = r5.zzw * r7.xyy;
    r8.y = -r8.w;
    r4.xyz = r5.wyy * r7.zzx - r4.xyz;
    r6 = r3.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r9 = r3.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r0.w = dot(r8.xyz, r4.xyz);
    r1.x = 0.003921569 * r1.x;
    r1.w = r0.w * 0.5 + 0.5;
    r6.xyw = -r9.wyx * CameraPosition.www + CameraPosition.zyx;
    r4 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r1.y = 0.003921569 * r1.y;
    r4 = r9.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r10.xyz = r6.xxx * WorldToLocal[2].xzy;
    r1.z = 0.003921569 * r1.z;
    r6.xyz = r6.yyy * WorldToLocal[1].xzy + r10.xyz;
    r4 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r9.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    r6.xyz = r6.www * WorldToLocal[0].xyz + r6.xzy;
    r5.x = dot(r8.zxw, r6.zxy);
    r2.x = 0.003921569 * r2.x;
    r5.y = dot(r5.zyw, r6.zxy);
    r2.y = 0.003921569 * r2.y;
    r5.z = dot(r7.zyx, r6.zxy);
    r2.z = 0.003921569 * r2.z;
    r6 = r3.wwww * LocalToWorld[3].xwzy;
    r6 = r3.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r3.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r3.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r6.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    o5.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.yzw = 0.0;
    o4.xyz = r2.xyz;
    o4.w = 0.0;
    o2.xyz = r5.xyz;
    o3 = r1;
    o0 = r0.xyzz;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    Out.color2 = o5;
    return Out;
}
