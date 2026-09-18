// vs_01b6452fec77b4e5.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 321 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000504 00600013 00000000 00000000 000064E7 00000001 0000001A 00000007 00000290 00105010 00200011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 0010601C 0000701D 0020301E 0012501F 00035020 00045021 00055022 00065023 00375024 00000043 00115044 00025045 00035046 00245047 00003050 0001F153 0002F254 0003F355 0004F456 00057557 0006F658 0000105A 00001067 00001068 00001069 0000105D 0000105B 0000105C
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> TEXCOORD1
//   vertex element: instruction 19 -> TEXCOORD2
//   vertex element: instruction 20 -> TEXCOORD3
//   vertex element: instruction 21 -> TEXCOORD4
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> TEXCOORD2
//   vertex element: instruction 26 -> TEXCOORD3
//   vertex element: instruction 27 -> TEXCOORD4
//   vertex element: instruction 28 -> TANGENT0
//   vertex element: instruction 29 -> BINORMAL0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> TEXCOORD2
//   vertex element: instruction 32 -> TEXCOORD3
//   vertex element: instruction 33 -> TEXCOORD4
//   vertex element: instruction 34 -> TEXCOORD5
//   vertex element: instruction 35 -> TEXCOORD6
//   vertex element: instruction 36 -> TEXCOORD7
//   vertex element: instruction 67 -> POSITION0
//   vertex element: instruction 68 -> TEXCOORD1
//   vertex element: instruction 69 -> TEXCOORD2
//   vertex element: instruction 70 -> TEXCOORD3
//   vertex element: instruction 71 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightMapScale[3] : register(c7); // float3[3]
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
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    float4 r19 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r0.z = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.z);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r7.xy = In.texcoord0.xy;
    r10 = In.position0.yzwx;
    r4.xyz = In.texcoord1.xyz;
    r12.xyz = In.texcoord2.xyz;
    r15.xyz = In.texcoord3.xyz;
    r16.xyz = In.texcoord4.xyz;
    r9.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r13.xyz = In.texcoord2.xyz;
    r5.yzw = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r19.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r18.xyz = In.normal0.xyz;
    r17.x = In.texcoord2.z;
    r17.y = In.texcoord3.z;
    r17.z = In.texcoord4.z;
    r2.xyz = In.texcoord5.xyz;
    r6.xyz = In.texcoord6.xyz;
    r0.yzw = In.texcoord7.xyz;
    r8.xyz = r8.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r9.xyz = r9.zyx * 0.007843138 - 1.0;
    r14.xyz = r4.xyz * r10.zzz;
    r4 = r10.zzzz * ViewProjectionMatrix[3].xwzy;
    r18.xyz = r18.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r19.xyz = r19.zyx * 0.007843138 - 1.0;
    r1.x = dot(r19.xzy, r17.zxy);
    r1.y = dot(r1.zyw, r17.zxy);
    r1.z = dot(r18.zyx, r17.zxy);
    r14.xyz = r16.xzy * r10.yyy + r14.xzy;
    r10.xyz = r15.xyz * r10.xxx + r14.xzy;
    r10.xyz = r12.xzy * r10.www + r10.xzy;
    r4 = r10.yyyy * ViewProjectionMatrix[2].xwzy + r4;
    r12.xyz = -r10.yzx * CameraPosition.www + CameraPosition.zyx;
    r5.x = dot(r12.xzy, r13.zxy);
    r5.y = dot(r12.xzy, r5.wyz);
    r5.z = dot(r12.xzy, r11.zxy);
    r4 = r10.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r10.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    r3.x = dot(r9.xzy, r5.zxy);
    r3.y = dot(r3.zyw, r5.zxy);
    r3.z = dot(r8.zyx, r5.zxy);
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r2.w = trunc(r1.w);
    r2.w = r2.w * NumVerticesPerInstance.x;
    r2.w = trunc(-r2.w);
    r0.x = r2.w + r0.x;
    r8 = In.position0.yzwx;
    r5.xyz = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r11.xyz = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r10.xyz = r5.xzy * r8.zzz;
    r5 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r10.xyz = r12.xyz * r8.yyy + r10.xzy;
    r8.xyz = r11.xzy * r8.xxx + r10.xzy;
    r8.xyz = r9.xyz * r8.www + r8.xzy;
    r5 = r8.zzzz * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r8.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    r5.x = log2(abs(r2.x));
    r5.y = log2(abs(r2.y));
    r5.z = log2(abs(r2.z));
    r2.x = log2(abs(r6.x));
    r2.y = log2(abs(r6.y));
    r6.x = log2(abs(r0.y));
    r6.y = log2(abs(r0.z));
    r6.w = log2(abs(r0.w));
    r0.xyz = r6.xyw * 2.2;
    r2.z = log2(abs(r6.z));
    o0.xy = r7.xy;
    o5.xyz = r3.xyz;
    o6.xyz = r1.xyz;
    o6.w = 0.0;
    o4 = r4;
    r0.x = pow(2.0, r0.x);
    r0.y = pow(2.0, r0.y);
    r1.xyz = r2.xyz * 2.2;
    r0.z = pow(2.0, r0.z);
    r1.x = pow(2.0, r1.x);
    r1.y = pow(2.0, r1.y);
    r2.xyz = r5.xyz * 2.2;
    r1.z = pow(2.0, r1.z);
    r2.x = pow(2.0, r2.x);
    r2.y = pow(2.0, r2.y);
    r2.z = pow(2.0, r2.z);
    o1.xyz = r2.xyz * LightMapScale[0].xyz;
    o1.w = 0.0;
    o2.xyz = r1.xyz * LightMapScale[1].xyz;
    o2.w = 0.0;
    o3.xyz = r0.xyz * LightMapScale[2].xyz;
    o3.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord3 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.texcoord8 = o6;
    return Out;
}
