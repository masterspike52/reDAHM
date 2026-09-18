// vs_43a889ef250d693b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000324 00310009 00000000 00000000 00003484 00000001 00000005 00000004 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 0002F256 00037357 00001040 00001041 0000103F 0000103E
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r2 = In.position0;
    r4 = In.normal0.yzwx;
    r0.yz = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r1 = In.texcoord1;
    r0.x = r0.w * 0.15915494 + 0.5;
    r3.xyz = r4.zzz * LocalToWorld[3].xyz;
    r5.xyz = r4.yyy * LocalToWorld[2].xzy + r3.xzy;
    ps = frac(r0.x);
    r3 = r2.wwww * LocalToWorld[3];
    r0.x = ps;
    r3 = r2.zzzz * LocalToWorld[2] + r3;
    r3 = r2.yyyy * LocalToWorld[1] + r3;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r4.xyz = r4.xxx * LocalToWorld[1].xyz + r5.xzy;
    r6.xyz = r4.www * LocalToWorld[0].xzy + r4.xzy;
    ps = cos(r0.w);
    r5.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r3 = r2.xxxx * LocalToWorld[0] + r3;
    r5.xyz = -r3.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = r0.xxx * CameraRight.zyx;
    r9.xyz = -r3.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r7.xyz = r3.xyz - r6.xzy;
    r0.w = ps;
    r4.xyz = r0.www * CameraUp.zyx + r4.xyz;
    ps = (-1.0) * r0.x;
    r8.x = dot(r7.zxy, r7.zxy);
    r4.w = ps;
    ps = r5.w;
    r8.y = dot(r9.zxy, r9.zxy);
    ps = r0.x * ps;
    r6.xy = r4.ww * CameraUp.zy;
    r6.z = ps;
    r6.xyz = r0.www * CameraRight.zyx + r6.xyz;
    r8.xy = max(r8.xy, 0.01);
    ps = rsqrt(abs(r8.y));
    r0.x = float((ScreenAlignment.x > 1.5));
    r0.w = ps;
    ps = rsqrt(abs(r8.x));
    r9.xyz = r9.zyx * r0.www;
    r0.w = ps;
    r8.xyz = r7.zyx * r0.www;
    r7.xyz = (-abs(r0.xxx) >= 0.0) ? r4.zyx : r8.zyx;
    r4.xyz = r9.xzy * r8.yxz;
    r4.xzw = r9.zxy * r8.yzx - r4.zyx;
    r0.w = dot(r4.xwz, r4.xwz);
    r0.w = max(r0.w, 0.01);
    ps = rsqrt(abs(r0.w));
    r4.y = dot(r5.xzy, r7.zxy);
    r0.w = ps;
    r4.xzw = r4.wzx * r0.www;
    r4.xzw = (-abs(r0.xxx) >= 0.0) ? r6.zyx : r4.xzw;
    r6.xyz = r4.zxw * r7.xzy;
    r6.xyz = r4.xwz * r7.yxz - r6.xyz;
    r0.x = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r0.x));
    r4.x = dot(r5.xzy, r4.wxz);
    r0.x = ps;
    r6.xyz = r6.xyz * r0.xxx;
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
    r2 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r3.zzzz * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    o3.xyz = r4.xyz;
    o2 = r3.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    o0.xy = r0.yz;
    o1 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
