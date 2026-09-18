// vs_1ed0dd29b89bae74.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000384 0081000D 00000000 00000000 00008D29 00000001 00000009 00000009 00000290 00100008 00006009 0000700A 0000300B 0001A00C 0000500D 0005500E 0006500F 00275010 0000F050 0001F153 0002F254 0003F355 0004F456 00057557 0006F658 0007F7A0 0008F8A2 0000103C 00001047 00001048 00001049 0000103D 00001039 0000103A 0000103B 00001038
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> COLOR1
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> TEXCOORD5
//   vertex element: instruction 15 -> TEXCOORD6
//   vertex element: instruction 16 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightMapScale[3] : register(c12); // float3[3]
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c9); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
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
    float4 color0 : COLOR0;
    float4 color2 : COLOR2;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 o8 = 0.0;
    float4 oPos = 0.0;

    r7 = In.position0;
    r8.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r6 = In.color1;
    r0.yz = In.texcoord0.xy;
    r0.w = 0.0;
    r5.xyz = In.texcoord5.xyz;
    r4.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2 = r7.wwww * LocalToWorld[3].xwzy;
    r10.xyz = r9.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r11.xyz = r8.zyx * 0.007843138 - 1.0;
    r8.x = dot(r11.xzy, WorldToLocal[2].zxy);
    r8.y = dot(r1.zyw, WorldToLocal[2].zxy);
    r8.z = dot(r10.zyx, WorldToLocal[2].zxy);
    r2 = r7.zzzz * LocalToWorld[2].xwzy + r2;
    r2 = r7.yyyy * LocalToWorld[1].xzyw + r2.xzwy;
    r12 = r7.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r9.xyw = -r12.wyx * CameraPosition.www + CameraPosition.zyx;
    r2 = r12.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r12.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r13.xyz = r9.xxx * WorldToLocal[2].xzy;
    r9.xyz = r9.yyy * WorldToLocal[1].xzy + r13.xyz;
    r2 = r12.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r12.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    r9.xyz = r9.www * WorldToLocal[0].xyz + r9.xzy;
    r1.x = dot(r11.xzy, r9.zxy);
    r1.y = dot(r1.zyw, r9.zxy);
    r1.z = dot(r10.zyx, r9.zxy);
    r9 = r7.wwww * LocalToWorld[3].xwzy;
    r9 = r7.zzzz * LocalToWorld[2].xwzy + r9;
    r9 = r7.yyyy * LocalToWorld[1].xzyw + r9.xzwy;
    r9 = r7.xxxx * LocalToWorld[0].xywz + r9.xzwy;
    r7 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r7 = r9.wwww * ViewProjectionMatrix[2].xwzy + r7;
    r7 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r7.xzwy;
    r7 = r9.xxxx * ViewProjectionMatrix[0] + r7.xzyw;
    oPos = r7;
    r7.x = log2(abs(r5.x));
    r7.y = log2(abs(r5.y));
    r7.z = log2(abs(r5.z));
    r5.x = log2(abs(r4.x));
    r5.y = log2(abs(r4.y));
    r4.x = log2(abs(r3.x));
    r4.y = log2(abs(r3.y));
    r4.w = log2(abs(r3.z));
    r3.xyz = r4.xyw * 2.2;
    r5.z = log2(abs(r4.z));
    o8.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o8.yzw = 0.0;
    o5.xyz = r1.xyz;
    o6.xyz = r8.xyz;
    o6.w = 0.0;
    o7 = r6;
    o0 = r0.yzww;
    o4 = r2;
    r0.x = pow(2.0, r3.x);
    r0.y = pow(2.0, r3.y);
    r1.xyz = r5.xyz * 2.2;
    r0.z = pow(2.0, r3.z);
    r1.x = pow(2.0, r1.x);
    r1.y = pow(2.0, r1.y);
    r2.xyz = r7.xyz * 2.2;
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
    Out.color0 = o7;
    Out.color2 = o8;
    return Out;
}
