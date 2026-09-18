// vs_6ba07d67d3d4860d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000021C 00000006 00000000 00000000 00001021 00000001 0000000A 00000001 00000290 0000000B 0011500C 0002500D 0003500E 0024500F 0000001A 0011501B 0002501C 0003501D 0024501E 0000F057 0000102B
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> TEXCOORD1
//   vertex element: instruction 13 -> TEXCOORD2
//   vertex element: instruction 14 -> TEXCOORD3
//   vertex element: instruction 15 -> TEXCOORD4
//   vertex element: instruction 26 -> POSITION0
//   vertex element: instruction 27 -> TEXCOORD1
//   vertex element: instruction 28 -> TEXCOORD2
//   vertex element: instruction 29 -> TEXCOORD3
//   vertex element: instruction 30 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ProjectionMatrix[4] : register(c11); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c7); // float4x4 (matrix_columns)

struct VS_INPUT
{
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
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r0.y = r0.x + 0.5;
    r2.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r2.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r1 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r2.xyz = In.texcoord2.xyz;
    r3.xyz = In.texcoord3.xyz;
    r4.xyz = In.texcoord4.xyz;
    r0.yzw = r0.yzw * r1.www;
    r0.yzw = r4.xzy * r1.zzz + r0.ywz;
    r0.yzw = r3.xyz * r1.yyy + r0.ywz;
    r1.xyz = r2.xzy * r1.xxx + r0.ywz;
    r0.y = r0.x + 0.5;
    r0.w = r0.y * InvNumVerticesPerInstance.x;
    r0.y = trunc(r0.w);
    r0.y = r0.y * NumVerticesPerInstance.x;
    r0.y = trunc(-r0.y);
    r0.x = r0.y + r0.x;
    r2 = In.position0.yzwx;
    r0.xyz = In.texcoord1.xyz;
    r3.xyz = In.texcoord2.xyz;
    r5.xyz = In.texcoord3.xyz;
    r6.xyz = In.texcoord4.xyz;
    r4.xyz = r0.xyz * r2.zzz;
    r0 = r2.zzzz * ProjectionMatrix[3].xwzy;
    r4.xyz = r6.xzy * r2.yyy + r4.xzy;
    r2.xyz = r5.xyz * r2.xxx + r4.xzy;
    r2.xyz = r3.xzy * r2.www + r2.xzy;
    r0 = r2.yyyy * ProjectionMatrix[2].xwzy + r0;
    r0 = r2.zzzz * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r1.wwww * ShadowMatrix[3].xwzy;
    r0 = r1.yyyy * ShadowMatrix[2].xwzy + r0;
    r0 = r1.zzzz * ShadowMatrix[1].xzyw + r0.xzwy;
    o0 = r1.xxxx * ShadowMatrix[0] + r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    return Out;
}
