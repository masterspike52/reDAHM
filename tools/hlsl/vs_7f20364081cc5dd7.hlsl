// vs_7f20364081cc5dd7.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 453 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000714 0031000E 00000000 00000000 00002C84 00000001 00000008 00000004 00000290 00100013 00006014 00007015 00003016 00002017 00001018 00005019 0021501A 00003050 00013151 0002F256 00037357 00001094 00001095 00001093 00001092
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> BLENDINDICES0
//   vertex element: instruction 24 -> BLENDWEIGHT0
//   vertex element: instruction 25 -> TEXCOORD0
//   vertex element: instruction 26 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 28

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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r10.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.zyx;
    r0.yzw = In.binormal0.zyx;
    r5.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r4.zw = In.texcoord0.xy;
    r4.xy = In.texcoord1.xy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r6 = r7.xxxx * BoneMatrices[a0];
    r12 = r7.xxxx * BoneMatrices[a0 + 1];
    r3.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r5.w = 3.0 * r1.x;
    a0 = xe_mova(r5.w);
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    r6 = r7.yyyy * BoneMatrices[a0] + r6;
    r12 = r7.yyyy * BoneMatrices[a0 + 1] + r12;
    r3.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    r5.w = 3.0 * r1.z;
    a0 = xe_mova(r5.w);
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    r6 = r7.zzzz * BoneMatrices[a0] + r6;
    r12 = r7.zzzz * BoneMatrices[a0 + 1] + r12;
    r3.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    if (p0)
    {
        if (p0)
        {
            r3.w = 3.0 * r1.w;
            a0 = xe_mova(r3.w);
            r6 = r7.wwww * BoneMatrices[a0] + r6;
            r12 = r7.wwww * BoneMatrices[a0 + 1] + r12;
            r3.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
            r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    a0 = xe_mova(r0.x);
    r13.xyz = r2.zyx * 0.007843138 - 1.0;
    r2.xyz = r0.wzy * 0.007843138 - 1.0;
    r11.xyz = r5.zyx * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r5.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r8.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = dot(r6.zxyw, r14);
    r3.y = dot(r12.zxyw, r14);
    p0 = (r2.w != 0.0);
    r0.x = dot(r10.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r3 = r3.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r3.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.x;
    a0 = xe_mova(r2.w);
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    r5.xyz = r7.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.z;
    a0 = xe_mova(r2.w);
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    r5.xyz = r7.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.z = 3.0 * r1.w;
            a0 = xe_mova(r0.z);
            r5.xyz = r7.www * BoneMatrices[a0].xyz + r5.xyz;
            r9.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r8.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r12.x = dot(r11.zxy, r5.zxy);
    r12.y = dot(r11.zxy, r9.zxy);
    r12.z = dot(r2.zxy, r5.zxy);
    r12.w = dot(r2.zxy, r8.zxy);
    r2.x = dot(r2.zxy, r9.zxy);
    r2.y = dot(r11.zxy, r8.zxy);
    r6.x = dot(r13.zxy, r5.zxy);
    r5.x = WorldToLocal[2].x * r0.w;
    r6.y = dot(r13.zxy, r9.zxy);
    r5.y = WorldToLocal[2].z * r0.w;
    r6.z = dot(r13.zxy, r8.zxy);
    r5.z = WorldToLocal[2].y * r0.w;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r5.xyz;
    r5.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.xy = r2.xy * r5.yz;
    r0.w = dot(r12.wz, r5.zx) + 0.0;
    r2.yz = r12.xy * r5.xy;
    ps = r2.y + r2.z;
    r2.x = dot(r6.zxy, r5.zxy);
    r0.z = ps;
    r2.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r7.xxxx * BoneMatrices[a0];
    r6 = r7.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r7.yyyy * BoneMatrices[a0] + r0;
    r6 = r7.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2.w = r1.z * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r7.zzzz * BoneMatrices[a0] + r0;
    r6 = r7.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r7.wwww * BoneMatrices[a0] + r0;
    r6 = r7.wwww * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r7);
    r1.y = dot(r6.zxyw, r7);
    r0.x = dot(r10.zxyw, r5);
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
    o3.xyz = r2.xyz;
    o2 = r3.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r4.zw;
    o1.xy = r4.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
