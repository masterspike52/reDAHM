// vs_86e57b66976e1ef1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000330 0031000A 00000000 00000000 00003484 00000001 00000005 00000004 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 0002F255 00037356 0000103F 00001041 00001042 00001040
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
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
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
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
    float4 oPos = 0.0;
    float ps = 0.0;

    r2 = In.position0;
    r5 = In.normal0;
    r1.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r3 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.xzw = r5.www * LocalToWorld[3].xyz;
    r0.xzw = r5.zzz * LocalToWorld[2].xzy + r0.xwz;
    ps = frac(r0.y);
    r4 = r2.wwww * LocalToWorld[3];
    r0.y = ps;
    r4 = r2.zzzz * LocalToWorld[2] + r4;
    r4 = r2.yyyy * LocalToWorld[1] + r4;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r0.xzw = r5.yyy * LocalToWorld[1].xyz + r0.xwz;
    r6.xyz = r5.xxx * LocalToWorld[0].xzy + r0.xwz;
    ps = cos(r0.y);
    r0.z = CameraUp.x * (-1.0);
    r0.x = ps;
    r8 = r2.xxxx * LocalToWorld[0] + r4;
    r5.xyz = -r8.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = r0.xxx * CameraRight.zyx;
    r9.xyz = -r8.xyz + CameraWorldPosition.xyz;
    r7.xyz = r8.xyz - r6.xzy;
    ps = sin(r0.y);
    r10 = r8.wwww * ViewProjectionMatrix[3].xwzy;
    r4.w = ps;
    r4.xyz = r4.www * CameraUp.zyx + r4.xyz;
    ps = (-1.0) * r0.x;
    r1.z = dot(r7.zxy, r7.zxy);
    r0.y = ps;
    ps = r0.z;
    r1.w = dot(r9.zxy, r9.zxy);
    ps = r0.x * ps;
    r6.xy = r0.yy * CameraUp.zy;
    r6.z = ps;
    r0 = r8.zzzz * ViewProjectionMatrix[2].xwzy + r10;
    r0 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r8.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    r6.xyz = r4.www * CameraRight.zyx + r6.xyz;
    r8.xy = max(r1.zw, 0.01);
    ps = rsqrt(abs(r8.y));
    r1.z = float((ScreenAlignment.x > 1.5));
    r1.w = ps;
    ps = rsqrt(abs(r8.x));
    r9.xyz = r9.zyx * r1.www;
    r1.w = ps;
    r8.xyz = r7.zyx * r1.www;
    r7.xyz = (-abs(r1.zzz) >= 0.0) ? r4.zyx : r8.zyx;
    r4.xyz = r9.xzy * r8.yxz;
    r4.xzw = r9.zxy * r8.yzx - r4.zyx;
    r1.w = dot(r4.xwz, r4.xwz);
    r1.w = max(r1.w, 0.01);
    ps = rsqrt(abs(r1.w));
    r4.y = dot(r5.xzy, r7.zxy);
    r1.w = ps;
    r4.xzw = r4.wzx * r1.www;
    r4.xzw = (-abs(r1.zzz) >= 0.0) ? r6.zyx : r4.xzw;
    r6.xyz = r4.zxw * r7.xzy;
    r6.xyz = r4.xwz * r7.yxz - r6.xyz;
    r1.z = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r1.z));
    r4.x = dot(r5.xzy, r4.wxz);
    r1.z = ps;
    r6.xyz = r6.xyz * r1.zzz;
    r4.z = dot(-r6.xzy, r5.xzy);
    r5 = r2.wwww * LocalToWorld[3].xwzy;
    r5 = r2.zzzz * LocalToWorld[2].xwzy + r5;
    r5 = r2.yyyy * LocalToWorld[1].xzyw + r5.xzwy;
    r5 = r2.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xy = r1.xy;
    o3.xyz = r4.xyz;
    o1 = r3;
    o2 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    return Out;
}
