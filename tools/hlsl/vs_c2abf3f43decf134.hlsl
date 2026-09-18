// vs_c2abf3f43decf134.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 585 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000924 00510010 00000000 00000000 000048C6 00000001 00000008 00000006 00000290 00100017 00006018 00007019 0000301A 0000201B 0000101C 0000501D 0021501E 00003050 00013151 00027254 0003F355 00047456 0005F557 000010BC 000010BD 000010BE 000010BF 000010C0 000010C1
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   vertex element: instruction 29 -> TEXCOORD0
//   vertex element: instruction 30 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c238); // float4
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c10); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r11.xyz = In.position0.xyz;
    r1.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r2 = In.blendindices0.yxzw;
    r8 = In.blendweight0;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r5.w = r2.y * 3.0;
    a0 = xe_mova(r5.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r6 = r8.xxxx * BoneMatrices[a0];
    r13 = r8.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.w = 3.0 * r2.x;
    a0 = xe_mova(r1.w);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r6 = r8.yyyy * BoneMatrices[a0] + r6;
    r13 = r8.yyyy * BoneMatrices[a0 + 1] + r13;
    r5.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    r1.w = 3.0 * r2.z;
    a0 = xe_mova(r1.w);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r6 = r8.zzzz * BoneMatrices[a0] + r6;
    r13 = r8.zzzz * BoneMatrices[a0 + 1] + r13;
    r5.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r2.w;
            a0 = xe_mova(r0.x);
            r6 = r8.wwww * BoneMatrices[a0] + r6;
            r13 = r8.wwww * BoneMatrices[a0 + 1] + r13;
            r5.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r7.xyz = r1.xyz * 0.007843138 - 1.0;
    r4.xyz = r0.yzw * 0.007843138 - 1.0;
    r12.xyz = r9.xyz * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    a0 = xe_mova(r5.w);
    r0.x = dot(r11.zxyw, r0);
    r5.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = dot(r6.zxyw, r9);
    r1.y = dot(r13.zxyw, r9);
    r0 = r0.xxxx * LocalToWorld[2].xzyw;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r1.xxxx * LocalToWorld[0].xzyw + r0;
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = r0.w;
    r0.xyz = r0.yxz + LocalToWorld[3].zxy;
    r0.w = LocalToWorld[3].w + r1.x;
    r1.xyw = -r0.zyx * CameraPosition.www + CameraPosition.yxz;
    p0 = (r4.w != 0.0);
    r9 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r9 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r9;
    r9 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r9.xzwy;
    r9 = r0.yyyy * ViewProjectionMatrix[0] + r9.xzyw;
    // UNHANDLED control flow: cjmp
    r1.z = 3.0 * r2.x;
    a0 = xe_mova(r1.z);
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    r5.xyz = r8.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r1.z = 3.0 * r2.z;
    a0 = xe_mova(r1.z);
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    r5.xyz = r8.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.w = 3.0 * r2.w;
            a0 = xe_mova(r0.w);
            r5.xyz = r8.www * BoneMatrices[a0].xyz + r5.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r14.x = dot(r12.zxy, r5.zxy);
    r14.y = dot(r12.zxy, r10.zxy);
    r13.z = dot(r4.zxy, r5.zxy);
    r13.w = dot(r4.zxy, r6.zxy);
    r13.x = dot(r4.zxy, r10.zxy);
    r13.y = dot(r12.zxy, r6.zxy);
    r16.x = WorldToLocal[2].x * r1.w;
    r15.x = dot(r7.zxy, r5.zxy);
    r16.y = WorldToLocal[2].z * r1.w;
    r15.y = dot(r7.zxy, r10.zxy);
    r16.z = WorldToLocal[2].y * r1.w;
    a0 = xe_mova(r5.w);
    r15.z = dot(r7.zxy, r6.zxy);
    r5.xyz = r1.xxx * WorldToLocal[1].xzy + r16.xyz;
    r1.xzw = r8.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r5.yzw = r1.yyy * WorldToLocal[0].xyz + r5.xzy;
    r5.x = dot(r15.zxy, r5.wyz);
    r13.xy = r13.xy * r5.zw;
    r0.y = LightPositionAndInvRadius.x - r0.y;
    r13.w = dot(r13.wz, r5.wy) + 0.0;
    r5.yz = r14.xy * r5.yz;
    r0.z = LightPositionAndInvRadius.y - r0.z;
    r13.z = r5.y + r5.z;
    r0.w = LightPositionAndInvRadius.z - r0.x;
    p0 = (r4.w != 0.0);
    r5.yz = r13.xz + r13.wy;
    // UNHANDLED control flow: cjmp
    r1.y = 3.0 * r2.x;
    a0 = xe_mova(r1.y);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r1.xzw = r8.yyy * BoneMatrices[a0].xyz + r1.xzw;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r1.y = 3.0 * r2.z;
    a0 = xe_mova(r1.y);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r1.xzw = r8.zzz * BoneMatrices[a0].xyz + r1.xzw;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r2.w;
            a0 = xe_mova(r0.x);
            r1.xzw = r8.www * BoneMatrices[a0].xyz + r1.xzw;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r13.x = dot(r12.zxy, r1.wxz);
    r13.y = dot(r12.zxy, r10.zxy);
    r13.z = dot(r4.zxy, r1.wxz);
    r13.w = dot(r4.zxy, r6.zxy);
    r4.x = dot(r4.zxy, r10.zxy);
    r4.y = dot(r12.zxy, r6.zxy);
    r12.x = dot(r7.zxy, r1.wxz);
    r1.x = WorldToLocal[2].x * r0.w;
    r12.y = dot(r7.zxy, r10.zxy);
    r1.y = WorldToLocal[2].z * r0.w;
    r12.z = dot(r7.zxy, r6.zxy);
    r1.z = WorldToLocal[2].y * r0.w;
    r1.xyz = r0.zzz * WorldToLocal[1].xzy + r1.xyz;
    r6.xyz = r0.yyy * WorldToLocal[0].xyz + r1.xzy;
    r4.xy = r4.xy * r6.yz;
    r4.w = dot(r13.wz, r6.zx) + 0.0;
    r1.yz = r13.xy * r6.xy;
    ps = r1.y + r1.z;
    r1.x = dot(r12.zxy, r6.zxy);
    r4.z = ps;
    r1.yz = r4.xz + r4.wy;
    r1.w = r2.y * 3.0;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r7 = r8.xxxx * BoneMatrices[a0];
    r6 = r8.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r2.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7 = r8.yyyy * BoneMatrices[a0] + r7;
    r6 = r8.yyyy * BoneMatrices[a0 + 1] + r6;
    r4.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7 = r8.zzzz * BoneMatrices[a0] + r7;
    r6 = r8.zzzz * BoneMatrices[a0 + 1] + r6;
    r4.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7 = r8.wwww * BoneMatrices[a0] + r7;
    r6 = r8.wwww * BoneMatrices[a0 + 1] + r6;
    r4.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.x = dot(r7.zxyw, r4);
    r1.w = dot(r6.zxyw, r4);
    r2.x = dot(r11.zxyw, r2);
    r2 = r2.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r2 = r1.wwww * LocalToWorld[1].xzyw + r2.xzwy;
    r4 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r2 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r4.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r4.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xy = r3.zw;
    o1.xy = r3.xy;
    o2.xyz = r1.xyz;
    o3.xyz = r0.yzw * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r5.xyz;
    o5 = r9;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
