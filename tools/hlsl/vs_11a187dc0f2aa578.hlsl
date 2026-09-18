// vs_11a187dc0f2aa578.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 606 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000978 00310010 00000000 00000000 00003884 00000001 00000007 00000004 00000290 00100018 00006019 0000301A 0020201B 0010101D 0006501E 0037501F 00007054 0001F155 00027256 0003F357 000010C5 000010C6 000010C7 000010C8
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD6
//   vertex element: instruction 31 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r7.xyz = In.position0.zyx;
    r9.xyz = In.tangent0.xyz;
    r3.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxwz;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r4 = In.blendweight0;
    r13.xyz = In.texcoord6.zyx;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r6.xyz = r7.zyx + r13.zyx;
    r2 = r4.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r4.x * BoneMatrices[a0 + 2].w;
    ps = r1.z;
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.z = ps;
    ps = r1.x;
    r8 = r4.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r8 = r4.yyyy * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r6.w = r4.y * BoneMatrices[a0 + 2].w + r6.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r8 = r4.zzzz * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r6.w = r4.z * BoneMatrices[a0 + 2].w + r6.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r5.w = ps;
            a0 = xe_mova(r5.w);
            ps = r5.w;
            r2 = r4.wwww * BoneMatrices[a0] + r2;
            r8 = r4.wwww * BoneMatrices[a0 + 1] + r8;
            r5.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r6.w = r4.w * BoneMatrices[a0 + 2].w + r6.w;
        }
    }
    r9.xyz = r9.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r3.xyz = r3.xyz + r0.xyw;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r5.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r8.zxyw, r11);
    r0.w = dot(r6.zxyw, r12);
    r3.xyz = r3.xyz * 0.007843138 - 1.0;
    r0.y = dot(r3.xzy, r3.xzy);
    r6 = r0.wwww * LocalToWorld[2].xzyw;
    r6 = r0.xxxx * LocalToWorld[1].xzyw + r6;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r2.zxyw, r11);
    r0.y = ps;
    r12.xyz = r3.zyx * r0.yyy;
    r2 = r0.xxxx * LocalToWorld[0].xzyw + r6;
    ps = r2.w;
    r3.x = dot(r12.zxy, r9.zxy);
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r2.xyz = r2.yxz + LocalToWorld[3].zxy;
    r2.w = ps;
    r0.xyw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r3.xyz = -r12.zyx * r3.xxx + r9.zyx;
    r6 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r6 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r6;
    r2.w = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r2.w));
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r2.w = ps;
    r6 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r9 = r2.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    r6.xyz = r3.zyx * r2.www;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r12.zxy * r6.yzx;
    r3.xyz = r12.yzx * r6.zxy - r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.w = ps;
            a0 = xe_mova(r2.w);
            ps = r2.w;
            r5.xyz = r4.www * BoneMatrices[a0].xyz + r5.xyz;
            r10.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r15.x = dot(r12.zxy, r5.zxy);
    r15.y = dot(r12.zxy, r10.zxy);
    r14.z = dot(r3.zxy, r5.zxy);
    r14.w = dot(r3.zxy, r8.zxy);
    r14.x = dot(r3.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r14.y = dot(r12.zxy, r8.zxy);
    r11.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r16.x = dot(r6.zxy, r5.zxy);
    r11.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r16.y = dot(r6.zxy, r10.zxy);
    r11.z = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r16.z = dot(r6.zxy, r8.zxy);
    r8.xyz = r0.xxx * WorldToLocal[1].xzy + r11.xyz;
    r5.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r8.yzw = r0.yyy * WorldToLocal[0].xyz + r8.xzy;
    r8.x = dot(r16.zxy, r8.wyz);
    ps = LightPositionAndInvRadius.x - r2.y;
    r14.xy = r14.xy * r8.zw;
    r0.x = ps;
    r14.w = dot(r14.wz, r8.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r2.z;
    r8.yz = r15.xy * r8.yz;
    r0.y = ps;
    ps = LightPositionAndInvRadius.z - r2.x;
    r14.z = r8.y + r8.z;
    r0.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.yz = r14.xz + r14.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r11.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r11.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r5.xyz = r4.www * BoneMatrices[a0].xyz + r5.xyz;
            r11.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r2.x = dot(r12.zxy, r5.zxy);
    r2.y = dot(r12.zxy, r11.zxy);
    r2.z = dot(r3.zxy, r5.zxy);
    r2.w = dot(r3.zxy, r10.zxy);
    r3.x = dot(r3.zxy, r11.zxy);
    r3.y = dot(r12.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r12.x = dot(r6.zxy, r5.zxy);
    r5.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r12.y = dot(r6.zxy, r11.zxy);
    r5.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r12.z = dot(r6.zxy, r10.zxy);
    r5.z = ps;
    r5.xyz = r0.yyy * WorldToLocal[1].xzy + r5.xyz;
    r5.xyz = r0.xxx * WorldToLocal[0].xyz + r5.xzy;
    r3.xy = r3.xy * r5.yz;
    r3.w = dot(r2.wz, r5.zx) + 0.0;
    r2.yz = r2.xy * r5.xy;
    ps = r2.y + r2.z;
    r2.x = dot(r12.zxy, r5.zxy);
    r3.z = ps;
    r2.yz = r3.xz + r3.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r7.xyz = r7.zyx + r13.zyx;
    r3 = r4.xxxx * BoneMatrices[a0];
    r6 = r4.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r6 = r4.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r4.y * BoneMatrices[a0 + 2].w + r7.w;
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
    r7.w = r4.z * BoneMatrices[a0 + 2].w + r7.w;
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
    r7.w = r4.w * BoneMatrices[a0 + 2].w + r7.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r0.z = dot(r3.zxyw, r4);
    r2.w = dot(r6.zxyw, r4);
    r1.x = dot(r7.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r3 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r3.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r3.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xyz = r2.xyz;
    o1.xyz = r0.xyw * LightPositionAndInvRadius.www;
    o1.w = 0.0;
    o2.xyz = r8.xyz;
    o3 = r9;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
