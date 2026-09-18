// vs_acc453b8d863e039.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 579 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000090C 0051000E 00000000 00000000 000048C6 00000001 00000008 00000006 00000290 00100017 00006018 00007019 0000301A 0000201B 0000101C 0000501D 0021501E 00003050 00013151 00027254 0003F355 00047456 0005F557 000010BB 000010BC 000010BD 000010BA 000010BE 000010BF
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

    r9.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r6 = In.blendweight0;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r5 = r6.xxxx * BoneMatrices[a0];
    r11 = r6.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.yyyy * BoneMatrices[a0] + r5;
    r11 = r6.yyyy * BoneMatrices[a0 + 1] + r11;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.zzzz * BoneMatrices[a0] + r5;
    r11 = r6.zzzz * BoneMatrices[a0 + 1] + r11;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r5 = r6.wwww * BoneMatrices[a0] + r5;
            r11 = r6.wwww * BoneMatrices[a0 + 1] + r11;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r12.xyz = r0.yzw * 0.007843138 - 1.0;
    r10.xyz = r7.xyz * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = dot(r9.zxyw, r0);
    r4.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r8.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r5.x = dot(r5.zxyw, r13);
    r5.y = dot(r11.zxyw, r13);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r11 = r5.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r11.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r11.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r11.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r11.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r11.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r8.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r8.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r4.xyz = r6.www * BoneMatrices[a0].xyz + r4.xyz;
            r8.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r13.x = dot(r10.zxy, r4.zxy);
    r13.y = dot(r10.zxy, r8.zxy);
    r11.z = dot(r12.zxy, r4.zxy);
    r11.w = dot(r12.zxy, r7.zxy);
    r11.x = dot(r12.zxy, r8.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r11.y = dot(r10.zxy, r7.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r4.x = dot(r2.zxy, r4.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r4.y = dot(r2.zxy, r8.zxy);
    r14.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r4.z = dot(r2.zxy, r7.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r14.xyz;
    r8.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.yzw = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.x = dot(r4.zxy, r0.wyz);
    r11.xy = r11.xy * r0.zw;
    r11.w = dot(r11.wz, r0.wy) + 0.0;
    r0.yz = r13.xy * r0.yz;
    ps = r0.y + r0.z;
    r4.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r11.z = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yz = r11.xz + r11.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r8.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r8.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r4.xyz = r6.www * BoneMatrices[a0].xyz + r4.xyz;
            r8.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r11.x = dot(r12.zxy, r4.zxy);
    r11.y = dot(r12.zxy, r8.zxy);
    r11.z = dot(r10.zxy, r4.zxy);
    ps = WorldToLocal[2].x;
    r11.w = dot(r10.zxy, r7.zxy);
    ps = LightDirection.z * ps;
    r12.x = dot(r12.zxy, r7.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].y;
    r12.y = dot(r10.zxy, r8.zxy);
    ps = LightDirection.z * ps;
    r10.x = dot(r2.zxy, r4.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].z;
    r10.y = dot(r2.zxy, r7.zxy);
    ps = LightDirection.z * ps;
    r10.z = dot(r2.zxy, r8.zxy);
    r13.z = ps;
    r2.xyz = WorldToLocal[1].xyz * LightDirection.yyy + r13.xyz;
    r7.xyz = WorldToLocal[0].xzy * LightDirection.xxx + r2.xzy;
    r4.yz = r12.xy * r7.yz;
    r4.w = dot(r11.wz, r7.yx) + 0.0;
    r2.yz = r11.xy * r7.xz;
    ps = r2.y + r2.z;
    r2.x = dot(r10.yxz, r7.yxz);
    r4.x = ps;
    r2.yz = r4.xz + r4.yw;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r8 = r6.xxxx * BoneMatrices[a0];
    r7 = r6.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r6.yyyy * BoneMatrices[a0] + r8;
    r7 = r6.yyyy * BoneMatrices[a0 + 1] + r7;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r6.zzzz * BoneMatrices[a0] + r8;
    r7 = r6.zzzz * BoneMatrices[a0 + 1] + r7;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r6.wwww * BoneMatrices[a0] + r8;
    r7 = r6.wwww * BoneMatrices[a0 + 1] + r7;
    r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r0.w = dot(r8.zxyw, r4);
    r2.w = dot(r7.zxyw, r4);
    r1.x = dot(r9.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r4 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r4.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r3.zw;
    o1.xy = r3.xy;
    o2.xyz = r2.xyz;
    o4.xyz = r0.xyz;
    o5 = r5;

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
