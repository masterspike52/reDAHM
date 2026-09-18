// vs_b8498836a88f7043.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003A8 00300010 00000000 00000000 00003C84 00000001 00000013 00000004 00000290 0010600E 0000700F 00003010 00200011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 00000038 00115039 0002503A 0003503B 0024503C 0000F056 00017157 0002F2A0 0003F3A1 0000104A 00001049 0000104C 0000104B
//   vertex element: instruction 14 -> TANGENT0
//   vertex element: instruction 15 -> BINORMAL0
//   vertex element: instruction 16 -> NORMAL0
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
//   vertex element: instruction 56 -> POSITION0
//   vertex element: instruction 57 -> TEXCOORD1
//   vertex element: instruction 58 -> TEXCOORD2
//   vertex element: instruction 59 -> TEXCOORD3
//   vertex element: instruction 60 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;

    r0.y = r0.x + 0.5;
    r1.z = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.z);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r2.z = r0.y + r0.x;
    r2.xyw = In.tangent0.xyz;
    r11.xyz = In.binormal0.xyz;
    r1.xyw = In.normal0.xyz;
    r3 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r15.xyz = In.texcoord3.xyz;
    r16.xyz = In.texcoord4.xyz;
    r10.xyz = In.tangent0.xyz;
    r7.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r4.xyz = In.texcoord2.xyz;
    r5.yzw = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r7.xyz = r7.xzy * 0.007843138 - 1.0;
    r12.y = -r2.y * 0.007843138 + 1.0;
    r12.xz = r2.xw * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r3.www;
    r14.xyz = r11.zxy * 0.007843138 - 1.0;
    r13.xyz = r1.ywx * 0.007843138 - 1.0;
    r11.xyz = r14.xxz * r13.xzz;
    r0.yzw = r16.xyz * r3.zzz + r0.ywz;
    r0.yzw = r15.xzy * r3.yyy + r0.ywz;
    r11.xyz = r14.zyy * r13.yyx - r11.xyz;
    r10.w = dot(r12.xyz, r11.xyz);
    r0.yzw = r9.xyz * r3.xxx + r0.ywz;
    r9.xyz = -r0.wzy * CameraPosition.www + CameraPosition.zyx;
    r4.w = r10.w * 0.5 + 0.5;
    r3.xyz = r10.zyx * 0.007843138 - 1.0;
    r5.x = dot(r9.xzy, r4.zxy);
    r4.x = 0.003921569 * r1.x;
    r5.y = dot(r9.xzy, r5.wyz);
    r4.y = 0.003921569 * r1.y;
    r5.z = dot(r9.xzy, r8.zxy);
    r4.z = 0.003921569 * r1.w;
    r3.x = dot(r3.xzy, r5.zxy);
    r1.x = 0.003921569 * r2.x;
    r3.y = dot(r7.yxz, r5.zxy);
    r1.y = 0.003921569 * r2.y;
    r3.z = dot(r6.zyx, r5.zxy);
    r1.z = 0.003921569 * r2.w;
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r2.x = trunc(r1.w);
    r2.x = r2.x * NumVerticesPerInstance.x;
    r2.x = trunc(-r2.x);
    r0.x = r2.x + r0.x;
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
    r2 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r0.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    o1.xyz = r3.xyz;
    o0 = r0.yyyy * ViewProjectionMatrix[0] + r2.xzyw;
    o3.xyz = r1.xyz;
    o3.w = 0.0;
    o2 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
