// vs_d52598bcbf693520.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 330 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000528 0050001A 00000000 00000000 000060C6 00000001 0000001F 00000006 00000290 00106010 00007011 00003012 00200013 00115014 00025015 00035016 00245017 00106018 00007019 0020301A 0012501B 0003501C 0024501D 0010601E 0000701F 00203020 00125021 00035022 00245023 00106024 00007025 00203026 00125027 00035028 00245029 00000059 0011505A 0002505B 0003505C 0024505D 0000F054 0001F156 0002F257 0003F358 0004F4A0 0005F5A1 00001069 00001067 0000106A 0000106B 0000106C 00001068
//   vertex element: instruction 16 -> TANGENT0
//   vertex element: instruction 17 -> BINORMAL0
//   vertex element: instruction 18 -> NORMAL0
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TEXCOORD1
//   vertex element: instruction 21 -> TEXCOORD2
//   vertex element: instruction 22 -> TEXCOORD3
//   vertex element: instruction 23 -> TEXCOORD4
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> TEXCOORD2
//   vertex element: instruction 28 -> TEXCOORD3
//   vertex element: instruction 29 -> TEXCOORD4
//   vertex element: instruction 30 -> TANGENT0
//   vertex element: instruction 31 -> BINORMAL0
//   vertex element: instruction 32 -> NORMAL0
//   vertex element: instruction 33 -> TEXCOORD2
//   vertex element: instruction 34 -> TEXCOORD3
//   vertex element: instruction 35 -> TEXCOORD4
//   vertex element: instruction 36 -> TANGENT0
//   vertex element: instruction 37 -> BINORMAL0
//   vertex element: instruction 38 -> NORMAL0
//   vertex element: instruction 39 -> TEXCOORD2
//   vertex element: instruction 40 -> TEXCOORD3
//   vertex element: instruction 41 -> TEXCOORD4
//   vertex element: instruction 89 -> POSITION0
//   vertex element: instruction 90 -> TEXCOORD1
//   vertex element: instruction 91 -> TEXCOORD2
//   vertex element: instruction 92 -> TEXCOORD3
//   vertex element: instruction 93 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
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
    r2.xyw = In.tangent0.xyz;
    r21.xyz = In.binormal0.xyz;
    r1.xyw = In.normal0.xyz;
    r3 = In.position0.wxyz;
    r4.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r23.xyz = In.texcoord3.xyz;
    r24.xyz = In.texcoord4.xyz;
    r17.yzw = In.tangent0.xyz;
    r12.xyz = In.binormal0.xyz;
    r11.xyz = In.normal0.xyz;
    r16.xyz = In.texcoord2.xyz;
    r15.xyz = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r26.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r25.xyz = In.normal0.xyz;
    r14.x = In.texcoord2.z;
    r14.y = In.texcoord3.z;
    r14.z = In.texcoord4.z;
    r10.xyz = In.tangent0.xyz;
    r9.xyz = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r19.xyz = In.texcoord2.xyz;
    r7.yzw = In.texcoord3.xyz;
    r18.xyz = In.texcoord4.xyz;
    r8.xyz = r8.yxz * 0.007843138 - 1.0;
    r9.xyz = r9.xzy * 0.007843138 - 1.0;
    r10.xyz = r10.zyx * 0.007843138 - 1.0;
    r11.xyz = r11.yxz * 0.007843138 - 1.0;
    r12.xyz = r12.xzy * 0.007843138 - 1.0;
    r20.y = -r2.y * 0.007843138 + 1.0;
    r20.xz = r2.xw * 0.007843138 - 1.0;
    r4.xyz = r4.xzy * r3.xxx;
    r22.xyz = r21.zxy * 0.007843138 - 1.0;
    r21.xyz = r1.ywx * 0.007843138 - 1.0;
    r25.xyz = r25.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r26.xyz = r26.zyx * 0.007843138 - 1.0;
    r5.x = dot(r26.xzy, r14.zxy);
    r5.y = dot(r5.zyw, r14.zxy);
    ps = r3.x;
    r5.z = dot(r25.zyx, r14.zxy);
    r0.y = ps;
    ps = ViewProjectionMatrix[3].z * r0.y;
    r14.xyz = r22.xxz * r21.xzz;
    r0.y = ps;
    r4.xyz = r24.xyz * r3.www + r4.xzy;
    r4.xyz = r23.xzy * r3.zzz + r4.xzy;
    r14.xyz = r22.zyy * r21.yyx - r14.xyz;
    ps = ViewProjectionMatrix[3].w * r3.x;
    r17.x = dot(r20.xyz, r14.xyz);
    r0.w = ps;
    r4.xyz = r6.yzx * r3.yyy + r4.zyx;
    r6.xy = r4.yy * ViewProjectionMatrix[2].zw + r0.yw;
    r14.xyz = -r4.yxz * CameraPosition.www + CameraPosition.zyx;
    r0.yzw = -r4.yxz * r0.zzz + LightPositionAndInvRadius.zyx;
    r6.w = r17.x * 0.5 + 0.5;
    r7.x = dot(r0.ywz, r19.zxy);
    r7.y = dot(r0.ywz, r7.wyz);
    r7.z = dot(r0.ywz, r18.zxy);
    r3.xyz = r17.wzy * 0.007843138 - 1.0;
    r0.y = dot(r14.xzy, r16.zxy);
    r0.z = dot(r14.xzy, r15.zxy);
    r0.w = dot(r14.xzy, r13.zxy);
    r4.xy = r4.xx * ViewProjectionMatrix[1].zw + r6.xy;
    r4.xy = r4.zz * ViewProjectionMatrix[0].zw + r4.xy;
    ps = 0.003921569 * r1.x;
    r3.x = dot(r3.xzy, r0.wyz);
    r6.x = ps;
    ps = 0.003921569 * r1.y;
    r3.y = dot(r12.yxz, r0.wyz);
    r6.y = ps;
    ps = 0.003921569 * r1.w;
    r3.z = dot(r11.zyx, r0.wyz);
    r6.z = ps;
    ps = 0.003921569 * r2.x;
    r0.y = dot(r10.xzy, r7.zxy);
    r1.x = ps;
    ps = 0.003921569 * r2.y;
    r0.z = dot(r9.yxz, r7.zxy);
    r1.y = ps;
    ps = 0.003921569 * r2.w;
    r0.w = dot(r8.zyx, r7.zxy);
    r1.z = ps;
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r2.x = trunc(r1.w);
    r2.x = r2.x * NumVerticesPerInstance.x;
    r2.x = trunc(-r2.x);
    r0.x = r2.x + r0.x;
    r7 = In.position0.yzwx;
    r2.xyz = In.texcoord1.xyz;
    r8.xyz = In.texcoord2.xyz;
    r10.xyz = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r9.xyz = r2.xyz * r7.zzz;
    r2 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r9.xyz = r11.xzy * r7.yyy + r9.xzy;
    r7.xyz = r10.xyz * r7.xxx + r9.xzy;
    r7.xyz = r8.xzy * r7.www + r7.xzy;
    r2 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r7.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r7.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o1.zw = r4.xy;
    o1.xy = 1.0;
    o5.xyz = r1.xyz;
    o5.w = 0.0;
    o0.xyz = r0.yzw;
    o0.w = 0.0;
    o2.xyz = r3.xyz;
    o2.w = 0.0;
    o3.xyz = r5.xyz;
    o3.w = 0.0;
    o4 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
