// vs_8003085beda31e33.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 729 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B64 00510011 00000000 00000000 000050C6 00000001 00000009 00000006 00000290 0010001C 0000601D 0000301E 0020201F 00101021 00005022 00015023 00065024 00375025 00003050 00013151 0002F254 0003F356 0004F457 0005F558 000010EC 000010ED 000010EF 000010EE 000010F0 000010F1
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD0
//   vertex element: instruction 35 -> TEXCOORD1
//   vertex element: instruction 36 -> TEXCOORD6
//   vertex element: instruction 37 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled control flow cjmp at cf 47

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    r1 = In.blendindices0.zxyw;
    ps = r1.z;
    r1.z = r1.y;
    r0.z = ps;
    r7 = In.blendweight0;
    r9.xy = In.texcoord0.xy;
    r6.zw = In.texcoord1.xy;
    r8.xyz = In.texcoord6.xyz;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r4.xyz = r14.xyz + r8.xyz;
    r3 = r7.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r7.x * BoneMatrices[a0 + 2].w;
    ps = r1.w;
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r1.w = ps;
    ps = r1.x;
    r11 = r7.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r6.x = ps;
    a0 = xe_mova(r6.x);
    ps = r6.x;
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.yyyy * BoneMatrices[a0] + r3;
    r11 = r7.yyyy * BoneMatrices[a0 + 1] + r11;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r4.w = r7.y * BoneMatrices[a0 + 2].w + r4.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r6.x = ps;
    a0 = xe_mova(r6.x);
    ps = r6.x;
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.zzzz * BoneMatrices[a0] + r3;
    r11 = r7.zzzz * BoneMatrices[a0 + 1] + r11;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r4.w = r7.z * BoneMatrices[a0 + 2].w + r4.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r5.w = ps;
            a0 = xe_mova(r5.w);
            ps = r5.w;
            r3 = r7.wwww * BoneMatrices[a0] + r3;
            r11 = r7.wwww * BoneMatrices[a0 + 1] + r11;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r4.w = r7.w * BoneMatrices[a0 + 2].w + r4.w;
        }
    }
    r15.xyz = r10.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.xyz = r2.xyz + r0.xyw;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r5.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r11.zxyw, r12);
    r0.w = dot(r4.zxyw, r13);
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.y = dot(r2.xzy, r2.xzy);
    r4 = r0.wwww * LocalToWorld[2].xzyw;
    r4 = r0.xxxx * LocalToWorld[1].xzyw + r4;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r3.zxyw, r12);
    r0.y = ps;
    r13.xyz = r2.zyx * r0.yyy;
    r3 = r0.xxxx * LocalToWorld[0].xzyw + r4;
    ps = r3.w;
    r2.y = dot(r13.zxy, r15.zxy);
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r12.xyz = r3.xzy + LocalToWorld[3].xyz;
    r2.x = ps;
    r0.xyw = -r12.yxz * CameraPosition.www + CameraPosition.yxz;
    r4.xyz = -r13.zyx * r2.yyy + r15.zyx;
    r2.xy = r2.xx * ViewProjectionMatrix[3].zw;
    r2.yz = r12.zz * ViewProjectionMatrix[2].zw + r2.xy;
    r2.x = dot(r4.xzy, r4.xzy);
    ps = rsqrt(abs(r2.x));
    r3.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    r2.yz = r12.yy * ViewProjectionMatrix[1].zw + r2.yz;
    r6.xy = r12.xx * ViewProjectionMatrix[0].zw + r2.yz;
    r4.xyz = r4.zyx * r2.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r13.zxy * r4.yzx;
    r2.xyz = r13.yzx * r4.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r7.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r3.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r7.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r3.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r5.xyz = r7.www * BoneMatrices[a0].xyz + r5.xyz;
            r10.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r3.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r9.z = dot(r13.zxy, r5.zxy);
    r9.w = dot(r13.zxy, r10.zxy);
    r15.z = dot(r2.zxy, r5.zxy);
    r15.w = dot(r2.zxy, r3.zxy);
    r15.x = dot(r2.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.y = dot(r13.zxy, r3.zxy);
    r11.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r5.x = dot(r4.zxy, r5.zxy);
    r11.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r5.y = dot(r4.zxy, r10.zxy);
    r11.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r5.z = dot(r4.zxy, r3.zxy);
    r3.xyz = r0.xxx * WorldToLocal[1].xzy + r11.xyz;
    r11.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r3.xzy;
    r5.x = dot(r5.zxy, r0.wxy);
    r15.xy = r15.xy * r0.yw;
    r15.w = dot(r15.wz, r0.wx) + 0.0;
    r0.xy = r9.zw * r0.xy;
    ps = r0.x + r0.y;
    r3.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r15.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yz = r15.xz + r15.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r7.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r11.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r7.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r11.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3.xyz = r7.www * BoneMatrices[a0].xyz + r3.xyz;
            r11.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r12.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r15.x = dot(r13.zxy, r3.zxy);
    r15.y = dot(r13.zxy, r11.zxy);
    r15.z = dot(r13.zxy, r10.zxy);
    r16.x = dot(r2.zxy, r3.zxy);
    r16.y = dot(r2.zxy, r11.zxy);
    r16.z = dot(r2.zxy, r10.zxy);
    r17.x = dot(r4.zxy, r3.zxy);
    r17.y = dot(r4.zxy, r11.zxy);
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r17.z = dot(r4.zxy, r10.zxy);
    r3.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r11.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.x = dot(r17.zxy, WorldToLocal[2].zxy);
    r10.y = dot(r16.zxy, WorldToLocal[2].zxy);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.z = dot(r15.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r7.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r12.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r7.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r12.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r3.xyz = r7.www * BoneMatrices[a0].xyz + r3.xyz;
            r12.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r9.z = dot(r13.zxy, r3.zxy);
    r9.w = dot(r13.zxy, r12.zxy);
    r15.x = dot(r2.zxy, r3.zxy);
    r15.y = dot(r2.zxy, r11.zxy);
    r15.z = dot(r2.zxy, r12.zxy);
    r15.w = dot(r13.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.x = dot(r4.zxy, r3.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r13.y = dot(r4.zxy, r12.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r13.z = dot(r4.zxy, r11.zxy);
    r2.z = ps;
    r2.xyz = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r2.xyz = r0.yyy * WorldToLocal[0].xyz + r2.xzy;
    r3.xy = r15.zw * r2.yz;
    r3.w = dot(r15.yx, r2.zx) + 0.0;
    r0.xy = r9.zw * r2.xy;
    ps = r0.x + r0.y;
    r2.x = dot(r13.zxy, r2.zxy);
    r3.z = ps;
    r2.yz = r3.xz + r3.wy;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r8.xyz = r8.xyz + r14.xyz;
    r3 = r7.xxxx * BoneMatrices[a0];
    r4 = r7.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r7.yyyy * BoneMatrices[a0] + r3;
    r4 = r7.yyyy * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r7.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r7.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r7.zzzz * BoneMatrices[a0] + r3;
    r4 = r7.zzzz * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r7.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r7.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r7.wwww * BoneMatrices[a0] + r3;
    r4 = r7.wwww * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r7.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r7.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r7);
    r1.y = dot(r4.zxyw, r7);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r9.xy;
    o1.xy = r6.zw;
    o3.zw = r6.xy;
    o3.xy = 1.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o5.xyz = r10.xyz;
    o5.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
