// vs_4a2008b8e3386f68.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000408 00300012 00000000 00000000 00003884 00000001 00000017 00000004 00000290 0000100E 0000000F 00115010 00025011 00035012 00245013 00106014 00007015 00203016 00125017 00035018 00245019 0010601A 0000701B 0020301C 0012501D 0003501E 0024501F 00000042 00115043 00025044 00035045 00245046 00007054 0001F155 00027256 0003F357 00001051 00001053 00001052 00001054
//   vertex element: instruction 14 -> BLENDWEIGHT0
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
//   vertex element: instruction 18 -> TEXCOORD3
//   vertex element: instruction 19 -> TEXCOORD4
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> TEXCOORD2
//   vertex element: instruction 24 -> TEXCOORD3
//   vertex element: instruction 25 -> TEXCOORD4
//   vertex element: instruction 26 -> TANGENT0
//   vertex element: instruction 27 -> BINORMAL0
//   vertex element: instruction 28 -> NORMAL0
//   vertex element: instruction 29 -> TEXCOORD2
//   vertex element: instruction 30 -> TEXCOORD3
//   vertex element: instruction 31 -> TEXCOORD4
//   vertex element: instruction 66 -> POSITION0
//   vertex element: instruction 67 -> TEXCOORD1
//   vertex element: instruction 68 -> TEXCOORD2
//   vertex element: instruction 69 -> TEXCOORD3
//   vertex element: instruction 70 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightPositionAndInvRadius : register(c7); // float4
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 blendweight0 : BLENDWEIGHT0;
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
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r0.z = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.z);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.w = r0.y + r0.x;
    r0.y = In.blendweight0.x;
    r4 = In.position0.yzwx;
    r1.xyz = In.texcoord1.xyz;
    r11.xyz = In.texcoord2.xyz;
    r17.xyz = In.texcoord3.xyz;
    r18.xyz = In.texcoord4.xyz;
    r10.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r7.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r16.xyz = In.texcoord2.xyz;
    r3.yzw = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r7.xyz = r7.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r10.xyz = r10.zyx * 0.007843138 - 1.0;
    r13.xyz = r1.xzy * r4.zzz;
    r1 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r13.xyz = r18.xyz * r4.yyy + r13.xzy;
    r4.xyz = r17.xzy * r4.xxx + r13.xzy;
    r11.xyz = r11.xyz * r4.www + r4.xzy;
    r1 = r11.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r13.xyz = -r11.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = -r11.xyz + LightPositionAndInvRadius.xyz;
    r3.x = dot(r4.zxy, r16.zxy);
    r3.y = dot(r4.zxy, r3.wyz);
    r3.z = dot(r4.zxy, r15.zxy);
    r8.x = dot(r13.xzy, r14.zxy);
    r8.y = dot(r13.xzy, r8.wyz);
    r8.z = dot(r13.xzy, r12.zxy);
    r1 = r11.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r11.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    r5.x = dot(r10.xzy, r8.zxy);
    r5.y = dot(r5.zyw, r8.zxy);
    r5.z = dot(r9.zyx, r8.zxy);
    r2.x = dot(r7.xzy, r3.zxy);
    r2.y = dot(r2.zyw, r3.zxy);
    r2.z = dot(r6.zyx, r3.zxy);
    r0.z = r0.x + 0.5;
    r2.w = r0.z * InvNumVerticesPerInstance.x;
    r0.z = trunc(r2.w);
    r0.z = r0.z * NumVerticesPerInstance.x;
    r0.z = trunc(-r0.z);
    r0.x = r0.z + r0.x;
    r6 = In.position0;
    r0.xzw = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r0.xzw = r0.xzw * r6.www;
    r3 = r6.wwww * ViewProjectionMatrix[3].xwzy;
    r0.xzw = r9.xzy * r6.zzz + r0.xwz;
    r0.xzw = r8.xyz * r6.yyy + r0.xwz;
    r0.xzw = r7.xzy * r6.xxx + r0.xwz;
    r3 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r0.wwww * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r0.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    r0.xzw = r4.xyz * LightPositionAndInvRadius.www;
    o0.xyz = r2.xyz;
    o2.xyz = r5.xyz;
    o1 = r0.xzwy;
    o3 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
