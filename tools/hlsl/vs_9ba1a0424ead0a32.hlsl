// vs_9ba1a0424ead0a32.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000420 00400012 00000000 00000000 000040A5 00000001 00000018 00000005 00000290 0000100E 0010500F 00200010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 0010601B 0000701C 0020301D 0012501E 0003501F 00245020 00000043 00115044 00025045 00035046 00245047 00003050 00017154 0002F255 00037356 0004F457 00001052 00001053 00001055 00001054 00001056
//   vertex element: instruction 14 -> BLENDWEIGHT0
//   vertex element: instruction 15 -> TEXCOORD0
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
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightPositionAndInvRadius : register(c7); // float4
float4 NumVerticesPerInstance : register(c6); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
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
    float4 oPos = 0.0;

    r0.y = 0.5 + r0.x;
    r0.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r0.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r1.w = r0.y + r0.x;
    r2.w = In.blendweight0.x;
    r0.yz = In.texcoord0.xy;
    r11 = In.position0;
    r1.xyz = In.texcoord1.xyz;
    r13.xyz = In.texcoord2.xyz;
    r17.xyz = In.texcoord3.xyz;
    r18.xyz = In.texcoord4.xyz;
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r7.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r16.xyz = In.texcoord2.xyz;
    r4.yzw = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r7.xyz = r7.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r5.yzw = r5.xzy * 0.007843138 - 1.0;
    r10.xyz = r2.zyx * 0.007843138 - 1.0;
    r2.xyz = r1.xyz * r11.www;
    r1 = r11.wwww * ViewProjectionMatrix[3].xwzy;
    r2.xyz = r18.xzy * r11.zzz + r2.xzy;
    r2.xyz = r17.xyz * r11.yyy + r2.xzy;
    r11.xyz = r13.xzy * r11.xxx + r2.xzy;
    r1 = r11.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r13.xyz = -r11.yzx * CameraPosition.www + CameraPosition.zyx;
    r2.xyz = -r11.xzy + LightPositionAndInvRadius.xyz;
    r4.x = dot(r2.zxy, r16.zxy);
    r4.y = dot(r2.zxy, r4.wyz);
    r4.z = dot(r2.zxy, r15.zxy);
    r8.x = dot(r13.xzy, r14.zxy);
    r8.y = dot(r13.xzy, r8.wyz);
    r8.z = dot(r13.xzy, r12.zxy);
    r1 = r11.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r11.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    r5.x = dot(r10.xzy, r8.zxy);
    r5.y = dot(r5.zyw, r8.zxy);
    r5.z = dot(r9.zyx, r8.zxy);
    r3.x = dot(r7.xzy, r4.zxy);
    r3.y = dot(r3.zyw, r4.zxy);
    r3.z = dot(r6.zyx, r4.zxy);
    r0.w = r0.x + 0.5;
    r0.w = r0.w * InvNumVerticesPerInstance.x;
    r3.w = trunc(r0.w);
    r3.w = r3.w * NumVerticesPerInstance.x;
    r3.w = trunc(-r3.w);
    r0.x = r3.w + r0.x;
    r6 = In.position0.yzwx;
    r4.xyz = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r8.xyz = r4.xzy * r6.zzz;
    r4 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r10.xyz * r6.yyy + r8.xzy;
    r6.xyz = r9.xzy * r6.xxx + r8.xzy;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    r4 = r6.zzzz * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    r2.xyz = r2.xyz * LightPositionAndInvRadius.www;
    o0.xy = r0.yz;
    o1.xyz = r3.xyz;
    o3.xyz = r5.xyz;
    o2 = r2;
    o4 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
