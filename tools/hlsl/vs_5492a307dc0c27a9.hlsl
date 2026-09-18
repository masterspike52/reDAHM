// vs_5492a307dc0c27a9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 438 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006D8 0011000D 00000000 00000000 00001C42 00000001 00000006 00000002 00000290 00100012 00006013 00007014 00003015 00002016 00201017 0000F056 00017157 00001090 0000108F
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> BINORMAL0
//   vertex element: instruction 21 -> NORMAL0
//   vertex element: instruction 22 -> BLENDINDICES0
//   vertex element: instruction 23 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 27

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r9.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.zyx;
    r0.yzw = In.binormal0.zyx;
    r7.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r6 = In.blendweight0;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r5 = r6.xxxx * BoneMatrices[a0];
    r11 = r6.xxxx * BoneMatrices[a0 + 1];
    r3.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r4.x = 3.0 * r1.x;
    a0 = xe_mova(r4.x);
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    r5 = r6.yyyy * BoneMatrices[a0] + r5;
    r11 = r6.yyyy * BoneMatrices[a0 + 1] + r11;
    r3.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    r4.x = 3.0 * r1.z;
    a0 = xe_mova(r4.x);
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    r5 = r6.zzzz * BoneMatrices[a0] + r5;
    r11 = r6.zzzz * BoneMatrices[a0 + 1] + r11;
    r3.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            r3.w = 3.0 * r1.w;
            a0 = xe_mova(r3.w);
            r5 = r6.wwww * BoneMatrices[a0] + r5;
            r11 = r6.wwww * BoneMatrices[a0 + 1] + r11;
            r3.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
            r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    a0 = xe_mova(r0.x);
    r12.xyz = r2.zyx * 0.007843138 - 1.0;
    r4.xyz = r0.wzy * 0.007843138 - 1.0;
    r10.xyz = r7.zyx * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r2.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r8.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = dot(r5.zxyw, r13);
    r3.y = dot(r11.zxyw, r13);
    p0 = (r2.w != 0.0);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r3 = r3.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r3.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.x;
    a0 = xe_mova(r2.w);
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    r2.xyz = r6.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r8.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.z;
    a0 = xe_mova(r2.w);
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    r2.xyz = r6.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r8.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.z = 3.0 * r1.w;
            a0 = xe_mova(r0.z);
            r2.xyz = r6.www * BoneMatrices[a0].xyz + r2.xyz;
            r8.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r11.x = dot(r10.zxy, r2.zxy);
    r11.y = dot(r10.zxy, r8.zxy);
    r11.z = dot(r4.zxy, r2.zxy);
    r11.w = dot(r4.zxy, r7.zxy);
    r13.x = dot(r4.zxy, r8.zxy);
    r13.y = dot(r10.zxy, r7.zxy);
    r5.x = dot(r12.zxy, r2.zxy);
    r2.x = WorldToLocal[2].x * r0.w;
    r5.y = dot(r12.zxy, r8.zxy);
    r2.y = WorldToLocal[2].z * r0.w;
    r5.z = dot(r12.zxy, r7.zxy);
    r2.z = WorldToLocal[2].y * r0.w;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r4.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.xy = r13.xy * r4.yz;
    r0.w = dot(r11.wz, r4.zx) + 0.0;
    r2.yz = r11.xy * r4.xy;
    ps = r2.y + r2.z;
    r2.x = dot(r5.zxy, r4.zxy);
    r0.z = ps;
    r2.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r6.xxxx * BoneMatrices[a0];
    r5 = r6.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r6.yyyy * BoneMatrices[a0] + r0;
    r5 = r6.yyyy * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2.w = r1.z * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r6.zzzz * BoneMatrices[a0] + r0;
    r5 = r6.zzzz * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r6.wwww * BoneMatrices[a0] + r0;
    r5 = r6.wwww * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r6);
    r1.y = dot(r5.zxyw, r6);
    r0.x = dot(r9.zxyw, r4);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r3.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o1.xyz = r2.xyz;
    o0 = r3.xxxx * ViewProjectionMatrix[0] + r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    return Out;
}
