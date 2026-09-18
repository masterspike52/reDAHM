// vs_5d63c4abdece7176.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 840 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000D20 00510012 00000000 00000000 000060C6 00000001 00000007 00000006 00000290 00100020 00006021 00003022 00202023 00101025 00265026 00075028 0000F054 0001F156 0002F257 0003F358 0004F4A0 0005F5A1 00001113 00001111 00001114 00001115 00001116 00001112
//   vertex element: instruction 32 -> POSITION0
//   vertex element: instruction 33 -> TANGENT0
//   vertex element: instruction 34 -> NORMAL0
//   vertex element: instruction 35 -> BLENDINDICES0
//   vertex element: instruction 37 -> BLENDWEIGHT0
//   vertex element: instruction 38 -> TEXCOORD6
//   vertex element: instruction 40 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 40
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled control flow cjmp at cf 49
// NOTE: unhandled control flow cjmp at cf 52
// NOTE: unhandled control flow cjmp at cf 55

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
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

    r4.xyz = In.position0.zyx;
    r3.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0;
    ps = r1.y;
    r2.x = ps;
    r6 = In.blendweight0;
    r14.xyz = In.texcoord6.zyx;
    ps = r1.w;
    r2.z = r1.x;
    r0.w = ps;
    r1.xyw = In.texcoord7.xyz;
    r3.xyz = r3.zyx * 0.007843138 - 1.0;
    ps = r2.z;
    r2.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r1.xyw = r5.zyx + r1.wyx;
    r2.w = ps;
    r5.xyz = r1.xyw * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = dot(r5.xzy, r5.xzy);
    r1.xyw = r6.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r0.x));
    r7.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = ps;
    r13.xyz = r5.zyx * r0.xxx;
    r0.x = dot(r13.zxy, r3.xzy);
    r3.xyz = -r13.zyx * r0.xxx + r3.xyz;
    r0.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r0.x));
    r5.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = r1.z;
    r3.xyz = r3.zyx * r0.xxx;
    r1.z = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r13.zxy * r3.yzx;
    r10.xyz = r13.yzx * r3.zxy - r0.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyw = r6.yyy * BoneMatrices[a0].xyz + r1.xyw;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r5.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyw = r6.zzz * BoneMatrices[a0].xyz + r1.xyw;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r5.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r1.xyw = r6.www * BoneMatrices[a0].xyz + r1.xyw;
            r7.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r5.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r11.x = dot(r3.zxy, r1.wxy);
    r11.z = dot(r3.zxy, r5.zxy);
    ps = r4.z;
    r15.x = dot(r10.zxy, r5.zxy);
    ps = r14.z + ps;
    r15.y = dot(r10.zxy, r7.zxy);
    r8.x = ps;
    ps = r4.y;
    r15.z = dot(r10.zxy, r1.wxy);
    ps = r14.y + ps;
    r0.x = dot(r13.zxy, r7.zxy);
    r8.y = ps;
    ps = r4.x;
    r0.y = dot(r13.zxy, r1.wxy);
    ps = r14.x + ps;
    r0.z = dot(r13.zxy, r5.zxy);
    r8.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r11.w = dot(r3.zxy, r7.zxy);
    r5 = r6.xxxx * BoneMatrices[a0];
    r12 = r6.xxxx * BoneMatrices[a0 + 1];
    r1.xyw = r6.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r11.w;
    r8.w = r6.x * BoneMatrices[a0 + 2].w;
    r11.y = ps;
    ps = 0.5 * r0.x;
    r9.xyz = r15.xxy * r0.xyy;
    r9.w = ps;
    r7.xyz = r11.xwz * 0.5 + 0.5;
    r9.xyz = r15.yzz * r0.zzx - r9.xyz;
    ps = 0.5 * r0.y;
    r3.w = dot(r11.xyz, r9.xyz);
    r9.y = ps;
    ps = 0.5 * r0.z;
    r9.x = r3.w * 0.5;
    r9.z = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9 = r9.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.yyyy * BoneMatrices[a0] + r5;
    r12 = r6.yyyy * BoneMatrices[a0 + 1] + r12;
    r1.xyw = r6.yyy * BoneMatrices[a0 + 2].xyz + r1.xyw;
    r8.w = r6.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.zzzz * BoneMatrices[a0] + r5;
    r12 = r6.zzzz * BoneMatrices[a0 + 1] + r12;
    r1.xyw = r6.zzz * BoneMatrices[a0 + 2].xyz + r1.xyw;
    r8.w = r6.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r5 = r6.wwww * BoneMatrices[a0] + r5;
            r12 = r6.wwww * BoneMatrices[a0 + 1] + r12;
            r1.xyw = r6.www * BoneMatrices[a0 + 2].xyz + r1.xyw;
            r8.w = r6.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.wxyy : 1.0;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = dot(r8.zxyw, r11);
    r8.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r5.zxyw, r15);
    r0.y = dot(r12.zxyw, r15);
    r5 = r0.zzzz * LocalToWorld[2].xzyw;
    r5 = r0.yyyy * LocalToWorld[1].xzyw + r5;
    r12 = r0.xxxx * LocalToWorld[0].xzyw + r5;
    ps = r12.w;
    r5.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r15.xyz = r12.xzy + LocalToWorld[3].xyz;
    r0.x = ps;
    r1.xyw = -r15.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xy = r0.xx * ViewProjectionMatrix[3].zw;
    r0.xy = r15.zz * ViewProjectionMatrix[2].zw + r0.xy;
    r0.xy = r15.yy * ViewProjectionMatrix[1].zw + r0.xy;
    r0.xy = r15.xx * ViewProjectionMatrix[0].zw + r0.xy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r6.yyy * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r5.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r6.zzz * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r5.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r8.xyz = r6.www * BoneMatrices[a0].xyz + r8.xyz;
            r11.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r5.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r17.x = dot(r13.zxy, r8.zxy);
    r17.y = dot(r13.zxy, r11.zxy);
    r16.z = dot(r10.zxy, r8.zxy);
    r16.w = dot(r10.zxy, r5.zxy);
    r16.x = dot(r10.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r16.y = dot(r13.zxy, r5.zxy);
    r12.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r8.x = dot(r3.zxy, r8.zxy);
    r12.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r8.y = dot(r3.zxy, r11.zxy);
    r12.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r8.z = dot(r3.zxy, r5.zxy);
    r5.xyz = r1.xxx * WorldToLocal[1].xzy + r12.xyz;
    r12.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r11.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r1.xyw = r1.yyy * WorldToLocal[0].xyz + r5.xzy;
    r5.x = dot(r8.zxy, r1.wxy);
    r16.xy = r16.xy * r1.yw;
    r16.w = dot(r16.wz, r1.wx) + 0.0;
    r1.xy = r17.xy * r1.xy;
    ps = r1.x + r1.y;
    r8.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r16.z = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yz = r16.xz + r16.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r1.x = ps;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r6.yyy * BoneMatrices[a0].xyz + r8.xyz;
    r12.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r1.x = ps;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r6.zzz * BoneMatrices[a0].xyz + r8.xyz;
    r12.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r8.xyz = r6.www * BoneMatrices[a0].xyz + r8.xyz;
            r12.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r0.z = float((LightType.x >= 0.9));
    r1.xyw = -r15.yxz * r0.zzz + LightPositionAndInvRadius.yxz;
    r16.x = dot(r13.zxy, r8.zxy);
    r16.y = dot(r13.zxy, r12.zxy);
    r16.z = dot(r13.zxy, r11.zxy);
    r17.x = dot(r10.zxy, r8.zxy);
    r17.y = dot(r10.zxy, r12.zxy);
    r17.z = dot(r10.zxy, r11.zxy);
    r18.x = dot(r3.zxy, r8.zxy);
    r18.y = dot(r3.zxy, r12.zxy);
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r18.z = dot(r3.zxy, r11.zxy);
    r15.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r8.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r11.x = dot(r18.zxy, WorldToLocal[2].zxy);
    r11.y = dot(r17.zxy, WorldToLocal[2].zxy);
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.z = dot(r16.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r15.xyz = r6.yyy * BoneMatrices[a0].xyz + r15.xyz;
    r12.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r8.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r15.xyz = r6.zzz * BoneMatrices[a0].xyz + r15.xyz;
    r12.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r8.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r15.xyz = r6.www * BoneMatrices[a0].xyz + r15.xyz;
            r12.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r8.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r2.y = dot(r13.zxy, r15.zxy);
    r2.w = dot(r13.zxy, r12.zxy);
    r16.x = dot(r10.zxy, r15.zxy);
    r16.y = dot(r10.zxy, r8.zxy);
    r16.z = dot(r10.zxy, r12.zxy);
    r16.w = dot(r13.zxy, r8.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r10.x = dot(r3.zxy, r15.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r10.y = dot(r3.zxy, r12.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r10.z = dot(r3.zxy, r8.zxy);
    r13.z = ps;
    r3.xyz = r1.xxx * WorldToLocal[1].xzy + r13.xyz;
    r8.xyz = r1.yyy * WorldToLocal[0].xyz + r3.xzy;
    r3.xy = r16.zw * r8.yz;
    r3.w = dot(r16.yx, r8.zx) + 0.0;
    r1.xy = r2.yw * r8.xy;
    ps = r1.x + r1.y;
    r8.x = dot(r10.zxy, r8.zxy);
    r3.z = ps;
    r8.yz = r3.xz + r3.wy;
    ps = 3.0 * r2.z;
    r0.z = float((MaxBoneInfluences.x > 1.0));
    r1.x = ps;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r10.xyz = r4.zyx + r14.zyx;
    r3 = r6.xxxx * BoneMatrices[a0];
    r4 = r6.xxxx * BoneMatrices[a0 + 1];
    r1.xyw = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r2.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r6.yyyy * BoneMatrices[a0] + r3;
    r4 = r6.yyyy * BoneMatrices[a0 + 1] + r4;
    r1.xyw = r6.yyy * BoneMatrices[a0 + 2].xyz + r1.xyw;
    r10.w = r6.y * BoneMatrices[a0 + 2].w + r10.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r6.zzzz * BoneMatrices[a0] + r3;
    r4 = r6.zzzz * BoneMatrices[a0 + 1] + r4;
    r1.xyw = r6.zzz * BoneMatrices[a0 + 2].xyz + r1.xyw;
    r10.w = r6.z * BoneMatrices[a0 + 2].w + r10.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r6.wwww * BoneMatrices[a0] + r3;
    r4 = r6.wwww * BoneMatrices[a0 + 1] + r4;
    r1.xyw = r6.www * BoneMatrices[a0 + 2].xyz + r1.xyw;
    r10.w = r6.w * BoneMatrices[a0 + 2].w + r10.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.wxyy : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.z = dot(r3.zxyw, r2);
    r0.w = dot(r4.zxyw, r2);
    r1.x = dot(r10.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r0.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r2 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o1.zw = r0.xy;
    o1.xy = 1.0;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o0.xyz = r8.xyz;
    o0.w = 0.0;
    o2.xyz = r5.xyz;
    o2.w = 0.0;
    o3.xyz = r11.xyz;
    o3.w = 0.0;
    o4 = r9;

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
