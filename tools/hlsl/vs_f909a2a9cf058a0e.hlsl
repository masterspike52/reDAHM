// vs_f909a2a9cf058a0e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000036C 0071000C 00000000 00000000 00007D08 00000001 00000008 00000008 00000290 00100008 00006009 0000700A 0000300B 0001A00C 0005500D 0006500E 0027500F 0000F053 0001F154 0002F255 0003F356 00047457 0005F558 0006F6A0 0007F7A2 00001045 00001046 00001047 0000103B 00001038 00001039 0000103A 00001037
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> COLOR1
//   vertex element: instruction 13 -> TEXCOORD5
//   vertex element: instruction 14 -> TEXCOORD6
//   vertex element: instruction 15 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightMapScale[3] : register(c12); // float3[3]
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c9); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
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
    float4 color0 : COLOR0;
    float4 color2 : COLOR2;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;

    r6 = In.position0;
    r7.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r1 = In.color1;
    r5.xyz = In.texcoord5.xyz;
    r4.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2 = r6.wwww * LocalToWorld[3];
    r9.xyz = r8.yxz * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r10.xyz = r7.zyx * 0.007843138 - 1.0;
    r7.x = dot(r10.xzy, WorldToLocal[2].zxy);
    r7.y = dot(r0.zyw, WorldToLocal[2].zxy);
    r7.z = dot(r9.zyx, WorldToLocal[2].zxy);
    r2 = r6.zzzz * LocalToWorld[2] + r2;
    r2 = r6.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r11 = r6.xxxx * LocalToWorld[0].xwyz + r2.xzwy;
    r8.xyw = -r11.wzx * CameraPosition.www + CameraPosition.zyx;
    r2 = r11.yyyy * ViewProjectionMatrix[3].xwzy;
    r2 = r11.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r12.xyz = r8.xxx * WorldToLocal[2].xzy;
    r8.xyz = r8.yyy * WorldToLocal[1].xzy + r12.xyz;
    r2 = r11.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r11.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    r8.xyz = r8.www * WorldToLocal[0].xyz + r8.xzy;
    r0.x = dot(r10.xzy, r8.zxy);
    r0.y = dot(r0.zyw, r8.zxy);
    r0.z = dot(r9.zyx, r8.zxy);
    r8 = r6.wwww * LocalToWorld[3];
    r8 = r6.zzzz * LocalToWorld[2] + r8;
    r8 = r6.yyyy * LocalToWorld[1].xzwy + r8.xzwy;
    r8 = r6.xxxx * LocalToWorld[0].xwyz + r8.xzwy;
    r6 = r8.yyyy * ViewProjectionMatrix[3].xwzy;
    r6 = r8.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r8.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r8.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    oPos = r6;
    r6.x = log2(abs(r5.x));
    r6.y = log2(abs(r5.y));
    r6.z = log2(abs(r5.z));
    r5.x = log2(abs(r4.x));
    r5.y = log2(abs(r4.y));
    r4.x = log2(abs(r3.x));
    r4.y = log2(abs(r3.y));
    r4.w = log2(abs(r3.z));
    r3.xyz = r4.xyw * 2.2;
    r5.z = log2(abs(r4.z));
    o7.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o7.yzw = 0.0;
    o4.xyz = r0.xyz;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o6 = r1;
    o3 = r2;
    r0.x = pow(2.0, r3.x);
    r0.y = pow(2.0, r3.y);
    r1.xyz = r5.xyz * 2.2;
    r0.z = pow(2.0, r3.z);
    r1.x = pow(2.0, r1.x);
    r1.y = pow(2.0, r1.y);
    r2.xyz = r6.xyz * 2.2;
    r1.z = pow(2.0, r1.z);
    r2.x = pow(2.0, r2.x);
    r2.y = pow(2.0, r2.y);
    r2.z = pow(2.0, r2.z);
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
    Out.color0 = o6;
    Out.color2 = o7;
    return Out;
}
