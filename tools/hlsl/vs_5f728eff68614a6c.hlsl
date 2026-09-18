// vs_5f728eff68614a6c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 573 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008F4 0031000F 00000000 00000000 00003884 00000001 00000006 00000004 00000290 00100017 00006018 00007019 0000301A 0000201B 0020101C 00007054 0001F155 00027256 0003F357 000010BA 000010BB 000010BC 000010BD
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 37

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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r10.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r2 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r3.w = r2.y * 3.0;
    a0 = xe_mova(r3.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r7.xxxx * BoneMatrices[a0];
    r12 = r7.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r5.x = 3.0 * r2.x;
    a0 = xe_mova(r5.x);
    r1.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.w != 0.0);
    r0 = r7.yyyy * BoneMatrices[a0] + r0;
    r12 = r7.yyyy * BoneMatrices[a0 + 1] + r12;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    r5.x = 3.0 * r2.z;
    a0 = xe_mova(r5.x);
    r1.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.w != 0.0);
    r0 = r7.zzzz * BoneMatrices[a0] + r0;
    r12 = r7.zzzz * BoneMatrices[a0 + 1] + r12;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    if (p0)
    {
        if (p0)
        {
            r1.w = 3.0 * r2.w;
            a0 = xe_mova(r1.w);
            r0 = r7.wwww * BoneMatrices[a0] + r0;
            r12 = r7.wwww * BoneMatrices[a0 + 1] + r12;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    r5.xyz = r3.xyz * 0.007843138 - 1.0;
    r6.xyz = r1.xyz * 0.007843138 - 1.0;
    r11.xyz = r8.xyz * 0.007843138 - 1.0;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    a0 = xe_mova(r3.w);
    r1.z = dot(r10.zxyw, r1);
    r3.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = dot(r0.zxyw, r8);
    r1.y = dot(r12.zxyw, r8);
    r0 = r1.zzzz * LocalToWorld[2].xzyw;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r1.xxxx * LocalToWorld[0].xzyw + r0;
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = r0.w;
    r0.xyz = r0.yxz + LocalToWorld[3].zxy;
    r0.w = LocalToWorld[3].w + r1.x;
    r1.xyw = -r0.zyx * CameraPosition.www + CameraPosition.yxz;
    p0 = (r4.w != 0.0);
    r8 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r8 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r8;
    r8 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r8.xzwy;
    r8 = r0.yyyy * ViewProjectionMatrix[0] + r8.xzyw;
    // UNHANDLED control flow: cjmp
    r1.z = 3.0 * r2.x;
    a0 = xe_mova(r1.z);
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    r3.xyz = r7.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    r1.z = 3.0 * r2.z;
    a0 = xe_mova(r1.z);
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    r3.xyz = r7.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.w = 3.0 * r2.w;
            a0 = xe_mova(r0.w);
            r3.xyz = r7.www * BoneMatrices[a0].xyz + r3.xyz;
            r9.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r13.x = dot(r11.zxy, r3.zxy);
    r13.y = dot(r11.zxy, r9.zxy);
    r12.z = dot(r6.zxy, r3.zxy);
    r12.w = dot(r6.zxy, r4.zxy);
    r12.x = dot(r6.zxy, r9.zxy);
    r12.y = dot(r11.zxy, r4.zxy);
    r15.x = WorldToLocal[2].x * r1.w;
    r14.x = dot(r5.zxy, r3.zxy);
    r15.y = WorldToLocal[2].z * r1.w;
    r14.y = dot(r5.zxy, r9.zxy);
    r15.z = WorldToLocal[2].y * r1.w;
    a0 = xe_mova(r3.w);
    r14.z = dot(r5.zxy, r4.zxy);
    r3.xyz = r1.xxx * WorldToLocal[1].xzy + r15.xyz;
    r1.xzw = r7.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r3.yzw = r1.yyy * WorldToLocal[0].xyz + r3.xzy;
    r3.x = dot(r14.zxy, r3.wyz);
    r12.xy = r12.xy * r3.zw;
    r0.y = LightPositionAndInvRadius.x - r0.y;
    r12.w = dot(r12.wz, r3.wy) + 0.0;
    r3.yz = r13.xy * r3.yz;
    r0.z = LightPositionAndInvRadius.y - r0.z;
    r12.z = r3.y + r3.z;
    r0.w = LightPositionAndInvRadius.z - r0.x;
    p0 = (r4.w != 0.0);
    r3.yz = r12.xz + r12.wy;
    // UNHANDLED control flow: cjmp
    r1.y = 3.0 * r2.x;
    a0 = xe_mova(r1.y);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r1.xzw = r7.yyy * BoneMatrices[a0].xyz + r1.xzw;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    r1.y = 3.0 * r2.z;
    a0 = xe_mova(r1.y);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r1.xzw = r7.zzz * BoneMatrices[a0].xyz + r1.xzw;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r2.w;
            a0 = xe_mova(r0.x);
            r1.xzw = r7.www * BoneMatrices[a0].xyz + r1.xzw;
            r9.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r12.x = dot(r11.zxy, r1.wxz);
    r12.y = dot(r11.zxy, r9.zxy);
    r12.z = dot(r6.zxy, r1.wxz);
    r12.w = dot(r6.zxy, r4.zxy);
    r13.x = dot(r6.zxy, r9.zxy);
    r13.y = dot(r11.zxy, r4.zxy);
    r6.x = dot(r5.zxy, r1.wxz);
    r1.x = WorldToLocal[2].x * r0.w;
    r6.y = dot(r5.zxy, r9.zxy);
    r1.y = WorldToLocal[2].z * r0.w;
    r6.z = dot(r5.zxy, r4.zxy);
    r1.z = WorldToLocal[2].y * r0.w;
    r1.xyz = r0.zzz * WorldToLocal[1].xzy + r1.xyz;
    r5.xyz = r0.yyy * WorldToLocal[0].xyz + r1.xzy;
    r4.xy = r13.xy * r5.yz;
    r4.w = dot(r12.wz, r5.zx) + 0.0;
    r1.yz = r12.xy * r5.xy;
    ps = r1.y + r1.z;
    r1.x = dot(r6.zxy, r5.zxy);
    r4.z = ps;
    r1.yz = r4.xz + r4.wy;
    r1.w = r2.y * 3.0;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r6 = r7.xxxx * BoneMatrices[a0];
    r5 = r7.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r2.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6 = r7.yyyy * BoneMatrices[a0] + r6;
    r5 = r7.yyyy * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6 = r7.zzzz * BoneMatrices[a0] + r6;
    r5 = r7.zzzz * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6 = r7.wwww * BoneMatrices[a0] + r6;
    r5 = r7.wwww * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.x = dot(r6.zxyw, r4);
    r1.w = dot(r5.zxyw, r4);
    r2.x = dot(r10.zxyw, r2);
    r2 = r2.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r2 = r1.wwww * LocalToWorld[1].xzyw + r2.xzwy;
    r4 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r2 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r4.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r4.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xyz = r1.xyz;
    o1.xyz = r0.yzw * LightPositionAndInvRadius.www;
    o1.w = 0.0;
    o2.xyz = r3.xyz;
    o3 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
