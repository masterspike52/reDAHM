// vs_d7d2aed377e432b8.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000039C 0051000A 00000000 00000000 000054C6 00000001 00000005 00000006 00000290 00100008 00003009 0000500A 0000100B 0021500C 00003050 0001F151 0002F256 00037357 0004F4A0 0005F5A1 00001048 0000104B 00001047 00001046 0000104A 00001049
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> BLENDWEIGHT0
//   vertex element: instruction 12 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c9); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c8); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 texcoord6 : TEXCOORD6;
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r4 = In.position0;
    r3 = In.normal0;
    r5.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.xzw = r3.www * LocalToWorld[3].xyz;
    r0.xzw = r3.zzz * LocalToWorld[2].xzy + r0.xwz;
    r1 = r4.wwww * LocalToWorld[3];
    r0.y = frac(r0.y);
    r1 = r4.zzzz * LocalToWorld[2] + r1;
    r1 = r4.yyyy * LocalToWorld[1] + r1;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r0.xzw = r3.yyy * LocalToWorld[1].xyz + r0.xwz;
    r6.xyz = r3.xxx * LocalToWorld[0].xzy + r0.xwz;
    r0.x = cos(r0.y);
    r1 = r4.xxxx * LocalToWorld[0] + r1;
    r7.xyz = -r1.zyx * CameraPosition.www + CameraPosition.zyx;
    r3.w = r0.x * (-1.0);
    r0.w = sin(r0.y);
    ps = CameraRight.z * r0.w;
    r0.xyz = r0.xxx * CameraRight.zyx;
    r3.x = ps;
    ps = CameraRight.y * r0.w;
    r8.xyz = -r1.zyx + CameraWorldPosition.zyx;
    r3.y = ps;
    ps = CameraRight.x * r0.w;
    r6.xyz = r1.xyz - r6.xzy;
    r3.z = ps;
    r3.xyz = r3.www * CameraUp.zyx + r3.xyz;
    r0.xyz = r0.www * CameraUp.zyx + r0.xyz;
    r5.z = dot(r8.xzy, r8.xzy);
    r5.w = dot(r6.zxy, r6.zxy);
    r5.zw = max(r5.zw, 0.01);
    ps = rsqrt(abs(r5.z));
    r3.w = float((ScreenAlignment.x > 1.5));
    r0.w = ps;
    ps = rsqrt(abs(r5.w));
    r8.xyz = r8.xyz * r0.www;
    r0.w = ps;
    r6.xyz = r6.zyx * r0.www;
    r9.xyz = (-abs(r3.www) >= 0.0) ? r0.zyx : r6.zyx;
    r0.xyz = r8.xzy * r6.yxz;
    r6.xyz = r8.zxy * r6.yzx - r0.zyx;
    r0.x = dot(r6.xzy, r6.xzy);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.y = dot(r7.xzy, r9.zxy);
    r0.x = ps;
    r0.xzw = r6.zyx * r0.xxx;
    r8.xzw = (-abs(r3.www) >= 0.0) ? r3.zxy : r0.xwz;
    r0.x = dot(r7.xzy, r8.zxw);
    r3.xyz = r8.xwz * 0.5 + 0.5;
    r6.xyz = r8.wxz * r9.xzy;
    r6.xyz = r8.xzw * r9.yxz - r6.xyz;
    r0.z = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r0.z));
    r8.y = -r8.w;
    r0.z = ps;
    r10.xyz = r6.xyz * r0.zzz;
    r6.xyz = r6.xyz * -r0.zzz;
    r0.z = dot(-r10.xzy, r7.xzy);
    r7.xyz = r6.yzz * r9.zzy;
    r7.xyz = r6.xxy * r9.yxx - r7.xyz;
    r6.w = dot(r8.xyz, r7.xyz);
    r6 = r6.zyxw * 0.5 + 0.5;
    r7 = r4.wwww * LocalToWorld[3].xwzy;
    r7 = r4.zzzz * LocalToWorld[2].xwzy + r7;
    r7 = r4.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r7 = r4.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r4 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r7.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r7.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    r4 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r4 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    o3.xyz = r0.xyz;
    o2 = r1.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    o0.xy = r5.xy;
    o5.xyz = r3.xyz;
    o5.w = 0.0;
    o4 = r6;
    o1 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
