// vs_64a2c4bcd47446dd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000021C 00410008 00000000 00000000 00004CA5 00000001 00000004 00000005 00000290 00100005 00006006 00007007 00303008 0000F056 00017157 0002F2A0 0003F3A1 0004F4A2 00001028 00001027 0000102B 0000102A 00001029
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> TANGENT0
//   vertex element: instruction 7 -> BINORMAL0
//   vertex element: instruction 8 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c9); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r2 = In.position0;
    r1.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r0.xyz = In.normal0.xyz;
    r4.yzw = r3.xzy * 0.007843138 - 1.0;
    r6.xyz = r0.yxz * 0.007843138 - 1.0;
    r3 = r2.wwww * LocalToWorld[3];
    r0.x = 0.003921569 * r0.x;
    r7.xzw = r1.xzy * 0.007843138 - 1.0;
    r3 = r2.zzzz * LocalToWorld[2] + r3;
    r5.xyz = r4.zzw * r6.xyy;
    r7.y = -r7.w;
    r5.xyz = r4.wyy * r6.zzx - r5.xyz;
    r3 = r2.yyyy * LocalToWorld[1].xzwy + r3.xzwy;
    r3 = r2.xxxx * LocalToWorld[0].xwyz + r3.xzwy;
    ps = 0.003921569 * r0.y;
    r0.w = dot(r7.xyz, r5.xyz);
    r0.y = ps;
    r0.w = r0.w * 0.5 + 0.5;
    r5.xyw = -r3.wzx * CameraPosition.www + CameraPosition.zyx;
    ps = 0.003921569 * r0.z;
    r8.xyz = r5.xxx * WorldToLocal[2].xzy;
    r0.z = ps;
    r5.xyz = r5.yyy * WorldToLocal[1].xzy + r8.xyz;
    r5.xyz = r5.www * WorldToLocal[0].xyz + r5.xzy;
    ps = 0.003921569 * r1.x;
    r4.x = dot(r7.zxw, r5.zxy);
    r1.x = ps;
    ps = 0.003921569 * r1.y;
    r4.y = dot(r4.zyw, r5.zxy);
    r1.y = ps;
    ps = 0.003921569 * r1.z;
    r4.z = dot(r6.zyx, r5.zxy);
    r1.z = ps;
    r5 = r2.wwww * LocalToWorld[3];
    r5 = r2.zzzz * LocalToWorld[2] + r5;
    r5 = r2.yyyy * LocalToWorld[1].xzwy + r5.xzwy;
    r5 = r2.xxxx * LocalToWorld[0].xwyz + r5.xzwy;
    r2 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    r2 = r3.yyyy * ViewProjectionMatrix[3].xwzy;
    r2 = r3.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    o1.xyz = r4.xyz;
    o0 = r3.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o3.xyz = r1.xyz;
    o3.w = 0.0;
    o2 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    Out.color2 = o4;
    return Out;
}
