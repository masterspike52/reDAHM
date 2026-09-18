// vs_987c8c5af2574653.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000360 0081000E 00000000 00000000 00009129 00000001 00000006 00000009 00000290 00100007 00006008 00007009 0000300A 0000500B 0025500C 0000F050 0001F153 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 0008F8A2 00001042 00001046 0000103E 0000103C 0000103F 00001040 00001041 0000103D 0000103B
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> TEXCOORD5
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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
    float4 r14 = 0.0;
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
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r3.xy = In.texcoord0.xy;
    r3.z = 0.0;
    r6.xyz = In.texcoord5.xyz;
    r0.w = float((LightType.x >= 0.9));
    r4 = r7.wwww * LocalToWorld[3].xwzy;
    r10.xyz = r1.yxz * 0.007843138 - 1.0;
    r11.xyz = r5.xzy * 0.007843138 - 1.0;
    r12.xzw = r2.xzy * 0.007843138 - 1.0;
    r0.x = dot(r12.zxw, WorldToLocal[2].zxy);
    r0.y = dot(r11.yxz, WorldToLocal[2].zxy);
    r0.z = dot(r10.zyx, WorldToLocal[2].zxy);
    r5 = r7.zzzz * LocalToWorld[2].zxwy + r4.zxyw;
    r4.xyz = r11.yyz * r10.xyy;
    r12.y = -r12.w;
    r4.xyz = r11.zxx * r10.zzx - r4.xyz;
    r5 = r7.yyyy * LocalToWorld[1].xzyw + r5.yxwz;
    r9 = r7.xxxx * LocalToWorld[0].ywxz + r5.zwxy;
    r1.w = dot(r12.xyz, r4.xyz);
    r4.w = r1.w * 0.5 + 0.5;
    r5.xyz = -r9.wxz * CameraPosition.www + CameraPosition.zyx;
    r8.xyw = -r9.wxz * r0.www + LightPositionAndInvRadius.zyx;
    r4.xy = r9.yy * ViewProjectionMatrix[3].zw;
    r13.xy = r9.ww * ViewProjectionMatrix[2].zw + r4.xy;
    r14.xyz = r8.xxx * WorldToLocal[2].xyz;
    r4.xyz = r5.xxx * WorldToLocal[2].xyz;
    r4.xyz = r5.yyy * WorldToLocal[1].xyz + r4.xyz;
    r8.xyz = r8.yyy * WorldToLocal[1].xyz + r14.xyz;
    r9.xy = r9.xx * ViewProjectionMatrix[1].zw + r13.xy;
    r5.xy = r9.zz * ViewProjectionMatrix[0].zw + r9.xy;
    r9.xyz = r8.www * WorldToLocal[0].xzy + r8.xzy;
    r13.xyz = r5.zzz * WorldToLocal[0].xzy + r4.xzy;
    r8.x = dot(r12.zxw, r13.yxz);
    r4.x = 0.003921569 * r1.x;
    r8.y = dot(r11.yxz, r13.yxz);
    r4.y = 0.003921569 * r1.y;
    r8.z = dot(r10.zyx, r13.yxz);
    r4.z = 0.003921569 * r1.z;
    r1.x = dot(r12.zxw, r9.yxz);
    r2.x = 0.003921569 * r2.x;
    r1.y = dot(r11.yxz, r9.yxz);
    r2.y = 0.003921569 * r2.y;
    r1.z = dot(r10.zyx, r9.yxz);
    r2.z = 0.003921569 * r2.z;
    r9 = r7.wwww * LocalToWorld[3].xwzy;
    r9 = r7.zzzz * LocalToWorld[2].xwzy + r9;
    r9 = r7.yyyy * LocalToWorld[1].xzyw + r9.xzwy;
    r9 = r7.xxxx * LocalToWorld[0].xywz + r9.xzwy;
    r7 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r7 = r9.wwww * ViewProjectionMatrix[2].xwzy + r7;
    r7 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r7.xzwy;
    r7 = r9.xxxx * ViewProjectionMatrix[0] + r7.xzyw;
    oPos = r7;
    r7.x = log2(abs(r6.x));
    r7.y = log2(abs(r6.y));
    r7.z = log2(abs(r6.z));
    r6.xyz = r7.xyz * 2.2;
    o8.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o8.yzw = 0.0;
    o3.zw = r5.xy;
    o3.xy = 1.0;
    o7.xyz = r2.xyz;
    o7.w = 0.0;
    o2.xyz = r1.xyz;
    o2.w = 0.0;
    o4.xyz = r8.xyz;
    o4.w = 0.0;
    o5.xyz = r0.xyz;
    o5.w = 0.0;
    o6 = r4;
    o0 = r3.xyzz;
    r0.x = pow(2.0, r6.x);
    r0.y = pow(2.0, r6.y);
    r0.z = pow(2.0, r6.z);
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
    Out.color1 = o7;
    Out.color2 = o8;
    return Out;
}
