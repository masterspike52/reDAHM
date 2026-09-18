// vs_2033f0f6e0221012.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 594 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000948 00610011 00000000 00000000 000050E7 00000001 00000009 00000007 00000290 00100018 00006019 0000701A 0000301B 0000201C 0000101D 0000501E 0001501F 00225020 00003050 00013151 00023252 00037354 0004F455 00057556 0006F657 000010BE 000010BF 000010C0 000010C1 000010C2 000010C3 000010C4
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> BINORMAL0
//   vertex element: instruction 27 -> NORMAL0
//   vertex element: instruction 28 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD1
//   vertex element: instruction 32 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r7.xyz = In.position0.xyz;
    r4.xyz = In.tangent0.xyz;
    r1.xyw = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r2 = In.blendindices0.yxzw;
    r12 = In.blendweight0;
    r11.zw = In.texcoord0.xy;
    r11.xy = In.texcoord1.xy;
    r3.xy = In.texcoord2.xy;
    r1.z = r2.y * 3.0;
    a0 = xe_mova(r1.z);
    r3.z = float((MaxBoneInfluences.x > 1.0));
    r10 = r12.xxxx * BoneMatrices[a0];
    r0 = r12.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.z != 0.0);
    r7.w = r12.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r2.x;
    a0 = xe_mova(r4.w);
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    r10 = r12.yyyy * BoneMatrices[a0] + r10;
    r0 = r12.yyyy * BoneMatrices[a0 + 1] + r0;
    r5.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r12.y * BoneMatrices[a0 + 2].w + r7.w;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r2.z;
    a0 = xe_mova(r4.w);
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    r10 = r12.zzzz * BoneMatrices[a0] + r10;
    r0 = r12.zzzz * BoneMatrices[a0 + 1] + r0;
    r5.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r12.z * BoneMatrices[a0 + 2].w + r7.w;
    if (p0)
    {
        if (p0)
        {
            r3.w = 3.0 * r2.w;
            a0 = xe_mova(r3.w);
            r10 = r12.wwww * BoneMatrices[a0] + r10;
            r0 = r12.wwww * BoneMatrices[a0 + 1] + r0;
            r5.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r7.w = r12.w * BoneMatrices[a0 + 2].w + r7.w;
        }
    }
    r8.xyz = r4.xyz * 0.007843138 - 1.0;
    r4.xyz = r1.xyw * 0.007843138 - 1.0;
    r9.xyz = r6.xyz * 0.007843138 - 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r1.w = dot(r7.zxyw, r5);
    r5.xyz = r12.xxx * BoneMatrices[a0].xyz;
    r6.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = dot(r10.zxyw, r13);
    r1.y = dot(r0.zxyw, r13);
    r0 = r1.wwww * LocalToWorld[2].xzyw;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r1.xxxx * LocalToWorld[0].xzyw + r0;
    ps = r0.w;
    r13.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    ps = LocalToWorld[3].w + r1.x;
    r0.xyz = r0.yxz + LocalToWorld[3].zxy;
    r0.w = ps;
    r1.xyw = -r0.zyx * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r10 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r10;
    r10 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r10.xzwy;
    r10 = r0.yyyy * ViewProjectionMatrix[0] + r10.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r12.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r6.xyz = r12.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r13.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r13.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r12.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r6.xyz = r12.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r13.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r13.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r5.xyz = r12.www * BoneMatrices[a0].xyz + r5.xyz;
            r6.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r13.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r13.xyz;
        }
    }
    r15.x = dot(r9.zxy, r5.zxy);
    r15.y = dot(r9.zxy, r6.zxy);
    r14.z = dot(r4.zxy, r5.zxy);
    r14.w = dot(r4.zxy, r13.zxy);
    r14.x = dot(r4.zxy, r6.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r14.y = dot(r9.zxy, r13.zxy);
    r17.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r16.x = dot(r8.zxy, r5.zxy);
    r17.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r16.y = dot(r8.zxy, r6.zxy);
    r17.z = ps;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r16.z = dot(r8.zxy, r13.zxy);
    r1.xzw = r1.xxx * WorldToLocal[1].xzy + r17.xyz;
    r13.xyz = r12.xxx * BoneMatrices[a0].xyz;
    r6.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r5.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    r1.yzw = r1.yyy * WorldToLocal[0].xyz + r1.xwz;
    r1.x = dot(r16.zxy, r1.wyz);
    ps = LightPositionAndInvRadius.x - r0.y;
    r14.xy = r14.xy * r1.zw;
    r0.y = ps;
    r14.w = dot(r14.wz, r1.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r0.z;
    r1.yz = r15.xy * r1.yz;
    r0.z = ps;
    ps = LightPositionAndInvRadius.z - r0.x;
    r14.z = r1.y + r1.z;
    r0.w = ps;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yz = r14.xz + r14.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.xyz = r12.yyy * BoneMatrices[a0].xyz + r13.xyz;
    r6.xyz = r12.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.z;
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.xyz = r12.zzz * BoneMatrices[a0].xyz + r13.xyz;
    r6.xyz = r12.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r13.xyz = r12.www * BoneMatrices[a0].xyz + r13.xyz;
            r6.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r5.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r3.z = dot(r9.zxy, r13.zxy);
    r3.w = dot(r9.zxy, r6.zxy);
    r14.x = dot(r4.zxy, r13.zxy);
    r14.y = dot(r4.zxy, r5.zxy);
    r14.z = dot(r4.zxy, r6.zxy);
    r14.w = dot(r9.zxy, r5.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r9.x = dot(r8.zxy, r13.zxy);
    r4.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r9.y = dot(r8.zxy, r6.zxy);
    r4.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r9.z = dot(r8.zxy, r5.zxy);
    r4.z = ps;
    r4.xyz = r0.zzz * WorldToLocal[1].xzy + r4.xyz;
    r4.xyz = r0.yyy * WorldToLocal[0].xyz + r4.xzy;
    r5.xy = r14.zw * r4.yz;
    r5.w = dot(r14.yx, r4.zx) + 0.0;
    r3.zw = r3.zw * r4.xy;
    ps = r3.z + r3.w;
    r4.x = dot(r9.zxy, r4.zxy);
    r5.z = ps;
    r4.yz = r5.xz + r5.wy;
    r1.w = r2.y * 3.0;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r8 = r12.xxxx * BoneMatrices[a0];
    r6 = r12.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r12.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r2.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r8 = r12.yyyy * BoneMatrices[a0] + r8;
    r6 = r12.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r12.y * BoneMatrices[a0 + 2].w + r7.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r8 = r12.zzzz * BoneMatrices[a0] + r8;
    r6 = r12.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r12.z * BoneMatrices[a0 + 2].w + r7.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r8 = r12.wwww * BoneMatrices[a0] + r8;
    r6 = r12.wwww * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r12.w * BoneMatrices[a0 + 2].w + r7.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r0.x = dot(r8.zxyw, r5);
    r1.w = dot(r6.zxyw, r5);
    r2.x = dot(r7.zxyw, r2);
    r2 = r2.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r2 = r1.wwww * LocalToWorld[1].xzyw + r2.xzwy;
    r5 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r2 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r5.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r5.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r2;
    o0.xy = r11.zw;
    o1.xy = r11.xy;
    o2.xy = r3.xy;
    o3.xyz = r4.xyz;
    o4.xyz = r0.yzw * LightPositionAndInvRadius.www;
    o4.w = 0.0;
    o5.xyz = r1.xyz;
    o6 = r10;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    return Out;
}
