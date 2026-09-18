// vs_d588fd07ad98c37e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 564 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008D0 0031000E 00000000 00000000 00003C84 00000001 00000006 00000004 00000290 00100017 00006018 00007019 0000301A 0000201B 0020101C 0000F056 00017157 0002F2A0 0003F3A1 000010B8 000010B7 000010BA 000010B9
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 37

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
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r13.xyz = r3.xyz * 0.007843138 - 1.0;
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r11.xyz = r0.yzw * 0.007843138 - 1.0;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r5.x = float((MaxBoneInfluences.x > 1.0));
    r0.yzw = r7.xxx * BoneMatrices[a0].xyz;
    r4.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r5.x != 0.0);
    r3.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.x;
    a0 = xe_mova(r3.w);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r7.yyy * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.z;
    a0 = xe_mova(r3.w);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r7.zzz * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r1.w;
            a0 = xe_mova(r0.x);
            r0.yzw = r7.www * BoneMatrices[a0].xyz + r0.yzw;
            r4.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r4.xyz;
            r3.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r8.x = dot(r13.zxy, r0.wyz);
    r8.z = dot(r13.zxy, r3.zxy);
    r9.x = dot(r2.zxy, r3.zxy);
    r9.y = dot(r2.zxy, r4.zxy);
    r9.z = dot(r2.zxy, r0.wyz);
    r0.x = dot(r11.zxy, r4.zxy);
    r0.y = dot(r11.zxy, r0.wyz);
    r0.z = dot(r11.zxy, r3.zxy);
    a0 = xe_mova(r2.w);
    r8.w = dot(r13.zxy, r4.zxy);
    r3 = r7.xxxx * BoneMatrices[a0];
    r12 = r7.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    r8.y = -r8.w;
    r4.xyz = r9.xxy * r0.xyy;
    r4.w = 0.5 * r0.x;
    r5.yzw = r8.xwz * 0.5 + 0.5;
    r4.xyz = r9.yzz * r0.zzx - r4.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r8.xyz, r4.xyz);
    r4.y = ps;
    ps = 0.5 * r0.z;
    r4.x = r0.w * 0.5;
    r4.z = ps;
    p0 = (r5.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r4.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.yyyy * BoneMatrices[a0] + r3;
    r12 = r7.yyyy * BoneMatrices[a0 + 1] + r12;
    r6.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.zzzz * BoneMatrices[a0] + r3;
    r12 = r7.zzzz * BoneMatrices[a0 + 1] + r12;
    r6.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r7.wwww * BoneMatrices[a0] + r3;
            r12 = r7.wwww * BoneMatrices[a0 + 1] + r12;
            r6.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r6.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r8.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r2.w = dot(r3.zxyw, r14);
    r3.x = dot(r12.zxyw, r14);
    p0 = (r5.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = dot(r10.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.xxxx * LocalToWorld[1].xzyw + r0.xzyw;
    r3 = r2.wwww * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r3.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r7.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r7.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r6.xyz = r7.www * BoneMatrices[a0].xyz + r6.xyz;
            r9.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r8.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r12.x = dot(r11.zxy, r6.zxy);
    r12.y = dot(r11.zxy, r9.zxy);
    r12.z = dot(r2.zxy, r6.zxy);
    r12.w = dot(r2.zxy, r8.zxy);
    r2.x = dot(r2.zxy, r9.zxy);
    r2.y = dot(r11.zxy, r8.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r11.x = dot(r13.zxy, r6.zxy);
    r6.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r11.y = dot(r13.zxy, r9.zxy);
    r6.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r11.z = dot(r13.zxy, r8.zxy);
    r6.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r6.xyz;
    r6.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.xy = r2.xy * r6.yz;
    r0.w = dot(r12.wz, r6.zx) + 0.0;
    r2.xy = r12.xy * r6.xy;
    ps = r2.x + r2.y;
    r8.x = dot(r11.zxy, r6.zxy);
    r0.z = ps;
    r8.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r7.xxxx * BoneMatrices[a0];
    r6 = r7.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r7.yyyy * BoneMatrices[a0] + r0;
    r6 = r7.yyyy * BoneMatrices[a0 + 1] + r6;
    r2.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
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
    r2.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
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
    r2.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r7);
    r1.y = dot(r6.zxyw, r7);
    r0.x = dot(r10.zxyw, r2);
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
    o1.xyz = r8.xyz;
    o0 = r3.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o3.xyz = r5.yzw;
    o3.w = 0.0;
    o2 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
