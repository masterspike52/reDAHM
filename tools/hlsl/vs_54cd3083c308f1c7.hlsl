// vs_54cd3083c308f1c7.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000036C 0051000A 00000000 00000000 000050C6 00000001 00000005 00000006 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 00027254 0003F355 00047456 0005F557 00001042 00001046 00001043 00001044 00001045 00001047
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LightPositionAndInvRadius : register(c13); // float4
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
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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

    r5 = In.position0;
    r3 = In.normal0;
    r4.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.xzw = r3.www * LocalToWorld[3].xyz;
    r0.xzw = r3.zzz * LocalToWorld[2].xzy + r0.xwz;
    r1 = r5.wwww * LocalToWorld[3];
    r0.y = frac(r0.y);
    r1 = r5.zzzz * LocalToWorld[2] + r1;
    r1 = r5.yyyy * LocalToWorld[1] + r1;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r0.xzw = r3.yyy * LocalToWorld[1].xyz + r0.xwz;
    r3.xyz = r3.xxx * LocalToWorld[0].xzy + r0.xwz;
    r0.x = cos(r0.y);
    r1 = r5.xxxx * LocalToWorld[0].yzxw + r1.yzxw;
    r8.xyz = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    r4.z = float((ScreenAlignment.x > 1.5));
    r6.w = (-1.0) * r0.x;
    ps = sin(r0.y);
    r0.xzw = r0.xxx * CameraRight.zyx;
    r4.w = ps;
    ps = r1.z;
    r6.xyz = r4.www * CameraRight.zyx;
    r0.y = ps;
    ps = CameraWorldPosition.x - r0.y;
    r7.xyz = r1.zxy - r3.xzy;
    r10.x = ps;
    ps = CameraWorldPosition.y - r1.x;
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r10.y = ps;
    r6.xzw = r6.www * CameraUp.zyx + r6.xyz;
    r9.xyz = r4.www * CameraUp.zyx + r0.xzw;
    ps = CameraWorldPosition.z - r1.y;
    r0.x = dot(r7.zxy, r7.zxy);
    r10.z = ps;
    r0.y = dot(r10.zxy, r10.zxy);
    r3 = r1.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.zzzz * ViewProjectionMatrix[0] + r3.xzyw;
    r0.xy = max(r0.xy, 0.01);
    ps = rsqrt(abs(r0.y));
    r1.xyz = -r1.zxy + LightPositionAndInvRadius.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r10.zyx * r0.zzz;
    r0.x = ps;
    r7.xyz = r7.zyx * r0.xxx;
    r0.xzw = r10.xzy * r7.yxz;
    r9.xyz = (-abs(r4.zzz) >= 0.0) ? r9.zyx : r7.zyx;
    r0.y = dot(r8.xzy, r9.zxy);
    r7.xyz = r10.zxy * r7.yzx - r0.wzx;
    r0.x = dot(r7.xzy, r7.xzy);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r6.y = dot(r1.zxy, r9.zxy);
    r0.x = ps;
    r0.xzw = r7.zyx * r0.xxx;
    r6.xzw = (-abs(r4.zzz) >= 0.0) ? r6.wzx : r0.xzw;
    r0.x = dot(r8.xzy, r6.wxz);
    r7.xyz = r6.zxw * r9.xzy;
    r7.xyz = r6.xwz * r9.yxz - r7.xyz;
    r0.z = dot(r7.xzy, r7.xzy);
    ps = rsqrt(abs(r0.z));
    r6.x = dot(r1.zxy, r6.wxz);
    r0.z = ps;
    r7.xyz = r7.xyz * r0.zzz;
    r0.z = dot(-r7.xzy, r8.xzy);
    r6.z = dot(-r7.xzy, r1.zxy);
    r7 = r5.wwww * LocalToWorld[3].xwzy;
    r7 = r5.zzzz * LocalToWorld[2].xwzy + r7;
    r7 = r5.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r7 = r5.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r5 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r7.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r7.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    o0.xy = r4.xy;
    o2.xyz = r6.xyz;
    o3.xyz = r1.xyz * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r0.xyz;
    o1 = r2;
    o5 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
