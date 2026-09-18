// vs_887bb8b3868284ce.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 741 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B94 00710013 00000000 00000000 00006908 00000001 00000009 00000008 00000290 0010001D 0000601E 0000301F 00202020 00101022 00005023 00015024 00065025 00275026 00003050 00013151 00027254 0003F355 00047456 0005F557 0006F6A0 0007F7A1 000010EE 000010EF 000010F1 000010F2 000010F3 000010F5 000010F4 000010F0
//   vertex element: instruction 29 -> POSITION0
//   vertex element: instruction 30 -> TANGENT0
//   vertex element: instruction 31 -> NORMAL0
//   vertex element: instruction 32 -> BLENDINDICES0
//   vertex element: instruction 34 -> BLENDWEIGHT0
//   vertex element: instruction 35 -> TEXCOORD0
//   vertex element: instruction 36 -> TEXCOORD1
//   vertex element: instruction 37 -> TEXCOORD6
//   vertex element: instruction 38 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled control flow cjmp at cf 45
// NOTE: unhandled control flow cjmp at cf 48

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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r16.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0.zxyw;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r4 = In.blendweight0;
    r8.xy = In.texcoord0.xy;
    r8.zw = In.texcoord1.xy;
    r9.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r5.xyz + r3.xyz;
    r1.y = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r3.x = dot(r3.ywz, r3.ywz);
    r0.xyw = r4.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r6.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r15.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r15.zxy, r2.xzy);
    r5.xyz = -r15.zyx * r3.xxx + r2.xyz;
    ps = r1.z;
    r2.x = dot(r5.xzy, r5.xzy);
    r1.z = ps;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.x;
    r11.xyz = r5.zyx * r2.xxx;
    r1.x = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r15.zxy * r11.yzx;
    r5.xyz = r15.yzx * r11.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r4.www * BoneMatrices[a0].xyz + r0.xyw;
            r6.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r10.x = dot(r11.zxy, r0.wxy);
    r10.z = dot(r11.zxy, r3.zxy);
    ps = r16.x;
    r14.x = dot(r5.zxy, r3.zxy);
    ps = r9.x + ps;
    r14.y = dot(r5.zxy, r6.zxy);
    r13.x = ps;
    ps = r16.y;
    r14.z = dot(r5.zxy, r0.wxy);
    ps = r9.y + ps;
    r2.x = dot(r15.zxy, r6.zxy);
    r13.y = ps;
    ps = r16.z;
    r2.y = dot(r15.zxy, r0.wxy);
    ps = r9.z + ps;
    r2.z = dot(r15.zxy, r3.zxy);
    r13.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r10.w = dot(r11.zxy, r6.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r12 = r4.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r10.w;
    r13.w = r4.x * BoneMatrices[a0 + 2].w;
    r10.y = ps;
    ps = 0.5 * r2.x;
    r6.xyz = r14.xxy * r2.xyy;
    r6.w = ps;
    r7.xyz = r10.xwz * 0.5 + 0.5;
    r6.xyz = r14.yzz * r2.zzx - r6.xyz;
    ps = 0.5 * r2.y;
    r5.w = dot(r10.xyz, r6.xyz);
    r6.y = ps;
    ps = 0.5 * r2.z;
    r6.x = r5.w * 0.5;
    r6.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r6.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r12 = r4.yyyy * BoneMatrices[a0 + 1] + r12;
    r0.xyw = r4.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r13.w = r4.y * BoneMatrices[a0 + 2].w + r13.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r12 = r4.zzzz * BoneMatrices[a0 + 1] + r12;
    r0.xyw = r4.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r13.w = r4.z * BoneMatrices[a0 + 2].w + r13.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r12 = r4.wwww * BoneMatrices[a0 + 1] + r12;
            r0.xyw = r4.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r13.w = r4.w * BoneMatrices[a0 + 2].w + r13.w;
        }
    }
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r13.zxyy : 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.w = dot(r13.zxyw, r6);
    r6.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r3.zxyw, r14);
    r0.y = dot(r12.zxyw, r14);
    r3 = r0.wwww * LocalToWorld[2].xzyw;
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3;
    r12 = r0.xxxx * LocalToWorld[0].xzyw + r3;
    ps = r12.w;
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r2.xyz = r12.yxz + LocalToWorld[3].zxy;
    r3.w = ps;
    r0.xyw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r12 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r12;
    r12 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r12.xzwy;
    r12 = r2.yyyy * ViewProjectionMatrix[0] + r12.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r4.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r13.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r4.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r13.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r6.xyz = r4.www * BoneMatrices[a0].xyz + r6.xyz;
            r13.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r18.x = dot(r15.zxy, r6.zxy);
    r18.y = dot(r15.zxy, r13.zxy);
    r17.z = dot(r5.zxy, r6.zxy);
    r17.w = dot(r5.zxy, r3.zxy);
    r17.x = dot(r5.zxy, r13.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r17.y = dot(r15.zxy, r3.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r19.x = dot(r11.zxy, r6.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r19.y = dot(r11.zxy, r13.zxy);
    r14.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r19.z = dot(r11.zxy, r3.zxy);
    r6.xyz = r0.xxx * WorldToLocal[1].xzy + r14.xyz;
    r3.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r14.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r13.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r6.yzw = r0.yyy * WorldToLocal[0].xyz + r6.xzy;
    r6.x = dot(r19.zxy, r6.wyz);
    ps = LightPositionAndInvRadius.x - r2.y;
    r17.xy = r17.xy * r6.zw;
    r0.x = ps;
    r17.w = dot(r17.wz, r6.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r2.z;
    r6.yz = r18.xy * r6.yz;
    r0.y = ps;
    ps = LightPositionAndInvRadius.z - r2.x;
    r17.z = r6.y + r6.z;
    r0.w = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.yz = r17.xz + r17.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r4.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r14.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r14.xyz;
    r13.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r13.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r4.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r14.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r14.xyz;
    r13.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r13.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r3.xyz = r4.www * BoneMatrices[a0].xyz + r3.xyz;
            r14.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r14.xyz;
            r13.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r13.xyz;
        }
    }
    r17.x = dot(r15.zxy, r3.zxy);
    r17.y = dot(r15.zxy, r14.zxy);
    r2.z = dot(r5.zxy, r3.zxy);
    r2.w = dot(r5.zxy, r13.zxy);
    r2.x = dot(r5.zxy, r14.zxy);
    r2.y = dot(r15.zxy, r13.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.x = dot(r11.zxy, r3.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r15.y = dot(r11.zxy, r14.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r15.z = dot(r11.zxy, r13.zxy);
    r3.z = ps;
    r3.xyz = r0.yyy * WorldToLocal[1].xzy + r3.xyz;
    r5.xyz = r0.xxx * WorldToLocal[0].xyz + r3.xzy;
    r2.xy = r2.xy * r5.yz;
    r2.w = dot(r2.wz, r5.zx) + 0.0;
    r3.yz = r17.xy * r5.xy;
    ps = r3.y + r3.z;
    r3.x = dot(r15.zxy, r5.zxy);
    r2.z = ps;
    r3.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r11.xyz = r9.xyz + r16.xyz;
    r2 = r4.xxxx * BoneMatrices[a0];
    r9 = r4.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.y = r1.z * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r9 = r4.yyyy * BoneMatrices[a0 + 1] + r9;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r11.w = r4.y * BoneMatrices[a0 + 2].w + r11.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r9 = r4.zzzz * BoneMatrices[a0 + 1] + r9;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r11.w = r4.z * BoneMatrices[a0 + 2].w + r11.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r4.wwww * BoneMatrices[a0] + r2;
    r9 = r4.wwww * BoneMatrices[a0 + 1] + r9;
    r5.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r11.w = r4.w * BoneMatrices[a0 + 2].w + r11.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.z = dot(r2.zxyw, r4);
    r2.x = dot(r9.zxyw, r4);
    r1.x = dot(r11.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.xxxx * LocalToWorld[1].xzyw + r1.xzwy;
    r2 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r8.xy;
    o1.xy = r8.zw;
    o7.xyz = r7.xyz;
    o7.w = 0.0;
    o2.xyz = r3.xyz;
    o3.xyz = r0.xyw * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r6.xyz;
    o6 = r10;
    o5 = r12;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
