// vs_7f0635c5e5ecc2a6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 594 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000948 00310011 00000000 00000000 00003C84 00000001 00000007 00000004 00000290 00100018 00006019 0000301A 0020201B 0010101D 0006501E 0027501F 0000F056 00017157 0002F2A0 0003F3A1 000010C2 000010C1 000010C4 000010C3
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD6
//   vertex element: instruction 31 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38

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
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3.xyz = In.position0.zyx;
    r2.xyz = In.tangent0.xyz;
    r6.xyz = In.normal0.xyz;
    r1 = In.blendindices0.zxyw;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r5 = In.blendweight0;
    r9.xyz = In.texcoord6.zyx;
    r4.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r4.xyz = r6.zyx + r4.zyx;
    r2.w = ps;
    r4.xyz = r4.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.w = dot(r4.xzy, r4.xzy);
    r0.xyw = r5.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.w));
    r6.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r3.w = ps;
    r12.xyz = r4.zyx * r3.www;
    r3.w = dot(r12.zxy, r2.xzy);
    r7.xyz = -r12.zyx * r3.www + r2.xyz;
    ps = r1.z;
    r2.x = dot(r7.xzy, r7.xzy);
    r1.z = ps;
    ps = rsqrt(abs(r2.x));
    r4.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.x;
    r14.xyz = r7.zyx * r2.xxx;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r12.zxy * r14.yzx;
    r7.xyz = r12.yzx * r14.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r5.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r5.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r5.www * BoneMatrices[a0].xyz + r0.xyw;
            r6.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r4.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r10.x = dot(r14.zxy, r0.wxy);
    r10.z = dot(r14.zxy, r4.zxy);
    ps = r3.z;
    r11.x = dot(r7.zxy, r4.zxy);
    ps = r9.z + ps;
    r11.y = dot(r7.zxy, r6.zxy);
    r15.x = ps;
    ps = r3.y;
    r11.z = dot(r7.zxy, r0.wxy);
    ps = r9.y + ps;
    r2.x = dot(r12.zxy, r6.zxy);
    r15.y = ps;
    ps = r3.x;
    r2.y = dot(r12.zxy, r0.wxy);
    ps = r9.x + ps;
    r2.z = dot(r12.zxy, r4.zxy);
    r15.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r10.w = dot(r14.zxy, r6.zxy);
    r4 = r5.xxxx * BoneMatrices[a0];
    r13 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r5.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r10.w;
    r15.w = r5.x * BoneMatrices[a0 + 2].w;
    r10.y = ps;
    ps = 0.5 * r2.x;
    r8.xyz = r11.xxy * r2.xyy;
    r8.w = ps;
    r6.xyz = r10.xwz * 0.5 + 0.5;
    r8.xyz = r11.yzz * r2.zzx - r8.xyz;
    ps = 0.5 * r2.y;
    r3.w = dot(r10.xyz, r8.xyz);
    r8.y = ps;
    ps = 0.5 * r2.z;
    r8.x = r3.w * 0.5;
    r8.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r8.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r5.yyyy * BoneMatrices[a0] + r4;
    r13 = r5.yyyy * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r15.w = r5.y * BoneMatrices[a0 + 2].w + r15.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r5.zzzz * BoneMatrices[a0] + r4;
    r13 = r5.zzzz * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r15.w = r5.z * BoneMatrices[a0 + 2].w + r15.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r4 = r5.wwww * BoneMatrices[a0] + r4;
            r13 = r5.wwww * BoneMatrices[a0 + 1] + r13;
            r0.xyw = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r15.w = r5.w * BoneMatrices[a0 + 2].w + r15.w;
        }
    }
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r15.zxyy : 1.0;
    r2.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = dot(r4.zxyw, r17);
    r0.y = dot(r13.zxyw, r17);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = dot(r15.zxyw, r16);
    r4 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r4 = r0.yyyy * LocalToWorld[1].xzyw + r4.xzyw;
    r4 = r0.xxxx * LocalToWorld[0].xywz + r4.xzwy;
    r0.xyw = -r4.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r5.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r5.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r2.xyz = r5.www * BoneMatrices[a0].xyz + r2.xyz;
            r11.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r13.x = dot(r12.zxy, r2.zxy);
    r13.y = dot(r12.zxy, r11.zxy);
    r13.z = dot(r7.zxy, r2.zxy);
    r13.w = dot(r7.zxy, r10.zxy);
    r15.x = dot(r7.zxy, r11.zxy);
    r15.y = dot(r12.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r12.x = dot(r14.zxy, r2.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r12.y = dot(r14.zxy, r11.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r12.z = dot(r14.zxy, r10.zxy);
    r2.z = ps;
    r2.xyz = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r7.xyz = r0.yyy * WorldToLocal[0].xyz + r2.xzy;
    r2.xy = r15.xy * r7.yz;
    r2.w = dot(r13.wz, r7.zx) + 0.0;
    r0.xy = r13.xy * r7.xy;
    ps = r0.x + r0.y;
    r7.x = dot(r12.zxy, r7.zxy);
    r2.z = ps;
    r7.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r9.xyz = r3.zyx + r9.zyx;
    r2 = r5.xxxx * BoneMatrices[a0];
    r3 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.y = r1.z * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r2 = r5.yyyy * BoneMatrices[a0] + r2;
    r3 = r5.yyyy * BoneMatrices[a0 + 1] + r3;
    r0.xyw = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r5.y * BoneMatrices[a0 + 2].w + r9.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r2 = r5.zzzz * BoneMatrices[a0] + r2;
    r3 = r5.zzzz * BoneMatrices[a0 + 1] + r3;
    r0.xyw = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r5.z * BoneMatrices[a0 + 2].w + r9.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r5.wwww * BoneMatrices[a0] + r2;
    r3 = r5.wwww * BoneMatrices[a0 + 1] + r3;
    r0.xyw = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r5.w * BoneMatrices[a0 + 2].w + r9.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r5);
    r1.y = dot(r3.zxyw, r5);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r4.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o1.xyz = r7.xyz;
    o0 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o3.xyz = r6.xyz;
    o3.w = 0.0;
    o2 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
