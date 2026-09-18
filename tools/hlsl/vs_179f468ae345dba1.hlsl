// vs_179f468ae345dba1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 318 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004F8 00400015 00000000 00000000 000050A5 00000001 0000001D 00000005 00000290 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 0010601B 0000701C 0020301D 0012501E 0003501F 00245020 00106021 00007022 00203023 00125024 00035025 00045026 00355027 0000004F 00115050 00025051 00035052 00245053 0000F053 0001F154 0002F256 0003F357 0004F458 00001068 00001062 00001061 00001063 00001064
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
//   vertex element: instruction 39 -> TEXCOORD5
//   vertex element: instruction 79 -> POSITION0
//   vertex element: instruction 80 -> TEXCOORD1
//   vertex element: instruction 81 -> TEXCOORD2
//   vertex element: instruction 82 -> TEXCOORD3
//   vertex element: instruction 83 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightMapScale : register(c7); // float3
float4 LightPositionAndInvRadius : register(c9); // float4[2]
float4 LightType : register(c8); // float[2]
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
    float4 texcoord5 : TEXCOORD5;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord3 : TEXCOORD3;
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
    r2.w = float((LightType.x >= 0.9));
    r2.x = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r2.x);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.y = r0.y + r0.x;
    r1 = In.position0.wxyz;
    r19.xyz = In.texcoord1.xyz;
    r16.xyz = In.texcoord2.xyz;
    r18.xyz = In.texcoord3.xyz;
    r20.xyz = In.texcoord4.xyz;
    r11.xyz = In.tangent0.xyz;
    r10.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r0.yzw = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r21.xyz = In.normal0.xyz;
    r13.y = In.texcoord2.z;
    r13.z = In.texcoord3.z;
    r13.w = In.texcoord4.z;
    r7.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r17.xyz = In.texcoord2.xyz;
    r3.yzw = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r2.xyz = In.texcoord5.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r7.xyz = r7.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r10.xyz = r10.xzy * 0.007843138 - 1.0;
    r11.xyz = r11.zyx * 0.007843138 - 1.0;
    r19.xyz = r19.xzy * r1.xxx;
    r21.xyz = r21.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    r5.x = dot(r0.ywz, r13.wyz);
    r0.y = r1.x;
    r5.y = dot(r5.zyw, r13.wyz);
    r13.x = ViewProjectionMatrix[3].z * r0.y;
    r5.z = dot(r21.zyx, r13.wyz);
    r13.y = ViewProjectionMatrix[3].w * r1.x;
    r0.yzw = r20.xyz * r1.www + r19.xzy;
    r0.yzw = r18.xzy * r1.zzz + r0.ywz;
    r0.yzw = r16.yzx * r1.yyy + r0.wzy;
    r1.xy = r0.zz * ViewProjectionMatrix[2].zw + r13.xy;
    r13.xyz = -r0.zyw * CameraPosition.www + CameraPosition.zyx;
    r16.xyz = -r0.zyw * r2.www + LightPositionAndInvRadius.zyx;
    r3.x = dot(r16.xzy, r17.zxy);
    r3.y = dot(r16.xzy, r3.wyz);
    r3.z = dot(r16.xzy, r15.zxy);
    r8.x = dot(r13.xzy, r14.zxy);
    r8.y = dot(r13.xzy, r8.wyz);
    r8.z = dot(r13.xzy, r12.zxy);
    r0.yz = r0.yy * ViewProjectionMatrix[1].zw + r1.xy;
    r1.xy = r0.ww * ViewProjectionMatrix[0].zw + r0.yz;
    r0.y = dot(r11.xzy, r8.zxy);
    r0.z = dot(r10.yxz, r8.zxy);
    r0.w = dot(r9.zyx, r8.zxy);
    r4.x = dot(r7.xzy, r3.zxy);
    r4.y = dot(r4.zyw, r3.zxy);
    r4.z = dot(r6.zyx, r3.zxy);
    r1.z = r0.x + 0.5;
    r1.z = r1.z * InvNumVerticesPerInstance.x;
    r1.w = trunc(r1.z);
    r1.w = r1.w * NumVerticesPerInstance.x;
    r1.w = trunc(-r1.w);
    r0.x = r1.w + r0.x;
    r6 = In.position0.yzwx;
    r3.xyz = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r8.xyz = r3.xyz * r6.zzz;
    r3 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r10.xzy * r6.yyy + r8.xzy;
    r6.xyz = r9.xyz * r6.xxx + r8.xzy;
    r6.xyz = r7.xzy * r6.www + r6.xzy;
    r3 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r6.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r6.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    r3.x = log2(abs(r2.x));
    r3.y = log2(abs(r2.y));
    r3.z = log2(abs(r2.z));
    r2.xyz = r3.xyz * 2.2;
    o2.zw = r1.xy;
    o2.xy = 1.0;
    o1.xyz = r4.xyz;
    o1.w = 0.0;
    o3.xyz = r0.yzw;
    o3.w = 0.0;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    r0.x = pow(2.0, r2.x);
    r0.y = pow(2.0, r2.y);
    r0.z = pow(2.0, r2.z);
    o0.xyz = r0.xyz * LightMapScale.xyz;
    o0.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord3 = o0;
    Out.texcoord4 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.texcoord8 = o4;
    return Out;
}
