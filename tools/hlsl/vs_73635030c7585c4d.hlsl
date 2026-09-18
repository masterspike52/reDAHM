// vs_73635030c7585c4d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000318 0081000D 00000000 00000000 00008929 00000001 00000006 00000009 00000290 00100007 00006008 00007009 0000300A 0000500B 0030A00C 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 0008F8A2 00001039 00001040 0000103C 0000103A 0000103D 0000103E 0000103F 0000103B 00001038
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 color0 : COLOR0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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

    r6 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r7.xy = In.texcoord0.xy;
    r7.z = 0.0;
    r0.xy = In.color0.xy;
    r0.w = float((LightType.x >= 0.9));
    r5.zw = r0.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r3 = r6.wwww * LocalToWorld[3].xwzy;
    r9.xyz = r1.yxz * 0.007843138 - 1.0;
    r10.xyz = r4.xzy * 0.007843138 - 1.0;
    r11.xzw = r2.xzy * 0.007843138 - 1.0;
    r0.x = dot(r11.zxw, WorldToLocal[2].zxy);
    r0.y = dot(r10.yxz, WorldToLocal[2].zxy);
    r0.z = dot(r9.zyx, WorldToLocal[2].zxy);
    r4 = r6.zzzz * LocalToWorld[2].zxwy + r3.zxyw;
    r3.xyz = r10.yyz * r9.xyy;
    r11.y = -r11.w;
    r3.xyz = r10.zxx * r9.zzx - r3.xyz;
    r4 = r6.yyyy * LocalToWorld[1].xzyw + r4.yxwz;
    r12 = r6.xxxx * LocalToWorld[0].xywz + r4.xzwy;
    r1.w = dot(r11.xyz, r3.xyz);
    r3.w = r1.w * 0.5 + 0.5;
    r4.xyz = -r12.wyx * CameraPosition.www + CameraPosition.zyx;
    r8.xyw = -r12.wyx * r0.www + LightPositionAndInvRadius.zyx;
    r3.xy = r12.zz * ViewProjectionMatrix[3].zw;
    r5.xy = r12.ww * ViewProjectionMatrix[2].zw + r3.xy;
    r13.xyz = r8.xxx * WorldToLocal[2].xyz;
    r3.xyz = r4.xxx * WorldToLocal[2].xyz;
    r3.xyz = r4.yyy * WorldToLocal[1].xyz + r3.xyz;
    r8.xyz = r8.yyy * WorldToLocal[1].xyz + r13.xyz;
    r5.xy = r12.yy * ViewProjectionMatrix[1].zw + r5.xy;
    r5.xy = r12.xx * ViewProjectionMatrix[0].zw + r5.xy;
    r8.xyz = r8.www * WorldToLocal[0].xzy + r8.xzy;
    r12.xyz = r4.zzz * WorldToLocal[0].xzy + r3.xzy;
    r4.x = dot(r11.zxw, r12.yxz);
    r3.x = 0.003921569 * r1.x;
    r4.y = dot(r10.yxz, r12.yxz);
    r3.y = 0.003921569 * r1.y;
    r4.z = dot(r9.zyx, r12.yxz);
    r3.z = 0.003921569 * r1.z;
    r1.x = dot(r11.zxw, r8.yxz);
    r2.x = 0.003921569 * r2.x;
    r1.y = dot(r10.yxz, r8.yxz);
    r2.y = 0.003921569 * r2.y;
    r1.z = dot(r9.zyx, r8.yxz);
    r2.z = 0.003921569 * r2.z;
    r8 = r6.wwww * LocalToWorld[3].xwzy;
    r8 = r6.zzzz * LocalToWorld[2].xwzy + r8;
    r8 = r6.yyyy * LocalToWorld[1].xzyw + r8.xzwy;
    r8 = r6.xxxx * LocalToWorld[0].xywz + r8.xzwy;
    r6 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r6 = r8.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r8.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    oPos = r6;
    o8.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o8.yzw = 0.0;
    o0.xy = r5.zw;
    o3.zw = r5.xy;
    o3.xy = 1.0;
    o7.xyz = r2.xyz;
    o7.w = 0.0;
    o2.xyz = r1.xyz;
    o2.w = 0.0;
    o4.xyz = r4.xyz;
    o4.w = 0.0;
    o5.xyz = r0.xyz;
    o5.w = 0.0;
    o6 = r3;
    o1 = r7.xyzz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    Out.color2 = o8;
    return Out;
}
