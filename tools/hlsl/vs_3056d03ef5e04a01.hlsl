// vs_3056d03ef5e04a01.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000354 00410008 00000000 00000000 000048A5 00000001 00000005 00000005 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 0002F257 0003F3A0 0004F4A1 00001042 00001045 00001041 00001044 00001043
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c9); // float4x4 (matrix_columns)
float4 ProjectionMatrix[4] : register(c17); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c8); // float4
float4 ShadowMatrix[4] : register(c13); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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

    r3 = In.position0;
    r5 = In.normal0;
    r4.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r1 = r3.wwww * LocalToWorld[3];
    ps = frac(r0.y);
    r0.xzw = r5.www * LocalToWorld[3].xyz;
    r0.y = ps;
    r0.xzw = r5.zzz * LocalToWorld[2].xzy + r0.xwz;
    r1 = r3.zzzz * LocalToWorld[2] + r1;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r1 = r3.yyyy * LocalToWorld[1] + r1;
    r0.xzw = r5.yyy * LocalToWorld[1].xyz + r0.xwz;
    r6.xyz = r5.xxx * LocalToWorld[0].xzy + r0.xwz;
    r1 = r3.xxxx * LocalToWorld[0] + r1;
    ps = cos(r0.y);
    r4.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r5.xyz = r0.xxx * CameraRight.zyx;
    r7.xyz = -r1.zyx + CameraWorldPosition.zyx;
    ps = sin(r0.y);
    r6.xyz = r1.xyz - r6.xzy;
    r0.w = ps;
    r8.xyz = r0.www * CameraUp.zyx + r5.xyz;
    ps = (-1.0) * r0.x;
    r0.y = dot(r7.xzy, r7.xzy);
    r4.z = ps;
    ps = r4.w;
    r0.z = dot(r6.zxy, r6.zxy);
    ps = r0.x * ps;
    r5.xy = r4.zz * CameraUp.zy;
    r5.z = ps;
    r5.xyz = r0.www * CameraRight.zyx + r5.xyz;
    r0.xy = max(r0.yz, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.w = float((ScreenAlignment.x > 1.5));
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r7.xyz * r0.zzz;
    r0.x = ps;
    r6.xyz = r6.zyx * r0.xxx;
    r8.xyz = (-abs(r0.www) >= 0.0) ? r8.zyx : r6.zyx;
    r0.xyz = r7.xzy * r6.yxz;
    r6.xyz = r7.zxy * r6.yzx - r0.zyx;
    r0.x = dot(r6.xzy, r6.xzy);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.x = ps;
    r0.xyz = r6.zyx * r0.xxx;
    r6.xzw = (-abs(r0.www) >= 0.0) ? r5.zxy : r0.xzy;
    r0.xyz = r6.xwz * 0.5 + 0.5;
    r5.xyz = r6.wxz * r8.xzy;
    r5.xyz = r6.xzw * r8.yxz - r5.xyz;
    r0.w = dot(r5.xzy, r5.xzy);
    ps = rsqrt(abs(r0.w));
    r6.y = -r6.w;
    r0.w = ps;
    r5.xyz = r5.xyz * -r0.www;
    r7.xyz = r5.yzz * r8.zzy;
    r7.xyz = r5.xxy * r8.yxx - r7.xyz;
    r5.w = dot(r6.xyz, r7.xyz);
    r5 = r5.zyxw * 0.5 + 0.5;
    r6 = r3.wwww * LocalToWorld[3].xwzy;
    r6 = r3.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r3.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r3.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r3 = r6.zzzz * ProjectionMatrix[3].xwzy;
    r3 = r6.wwww * ProjectionMatrix[2].xwzy + r3;
    r3 = r6.yyyy * ProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    r3 = r1.wwww * ShadowMatrix[3].xwzy;
    r3 = r1.zzzz * ShadowMatrix[2].xwzy + r3;
    r3 = r1.yyyy * ShadowMatrix[1].xzyw + r3.xzwy;
    o2 = r1.xxxx * ShadowMatrix[0] + r3.xzyw;
    o0.xy = r4.xy;
    o4.xyz = r0.xyz;
    o4.w = 0.0;
    o3 = r5;
    o1 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
