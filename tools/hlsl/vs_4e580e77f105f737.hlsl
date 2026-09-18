// vs_4e580e77f105f737.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000234 00100007 00000000 00000000 00001842 00000001 0000000B 00000002 00000290 0010500B 0020000C 0011500D 0002500E 0003500F 00245010 0000001B 0011501C 0002501D 0003501E 0024501F 00003050 0001F157 0000102D 0000102C
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> POSITION0
//   vertex element: instruction 13 -> TEXCOORD1
//   vertex element: instruction 14 -> TEXCOORD2
//   vertex element: instruction 15 -> TEXCOORD3
//   vertex element: instruction 16 -> TEXCOORD4
//   vertex element: instruction 27 -> POSITION0
//   vertex element: instruction 28 -> TEXCOORD1
//   vertex element: instruction 29 -> TEXCOORD2
//   vertex element: instruction 30 -> TEXCOORD3
//   vertex element: instruction 31 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ProjectionMatrix[4] : register(c11); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c7); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 texcoord0 : TEXCOORD0;
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord7 : TEXCOORD7;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;

    r0.y = r0.x + 0.5;
    r2.z = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r2.z);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r2.xy = In.texcoord0.xy;
    r1 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r3.xyz = In.texcoord2.xyz;
    r4.xyz = In.texcoord3.xyz;
    r5.xyz = In.texcoord4.xyz;
    r0.yzw = r0.yzw * r1.www;
    r0.yzw = r5.xzy * r1.zzz + r0.ywz;
    r0.yzw = r4.xyz * r1.yyy + r0.ywz;
    r1.xyz = r3.xzy * r1.xxx + r0.ywz;
    r0.y = r0.x + 0.5;
    r0.w = r0.y * InvNumVerticesPerInstance.x;
    r0.y = trunc(r0.w);
    r0.y = r0.y * NumVerticesPerInstance.x;
    r0.y = trunc(-r0.y);
    r0.x = r0.y + r0.x;
    r3 = In.position0.yzwx;
    r0.xyz = In.texcoord1.xyz;
    r4.xyz = In.texcoord2.xyz;
    r6.xyz = In.texcoord3.xyz;
    r7.xyz = In.texcoord4.xyz;
    r5.xyz = r0.xyz * r3.zzz;
    r0 = r3.zzzz * ProjectionMatrix[3].xwzy;
    r5.xyz = r7.xzy * r3.yyy + r5.xzy;
    r3.xyz = r6.xyz * r3.xxx + r5.xzy;
    r3.xyz = r4.xzy * r3.www + r3.xzy;
    r0 = r3.yyyy * ProjectionMatrix[2].xwzy + r0;
    r0 = r3.zzzz * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r3.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r1.wwww * ShadowMatrix[3].xwzy;
    r0 = r1.yyyy * ShadowMatrix[2].xwzy + r0;
    r0 = r1.zzzz * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r1.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r2.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    return Out;
}
