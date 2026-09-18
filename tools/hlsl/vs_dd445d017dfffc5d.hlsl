// vs_dd445d017dfffc5d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 252 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003F0 00300011 00000000 00000000 00003884 00000001 00000016 00000004 00000290 0000000E 0011500F 00025010 00035011 00245012 00106013 00007014 00203015 00125016 00035017 00245018 00106019 0000701A 0020301B 0012501C 0003501D 0024501E 00000041 00115042 00025043 00035044 00245045 00007054 0001F155 00027256 0003F357 0000104F 00001050 00001051 00001052
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
//   vertex element: instruction 65 -> POSITION0
//   vertex element: instruction 66 -> TEXCOORD1
//   vertex element: instruction 67 -> TEXCOORD2
//   vertex element: instruction 68 -> TEXCOORD3
//   vertex element: instruction 69 -> TEXCOORD4
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
    r1.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.x = r0.y + r0.x;
    r10 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r12.xyz = In.texcoord2.xyz;
    r16.xyz = In.texcoord3.xyz;
    r17.xyz = In.texcoord4.xyz;
    r4.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r13.xyz = In.texcoord2.xyz;
    r7.yzw = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r6.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r15.xyz = In.texcoord2.xyz;
    r2.yzw = In.texcoord3.xyz;
    r14.xyz = In.texcoord4.xyz;
    r5.xyz = r5.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r6.xyz = r6.zyx * 0.007843138 - 1.0;
    r8.xyz = r8.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r9.xyz = r4.zyx * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r10.www;
    r4 = r10.wwww * ViewProjectionMatrix[3].xwzy;
    r0.yzw = r17.xyz * r10.zzz + r0.ywz;
    r0.yzw = r16.xzy * r10.yyy + r0.ywz;
    r10.xyz = r12.xyz * r10.xxx + r0.ywz;
    r4 = r10.zzzz * ViewProjectionMatrix[2].xwzy + r4;
    r12.xyz = -r10.zyx * CameraPosition.www + CameraPosition.zyx;
    r0.yzw = -r10.xyz + LightPositionAndInvRadius.xyz;
    r2.x = dot(r0.wyz, r15.zxy);
    r2.y = dot(r0.wyz, r2.wyz);
    r2.z = dot(r0.wyz, r14.zxy);
    r7.x = dot(r12.xzy, r13.zxy);
    r7.y = dot(r12.xzy, r7.wyz);
    r7.z = dot(r12.xzy, r11.zxy);
    r4 = r10.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r10.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    r3.x = dot(r9.xzy, r7.zxy);
    r3.y = dot(r3.zyw, r7.zxy);
    r3.z = dot(r8.zyx, r7.zxy);
    r1.x = dot(r6.xzy, r2.zxy);
    r1.y = dot(r1.zyw, r2.zxy);
    r1.z = dot(r5.zyx, r2.zxy);
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r2.x = trunc(r1.w);
    r2.x = r2.x * NumVerticesPerInstance.x;
    r2.x = trunc(-r2.x);
    r0.x = r2.x + r0.x;
    r5 = In.position0.yzwx;
    r2.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r7.xyz = r2.xyz * r5.zzz;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r7.xyz = r9.xzy * r5.yyy + r7.xzy;
    r5.xyz = r8.xyz * r5.xxx + r7.xzy;
    r5.xyz = r6.xzy * r5.www + r5.xzy;
    r2 = r5.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xyz = r1.xyz;
    o1.xyz = r0.yzw * LightPositionAndInvRadius.www;
    o1.w = 0.0;
    o2.xyz = r3.xyz;
    o3 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
