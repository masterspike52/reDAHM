// vs_c7b53ba0fe2a71e7.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 288 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000480 00300014 00000000 00000000 00004084 00000001 0000001C 00000004 00000290 0000000F 00115010 00025011 00035012 00245013 00106014 00007015 00203016 00125017 00035018 00245019 0010601A 0000701B 0020301C 0012501D 0003501E 0024501F 00106020 00007021 00203022 00125023 00035024 00245025 0000004D 0011504E 0002504F 00035050 00245051 0000F054 0001F156 0002F257 0003F358 0000105C 0000105B 0000105D 0000105E
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
//   vertex element: instruction 32 -> TANGENT0
//   vertex element: instruction 33 -> BINORMAL0
//   vertex element: instruction 34 -> NORMAL0
//   vertex element: instruction 35 -> TEXCOORD2
//   vertex element: instruction 36 -> TEXCOORD3
//   vertex element: instruction 37 -> TEXCOORD4
//   vertex element: instruction 77 -> POSITION0
//   vertex element: instruction 78 -> TEXCOORD1
//   vertex element: instruction 79 -> TEXCOORD2
//   vertex element: instruction 80 -> TEXCOORD3
//   vertex element: instruction 81 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightPositionAndInvRadius : register(c8); // float4[2]
float4 LightType : register(c7); // float[2]
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r2.x = float((LightType.x >= 0.9));
    r3.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r3.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.y = r0.y + r0.x;
    r1 = In.position0.wxyz;
    r18.xyz = In.texcoord1.xyz;
    r15.xyz = In.texcoord2.xyz;
    r17.xyz = In.texcoord3.xyz;
    r19.xyz = In.texcoord4.xyz;
    r10.xyz = In.tangent0.xyz;
    r9.xyz = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r13.xyz = In.texcoord2.xyz;
    r7.yzw = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r0.yzw = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r20.xyz = In.normal0.xyz;
    r12.y = In.texcoord2.z;
    r12.z = In.texcoord3.z;
    r12.w = In.texcoord4.z;
    r6.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r16.xyz = In.texcoord2.xyz;
    r2.yzw = In.texcoord3.xyz;
    r14.xyz = In.texcoord4.xyz;
    r5.xyz = r5.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r6.xyz = r6.zyx * 0.007843138 - 1.0;
    r8.xyz = r8.yxz * 0.007843138 - 1.0;
    r9.xyz = r9.xzy * 0.007843138 - 1.0;
    r10.xyz = r10.zyx * 0.007843138 - 1.0;
    r18.xyz = r18.xzy * r1.xxx;
    r20.xyz = r20.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    r4.x = dot(r0.ywz, r12.wyz);
    r0.y = r1.x;
    r4.y = dot(r4.zyw, r12.wyz);
    r12.x = ViewProjectionMatrix[3].z * r0.y;
    r4.z = dot(r20.zyx, r12.wyz);
    r12.y = ViewProjectionMatrix[3].w * r1.x;
    r0.yzw = r19.xyz * r1.www + r18.xzy;
    r0.yzw = r17.xzy * r1.zzz + r0.ywz;
    r0.yzw = r15.yzx * r1.yyy + r0.wzy;
    r1.xy = r0.zz * ViewProjectionMatrix[2].zw + r12.xy;
    r12.xyz = -r0.zyw * CameraPosition.www + CameraPosition.zyx;
    r15.xyz = -r0.zyw * r2.xxx + LightPositionAndInvRadius.zyx;
    r2.x = dot(r15.xzy, r16.zxy);
    r2.y = dot(r15.xzy, r2.wyz);
    r2.z = dot(r15.xzy, r14.zxy);
    r7.x = dot(r12.xzy, r13.zxy);
    r7.y = dot(r12.xzy, r7.wyz);
    r7.z = dot(r12.xzy, r11.zxy);
    r0.yz = r0.yy * ViewProjectionMatrix[1].zw + r1.xy;
    r1.xy = r0.ww * ViewProjectionMatrix[0].zw + r0.yz;
    r0.y = dot(r10.xzy, r7.zxy);
    r0.z = dot(r9.yxz, r7.zxy);
    r0.w = dot(r8.zyx, r7.zxy);
    r3.x = dot(r6.xzy, r2.zxy);
    r3.y = dot(r3.zyw, r2.zxy);
    r3.z = dot(r5.zyx, r2.zxy);
    r1.z = r0.x + 0.5;
    r1.z = r1.z * InvNumVerticesPerInstance.x;
    r1.w = trunc(r1.z);
    r1.w = r1.w * NumVerticesPerInstance.x;
    r1.w = trunc(-r1.w);
    r0.x = r1.w + r0.x;
    r5 = In.position0.yzwx;
    r2.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r8.xyz = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r7.xyz = r2.xyz * r5.zzz;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r7.xyz = r9.xzy * r5.yyy + r7.xzy;
    r5.xyz = r8.xyz * r5.xxx + r7.xzy;
    r5.xyz = r6.xzy * r5.www + r5.xzy;
    r2 = r5.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o1.zw = r1.xy;
    o1.xy = 1.0;
    o0.xyz = r3.xyz;
    o0.w = 0.0;
    o2.xyz = r0.yzw;
    o2.w = 0.0;
    o3.xyz = r4.xyz;
    o3.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    return Out;
}
