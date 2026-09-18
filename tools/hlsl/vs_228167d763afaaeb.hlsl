// vs_228167d763afaaeb.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000318 0061000C 00000000 00000000 000070E7 00000001 00000006 00000007 00000290 00100007 00006008 00007009 0000300A 0001A00B 0025500C 0000F053 0001F154 0002F256 0003F357 0004F458 0005F5A0 0006F6A2 00001040 00001039 00001038 0000103A 0000103B 0000103C 00001037
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   vertex element: instruction 12 -> TEXCOORD5
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightMapScale : register(c12); // float3
float4 LightPositionAndInvRadius : register(c14); // float4[2]
float4 LightType : register(c13); // float[2]
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
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
    float4 oPos = 0.0;

    r5 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r1 = In.color1;
    r4.xyz = In.texcoord5.xyz;
    r0.x = float((LightType.x >= 0.9));
    r2 = r5.wwww * LocalToWorld[3];
    r8.xyz = r6.yxz * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * 0.007843138 - 1.0;
    r9.xyz = r3.zyx * 0.007843138 - 1.0;
    r6.x = dot(r9.xzy, WorldToLocal[2].zxy);
    r6.y = dot(r0.zyw, WorldToLocal[2].zxy);
    r6.z = dot(r8.zyx, WorldToLocal[2].zxy);
    r2 = r5.zzzz * LocalToWorld[2] + r2;
    r2 = r5.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r10 = r5.xxxx * LocalToWorld[0].wyxz + r2.zwxy;
    r2.xyw = -r10.wyz * CameraPosition.www + CameraPosition.zyx;
    r3.xyz = -r10.wyz * r0.xxx + LightPositionAndInvRadius.zyx;
    r7.xy = r10.xx * ViewProjectionMatrix[3].zw;
    r11.xy = r10.ww * ViewProjectionMatrix[2].zw + r7.xy;
    r7.xyz = r3.xxx * WorldToLocal[2].xyz;
    r12.xyz = r2.xxx * WorldToLocal[2].xyz;
    r2.xyz = r2.yyy * WorldToLocal[1].xyz + r12.xyz;
    r7.xyz = r3.yyy * WorldToLocal[1].xyz + r7.xyz;
    r10.xy = r10.yy * ViewProjectionMatrix[1].zw + r11.xy;
    r3.xy = r10.zz * ViewProjectionMatrix[0].zw + r10.xy;
    r7.xyz = r3.zzz * WorldToLocal[0].xzy + r7.xzy;
    r10.xyz = r2.www * WorldToLocal[0].xzy + r2.xzy;
    r2.x = dot(r9.xzy, r10.yxz);
    r2.y = dot(r0.zyw, r10.yxz);
    r2.z = dot(r8.zyx, r10.yxz);
    r0.x = dot(r9.xzy, r7.yxz);
    r0.y = dot(r0.zyw, r7.yxz);
    r0.z = dot(r8.zyx, r7.yxz);
    r7 = r5.wwww * LocalToWorld[3];
    r7 = r5.zzzz * LocalToWorld[2] + r7;
    r7 = r5.yyyy * LocalToWorld[1].xzwy + r7.xzwy;
    r7 = r5.xxxx * LocalToWorld[0].xwyz + r7.xzwy;
    r5 = r7.yyyy * ViewProjectionMatrix[3].xwzy;
    r5 = r7.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r7.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r7.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    r5.x = log2(abs(r4.x));
    r5.y = log2(abs(r4.y));
    r5.z = log2(abs(r4.z));
    r4.xyz = r5.xyz * 2.2;
    o6.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.yzw = 0.0;
    o2.zw = r3.xy;
    o2.xy = 1.0;
    o1.xyz = r0.xyz;
    o1.w = 0.0;
    o3.xyz = r2.xyz;
    o3.w = 0.0;
    o4.xyz = r6.xyz;
    o4.w = 0.0;
    o5 = r1;
    r0.x = pow(2.0, r4.x);
    r0.y = pow(2.0, r4.y);
    r0.z = pow(2.0, r4.z);
    o0.xyz = r0.xyz * LightMapScale.xyz;
    o0.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord3 = o0;
    Out.texcoord4 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.texcoord8 = o4;
    Out.color0 = o5;
    Out.color2 = o6;
    return Out;
}
