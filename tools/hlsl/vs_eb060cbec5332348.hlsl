// vs_eb060cbec5332348.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 807 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000C9C 00510010 00000000 00000000 000060C6 00000001 00000006 00000006 00000290 0010001F 00006020 00007021 00003022 00002023 00201024 0000F054 0001F156 0002F257 0003F358 0004F4A0 0005F5A1 00001108 00001106 00001109 0000110A 0000110B 00001107
//   vertex element: instruction 31 -> POSITION0
//   vertex element: instruction 32 -> TANGENT0
//   vertex element: instruction 33 -> BINORMAL0
//   vertex element: instruction 34 -> NORMAL0
//   vertex element: instruction 35 -> BLENDINDICES0
//   vertex element: instruction 36 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 39
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 48
// NOTE: unhandled control flow cjmp at cf 51
// NOTE: unhandled control flow cjmp at cf 54

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c239); // float4[2]
float4 LightType : register(c238); // float[2]
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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

    r12.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r9 = In.blendweight0;
    r5.xyz = r3.xyz * 0.007843138 - 1.0;
    r8.xyz = r2.xyz * 0.007843138 - 1.0;
    r13.xyz = r0.yzw * 0.007843138 - 1.0;
    r3.w = r1.y * 3.0;
    a0 = xe_mova(r3.w);
    r4.z = float((MaxBoneInfluences.x > 1.0));
    r0.yzw = r9.xxx * BoneMatrices[a0].xyz;
    r3.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r4.z != 0.0);
    r2.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.x;
    a0 = xe_mova(r2.w);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r9.yyy * BoneMatrices[a0].xyz + r0.yzw;
    r3.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.z;
    a0 = xe_mova(r2.w);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r9.zzz * BoneMatrices[a0].xyz + r0.yzw;
    r3.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r1.w;
            a0 = xe_mova(r0.x);
            r0.yzw = r9.www * BoneMatrices[a0].xyz + r0.yzw;
            r3.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r3.xyz;
            r2.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r7.x = dot(r5.zxy, r0.wyz);
    r7.z = dot(r5.zxy, r2.zxy);
    r10.x = dot(r8.zxy, r2.zxy);
    r10.y = dot(r8.zxy, r3.zxy);
    r10.z = dot(r8.zxy, r0.wyz);
    r0.x = dot(r13.zxy, r3.zxy);
    r0.y = dot(r13.zxy, r0.wyz);
    r0.z = dot(r13.zxy, r2.zxy);
    a0 = xe_mova(r3.w);
    r7.w = dot(r5.zxy, r3.zxy);
    r2 = r9.xxxx * BoneMatrices[a0];
    r11 = r9.xxxx * BoneMatrices[a0 + 1];
    r4.xyw = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r12.w = r9.x * BoneMatrices[a0 + 2].w;
    r7.y = -r7.w;
    r6.xyz = r10.xxy * r0.xyy;
    r6.w = 0.5 * r0.x;
    r3.xyz = r7.xwz * 0.5 + 0.5;
    r6.xyz = r10.yzz * r0.zzx - r6.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r7.xyz, r6.xyz);
    r6.y = ps;
    ps = 0.5 * r0.z;
    r6.x = r0.w * 0.5;
    r6.z = ps;
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r6.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.yyyy * BoneMatrices[a0] + r2;
    r11 = r9.yyyy * BoneMatrices[a0 + 1] + r11;
    r4.xyw = r9.yyy * BoneMatrices[a0 + 2].xyz + r4.xyw;
    r12.w = r9.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.zzzz * BoneMatrices[a0] + r2;
    r11 = r9.zzzz * BoneMatrices[a0 + 1] + r11;
    r4.xyw = r9.zzz * BoneMatrices[a0 + 2].xyz + r4.xyw;
    r12.w = r9.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r9.wwww * BoneMatrices[a0] + r2;
            r11 = r9.wwww * BoneMatrices[a0 + 1] + r11;
            r4.xyw = r9.www * BoneMatrices[a0 + 2].xyz + r4.xyw;
            r12.w = r9.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.wxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.x = dot(r12.zxyw, r0);
    r6.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r2.zxyw, r14);
    r2.y = dot(r11.zxyw, r14);
    r0 = r0.xxxx * LocalToWorld[2].xzyw;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r2.xxxx * LocalToWorld[0].wxzy + r0.wxyz;
    ps = r0.x;
    r2.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r14.xyz = r0.ywz + LocalToWorld[3].xyz;
    r0.z = ps;
    r0.xyw = -r14.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xy = r0.zz * ViewProjectionMatrix[3].zw;
    r4.xy = r14.zz * ViewProjectionMatrix[2].zw + r4.xy;
    r4.xy = r14.yy * ViewProjectionMatrix[1].zw + r4.xy;
    r4.xy = r14.xx * ViewProjectionMatrix[0].zw + r4.xy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r9.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r10.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r2.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r9.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r10.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r2.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r6.xyz = r9.www * BoneMatrices[a0].xyz + r6.xyz;
            r10.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r2.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r15.x = dot(r13.zxy, r6.zxy);
    r15.y = dot(r13.zxy, r10.zxy);
    r15.z = dot(r8.zxy, r6.zxy);
    r15.w = dot(r8.zxy, r2.zxy);
    r16.x = dot(r8.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r16.y = dot(r13.zxy, r2.zxy);
    r11.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r6.x = dot(r5.zxy, r6.zxy);
    r11.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r6.y = dot(r5.zxy, r10.zxy);
    r11.z = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r6.z = dot(r5.zxy, r2.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r11.xyz;
    r11.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r2.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r6.x = dot(r6.zxy, r2.zxy);
    r0.xy = r16.xy * r2.yz;
    r0.w = dot(r15.wz, r2.zx) + 0.0;
    r6.yz = r15.xy * r2.xy;
    ps = r6.y + r6.z;
    r2.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r0.z = ps;
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.yz = r0.xz + r0.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r9.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r9.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r9.www * BoneMatrices[a0].xyz + r2.xyz;
            r11.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r14.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r15.x = dot(r13.zxy, r2.zxy);
    r15.y = dot(r13.zxy, r11.zxy);
    r15.z = dot(r13.zxy, r10.zxy);
    r16.x = dot(r8.zxy, r2.zxy);
    r16.y = dot(r8.zxy, r11.zxy);
    r16.z = dot(r8.zxy, r10.zxy);
    r2.x = dot(r5.zxy, r2.zxy);
    r2.y = dot(r5.zxy, r11.zxy);
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.z = dot(r5.zxy, r10.zxy);
    r14.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = dot(r2.zxy, WorldToLocal[2].zxy);
    r2.y = dot(r16.zxy, WorldToLocal[2].zxy);
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = dot(r15.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r14.xyz = r9.yyy * BoneMatrices[a0].xyz + r14.xyz;
    r11.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r14.xyz = r9.zzz * BoneMatrices[a0].xyz + r14.xyz;
    r11.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r14.xyz = r9.www * BoneMatrices[a0].xyz + r14.xyz;
            r11.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r4.z = dot(r13.zxy, r14.zxy);
    r4.w = dot(r13.zxy, r11.zxy);
    r15.x = dot(r8.zxy, r14.zxy);
    r15.y = dot(r8.zxy, r10.zxy);
    r15.z = dot(r8.zxy, r11.zxy);
    r15.w = dot(r13.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.x = dot(r5.zxy, r14.zxy);
    r8.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r13.y = dot(r5.zxy, r11.zxy);
    r8.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r13.z = dot(r5.zxy, r10.zxy);
    r8.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r8.xyz;
    r8.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r5.xy = r15.zw * r8.yz;
    r5.w = dot(r15.yx, r8.zx) + 0.0;
    r0.yz = r4.zw * r8.xy;
    ps = r0.y + r0.z;
    r0.x = dot(r13.zxy, r8.zxy);
    r5.z = ps;
    r0.yz = r5.xz + r5.wy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r10 = r9.xxxx * BoneMatrices[a0];
    r8 = r9.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r9.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r9.yyyy * BoneMatrices[a0] + r10;
    r8 = r9.yyyy * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r9.y * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r9.zzzz * BoneMatrices[a0] + r10;
    r8 = r9.zzzz * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r9.z * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r9.wwww * BoneMatrices[a0] + r10;
    r8 = r9.wwww * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r9.w * BoneMatrices[a0 + 2].w + r12.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r0.w = dot(r10.zxyw, r5);
    r2.w = dot(r8.zxyw, r5);
    r1.x = dot(r12.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r5 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r5.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r5.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o1.zw = r4.xy;
    o1.xy = 1.0;
    o5.xyz = r3.xyz;
    o5.w = 0.0;
    o0.xyz = r0.xyz;
    o0.w = 0.0;
    o2.xyz = r6.xyz;
    o2.w = 0.0;
    o3.xyz = r2.xyz;
    o3.w = 0.0;
    o4 = r7;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
