// vs_519ca9312d417f1d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002D0 0071000C 00000000 00000000 00007908 00000001 00000006 00000008 00000290 00100007 00006008 00007009 0000300A 0000500B 0021500C 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A1 0007F7A2 00001039 00001035 00001036 00001037 0000103A 00001038 00001034 00001033
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> TEXCOORD1
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
    float4 texcoord1 : TEXCOORD1;
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

    r6 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r7.xy = In.texcoord0.xy;
    r7.zw = In.texcoord1.yx;
    r5.yzw = r0.ywz * 0.007843138 - 1.0;
    r9.xyz = r1.yxz * 0.007843138 - 1.0;
    r0 = r6.wwww * LocalToWorld[3].xzyw;
    r10.xzw = r2.xzy * 0.007843138 - 1.0;
    r3 = r6.zzzz * LocalToWorld[2].xzyw + r0;
    r0.xyz = r5.zzw * r9.xyy;
    r10.y = -r10.w;
    r0.xyz = r5.wyy * r9.zzx - r0.xyz;
    r3 = r6.yyyy * LocalToWorld[1].xzyw + r3;
    r12 = r6.xxxx * LocalToWorld[0].xzyw + r3;
    r0.x = dot(r10.xyz, r0.xyz);
    r4.w = r0.x * 0.5 + 0.5;
    r8.xyw = -r12.yzx * CameraPosition.www + CameraPosition.zyx;
    r3.xyz = -r12.xzy + LightPositionAndInvRadius.xyz;
    r0 = r12.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r12.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r11.xyz = r3.zzz * WorldToLocal[2].xzy;
    r4.xyz = r8.xxx * WorldToLocal[2].xyz;
    r4.xyz = r8.yyy * WorldToLocal[1].xyz + r4.xyz;
    r11.xyz = r3.yyy * WorldToLocal[1].xzy + r11.xyz;
    r0 = r12.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    r8.xyz = r3.xxx * WorldToLocal[0].xyz + r11.xzy;
    r11.xyz = r8.www * WorldToLocal[0].xzy + r4.xzy;
    ps = 0.003921569 * r1.x;
    r1.w = dot(r10.zxw, r11.yxz);
    r4.x = ps;
    ps = 0.003921569 * r1.y;
    r1.x = dot(r5.zyw, r11.yxz);
    r4.y = ps;
    ps = 0.003921569 * r1.z;
    r1.y = dot(r9.zyx, r11.yxz);
    r4.z = ps;
    ps = 0.003921569 * r2.x;
    r2.w = dot(r10.zxw, r8.zxy);
    r5.x = ps;
    ps = 0.003921569 * r2.y;
    r2.x = dot(r5.zyw, r8.zxy);
    r5.y = ps;
    ps = 0.003921569 * r2.z;
    r2.y = dot(r9.zyx, r8.zxy);
    r5.z = ps;
    r8 = r6.wwww * LocalToWorld[3].xwzy;
    r8 = r6.zzzz * LocalToWorld[2].xwzy + r8;
    r8 = r6.yyyy * LocalToWorld[1].xzyw + r8.xzwy;
    r8 = r6.xxxx * LocalToWorld[0].xywz + r8.xzwy;
    r6 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r6 = r8.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r8.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    oPos = r6;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.x = ps;
    o7.yzw = 0.0;
    o6.xyz = r5.xyz;
    o6.w = 0.0;
    o1.xyz = r2.wxy;
    o2.xyz = r3.xyz * LightPositionAndInvRadius.www;
    o2.w = 0.0;
    o3.xyz = r1.wxy;
    o5 = r4;
    o0 = r7;
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
