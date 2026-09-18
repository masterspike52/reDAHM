// vs_9078ddea231c9b07.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003D8 00300010 00000000 00000000 00003484 00000001 00000017 00000004 00000290 0000A00E 0000000F 00115010 00025011 00035012 00245013 00106014 00007015 00203016 00125017 00035018 00245019 0010601A 0000701B 0020301C 0012501D 0003501E 0024501F 0000003F 00115040 00025041 00035042 00245043 00003050 0001F156 00027257 0003F358 0000104D 00001050 0000104E 0000104F
//   vertex element: instruction 14 -> COLOR0
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
//   vertex element: instruction 18 -> TEXCOORD3
//   vertex element: instruction 19 -> TEXCOORD4
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> TEXCOORD2
//   vertex element: instruction 24 -> TEXCOORD3
//   vertex element: instruction 25 -> TEXCOORD4
//   vertex element: instruction 26 -> TANGENT0
//   vertex element: instruction 27 -> BINORMAL0
//   vertex element: instruction 28 -> NORMAL0
//   vertex element: instruction 29 -> TEXCOORD2
//   vertex element: instruction 30 -> TEXCOORD3
//   vertex element: instruction 31 -> TEXCOORD4
//   vertex element: instruction 63 -> POSITION0
//   vertex element: instruction 64 -> TEXCOORD1
//   vertex element: instruction 65 -> TEXCOORD2
//   vertex element: instruction 66 -> TEXCOORD3
//   vertex element: instruction 67 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c6); // float
float4 NumVerticesPerInstance : register(c7); // float
float4 ShadowCoordinateScaleBias : register(c5); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 color0 : COLOR0;
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r1.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.x = r0.y + r0.x;
    r3.xy = In.color0.xy;
    r7 = In.position0.yzwx;
    r1.xyz = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r12.xyz = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r0.yzw = In.tangent0.xyz;
    r6.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r10.xyz = In.texcoord2.xyz;
    r2.yzw = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r16.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r15.xyz = In.normal0.xyz;
    r14.x = In.texcoord2.z;
    r14.y = In.texcoord3.z;
    r14.z = In.texcoord4.z;
    r3.xy = r3.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r5.xyz = r5.yxz * 0.007843138 - 1.0;
    r6.xyz = r6.xzy * 0.007843138 - 1.0;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    r11.xyz = r1.xyz * r7.zzz;
    r1 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r15.xyz = r15.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r16.xyz = r16.zyx * 0.007843138 - 1.0;
    r4.x = dot(r16.xzy, r14.zxy);
    r4.y = dot(r4.zyw, r14.zxy);
    r4.z = dot(r15.zyx, r14.zxy);
    r11.xyz = r13.xzy * r7.yyy + r11.xzy;
    r7.xyz = r12.xyz * r7.xxx + r11.xzy;
    r7.xyz = r9.xzy * r7.www + r7.xzy;
    r1 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r9.xyz = -r7.yzx * CameraPosition.www + CameraPosition.zyx;
    r2.x = dot(r9.xzy, r10.zxy);
    r2.y = dot(r9.xzy, r2.wyz);
    r2.z = dot(r9.xzy, r8.zxy);
    r1 = r7.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r7.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    r0.y = dot(r0.ywz, r2.zxy);
    r0.z = dot(r6.yxz, r2.zxy);
    r0.w = dot(r5.zyx, r2.zxy);
    r2.x = r0.x + 0.5;
    r2.w = r2.x * InvNumVerticesPerInstance.x;
    r2.x = trunc(r2.w);
    r2.x = r2.x * NumVerticesPerInstance.x;
    r2.x = trunc(-r2.x);
    r0.x = r2.x + r0.x;
    r5 = In.position0.yzwx;
    r2.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r7.xyz = r2.xzy * r5.zzz;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r7.xyz = r9.xyz * r5.yyy + r7.xzy;
    r5.xyz = r8.xzy * r5.xxx + r7.xzy;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    r2 = r5.zzzz * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xy = r3.xy;
    o2.xyz = r0.yzw;
    o3.xyz = r4.xyz;
    o3.w = 0.0;
    o1 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    return Out;
}
