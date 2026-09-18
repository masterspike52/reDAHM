// vs_2307d6b2d2ac96b6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 183 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002DC 0071000C 00000000 00000000 00007908 00000001 00000006 00000008 00000290 00100007 00006008 00007009 0000300A 0000500B 0020100C 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A1 0007F7A2 00001039 00001036 0000103A 00001037 0000103B 00001038 00001035 00001034
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c12); // float4
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
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r7 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r8.xy = In.texcoord0.xy;
    r8.z = 0.0;
    r2.w = In.blendweight0.x;
    r5.yzw = r0.ywz * 0.007843138 - 1.0;
    r10.xyz = r1.yxz * 0.007843138 - 1.0;
    r0 = r7.wwww * LocalToWorld[3].xzyw;
    r6.xzw = r2.xzy * 0.007843138 - 1.0;
    r3 = r7.zzzz * LocalToWorld[2].xzyw + r0;
    r0.xyz = r5.zzw * r10.xyy;
    r6.y = -r6.w;
    r0.xyz = r5.wyy * r10.zzx - r0.xyz;
    r3 = r7.yyyy * LocalToWorld[1].xzyw + r3;
    r12 = r7.xxxx * LocalToWorld[0].xzyw + r3;
    r0.x = dot(r6.xyz, r0.xyz);
    r4.w = r0.x * 0.5 + 0.5;
    r9.xyw = -r12.yzx * CameraPosition.www + CameraPosition.zyx;
    r3.xyz = -r12.xzy + LightPositionAndInvRadius.xyz;
    r0 = r12.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r12.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r11.xyz = r3.zzz * WorldToLocal[2].xzy;
    r4.xyz = r9.xxx * WorldToLocal[2].xyz;
    r4.xyz = r9.yyy * WorldToLocal[1].xyz + r4.xyz;
    r11.xyz = r3.yyy * WorldToLocal[1].xzy + r11.xyz;
    r0 = r12.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    r9.xyz = r3.xxx * WorldToLocal[0].xyz + r11.xzy;
    r11.xyz = r9.www * WorldToLocal[0].xzy + r4.xzy;
    ps = 0.003921569 * r1.x;
    r1.w = dot(r6.zxw, r11.yxz);
    r4.x = ps;
    ps = 0.003921569 * r1.y;
    r1.x = dot(r5.zyw, r11.yxz);
    r4.y = ps;
    ps = 0.003921569 * r1.z;
    r1.y = dot(r10.zyx, r11.yxz);
    r4.z = ps;
    ps = 0.003921569 * r2.x;
    r5.x = dot(r6.zxw, r9.zxy);
    r6.x = ps;
    ps = 0.003921569 * r2.y;
    r5.y = dot(r5.zyw, r9.zxy);
    r6.y = ps;
    ps = 0.003921569 * r2.z;
    r5.z = dot(r10.zyx, r9.zxy);
    r6.z = ps;
    r9 = r7.wwww * LocalToWorld[3].xwzy;
    r9 = r7.zzzz * LocalToWorld[2].xwzy + r9;
    r9 = r7.yyyy * LocalToWorld[1].xzyw + r9.xzwy;
    r9 = r7.xxxx * LocalToWorld[0].xywz + r9.xzwy;
    r7 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r7 = r9.wwww * ViewProjectionMatrix[2].xwzy + r7;
    r7 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r7.xzwy;
    r7 = r9.xxxx * ViewProjectionMatrix[0] + r7.xzyw;
    oPos = r7;
    r2.xyz = r3.xyz * LightPositionAndInvRadius.www;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.x = ps;
    o7.yzw = 0.0;
    o6.xyz = r6.xyz;
    o6.w = 0.0;
    o1.xyz = r5.xyz;
    o3.xyz = r1.wxy;
    o5 = r4;
    o0 = r8.xyzz;
    o2 = r2;
    o4 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    Out.color2 = o7;
    return Out;
}
