// vs_1293fe2061ac4d14.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002D0 0061000B 00000000 00000000 000068E7 00000001 00000006 00000007 00000290 00100007 00006008 00007009 0000300A 0001A00B 0020A00C 00003050 0001F154 0002F256 0003F357 0004F458 0005F5A0 0006F6A2 00001035 00001037 00001036 00001038 00001039 0000103A 00001034
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   vertex element: instruction 12 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;

    r4 = In.position0;
    r5.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r1 = In.color1;
    r2.xy = In.color0.xy;
    r0.x = float((LightType.x >= 0.9));
    r2.xy = r2.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r3 = r4.wwww * LocalToWorld[3];
    r7.xyz = r6.yxz * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r8.xyz = r5.zyx * 0.007843138 - 1.0;
    r5.x = dot(r8.xzy, WorldToLocal[2].zxy);
    r5.y = dot(r0.zyw, WorldToLocal[2].zxy);
    r5.z = dot(r7.zyx, WorldToLocal[2].zxy);
    r3 = r4.zzzz * LocalToWorld[2] + r3;
    r3 = r4.yyyy * LocalToWorld[1].xzwy + r3.xzwy;
    r9 = r4.xxxx * LocalToWorld[0].xwyz + r3.xzwy;
    r3.xyw = -r9.wzx * CameraPosition.www + CameraPosition.zyx;
    r6.xyw = -r9.wzx * r0.xxx + LightPositionAndInvRadius.zyx;
    r2.zw = r9.yy * ViewProjectionMatrix[3].zw;
    r2.zw = r9.ww * ViewProjectionMatrix[2].zw + r2.zw;
    r10.xyz = r6.xxx * WorldToLocal[2].xyz;
    r11.xyz = r3.xxx * WorldToLocal[2].xyz;
    r3.xyz = r3.yyy * WorldToLocal[1].xyz + r11.xyz;
    r6.xyz = r6.yyy * WorldToLocal[1].xyz + r10.xyz;
    r2.zw = r9.zz * ViewProjectionMatrix[1].zw + r2.zw;
    r2.zw = r9.xx * ViewProjectionMatrix[0].zw + r2.zw;
    r6.xyz = r6.www * WorldToLocal[0].xzy + r6.xzy;
    r9.xyz = r3.www * WorldToLocal[0].xzy + r3.xzy;
    r3.x = dot(r8.xzy, r9.yxz);
    r3.y = dot(r0.zyw, r9.yxz);
    r3.z = dot(r7.zyx, r9.yxz);
    r0.x = dot(r8.xzy, r6.yxz);
    r0.y = dot(r0.zyw, r6.yxz);
    r0.z = dot(r7.zyx, r6.yxz);
    r6 = r4.wwww * LocalToWorld[3];
    r6 = r4.zzzz * LocalToWorld[2] + r6;
    r6 = r4.yyyy * LocalToWorld[1].xzwy + r6.xzwy;
    r6 = r4.xxxx * LocalToWorld[0].xwyz + r6.xzwy;
    r4 = r6.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r6.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    o6.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.yzw = 0.0;
    o0.xy = r2.xy;
    o2.zw = r2.zw;
    o2.xy = 1.0;
    o1.xyz = r0.xyz;
    o1.w = 0.0;
    o3.xyz = r3.xyz;
    o3.w = 0.0;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o5 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.texcoord8 = o4;
    Out.color0 = o5;
    Out.color2 = o6;
    return Out;
}
