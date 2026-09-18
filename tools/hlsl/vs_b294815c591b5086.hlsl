// vs_b294815c591b5086.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003E4 00300011 00000000 00000000 00003884 00000001 00000016 00000004 00000290 0000000E 0011500F 00025010 00035011 00245012 00106013 00007014 00203015 00125016 00035017 00245018 00106019 0000701A 0020301B 0012501C 0003501D 0024501E 00000040 00115041 00025042 00035043 00245044 00007054 0001F155 00027256 0003F357 0000104F 0000104E 00001050 00001051
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
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> BINORMAL0
//   vertex element: instruction 27 -> NORMAL0
//   vertex element: instruction 28 -> TEXCOORD2
//   vertex element: instruction 29 -> TEXCOORD3
//   vertex element: instruction 30 -> TEXCOORD4
//   vertex element: instruction 64 -> POSITION0
//   vertex element: instruction 65 -> TEXCOORD1
//   vertex element: instruction 66 -> TEXCOORD2
//   vertex element: instruction 67 -> TEXCOORD3
//   vertex element: instruction 68 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightDirection : register(c7); // float3
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r1.x = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.x);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.w = r0.y + r0.x;
    r6 = In.position0.yzwx;
    r10.xyz = In.texcoord1.xyz;
    r8.xyz = In.texcoord2.xyz;
    r11.xyz = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r4.xyz = In.normal0.xyz;
    r9.xyz = In.texcoord2.xyz;
    r1.yzw = In.texcoord3.xyz;
    r7.xyz = In.texcoord4.xyz;
    r0.yzw = In.tangent0.xyz;
    r14.xyz = In.binormal0.xyz;
    r13.xyz = In.normal0.xyz;
    r17.xyz = In.texcoord2.xyz;
    r12.yzw = In.texcoord3.xyz;
    r16.xyz = In.texcoord4.xyz;
    r4.xyz = r4.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r5.xyz = r3.zyx * 0.007843138 - 1.0;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r13.xyz = r13.yxz * 0.007843138 - 1.0;
    r14.xyz = r14.xzy * 0.007843138 - 1.0;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    r12.x = dot(r17.zxy, LightDirection.zxy);
    r12.y = dot(r12.wyz, LightDirection.zxy);
    r12.z = dot(r16.zxy, LightDirection.zxy);
    r10.xyz = r10.xzy * r6.zzz;
    r10.xyz = r15.xyz * r6.yyy + r10.xzy;
    r0.y = dot(r0.ywz, r12.zxy);
    r0.z = dot(r14.yxz, r12.zxy);
    r0.w = dot(r13.zyx, r12.zxy);
    r6.xyz = r11.xzy * r6.xxx + r10.xzy;
    r6.xyz = r8.xyz * r6.www + r6.xzy;
    r3 = r6.zzzz * ViewProjectionMatrix[2].xwzy + r3;
    r8.xyz = -r6.zyx * CameraPosition.www + CameraPosition.zyx;
    r1.x = dot(r8.xzy, r9.zxy);
    r1.y = dot(r8.xzy, r1.wyz);
    r1.z = dot(r8.xzy, r7.zxy);
    r3 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    r2.x = dot(r5.xzy, r1.zxy);
    r2.y = dot(r2.zyw, r1.zxy);
    r2.z = dot(r4.zyx, r1.zxy);
    r1.x = r0.x + 0.5;
    r1.w = r1.x * InvNumVerticesPerInstance.x;
    r1.x = trunc(r1.w);
    r1.x = r1.x * NumVerticesPerInstance.x;
    r1.x = trunc(-r1.x);
    r0.x = r1.x + r0.x;
    r4 = In.position0.yzwx;
    r1.xyz = In.texcoord1.xyz;
    r5.xyz = In.texcoord2.xyz;
    r7.xyz = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r6.xyz = r1.xyz * r4.zzz;
    r1 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r6.xyz = r8.xzy * r4.yyy + r6.xzy;
    r4.xyz = r7.xyz * r4.xxx + r6.xzy;
    r4.xyz = r5.xzy * r4.www + r4.xzy;
    r1 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o1.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o1.yzw = 0.0;
    o0.xyz = r0.yzw;
    o2.xyz = r2.xyz;
    o3 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
