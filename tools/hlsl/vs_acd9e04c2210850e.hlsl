// vs_acd9e04c2210850e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000318 0020000B 00000000 00000000 00002463 00000001 00000011 00000003 00000290 0010500D 0020000E 0011500F 00025010 00035011 00245012 00106013 00007014 00203015 00125016 00035017 00245018 0000002D 0011502E 0002502F 00035030 00245031 00003050 0001F156 00027257 00001040 0000103F 0000103E
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> TEXCOORD1
//   vertex element: instruction 16 -> TEXCOORD2
//   vertex element: instruction 17 -> TEXCOORD3
//   vertex element: instruction 18 -> TEXCOORD4
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> BINORMAL0
//   vertex element: instruction 21 -> NORMAL0
//   vertex element: instruction 22 -> TEXCOORD2
//   vertex element: instruction 23 -> TEXCOORD3
//   vertex element: instruction 24 -> TEXCOORD4
//   vertex element: instruction 45 -> POSITION0
//   vertex element: instruction 46 -> TEXCOORD1
//   vertex element: instruction 47 -> TEXCOORD2
//   vertex element: instruction 48 -> TEXCOORD3
//   vertex element: instruction 49 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 texcoord0 : TEXCOORD0;
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
    float4 texcoord0 : TEXCOORD0;
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
    float4 r11 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r0.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.x = r0.y + r0.x;
    r0.yz = In.texcoord0.xy;
    r1 = In.position0;
    r7.xyz = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r10.xyz = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r5.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r4.xyz = In.normal0.xyz;
    r8.xyz = In.texcoord2.xyz;
    r2.yzw = In.texcoord3.xyz;
    r6.xyz = In.texcoord4.xyz;
    r4.xyz = r4.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r5.xyz = r5.zyx * 0.007843138 - 1.0;
    r7.xyz = r7.xyz * r1.www;
    r7.xyz = r11.xzy * r1.zzz + r7.xzy;
    r7.xyz = r10.xyz * r1.yyy + r7.xzy;
    r1.xyz = r9.xzy * r1.xxx + r7.xzy;
    r7.xyz = -r1.yzx * CameraPosition.www + CameraPosition.zyx;
    r2.x = dot(r7.xzy, r8.zxy);
    r2.y = dot(r7.xzy, r2.wyz);
    r2.z = dot(r7.xzy, r6.zxy);
    r3.x = dot(r5.xzy, r2.zxy);
    r3.y = dot(r3.zyw, r2.zxy);
    r3.z = dot(r4.zyx, r2.zxy);
    r0.w = r0.x + 0.5;
    r0.w = r0.w * InvNumVerticesPerInstance.x;
    r2.x = trunc(r0.w);
    r2.x = r2.x * NumVerticesPerInstance.x;
    r2.x = trunc(-r2.x);
    r0.x = r2.x + r0.x;
    r4 = In.position0.yzwx;
    r2.xyz = In.texcoord1.xyz;
    r5.xyz = In.texcoord2.xyz;
    r7.xyz = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r6.xyz = r2.xzy * r4.zzz;
    r2 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r6.xyz = r8.xyz * r4.yyy + r6.xzy;
    r4.xyz = r7.xzy * r4.xxx + r6.xzy;
    r4.xyz = r5.xyz * r4.www + r4.xzy;
    r2 = r4.zzzz * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r4.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    r2 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r1.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    o2.xyz = r3.xyz;
    o1 = r1.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    o0.xy = r0.yz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
