// vs_f4a1ae05e56a4814.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 39 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 0000009C 00410001 00000000 00000000 000048A5 00000001 00000001 00000005 00000290 00000003 00003050 0001F151 0002F252 0003F353 0004F454 0000100B 0000100A 00001008 00001009 00001007
//   vertex element: instruction 3 -> POSITION0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 FogMaxHeight : register(c7); // float4
float4 FogMinHeight : register(c6); // float4
float4 ScreenPositionScaleBias : register(c5); // float4
float4 ScreenToWorld[4] : register(c8); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;

    r1.xy = In.position0.xy;
    r1.z = 0.0;
    r1.w = 1.0;
    r0 = r1;
    oPos = r0;
    r0 = r1.yyyy * ScreenToWorld[1] + ScreenToWorld[2];
    o4 = ScreenToWorld[3];
    o2 = FogMinHeight - CameraPosition.zzzz;
    o3 = FogMaxHeight - CameraPosition.zzzz;
    o1 = r1.xxxx * ScreenToWorld[0] + r0;
    o0.xy = r1.xy * ScreenPositionScaleBias.xy + ScreenPositionScaleBias.wz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord4 = o4;
    return Out;
}
