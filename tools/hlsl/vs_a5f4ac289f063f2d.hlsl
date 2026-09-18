// vs_a5f4ac289f063f2d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000330 0071000D 00000000 00000000 00008108 00000001 00000007 00000008 00000290 00100007 00006008 00007009 0000300A 0001A00B 0000500C 0025500D 0000F050 0001F153 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A2 0000103E 00001042 0000103A 00001039 0000103B 0000103C 0000103D 00001038
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   vertex element: instruction 12 -> TEXCOORD0
//   vertex element: instruction 13 -> TEXCOORD5
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightMapScale : register(c12); // float3
float4 LightPositionAndInvRadius : register(c14); // float4[2]
float4 LightType : register(c13); // float[2]
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
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
    float4 oPos = 0.0;

    r6 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r5 = In.color1;
    r1.xy = In.texcoord0.xy;
    r1.z = 0.0;
    r4.xyz = In.texcoord5.xyz;
    r0.x = float((LightType.x >= 0.9));
    r2 = r6.wwww * LocalToWorld[3].xwzy;
    r9.xyz = r7.yxz * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r10.xyz = r3.zyx * 0.007843138 - 1.0;
    r7.x = dot(r10.xzy, WorldToLocal[2].zxy);
    r7.y = dot(r0.zyw, WorldToLocal[2].zxy);
    r7.z = dot(r9.zyx, WorldToLocal[2].zxy);
    r2 = r6.zzzz * LocalToWorld[2].zxwy + r2.zxyw;
    r2 = r6.yyyy * LocalToWorld[1].xzyw + r2.yxwz;
    r11 = r6.xxxx * LocalToWorld[0].ywxz + r2.zwxy;
    r2.xyw = -r11.wxz * CameraPosition.www + CameraPosition.zyx;
    r3.xyz = -r11.wxz * r0.xxx + LightPositionAndInvRadius.zyx;
    r8.xy = r11.yy * ViewProjectionMatrix[3].zw;
    r12.xy = r11.ww * ViewProjectionMatrix[2].zw + r8.xy;
    r8.xyz = r3.xxx * WorldToLocal[2].xyz;
    r13.xyz = r2.xxx * WorldToLocal[2].xyz;
    r2.xyz = r2.yyy * WorldToLocal[1].xyz + r13.xyz;
    r8.xyz = r3.yyy * WorldToLocal[1].xyz + r8.xyz;
    r11.xy = r11.xx * ViewProjectionMatrix[1].zw + r12.xy;
    r3.xy = r11.zz * ViewProjectionMatrix[0].zw + r11.xy;
    r8.xyz = r3.zzz * WorldToLocal[0].xzy + r8.xzy;
    r11.xyz = r2.www * WorldToLocal[0].xzy + r2.xzy;
    r2.x = dot(r10.xzy, r11.yxz);
    r2.y = dot(r0.zyw, r11.yxz);
    r2.z = dot(r9.zyx, r11.yxz);
    r0.x = dot(r10.xzy, r8.yxz);
    r0.y = dot(r0.zyw, r8.yxz);
    r0.z = dot(r9.zyx, r8.yxz);
    r8 = r6.wwww * LocalToWorld[3].xwzy;
    r8 = r6.zzzz * LocalToWorld[2].xwzy + r8;
    r8 = r6.yyyy * LocalToWorld[1].xzyw + r8.xzwy;
    r8 = r6.xxxx * LocalToWorld[0].xywz + r8.xzwy;
    r6 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r6 = r8.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r8.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    oPos = r6;
    r6.x = log2(abs(r4.x));
    r6.y = log2(abs(r4.y));
    r6.z = log2(abs(r4.z));
    r4.xyz = r6.xyz * 2.2;
    o7.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.yzw = 0.0;
    o3.zw = r3.xy;
    o3.xy = 1.0;
    o2.xyz = r0.xyz;
    o2.w = 0.0;
    o4.xyz = r2.xyz;
    o4.w = 0.0;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o6 = r5;
    o0 = r1.xyzz;
    r0.x = pow(2.0, r4.x);
    r0.y = pow(2.0, r4.y);
    r0.z = pow(2.0, r4.z);
    o1.xyz = r0.xyz * LightMapScale.xyz;
    o1.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord3 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    Out.color0 = o6;
    Out.color2 = o7;
    return Out;
}
