// vs_af8c68feba890c27.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000300 0010000A 00000000 00000000 00001C42 00000001 00000010 00000002 00000290 0000000D 0011500E 0002500F 00035010 00245011 00106012 00007013 00203014 00125015 00035016 00245017 0000002C 0011502D 0002502E 0003502F 00245030 0000F056 00017157 0000103E 0000103D
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> TEXCOORD1
//   vertex element: instruction 15 -> TEXCOORD2
//   vertex element: instruction 16 -> TEXCOORD3
//   vertex element: instruction 17 -> TEXCOORD4
//   vertex element: instruction 18 -> TANGENT0
//   vertex element: instruction 19 -> BINORMAL0
//   vertex element: instruction 20 -> NORMAL0
//   vertex element: instruction 21 -> TEXCOORD2
//   vertex element: instruction 22 -> TEXCOORD3
//   vertex element: instruction 23 -> TEXCOORD4
//   vertex element: instruction 44 -> POSITION0
//   vertex element: instruction 45 -> TEXCOORD1
//   vertex element: instruction 46 -> TEXCOORD2
//   vertex element: instruction 47 -> TEXCOORD3
//   vertex element: instruction 48 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord6 : TEXCOORD6;
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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r2.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r2.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r1 = In.position0;
    r6.xyz = In.texcoord1.xyz;
    r8.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r4.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r0.yzw = In.texcoord2.xyz;
    r7.xyz = In.texcoord3.xyz;
    r5.xyz = In.texcoord4.xyz;
    r3.xyz = r3.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r4.xyz = r4.zyx * 0.007843138 - 1.0;
    r6.xyz = r6.xzy * r1.www;
    r6.xyz = r10.xyz * r1.zzz + r6.xzy;
    r6.xyz = r9.xzy * r1.yyy + r6.xzy;
    r1.xyz = r8.xyz * r1.xxx + r6.xzy;
    r6.xyz = -r1.zyx * CameraPosition.www + CameraPosition.zyx;
    r0.y = dot(r6.xzy, r0.wyz);
    r0.z = dot(r6.xzy, r7.zxy);
    r0.w = dot(r6.xzy, r5.zxy);
    r2.x = dot(r4.xzy, r0.wyz);
    r2.y = dot(r2.zyw, r0.wyz);
    r2.z = dot(r3.zyx, r0.wyz);
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
    r0 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r5.xyz = r7.xzy * r3.yyy + r5.xzy;
    r3.xyz = r6.xyz * r3.xxx + r5.xzy;
    r3.xyz = r4.xzy * r3.www + r3.xzy;
    r0 = r3.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r3.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o1.xyz = r2.xyz;
    o0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    return Out;
}
