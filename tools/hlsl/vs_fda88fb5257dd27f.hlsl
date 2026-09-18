// vs_fda88fb5257dd27f.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000180 00410007 00000000 00000000 000050A5 00000001 00000006 00000005 00000290 00100004 00006005 00007006 00003007 00005008 00215009 0000F050 0001F156 0002F2A0 0003F3A1 0004F4A2 0000101C 0000101D 0000101E 0000101B 0000101A
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> TANGENT0
//   vertex element: instruction 6 -> BINORMAL0
//   vertex element: instruction 7 -> NORMAL0
//   vertex element: instruction 8 -> TEXCOORD0
//   vertex element: instruction 9 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;

    r5 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r3.xy = In.texcoord0.xy;
    r3.zw = In.texcoord1.yx;
    r2 = r5.wwww * LocalToWorld[3];
    r2 = r5.zzzz * LocalToWorld[2] + r2;
    r2 = r5.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r2 = r5.xxxx * LocalToWorld[0].xwyz + r2.xzwy;
    r5 = r2.yyyy * ViewProjectionMatrix[3].xwzy;
    r5 = r2.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    oPos = r2.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    r5.y = -r0.z * 0.007843138 + 1.0;
    r5.xz = r0.yw * 0.007843138 - 1.0;
    r7.xyz = r4.yxz * 0.007843138 - 1.0;
    r6.xyz = r1.zyx * 0.007843138 - 1.0;
    r4.xyz = r7.zzx * r6.yzz;
    r4.xyz = r7.xyy * r6.xxy - r4.xyz;
    r1.w = dot(r5.xyz, r4.xyz);
    r0.x = 0.5 * r1.w;
    o4.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.yzw = 0.0;
    o3.xyz = r0.yzw * 0.003921569;
    o3.w = 0.0;
    o0 = r3;
    o1 = r2.xzwy;
    o2.xyz = r1.xyz * 0.003921569;
    o2.w = 0.5 + r0.x;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    Out.color2 = o4;
    return Out;
}
