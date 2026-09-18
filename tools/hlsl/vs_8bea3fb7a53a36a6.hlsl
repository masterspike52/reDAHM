// vs_8bea3fb7a53a36a6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 618 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000009A8 00510011 00000000 00000000 000048C6 00000001 00000009 00000006 00000290 00100018 00006019 0000301A 0020201B 0010101D 0000501E 0001501F 00065020 00375021 00003050 00013151 00027254 0003F355 00047456 0005F557 000010C7 000010C8 000010C9 000010CA 000010CB 000010CC
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD1
//   vertex element: instruction 32 -> TEXCOORD6
//   vertex element: instruction 33 -> TEXCOORD7
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
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled control flow cjmp at cf 39

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
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r17 = 0.0;
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

    r14.xyz = In.position0.xyz;
    r10.xyz = In.tangent0.xyz;
    r2.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxwz;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r4 = In.blendweight0;
    r7.zw = In.texcoord0.xy;
    r7.xy = In.texcoord1.xy;
    r6.xyz = In.texcoord6.xyz;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r5.xyz = r14.xyz + r6.xyz;
    r3 = r4.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r4.x * BoneMatrices[a0 + 2].w;
    ps = r1.z;
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.z = ps;
    ps = r1.x;
    r9 = r4.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r8.w = ps;
    a0 = xe_mova(r8.w);
    ps = r8.w;
    r6.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r9 = r4.yyyy * BoneMatrices[a0 + 1] + r9;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r5.w = r4.y * BoneMatrices[a0 + 2].w + r5.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r8.w = ps;
    a0 = xe_mova(r8.w);
    ps = r8.w;
    r6.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r9 = r4.zzzz * BoneMatrices[a0 + 1] + r9;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r5.w = r4.z * BoneMatrices[a0 + 2].w + r5.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r6.w = ps;
            a0 = xe_mova(r6.w);
            ps = r6.w;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r9 = r4.wwww * BoneMatrices[a0 + 1] + r9;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r5.w = r4.w * BoneMatrices[a0 + 2].w + r5.w;
        }
    }
    r10.xyz = r10.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.xyz = r2.xyz + r0.xyw;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r8.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r9.zxyw, r12);
    r0.w = dot(r5.zxyw, r13);
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.y = dot(r2.xzy, r2.xzy);
    r5 = r0.wwww * LocalToWorld[2].xzyw;
    r5 = r0.xxxx * LocalToWorld[1].xzyw + r5;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r3.zxyw, r12);
    r0.y = ps;
    r13.xyz = r2.zyx * r0.yyy;
    r5 = r0.xxxx * LocalToWorld[0].xzyw + r5;
    ps = r5.w;
    r3.y = dot(r13.zxy, r10.zxy);
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r2.xyz = r5.yxz + LocalToWorld[3].zxy;
    r3.x = ps;
    r0.xyw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r3.yzw = -r13.zyx * r3.yyy + r10.zyx;
    r5 = r3.xxxx * ViewProjectionMatrix[3].xwzy;
    r5 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r5;
    r3.x = dot(r3.ywz, r3.ywz);
    ps = rsqrt(abs(r3.x));
    r10.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = ps;
    r5 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r9 = r2.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    r5.xyz = r3.wzy * r3.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r13.zxy * r5.yzx;
    r3.xyz = r13.yzx * r5.zxy - r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r4.yyy * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r4.zzz * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r8.xyz = r4.www * BoneMatrices[a0].xyz + r8.xyz;
            r11.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r16.x = dot(r13.zxy, r8.zxy);
    r16.y = dot(r13.zxy, r11.zxy);
    r15.z = dot(r3.zxy, r8.zxy);
    r15.w = dot(r3.zxy, r10.zxy);
    r15.x = dot(r3.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.y = dot(r13.zxy, r10.zxy);
    r12.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r17.x = dot(r5.zxy, r8.zxy);
    r12.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r17.y = dot(r5.zxy, r11.zxy);
    r12.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r17.z = dot(r5.zxy, r10.zxy);
    r8.xyz = r0.xxx * WorldToLocal[1].xzy + r12.xyz;
    r10.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r11.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r8.yzw = r0.yyy * WorldToLocal[0].xyz + r8.xzy;
    r8.x = dot(r17.zxy, r8.wyz);
    ps = LightPositionAndInvRadius.x - r2.y;
    r15.xy = r15.xy * r8.zw;
    r0.x = ps;
    r15.w = dot(r15.wz, r8.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r2.z;
    r8.yz = r16.xy * r8.yz;
    r0.y = ps;
    ps = LightPositionAndInvRadius.z - r2.x;
    r15.z = r8.y + r8.z;
    r0.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.yz = r15.xz + r15.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.xyz = r4.yyy * BoneMatrices[a0].xyz + r10.xyz;
    r12.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.xyz = r4.zzz * BoneMatrices[a0].xyz + r10.xyz;
    r12.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r10.xyz = r4.www * BoneMatrices[a0].xyz + r10.xyz;
            r12.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r2.x = dot(r13.zxy, r10.zxy);
    r2.y = dot(r13.zxy, r12.zxy);
    r2.z = dot(r3.zxy, r10.zxy);
    r2.w = dot(r3.zxy, r11.zxy);
    r3.x = dot(r3.zxy, r12.zxy);
    r3.y = dot(r13.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r10.x = dot(r5.zxy, r10.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r10.y = dot(r5.zxy, r12.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r10.z = dot(r5.zxy, r11.zxy);
    r13.z = ps;
    r5.xyz = r0.yyy * WorldToLocal[1].xzy + r13.xyz;
    r5.xyz = r0.xxx * WorldToLocal[0].xyz + r5.xzy;
    r3.xy = r3.xy * r5.yz;
    r3.w = dot(r2.wz, r5.zx) + 0.0;
    r2.yz = r2.xy * r5.xy;
    ps = r2.y + r2.z;
    r2.x = dot(r10.zxy, r5.zxy);
    r3.z = ps;
    r2.yz = r3.xz + r3.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r10.xyz = r6.xyz + r14.xyz;
    r3 = r4.xxxx * BoneMatrices[a0];
    r6 = r4.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r6 = r4.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r4.y * BoneMatrices[a0 + 2].w + r10.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r6 = r4.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r4.z * BoneMatrices[a0 + 2].w + r10.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r4.wwww * BoneMatrices[a0] + r3;
    r6 = r4.wwww * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r10.w = r4.w * BoneMatrices[a0 + 2].w + r10.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.z = dot(r3.zxyw, r4);
    r2.w = dot(r6.zxyw, r4);
    r1.x = dot(r10.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r3 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r3.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r3.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r7.zw;
    o1.xy = r7.xy;
    o2.xyz = r2.xyz;
    o3.xyz = r0.xyw * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r8.xyz;
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
