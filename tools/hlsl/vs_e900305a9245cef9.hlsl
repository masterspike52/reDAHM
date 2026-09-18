// vs_e900305a9245cef9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002D0 00200009 00000000 00000000 00003063 00000001 0000000D 00000003 00000290 0010600C 0000700D 0000300E 0020000F 00115010 00025011 00035012 00245013 00000027 00115028 00025029 0003502A 0024502B 0000F057 0001F1A0 0002F2A1 00001038 0000103A 00001039
//   vertex element: instruction 12 -> TANGENT0
//   vertex element: instruction 13 -> BINORMAL0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
//   vertex element: instruction 18 -> TEXCOORD3
//   vertex element: instruction 19 -> TEXCOORD4
//   vertex element: instruction 39 -> POSITION0
//   vertex element: instruction 40 -> TEXCOORD1
//   vertex element: instruction 41 -> TEXCOORD2
//   vertex element: instruction 42 -> TEXCOORD3
//   vertex element: instruction 43 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ProjectionMatrix[4] : register(c11); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c7); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    r1.z = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.z);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r1.xyw = In.tangent0.xyz;
    r9.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r2 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r6.xyz = In.texcoord4.xyz;
    r4.xyz = r3.xyz * 0.003921569;
    r5.y = -r1.y * 0.007843138 + 1.0;
    r5.xz = r1.xw * 0.007843138 - 1.0;
    r9.xyz = r9.zxy * 0.007843138 - 1.0;
    r3.yzw = r3.xyz * 0.007843138 - 1.0;
    r0.yzw = r0.yzw * r2.www;
    r3.x = 0.003921569 * r1.x;
    r0.yzw = r6.xzy * r2.zzz + r0.ywz;
    r6.xyz = r9.xxz * r3.zyy;
    r3.y = 0.003921569 * r1.y;
    r6.xyz = r9.zyy * r3.wwz - r6.xyz;
    r0.yzw = r8.xyz * r2.yyy + r0.ywz;
    r0.yzw = r7.xzy * r2.xxx + r0.ywz;
    ps = 0.003921569 * r1.w;
    r1.z = dot(r5.xyz, r6.xyz);
    r3.z = ps;
    r4.w = r1.z * 0.5 + 0.5;
    r1.x = r0.x + 0.5;
    r1.w = r1.x * InvNumVerticesPerInstance.x;
    r1.x = trunc(r1.w);
    r1.x = r1.x * NumVerticesPerInstance.x;
    r1.x = trunc(-r1.x);
    r0.x = r1.x + r0.x;
    r5 = In.position0.yzwx;
    r1.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r7.xyz = r1.xyz * r5.zzz;
    r1 = r5.zzzz * ProjectionMatrix[3].xwzy;
    r7.xyz = r9.xzy * r5.yyy + r7.xzy;
    r5.xyz = r8.xyz * r5.xxx + r7.xzy;
    r5.xyz = r6.xzy * r5.www + r5.xzy;
    r1 = r5.yyyy * ProjectionMatrix[2].xwzy + r1;
    r1 = r5.zzzz * ProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r5.xxxx * ProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.wwww * ShadowMatrix[3].xwzy;
    r1 = r0.zzzz * ShadowMatrix[2].xwzy + r1;
    r1 = r0.wwww * ShadowMatrix[1].xzyw + r1.xzwy;
    o0 = r0.yyyy * ShadowMatrix[0] + r1.xzyw;
    o2.xyz = r3.xyz;
    o2.w = 0.0;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
