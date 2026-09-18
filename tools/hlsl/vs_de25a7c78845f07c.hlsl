// vs_de25a7c78845f07c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000036C 0051000A 00000000 00000000 000050C6 00000001 00000005 00000006 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 00027254 0003F355 00047456 0005F557 00001043 00001046 00001044 00001042 00001045 00001047
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
float4 LightDirection : register(c13); // float3
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

    r3 = In.position0;
    r5 = In.normal0;
    r2.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r4 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.xzw = r5.www * LocalToWorld[3].xyz;
    r0.xzw = r5.zzz * LocalToWorld[2].xzy + r0.xwz;
    r1 = r3.wwww * LocalToWorld[3];
    r0.y = frac(r0.y);
    r1 = r3.zzzz * LocalToWorld[2] + r1;
    r1 = r3.yyyy * LocalToWorld[1] + r1;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r0.xzw = r5.yyy * LocalToWorld[1].xyz + r0.xwz;
    r5.xyz = r5.xxx * LocalToWorld[0].xzy + r0.xwz;
    r0.x = cos(r0.y);
    r1 = r3.xxxx * LocalToWorld[0].yzxw + r1.yzxw;
    r7.xyz = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    r2.w = (-1.0) * r0.x;
    ps = sin(r0.y);
    r0.xzw = r0.xxx * CameraRight.zyx;
    r2.z = ps;
    ps = r1.z;
    r6.xyz = r2.zzz * CameraRight.zyx;
    r0.y = ps;
    ps = CameraWorldPosition.x - r0.y;
    r10.xyz = r1.zxy - r5.xzy;
    r9.x = ps;
    ps = CameraWorldPosition.y - r1.x;
    r5 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r9.y = ps;
    r6.xyz = r2.www * CameraUp.zyx + r6.xyz;
    r8.xyz = r2.zzz * CameraUp.zyx + r0.xzw;
    ps = CameraWorldPosition.z - r1.y;
    r0.x = dot(r10.zxy, r10.zxy);
    r9.z = ps;
    r0.y = dot(r9.zxy, r9.zxy);
    r5 = r1.yyyy * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r1.xxxx * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r1.zzzz * ViewProjectionMatrix[0] + r5.xzyw;
    r0.xy = max(r0.xy, 0.01);
    ps = rsqrt(abs(r0.y));
    r1.x = float((ScreenAlignment.x > 1.5));
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r9.zyx * r0.zzz;
    r0.x = ps;
    r1.yzw = r10.zyx * r0.xxx;
    r0.xzw = r9.xzy * r1.zyw;
    r8.xyz = (-abs(r1.xxx) >= 0.0) ? r8.zyx : r1.wzy;
    r0.y = dot(r7.xzy, r8.zxy);
    r9.xyz = r9.zxy * r1.zwy - r0.wzx;
    r0.x = dot(r9.xzy, r9.xzy);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r1.y = dot(r8.zxy, LightDirection.zxy);
    r0.x = ps;
    r0.xzw = r9.zyx * r0.xxx;
    r1.xzw = (-abs(r1.xxx) >= 0.0) ? r6.zyx : r0.xzw;
    r0.x = dot(r7.xzy, r1.wxz);
    r6.xyz = r1.zxw * r8.xzy;
    r6.xyz = r1.xwz * r8.yxz - r6.xyz;
    r0.z = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r0.z));
    r1.x = dot(r1.wxz, LightDirection.zxy);
    r0.z = ps;
    r6.xyz = r6.xyz * r0.zzz;
    r0.z = dot(-r6.xzy, r7.xzy);
    r1.z = dot(-r6.xzy, LightDirection.zxy);
    r6 = r3.wwww * LocalToWorld[3].xwzy;
    r6 = r3.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r3.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r3.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r6.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r2.xy;
    o2.xyz = r1.xyz;
    o4.xyz = r0.xyz;
    o1 = r4;
    o5 = r5;

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
