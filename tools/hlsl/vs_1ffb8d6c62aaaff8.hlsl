// vs_1ffb8d6c62aaaff8.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 324 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000510 00500017 00000000 00000000 000058C6 00000001 0000001E 00000006 00000290 00105010 00200011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 0010601C 0000701D 0020301E 0012501F 00035020 00245021 00106022 00007023 00203024 00125025 00035026 00045027 00255028 00000050 00115051 00025052 00035053 00245054 00003050 0001F153 0002F254 0003F356 0004F457 0005F558 00001062 0000106A 00001064 00001063 00001065 00001066
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> TEXCOORD1
//   vertex element: instruction 19 -> TEXCOORD2
//   vertex element: instruction 20 -> TEXCOORD3
//   vertex element: instruction 21 -> TEXCOORD4
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> TEXCOORD2
//   vertex element: instruction 26 -> TEXCOORD3
//   vertex element: instruction 27 -> TEXCOORD4
//   vertex element: instruction 28 -> TANGENT0
//   vertex element: instruction 29 -> BINORMAL0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> TEXCOORD2
//   vertex element: instruction 32 -> TEXCOORD3
//   vertex element: instruction 33 -> TEXCOORD4
//   vertex element: instruction 34 -> TANGENT0
//   vertex element: instruction 35 -> BINORMAL0
//   vertex element: instruction 36 -> NORMAL0
//   vertex element: instruction 37 -> TEXCOORD2
//   vertex element: instruction 38 -> TEXCOORD3
//   vertex element: instruction 39 -> TEXCOORD4
//   vertex element: instruction 40 -> TEXCOORD5
//   vertex element: instruction 80 -> POSITION0
//   vertex element: instruction 81 -> TEXCOORD1
//   vertex element: instruction 82 -> TEXCOORD2
//   vertex element: instruction 83 -> TEXCOORD3
//   vertex element: instruction 84 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
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
    float4 texcoord0 : TEXCOORD0;
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = 0.5 + r0.x;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r0.z = float((LightType.x >= 0.9));
    r0.w = ps;
    ps = trunc(r0.w);
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r0.y = r0.y + r0.x;
    r2.xy = In.texcoord0.xy;
    r1 = In.position0.wxyz;
    r13.xyz = In.texcoord1.xyz;
    r18.xyz = In.texcoord2.xyz;
    r19.xyz = In.texcoord3.xyz;
    r20.xyz = In.texcoord4.xyz;
    r11.xyz = In.tangent0.xyz;
    r10.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r15.xyz = In.texcoord2.xyz;
    r14.xyz = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r23.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r22.xyz = In.normal0.xyz;
    r21.x = In.texcoord2.z;
    r21.y = In.texcoord3.z;
    r21.z = In.texcoord4.z;
    r8.xyz = In.tangent0.xyz;
    r7.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r17.xyz = In.texcoord2.xyz;
    r3.yzw = In.texcoord3.xyz;
    r16.xyz = In.texcoord4.xyz;
    r4.xyz = In.texcoord5.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r7.xyz = r7.xzy * 0.007843138 - 1.0;
    r8.xyz = r8.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r10.xyz = r10.xzy * 0.007843138 - 1.0;
    r11.xyz = r11.zyx * 0.007843138 - 1.0;
    r13.xyz = r13.xyz * r1.xxx;
    r22.xyz = r22.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r23.xyz = r23.zyx * 0.007843138 - 1.0;
    ps = r1.x;
    r5.x = dot(r23.xzy, r21.zxy);
    r0.y = ps;
    ps = ViewProjectionMatrix[3].z * r0.y;
    r5.y = dot(r5.zyw, r21.zxy);
    r0.y = ps;
    ps = ViewProjectionMatrix[3].w * r1.x;
    r5.z = dot(r22.zyx, r21.zxy);
    r0.w = ps;
    r13.xyz = r20.xzy * r1.www + r13.xzy;
    r13.xyz = r19.xyz * r1.zzz + r13.xzy;
    r1.xyz = r18.zyx * r1.yyy + r13.zyx;
    r2.zw = r1.xx * ViewProjectionMatrix[2].zw + r0.yw;
    r13.xyz = -r1.xyz * CameraPosition.www + CameraPosition.zyx;
    r0.yzw = -r1.xyz * r0.zzz + LightPositionAndInvRadius.zyx;
    r3.x = dot(r0.ywz, r17.zxy);
    r3.y = dot(r0.ywz, r3.wyz);
    r3.z = dot(r0.ywz, r16.zxy);
    r0.y = dot(r13.xzy, r15.zxy);
    r0.z = dot(r13.xzy, r14.zxy);
    r0.w = dot(r13.xzy, r12.zxy);
    r1.xy = r1.yy * ViewProjectionMatrix[1].zw + r2.zw;
    r2.zw = r1.zz * ViewProjectionMatrix[0].zw + r1.xy;
    r1.x = dot(r11.xzy, r0.wyz);
    r1.y = dot(r10.yxz, r0.wyz);
    r1.z = dot(r9.zyx, r0.wyz);
    r0.y = dot(r8.xzy, r3.zxy);
    r0.z = dot(r7.yxz, r3.zxy);
    r0.w = dot(r6.zyx, r3.zxy);
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r3.x = trunc(r1.w);
    r3.x = r3.x * NumVerticesPerInstance.x;
    r3.x = trunc(-r3.x);
    r0.x = r3.x + r0.x;
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
    ps = log2(abs(r4.x));
    r3.x = ps;
    ps = log2(abs(r4.y));
    r3.y = ps;
    ps = log2(abs(r4.z));
    r3.z = ps;
    r3.xyz = r3.xyz * 2.2;
    o0.xy = r2.xy;
    o3.zw = r2.zw;
    o3.xy = 1.0;
    o2.xyz = r0.yzw;
    o2.w = 0.0;
    o4.xyz = r1.xyz;
    o4.w = 0.0;
    o5.xyz = r5.xyz;
    o5.w = 0.0;
    ps = pow(2.0, r3.x);
    r0.x = ps;
    ps = pow(2.0, r3.y);
    r0.y = ps;
    ps = pow(2.0, r3.z);
    r0.z = ps;
    o1.xyz = r0.xyz * LightMapScale.xyz;
    o1.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord3 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
