// vs_d62b4de953353b0f.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 183 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002DC 0061000C 00000000 00000000 000070E7 00000001 00000004 00000007 00000290 00100007 00006008 00007009 0030300A 0000F054 0001F156 0002F257 0003F358 0004F4A0 0005F5A1 0006F6A2 00001038 00001036 00001039 0000103A 0000103B 00001037 00001035
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c13); // float4[2]
float4 LightType : register(c12); // float[2]
float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c9); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
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
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    r1.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r0.xyz = In.normal0.xyz;
    r0.w = float((LightType.x >= 0.9));
    r2 = r5.wwww * LocalToWorld[3];
    r9.xyz = r0.yxz * 0.007843138 - 1.0;
    r6.yzw = r3.xzy * 0.007843138 - 1.0;
    r10.xzw = r1.xzy * 0.007843138 - 1.0;
    r7.x = dot(r10.zxw, WorldToLocal[2].zxy);
    r7.y = dot(r6.zyw, WorldToLocal[2].zxy);
    r7.z = dot(r9.zyx, WorldToLocal[2].zxy);
    r3 = r5.zzzz * LocalToWorld[2] + r2;
    r2.xyz = r6.zzw * r9.xyy;
    r10.y = -r10.w;
    r2.xyz = r6.wyy * r9.zzx - r2.xyz;
    r3 = r5.yyyy * LocalToWorld[1].xzwy + r3.xzwy;
    r11 = r5.xxxx * LocalToWorld[0].wyxz + r3.zwxy;
    r1.w = dot(r10.xyz, r2.xyz);
    r2.w = r1.w * 0.5 + 0.5;
    r3.xyz = -r11.wyz * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = -r11.wyz * r0.www + LightPositionAndInvRadius.zyx;
    r2.xy = r11.xx * ViewProjectionMatrix[3].zw;
    r12.xy = r11.ww * ViewProjectionMatrix[2].zw + r2.xy;
    r8.xyz = r4.xxx * WorldToLocal[2].xyz;
    r2.xyz = r3.xxx * WorldToLocal[2].xyz;
    r2.xyz = r3.yyy * WorldToLocal[1].xyz + r2.xyz;
    r8.xyz = r4.yyy * WorldToLocal[1].xyz + r8.xyz;
    r11.xy = r11.yy * ViewProjectionMatrix[1].zw + r12.xy;
    r4.xy = r11.zz * ViewProjectionMatrix[0].zw + r11.xy;
    r8.xyz = r4.zzz * WorldToLocal[0].xzy + r8.xzy;
    r11.xyz = r3.zzz * WorldToLocal[0].xzy + r2.xzy;
    r3.x = dot(r10.zxw, r11.yxz);
    r2.x = 0.003921569 * r0.x;
    r3.y = dot(r6.zyw, r11.yxz);
    r2.y = 0.003921569 * r0.y;
    r3.z = dot(r9.zyx, r11.yxz);
    r2.z = 0.003921569 * r0.z;
    r0.x = dot(r10.zxw, r8.yxz);
    r6.x = 0.003921569 * r1.x;
    r0.y = dot(r6.zyw, r8.yxz);
    r6.y = 0.003921569 * r1.y;
    r0.z = dot(r9.zyx, r8.yxz);
    r6.z = 0.003921569 * r1.z;
    r1 = r5.wwww * LocalToWorld[3];
    r1 = r5.zzzz * LocalToWorld[2] + r1;
    r1 = r5.yyyy * LocalToWorld[1].xzwy + r1.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xwyz + r1.xzwy;
    r1 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r1 = r5.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r5.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o6.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.yzw = 0.0;
    o1.zw = r4.xy;
    o1.xy = 1.0;
    o5.xyz = r6.xyz;
    o5.w = 0.0;
    o0.xyz = r0.xyz;
    o0.w = 0.0;
    o2.xyz = r3.xyz;
    o2.w = 0.0;
    o3.xyz = r7.xyz;
    o3.w = 0.0;
    o4 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    Out.color2 = o6;
    return Out;
}
