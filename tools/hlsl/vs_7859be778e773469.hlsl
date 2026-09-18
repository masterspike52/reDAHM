// vs_7859be778e773469.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000228 00510009 00000000 00000000 00005CC6 00000001 00000008 00000006 00000290 00100005 00006006 00007007 00003008 0001A009 0000500A 0001500B 0022500C 0000F050 0001F151 0002F256 00037357 0004F4A0 0005F5A2 0000102C 0000102A 00001028 00001027 0000102B 00001029
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> COLOR1
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> TEXCOORD1
//   vertex element: instruction 12 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
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

    r4 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r3 = In.color1;
    r2.xy = In.texcoord0.xy;
    r2.zw = In.texcoord1.yx;
    r1.xy = In.texcoord2.xy;
    r7.xyz = r6.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r8.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r0 = r4.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r6.xyw = -r0.wzx * CameraPosition.www + CameraPosition.zyx;
    r9.xyz = r6.xxx * WorldToLocal[2].xzy;
    r6.xyz = r6.yyy * WorldToLocal[1].xzy + r9.xyz;
    r6.xyz = r6.www * WorldToLocal[0].xyz + r6.xzy;
    r5.x = dot(r8.xzy, r6.zxy);
    r5.y = dot(r5.zyw, r6.zxy);
    r5.z = dot(r7.zyx, r6.zxy);
    r6 = r4.wwww * LocalToWorld[3].xwzy;
    r6 = r4.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r4.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r4.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r4 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r6.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    r4 = r0.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r0.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    o3.xyz = r5.xyz;
    o2 = r0.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    o5.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.yzw = 0.0;
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o4 = r3;
    o0 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color2 = o5;
    return Out;
}
