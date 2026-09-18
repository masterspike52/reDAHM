// vs_95c39f2886a96367.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 588 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000930 0061000F 00000000 00000000 000050E7 00000001 00000009 00000007 00000290 00100018 00006019 0000701A 0000301B 0000201C 0000101D 0000501E 0001501F 00225020 00003050 00013151 00023252 00037354 0004F455 00057556 0006F657 000010BD 000010BE 000010BF 000010C0 000010BC 000010C1 000010C2
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
float4 LightDirection : register(c238); // float3
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

    r12.xyz = In.position0.xyz;
    r4.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r11 = In.blendweight0;
    r9.zw = In.texcoord0.xy;
    r9.xy = In.texcoord1.xy;
    r3.xy = In.texcoord2.xy;
    r3.z = r1.y * 3.0;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r10 = r11.xxxx * BoneMatrices[a0];
    r0 = r11.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r11.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r11.yyyy * BoneMatrices[a0] + r10;
    r0 = r11.yyyy * BoneMatrices[a0 + 1] + r0;
    r5.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r11.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r11.zzzz * BoneMatrices[a0] + r10;
    r0 = r11.zzzz * BoneMatrices[a0 + 1] + r0;
    r5.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r11.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r10 = r11.wwww * BoneMatrices[a0] + r10;
            r0 = r11.wwww * BoneMatrices[a0 + 1] + r0;
            r5.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r12.w = r11.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r6.xyz = r4.xyz * 0.007843138 - 1.0;
    r8.xyz = r2.xyz * 0.007843138 - 1.0;
    r7.xyz = r7.xyz * 0.007843138 - 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r5.w = dot(r12.zxyw, r4);
    r2.xyz = r11.xxx * BoneMatrices[a0].xyz;
    r5.xyz = r11.xxx * BoneMatrices[a0 + 1].xyz;
    r4.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    r3.w = dot(r10.zxyw, r13);
    r4.w = dot(r0.zxyw, r13);
    r0 = r5.wwww * LocalToWorld[2] + LocalToWorld[3];
    r0 = r4.wwww * LocalToWorld[1].xzyw + r0.xzyw;
    r13 = r3.wwww * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r13.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r13.zzzz * ViewProjectionMatrix[3].xwzy;
    r10 = r13.wwww * ViewProjectionMatrix[2].xwzy + r10;
    r10 = r13.yyyy * ViewProjectionMatrix[1].xzyw + r10.xzwy;
    r10 = r13.xxxx * ViewProjectionMatrix[0] + r10.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r11.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r11.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r11.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r11.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r2.xyz = r11.www * BoneMatrices[a0].xyz + r2.xyz;
            r5.xyz = r11.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r14.x = dot(r7.zxy, r2.zxy);
    r14.y = dot(r7.zxy, r5.zxy);
    r13.z = dot(r8.zxy, r2.zxy);
    r13.w = dot(r8.zxy, r4.zxy);
    r13.x = dot(r8.zxy, r5.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.y = dot(r7.zxy, r4.zxy);
    r15.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r2.x = dot(r6.zxy, r2.zxy);
    r15.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r2.y = dot(r6.zxy, r5.zxy);
    r15.z = ps;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r2.z = dot(r6.zxy, r4.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r15.xyz;
    r5.xyz = r11.xxx * BoneMatrices[a0 + 1].xyz;
    r4.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r2.x = dot(r2.zxy, r0.zxy);
    r13.xy = r13.xy * r0.yz;
    r13.w = dot(r13.wz, r0.zx) + 0.0;
    r2.yz = r14.xy * r0.xy;
    ps = r2.y + r2.z;
    r0.xyz = r11.xxx * BoneMatrices[a0].xyz;
    r13.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yz = r13.xz + r13.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r11.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r5.xyz = r11.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r11.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r5.xyz = r11.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r11.www * BoneMatrices[a0].xyz + r0.xyz;
            r5.xyz = r11.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r3.z = dot(r8.zxy, r0.zxy);
    r3.w = dot(r8.zxy, r5.zxy);
    r13.x = dot(r7.zxy, r0.zxy);
    ps = WorldToLocal[2].x;
    r13.y = dot(r7.zxy, r4.zxy);
    ps = LightDirection.z * ps;
    r8.x = dot(r8.zxy, r4.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].y;
    r8.y = dot(r7.zxy, r5.zxy);
    ps = LightDirection.z * ps;
    r7.x = dot(r6.zxy, r0.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].z;
    r7.y = dot(r6.zxy, r4.zxy);
    ps = LightDirection.z * ps;
    r7.z = dot(r6.zxy, r5.zxy);
    r14.z = ps;
    r0.xyz = WorldToLocal[1].xyz * LightDirection.yyy + r14.xyz;
    r5.xyz = WorldToLocal[0].xzy * LightDirection.xxx + r0.xzy;
    r4.yz = r8.xy * r5.yz;
    r4.w = dot(r13.yx, r5.yx) + 0.0;
    r0.yz = r3.zw * r5.xz;
    ps = r0.y + r0.z;
    r0.x = dot(r7.yxz, r5.yxz);
    r4.x = ps;
    r0.yz = r4.xz + r4.yw;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r6 = r11.xxxx * BoneMatrices[a0];
    r5 = r11.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r11.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r6 = r11.yyyy * BoneMatrices[a0] + r6;
    r5 = r11.yyyy * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r12.w = r11.y * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r6 = r11.zzzz * BoneMatrices[a0] + r6;
    r5 = r11.zzzz * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r12.w = r11.z * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r6 = r11.wwww * BoneMatrices[a0] + r6;
    r5 = r11.wwww * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r12.w = r11.w * BoneMatrices[a0 + 2].w + r12.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r0.w = dot(r6.zxyw, r4);
    r2.w = dot(r5.zxyw, r4);
    r1.x = dot(r12.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r4 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r4.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o0.xy = r9.zw;
    o1.xy = r9.xy;
    o2.xy = r3.xy;
    o3.xyz = r0.xyz;
    o5.xyz = r2.xyz;
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
