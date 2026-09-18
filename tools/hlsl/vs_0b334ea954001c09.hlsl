// vs_0b334ea954001c09.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 270 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000438 00500012 00000000 00000000 000048C6 00000001 00000018 00000006 00000290 0000500F 0000A010 00000011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 0010601C 0000701D 0020301E 0012501F 00035020 00245021 00000045 00115046 00025047 00035048 00245049 00003050 00013151 00027254 0003F355 00047456 0005F557 00001053 00001054 00001055 00001056 00001057 00001058
//   vertex element: instruction 15 -> TEXCOORD0
//   vertex element: instruction 16 -> COLOR0
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
//   vertex element: instruction 69 -> POSITION0
//   vertex element: instruction 70 -> TEXCOORD1
//   vertex element: instruction 71 -> TEXCOORD2
//   vertex element: instruction 72 -> TEXCOORD3
//   vertex element: instruction 73 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c6); // float
float4 LightPositionAndInvRadius : register(c8); // float4
float4 NumVerticesPerInstance : register(c7); // float
float4 ShadowCoordinateScaleBias : register(c5); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 texcoord0 : TEXCOORD0;
    float4 color0 : COLOR0;
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
    float4 texcoord1 : TEXCOORD1;
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
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r1.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.w = r0.y + r0.x;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.color0.xy;
    r11 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r13.xyz = In.texcoord2.xyz;
    r17.xyz = In.texcoord3.xyz;
    r18.xyz = In.texcoord4.xyz;
    r1.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r7.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r16.xyz = In.texcoord2.xyz;
    r4.yzw = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r3.xy = r3.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r7.xyz = r7.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r10.xyz = r1.zyx * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r11.www;
    r1 = r11.wwww * ViewProjectionMatrix[3].xwzy;
    r0.yzw = r18.xyz * r11.zzz + r0.ywz;
    r0.yzw = r17.xzy * r11.yyy + r0.ywz;
    r11.xyz = r13.xyz * r11.xxx + r0.ywz;
    r1 = r11.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r13.xyz = -r11.zyx * CameraPosition.www + CameraPosition.zyx;
    r0.yzw = -r11.xyz + LightPositionAndInvRadius.xyz;
    r4.x = dot(r0.wyz, r16.zxy);
    r4.y = dot(r0.wyz, r4.wyz);
    r4.z = dot(r0.wyz, r15.zxy);
    r8.x = dot(r13.xzy, r14.zxy);
    r8.y = dot(r13.xzy, r8.wyz);
    r8.z = dot(r13.xzy, r12.zxy);
    r1 = r11.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r11.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    r5.x = dot(r10.xzy, r8.zxy);
    r5.y = dot(r5.zyw, r8.zxy);
    r5.z = dot(r9.zyx, r8.zxy);
    r2.x = dot(r7.xzy, r4.zxy);
    r2.y = dot(r2.zyw, r4.zxy);
    r2.z = dot(r6.zyx, r4.zxy);
    r2.w = r0.x + 0.5;
    r2.w = r2.w * InvNumVerticesPerInstance.x;
    r4.x = trunc(r2.w);
    r4.x = r4.x * NumVerticesPerInstance.x;
    r4.x = trunc(-r4.x);
    r0.x = r4.x + r0.x;
    r6 = In.position0.yzwx;
    r4.xyz = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r8.xyz = r4.xyz * r6.zzz;
    r4 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r10.xzy * r6.yyy + r8.xzy;
    r6.xyz = r9.xyz * r6.xxx + r8.xzy;
    r6.xyz = r7.xzy * r6.www + r6.xzy;
    r4 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    o0.xy = r3.xy;
    o1.xy = r3.zw;
    o2.xyz = r2.xyz;
    o3.xyz = r0.yzw * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r5.xyz;
    o5 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
