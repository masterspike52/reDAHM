// vs_7aab17ccd0f31973.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002AC 0071000B 00000000 00000000 00007908 00000001 00000005 00000008 00000290 00100006 00006007 00007008 00003009 0020500A 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A1 0007F7A2 00001036 00001033 00001031 00001034 00001037 00001035 00001032 00001030
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 r11 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;

    r4 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r5.xy = In.texcoord0.xy;
    r5.z = 0.0;
    r3.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r3.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r3.xyz;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r8.xyz = r1.yxz * 0.007843138 - 1.0;
    r6 = r4.wwww * LocalToWorld[3].xwzy;
    r9.xzw = r2.xzy * 0.007843138 - 1.0;
    r7 = r4.zzzz * LocalToWorld[2].xwzy + r6;
    r6.xyz = r0.zzw * r8.xyy;
    r10.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r3.xzy;
    r3.x = dot(r9.zxw, r10.zxy);
    r3.y = dot(r0.zyw, r10.zxy);
    r3.z = dot(r8.zyx, r10.zxy);
    r9.y = -r9.w;
    r6.xyz = r0.wyy * r8.zzx - r6.xyz;
    r7 = r4.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r10 = r4.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r0.x = dot(r9.xyz, r6.xyz);
    r1.x = 0.003921569 * r1.x;
    r1.w = r0.x * 0.5 + 0.5;
    r7.xyw = -r10.wyx * CameraPosition.www + CameraPosition.zyx;
    r6 = r10.zzzz * ViewProjectionMatrix[3].xwzy;
    r1.y = 0.003921569 * r1.y;
    r6 = r10.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r11.xyz = r7.xxx * WorldToLocal[2].xzy;
    r1.z = 0.003921569 * r1.z;
    r7.xyz = r7.yyy * WorldToLocal[1].xzy + r11.xyz;
    r6 = r10.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r10.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    r7.xyz = r7.www * WorldToLocal[0].xyz + r7.xzy;
    r0.x = dot(r9.zxw, r7.zxy);
    r2.x = 0.003921569 * r2.x;
    r0.y = dot(r0.zyw, r7.zxy);
    r2.y = 0.003921569 * r2.y;
    r0.z = dot(r8.zyx, r7.zxy);
    r2.z = 0.003921569 * r2.z;
    r7 = r4.wwww * LocalToWorld[3].xwzy;
    r7 = r4.zzzz * LocalToWorld[2].xwzy + r7;
    r7 = r4.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r7 = r4.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r4 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r7.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r7.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    o7.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.yzw = 0.0;
    o2.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.yzw = 0.0;
    o6.xyz = r2.xyz;
    o6.w = 0.0;
    o1.xyz = r3.xyz;
    o3.xyz = r0.xyz;
    o5 = r1;
    o0 = r5.xyzz;
    o4 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    Out.color2 = o7;
    return Out;
}
