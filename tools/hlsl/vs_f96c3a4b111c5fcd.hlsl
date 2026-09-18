// vs_f96c3a4b111c5fcd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000030C 0081000D 00000000 00000000 00008929 00000001 00000009 00000009 00000290 00100007 00006008 00007009 0000300A 0001A00B 0000500C 0001500D 0002500E 0030A00F 00003050 0001F151 0002F252 0003F354 0004F456 0005F557 0006F658 0007F7A0 0008F8A2 00001038 0000103F 00001039 0000103B 0000103A 0000103C 0000103D 0000103E 00001037
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   vertex element: instruction 12 -> TEXCOORD0
//   vertex element: instruction 13 -> TEXCOORD1
//   vertex element: instruction 14 -> TEXCOORD2
//   vertex element: instruction 15 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c14); // float4[2]
float4 LightType : register(c13); // float[2]
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowCoordinateScaleBias : register(c12); // float4
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
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 color0 : COLOR0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 o8 = 0.0;
    float4 oPos = 0.0;

    r7 = In.position0;
    r8.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r2 = In.color1;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.yx;
    r3.xy = In.texcoord2.xy;
    r0.xy = In.color0.xy;
    r0.z = float((LightType.x >= 0.9));
    r6.xy = r0.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r4 = r7.wwww * LocalToWorld[3];
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r10.xyz = r8.zyx * 0.007843138 - 1.0;
    r8.x = dot(r10.xzy, WorldToLocal[2].zxy);
    r8.y = dot(r1.zyw, WorldToLocal[2].zxy);
    r8.z = dot(r9.zyx, WorldToLocal[2].zxy);
    r4 = r7.zzzz * LocalToWorld[2] + r4;
    r4 = r7.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r12 = r7.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    r0.xyw = -r12.wzx * CameraPosition.www + CameraPosition.zyx;
    r11.xyw = -r12.wzx * r0.zzz + LightPositionAndInvRadius.zyx;
    r3.zw = r12.yy * ViewProjectionMatrix[3].zw;
    r3.zw = r12.ww * ViewProjectionMatrix[2].zw + r3.zw;
    r13.xyz = r11.xxx * WorldToLocal[2].xyz;
    r4.xyz = r0.xxx * WorldToLocal[2].xyz;
    r4.xyz = r0.yyy * WorldToLocal[1].xyz + r4.xyz;
    r11.xyz = r11.yyy * WorldToLocal[1].xyz + r13.xyz;
    r3.zw = r12.zz * ViewProjectionMatrix[1].zw + r3.zw;
    r3.zw = r12.xx * ViewProjectionMatrix[0].zw + r3.zw;
    r0.xyz = r11.www * WorldToLocal[0].xzy + r11.xzy;
    r11.xyz = r0.www * WorldToLocal[0].xzy + r4.xzy;
    r4.x = dot(r10.xzy, r11.yxz);
    r4.y = dot(r1.zyw, r11.yxz);
    r4.z = dot(r9.zyx, r11.yxz);
    r1.x = dot(r10.xzy, r0.yxz);
    r1.y = dot(r1.zyw, r0.yxz);
    r1.z = dot(r9.zyx, r0.yxz);
    r0 = r7.wwww * LocalToWorld[3].xwzy;
    r0 = r7.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r7.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r7.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o8.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o8.yzw = 0.0;
    o0.xy = r6.xy;
    o2.xy = r3.xy;
    o2.zw = 0.0;
    o4.zw = r3.zw;
    o4.xy = 1.0;
    o3.xyz = r1.xyz;
    o3.w = 0.0;
    o5.xyz = r4.xyz;
    o5.w = 0.0;
    o6.xyz = r8.xyz;
    o6.w = 0.0;
    o7 = r2;
    o1 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.texcoord8 = o6;
    Out.color0 = o7;
    Out.color2 = o8;
    return Out;
}
