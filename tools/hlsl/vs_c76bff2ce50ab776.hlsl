// vs_c76bff2ce50ab776.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000420 00500012 00000000 00000000 000048C6 00000001 00000018 00000006 00000290 0000500E 0000A00F 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 0010601B 0000701C 0020301D 0012501E 0003501F 00245020 00000043 00115044 00025045 00035046 00245047 00003050 00013151 00027254 0003F355 00047456 0005F557 00001052 00001053 00001054 00001051 00001055 00001056
//   vertex element: instruction 14 -> TEXCOORD0
//   vertex element: instruction 15 -> COLOR0
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> TEXCOORD1
//   vertex element: instruction 18 -> TEXCOORD2
//   vertex element: instruction 19 -> TEXCOORD3
//   vertex element: instruction 20 -> TEXCOORD4
//   vertex element: instruction 21 -> TANGENT0
//   vertex element: instruction 22 -> BINORMAL0
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> TEXCOORD2
//   vertex element: instruction 25 -> TEXCOORD3
//   vertex element: instruction 26 -> TEXCOORD4
//   vertex element: instruction 27 -> TANGENT0
//   vertex element: instruction 28 -> BINORMAL0
//   vertex element: instruction 29 -> NORMAL0
//   vertex element: instruction 30 -> TEXCOORD2
//   vertex element: instruction 31 -> TEXCOORD3
//   vertex element: instruction 32 -> TEXCOORD4
//   vertex element: instruction 67 -> POSITION0
//   vertex element: instruction 68 -> TEXCOORD1
//   vertex element: instruction 69 -> TEXCOORD2
//   vertex element: instruction 70 -> TEXCOORD3
//   vertex element: instruction 71 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c6); // float
float4 LightDirection : register(c8); // float3
float4 NumVerticesPerInstance : register(c7); // float
float4 ShadowCoordinateScaleBias : register(c5); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 texcoord0 : TEXCOORD0;
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r1.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r3.x = r0.y + r0.x;
    r2.zw = In.texcoord0.xy;
    r2.xy = In.color0.xy;
    r7 = In.position0.yzwx;
    r11.xyz = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r12.xyz = In.texcoord3.xyz;
    r16.xyz = In.texcoord4.xyz;
    r1.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r10.xyz = In.texcoord2.xyz;
    r3.yzw = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r0.yzw = In.tangent0.xyz;
    r15.xyz = In.binormal0.xyz;
    r14.xyz = In.normal0.xyz;
    r18.xyz = In.texcoord2.xyz;
    r13.yzw = In.texcoord3.xyz;
    r17.xyz = In.texcoord4.xyz;
    r2.xy = r2.xy * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r5.xyz = r5.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r6.xyz = r1.zyx * 0.007843138 - 1.0;
    r1 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r14.xyz = r14.yxz * 0.007843138 - 1.0;
    r15.xyz = r15.xzy * 0.007843138 - 1.0;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    r13.x = dot(r18.zxy, LightDirection.zxy);
    r13.y = dot(r13.wyz, LightDirection.zxy);
    r13.z = dot(r17.zxy, LightDirection.zxy);
    r11.xyz = r11.xzy * r7.zzz;
    r11.xyz = r16.xyz * r7.yyy + r11.xzy;
    r0.y = dot(r0.ywz, r13.zxy);
    r0.z = dot(r15.yxz, r13.zxy);
    r0.w = dot(r14.zyx, r13.zxy);
    r7.xyz = r12.xzy * r7.xxx + r11.xzy;
    r7.xyz = r9.xyz * r7.www + r7.xzy;
    r1 = r7.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r9.xyz = -r7.zyx * CameraPosition.www + CameraPosition.zyx;
    r3.x = dot(r9.xzy, r10.zxy);
    r3.y = dot(r9.xzy, r3.wyz);
    r3.z = dot(r9.xzy, r8.zxy);
    r1 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r7.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    r4.x = dot(r6.xzy, r3.zxy);
    r4.y = dot(r4.zyw, r3.zxy);
    r4.z = dot(r5.zyx, r3.zxy);
    r3.x = r0.x + 0.5;
    r3.w = r3.x * InvNumVerticesPerInstance.x;
    r3.x = trunc(r3.w);
    r3.x = r3.x * NumVerticesPerInstance.x;
    r3.x = trunc(-r3.x);
    r0.x = r3.x + r0.x;
    r5 = In.position0.yzwx;
    r3.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r7.xyz = r3.xyz * r5.zzz;
    r3 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r7.xyz = r9.xzy * r5.yyy + r7.xzy;
    r5.xyz = r8.xyz * r5.xxx + r7.xzy;
    r5.xyz = r6.xzy * r5.www + r5.xzy;
    r3 = r5.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r5.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o0.xy = r2.xy;
    o1.xy = r2.zw;
    o2.xyz = r0.yzw;
    o4.xyz = r4.xyz;
    o5 = r1;

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
