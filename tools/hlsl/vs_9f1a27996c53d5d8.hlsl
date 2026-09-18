// vs_9f1a27996c53d5d8.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 297 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004A4 00400015 00000000 00000000 000048A5 00000001 0000001D 00000005 00000290 0000A00F 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 0010601B 0000701C 0020301D 0012501E 0003501F 00245020 00106021 00007022 00203023 00125024 00035025 00245026 0000004F 00115050 00025051 00035052 00245053 00003050 0001F154 0002F256 0003F357 0004F458 0000105D 0000105F 0000105E 00001060 00001061
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
//   vertex element: instruction 33 -> TANGENT0
//   vertex element: instruction 34 -> BINORMAL0
//   vertex element: instruction 35 -> NORMAL0
//   vertex element: instruction 36 -> TEXCOORD2
//   vertex element: instruction 37 -> TEXCOORD3
//   vertex element: instruction 38 -> TEXCOORD4
//   vertex element: instruction 79 -> POSITION0
//   vertex element: instruction 80 -> TEXCOORD1
//   vertex element: instruction 81 -> TEXCOORD2
//   vertex element: instruction 82 -> TEXCOORD3
//   vertex element: instruction 83 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c6); // float
float4 LightPositionAndInvRadius : register(c9); // float4[2]
float4 LightType : register(c8); // float[2]
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
    float4 texcoord4 : TEXCOORD4;
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r2.z = float((LightType.x >= 0.9));
    r0.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r3.x = r0.y + r0.x;
    r0.yz = In.color0.xy;
    r1 = In.position0.wxyz;
    r13.xyz = In.texcoord1.xyz;
    r16.xyz = In.texcoord2.xyz;
    r18.xyz = In.texcoord3.xyz;
    r19.xyz = In.texcoord4.xyz;
    r11.xyz = In.tangent0.xyz;
    r10.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r5.xyz = In.tangent0.xyz;
    r2.xyw = In.binormal0.xyz;
    r21.xyz = In.normal0.xyz;
    r20.x = In.texcoord2.z;
    r20.y = In.texcoord3.z;
    r20.z = In.texcoord4.z;
    r7.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r17.xyz = In.texcoord2.xyz;
    r3.yzw = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r0.zw = r0.yz * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r7.xyz = r7.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r10.xyz = r10.xzy * 0.007843138 - 1.0;
    r11.xyz = r11.zyx * 0.007843138 - 1.0;
    r13.xyz = r13.xyz * r1.xxx;
    r21.xyz = r21.yxz * 0.007843138 - 1.0;
    r2.xyw = r2.xwy * 0.007843138 - 1.0;
    r5.xyz = r5.zyx * 0.007843138 - 1.0;
    r5.x = dot(r5.xzy, r20.zxy);
    r0.y = r1.x;
    r5.y = dot(r2.yxw, r20.zxy);
    r2.x = ViewProjectionMatrix[3].z * r0.y;
    r5.z = dot(r21.zyx, r20.zxy);
    r2.y = ViewProjectionMatrix[3].w * r1.x;
    r13.xyz = r19.xzy * r1.www + r13.xzy;
    r13.xyz = r18.xyz * r1.zzz + r13.xzy;
    r1.xyz = r16.zyx * r1.yyy + r13.zyx;
    r2.xy = r1.xx * ViewProjectionMatrix[2].zw + r2.xy;
    r13.xyz = -r1.xyz * CameraPosition.www + CameraPosition.zyx;
    r16.xyz = -r1.xyz * r2.zzz + LightPositionAndInvRadius.zyx;
    r3.x = dot(r16.xzy, r17.zxy);
    r3.y = dot(r16.xzy, r3.wyz);
    r3.z = dot(r16.xzy, r15.zxy);
    r8.x = dot(r13.xzy, r14.zxy);
    r8.y = dot(r13.xzy, r8.wyz);
    r8.z = dot(r13.xzy, r12.zxy);
    r1.xy = r1.yy * ViewProjectionMatrix[1].zw + r2.xy;
    r2.xy = r1.zz * ViewProjectionMatrix[0].zw + r1.xy;
    r1.x = dot(r11.xzy, r8.zxy);
    r1.y = dot(r10.yxz, r8.zxy);
    r1.z = dot(r9.zyx, r8.zxy);
    r4.x = dot(r7.xzy, r3.zxy);
    r4.y = dot(r4.zyw, r3.zxy);
    r4.z = dot(r6.zyx, r3.zxy);
    r0.y = r0.x + 0.5;
    r0.y = r0.y * InvNumVerticesPerInstance.x;
    r1.w = trunc(r0.y);
    r1.w = r1.w * NumVerticesPerInstance.x;
    r1.w = trunc(-r1.w);
    r0.x = r1.w + r0.x;
    r6 = In.position0.yzwx;
    r3.xyz = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r8.xyz = r3.xzy * r6.zzz;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r10.xyz * r6.yyy + r8.xzy;
    r6.xyz = r9.xzy * r6.xxx + r8.xzy;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    r3 = r6.zzzz * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    o0.xy = r0.zw;
    o2.zw = r2.xy;
    o2.xy = 1.0;
    o1.xyz = r4.xyz;
    o1.w = 0.0;
    o3.xyz = r1.xyz;
    o3.w = 0.0;
    o4.xyz = r5.xyz;
    o4.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.texcoord8 = o4;
    return Out;
}
