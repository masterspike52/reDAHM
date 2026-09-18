// vs_eb6a8cab2c075dee.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 315 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004EC 00500012 00000000 00000000 00005CC6 00000001 00000019 00000006 00000290 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 0010601B 0000701C 0020301D 0012501E 0003501F 00045020 00055021 00065022 00275023 00000042 00115043 00025044 00035045 00245046 0000F053 0001F154 0002F255 0003F356 00047457 0005F558 00001065 00001066 00001067 0000105B 00001059 0000105A
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
//   vertex element: instruction 33 -> TEXCOORD5
//   vertex element: instruction 34 -> TEXCOORD6
//   vertex element: instruction 35 -> TEXCOORD7
//   vertex element: instruction 66 -> POSITION0
//   vertex element: instruction 67 -> TEXCOORD1
//   vertex element: instruction 68 -> TEXCOORD2
//   vertex element: instruction 69 -> TEXCOORD3
//   vertex element: instruction 70 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 InvNumVerticesPerInstance : register(c5); // float
float4 LightMapScale[3] : register(c7); // float3[3]
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = 0.5 + r0.x;
    r1.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r1.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r0.y = r0.y + r0.x;
    r9 = In.position0.yzwx;
    r3.xyz = In.texcoord1.xyz;
    r11.xyz = In.texcoord2.xyz;
    r14.xyz = In.texcoord3.xyz;
    r15.xyz = In.texcoord4.xyz;
    r8.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r12.xyz = In.texcoord2.xyz;
    r4.yzw = In.texcoord3.xyz;
    r10.xyz = In.texcoord4.xyz;
    r18.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r17.xyz = In.normal0.xyz;
    r16.x = In.texcoord2.z;
    r16.y = In.texcoord3.z;
    r16.z = In.texcoord4.z;
    r5.xyz = In.texcoord5.xyz;
    r0.yzw = In.texcoord6.xyz;
    r6.xyz = In.texcoord7.xyz;
    r7.xyz = r7.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r8.xyz = r8.zyx * 0.007843138 - 1.0;
    r13.xyz = r3.xzy * r9.zzz;
    r3 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r17.xyz = r17.yxz * 0.007843138 - 1.0;
    r1.yzw = r1.xzy * 0.007843138 - 1.0;
    r18.xyz = r18.zyx * 0.007843138 - 1.0;
    r1.x = dot(r18.xzy, r16.zxy);
    r1.y = dot(r1.zyw, r16.zxy);
    r1.z = dot(r17.zyx, r16.zxy);
    r13.xyz = r15.xyz * r9.yyy + r13.xzy;
    r9.xyz = r14.xzy * r9.xxx + r13.xzy;
    r9.xyz = r11.xyz * r9.www + r9.xzy;
    r3 = r9.zzzz * ViewProjectionMatrix[2].xwzy + r3;
    r11.xyz = -r9.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.x = dot(r11.xzy, r12.zxy);
    r4.y = dot(r11.xzy, r4.wyz);
    r4.z = dot(r11.xzy, r10.zxy);
    r3 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r9.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    r2.x = dot(r8.xzy, r4.zxy);
    r2.y = dot(r2.zyw, r4.zxy);
    r2.z = dot(r7.zyx, r4.zxy);
    r1.w = r0.x + 0.5;
    r1.w = r1.w * InvNumVerticesPerInstance.x;
    r2.w = trunc(r1.w);
    r2.w = r2.w * NumVerticesPerInstance.x;
    r2.w = trunc(-r2.w);
    r0.x = r2.w + r0.x;
    r7 = In.position0.yzwx;
    r4.xyz = In.texcoord1.xyz;
    r8.xyz = In.texcoord2.xyz;
    r10.xyz = In.texcoord3.xyz;
    r11.xyz = In.texcoord4.xyz;
    r9.xyz = r4.xyz * r7.zzz;
    r4 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r9.xyz = r11.xzy * r7.yyy + r9.xzy;
    r7.xyz = r10.xyz * r7.xxx + r9.xzy;
    r7.xyz = r8.xzy * r7.www + r7.xzy;
    r4 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r7.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r7.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    r4.x = log2(abs(r5.x));
    r4.y = log2(abs(r5.y));
    r4.z = log2(abs(r5.z));
    r5.x = log2(abs(r0.y));
    r5.y = log2(abs(r0.z));
    r0.x = log2(abs(r6.x));
    r0.y = log2(abs(r6.y));
    r0.z = log2(abs(r6.z));
    ps = log2(abs(r0.w));
    r0.xyz = r0.xyz * 2.2;
    r5.z = ps;
    o4.xyz = r2.xyz;
    o5.xyz = r1.xyz;
    o5.w = 0.0;
    o3 = r3;
    ps = pow(2.0, r0.x);
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r1.xyz = r5.xyz * 2.2;
    r0.z = ps;
    ps = pow(2.0, r1.x);
    r1.x = ps;
    ps = pow(2.0, r1.y);
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r2.xyz = r4.xyz * 2.2;
    r1.z = ps;
    ps = pow(2.0, r2.x);
    r2.x = ps;
    ps = pow(2.0, r2.y);
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r2.z = ps;
    o0.xyz = r2.xyz * LightMapScale[0].xyz;
    o0.w = 0.0;
    o1.xyz = r1.xyz * LightMapScale[1].xyz;
    o1.w = 0.0;
    o2.xyz = r0.xyz * LightMapScale[2].xyz;
    o2.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord3 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
