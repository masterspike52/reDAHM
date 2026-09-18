// vs_d50f4dd2e9c46f2d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002A0 0071000B 00000000 00000000 00007908 00000001 00000008 00000008 00000290 00100006 00006007 00007008 00003009 0001A00A 0000500B 0001500C 0022500D 0000F050 0001F151 00027254 0003F355 00047456 0005F557 0006F6A0 0007F7A2 00001035 00001031 00001032 00001030 00001033 00001036 00001034 0000102F
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> COLOR1
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> TEXCOORD1
//   vertex element: instruction 13 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
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
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o7 = 0.0;
    float4 oPos = 0.0;

    r6 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r5 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    r2.xy = In.texcoord2.xy;
    r0.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r8.xyz = r7.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r9.xyz = r3.zyx * 0.007843138 - 1.0;
    r3.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r0.xyz;
    r0 = r6.wwww * LocalToWorld[3];
    r0 = r6.zzzz * LocalToWorld[2] + r0;
    r7.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r3.xzy;
    r3.x = dot(r9.xzy, r7.zxy);
    r3.y = dot(r1.zyw, r7.zxy);
    r3.z = dot(r8.zyx, r7.zxy);
    r0 = r6.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r10 = r6.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0.xyw = -r10.wzx * CameraPosition.www + CameraPosition.zyx;
    r7 = r10.yyyy * ViewProjectionMatrix[3].xwzy;
    r7 = r10.wwww * ViewProjectionMatrix[2].xwzy + r7;
    r11.xyz = r0.xxx * WorldToLocal[2].xzy;
    r0.xyz = r0.yyy * WorldToLocal[1].xzy + r11.xyz;
    r7 = r10.zzzz * ViewProjectionMatrix[1].xzyw + r7.xzwy;
    r7 = r10.xxxx * ViewProjectionMatrix[0] + r7.xzyw;
    r0.xyz = r0.www * WorldToLocal[0].xyz + r0.xzy;
    r1.x = dot(r9.xzy, r0.zxy);
    r1.y = dot(r1.zyw, r0.zxy);
    r1.z = dot(r8.zyx, r0.zxy);
    r0 = r6.wwww * LocalToWorld[3].xwzy;
    r0 = r6.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r6 = r6.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r6.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o7.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.yzw = 0.0;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o1.xy = r2.xy;
    o1.zw = 0.0;
    o2.xyz = r3.xyz;
    o4.xyz = r1.xyz;
    o6 = r5;
    o0 = r4;
    o5 = r7;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color2 = o7;
    return Out;
}
