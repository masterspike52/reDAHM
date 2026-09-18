// vs_b413b30282752e6c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 843 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000D2C 00610013 00000000 00000000 000068E7 00000001 00000008 00000007 00000290 00100020 00006021 00003022 00202023 00101025 00005026 00065027 00275028 00003050 0001F154 0002F256 0003F357 0004F458 0005F5A0 0006F6A1 00001111 00001114 00001112 00001115 00001116 00001117 00001113
//   vertex element: instruction 32 -> POSITION0
//   vertex element: instruction 33 -> TANGENT0
//   vertex element: instruction 34 -> NORMAL0
//   vertex element: instruction 35 -> BLENDINDICES0
//   vertex element: instruction 37 -> BLENDWEIGHT0
//   vertex element: instruction 38 -> TEXCOORD0
//   vertex element: instruction 39 -> TEXCOORD6
//   vertex element: instruction 40 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 r19 = 0.0;
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

    r15.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r4.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxwz;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r6 = In.blendweight0;
    r5.xy = In.texcoord0.xy;
    r10.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r4.xyz + r3.xyz;
    r2.w = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.x = dot(r3.ywz, r3.ywz);
    r0.xyw = r6.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r7.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r14.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r14.zxy, r2.xzy);
    r3.xyz = -r14.zyx * r3.xxx + r2.xyz;
    ps = r1.x;
    r2.x = dot(r3.xzy, r3.xzy);
    r1.x = ps;
    ps = rsqrt(abs(r2.x));
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.z;
    r3.xyz = r3.zyx * r2.xxx;
    r1.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r14.zxy * r3.yzx;
    r11.xyz = r14.yzx * r3.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r6.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r6.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r6.www * BoneMatrices[a0].xyz + r0.xyw;
            r7.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r8.x = dot(r3.zxy, r0.wxy);
    r8.z = dot(r3.zxy, r4.zxy);
    ps = r15.x;
    r16.x = dot(r11.zxy, r4.zxy);
    ps = r10.x + ps;
    r16.y = dot(r11.zxy, r7.zxy);
    r12.x = ps;
    ps = r15.y;
    r16.z = dot(r11.zxy, r0.wxy);
    ps = r10.y + ps;
    r2.x = dot(r14.zxy, r7.zxy);
    r12.y = ps;
    ps = r15.z;
    r2.y = dot(r14.zxy, r0.wxy);
    ps = r10.z + ps;
    r2.z = dot(r14.zxy, r4.zxy);
    r12.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r8.w = dot(r3.zxy, r7.zxy);
    r4 = r6.xxxx * BoneMatrices[a0];
    r13 = r6.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r6.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r8.w;
    r12.w = r6.x * BoneMatrices[a0 + 2].w;
    r8.y = ps;
    ps = 0.5 * r2.x;
    r7.xyz = r16.xxy * r2.xyy;
    r7.w = ps;
    r9.xyz = r8.xwz * 0.5 + 0.5;
    r7.xyz = r16.yzz * r2.zzx - r7.xyz;
    ps = 0.5 * r2.y;
    r3.w = dot(r8.xyz, r7.xyz);
    r7.y = ps;
    ps = 0.5 * r2.z;
    r7.x = r3.w * 0.5;
    r7.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r7.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r6.yyyy * BoneMatrices[a0] + r4;
    r13 = r6.yyyy * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r6.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r12.w = r6.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r6.zzzz * BoneMatrices[a0] + r4;
    r13 = r6.zzzz * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r6.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r12.w = r6.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r4 = r6.wwww * BoneMatrices[a0] + r4;
            r13 = r6.wwww * BoneMatrices[a0 + 1] + r13;
            r0.xyw = r6.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r12.w = r6.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = dot(r12.zxyw, r7);
    r7.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r4.zxyw, r16);
    r0.y = dot(r13.zxyw, r16);
    r4 = r0.wwww * LocalToWorld[2].xzyw;
    r4 = r0.yyyy * LocalToWorld[1].xzyw + r4;
    r13 = r0.xxxx * LocalToWorld[0].xzyw + r4;
    ps = r13.w;
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r16.xyz = r13.xzy + LocalToWorld[3].xyz;
    r2.x = ps;
    r0.xyw = -r16.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xy = r2.xx * ViewProjectionMatrix[3].zw;
    r2.xy = r16.zz * ViewProjectionMatrix[2].zw + r2.xy;
    r2.xy = r16.yy * ViewProjectionMatrix[1].zw + r2.xy;
    r2.xy = r16.xx * ViewProjectionMatrix[0].zw + r2.xy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r6.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r12.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r6.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r12.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.z = ps;
            a0 = xe_mova(r2.z);
            ps = r2.z;
            r7.xyz = r6.www * BoneMatrices[a0].xyz + r7.xyz;
            r12.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r5.z = dot(r14.zxy, r7.zxy);
    r5.w = dot(r14.zxy, r12.zxy);
    r17.z = dot(r11.zxy, r7.zxy);
    r17.w = dot(r11.zxy, r4.zxy);
    r17.x = dot(r11.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r17.y = dot(r14.zxy, r4.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r18.x = dot(r3.zxy, r7.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r18.y = dot(r3.zxy, r12.zxy);
    r13.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r18.z = dot(r3.zxy, r4.zxy);
    r4.xyz = r0.xxx * WorldToLocal[1].xzy + r13.xyz;
    r13.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r4.xzy;
    r12.x = dot(r18.zxy, r0.wxy);
    r17.xy = r17.xy * r0.yw;
    r17.w = dot(r17.wz, r0.wx) + 0.0;
    r0.xy = r5.zw * r0.xy;
    ps = r0.x + r0.y;
    r4.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r17.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.yz = r17.xz + r17.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r13.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r13.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r4.xyz = r6.www * BoneMatrices[a0].xyz + r4.xyz;
            r13.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r16.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r17.x = dot(r14.zxy, r4.zxy);
    r17.y = dot(r14.zxy, r13.zxy);
    r17.z = dot(r14.zxy, r7.zxy);
    r18.x = dot(r11.zxy, r4.zxy);
    r18.y = dot(r11.zxy, r13.zxy);
    r18.z = dot(r11.zxy, r7.zxy);
    r19.x = dot(r3.zxy, r4.zxy);
    r19.y = dot(r3.zxy, r13.zxy);
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r19.z = dot(r3.zxy, r7.zxy);
    r16.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r7.x = dot(r19.zxy, WorldToLocal[2].zxy);
    r7.y = dot(r18.zxy, WorldToLocal[2].zxy);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.z = dot(r17.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.z = ps;
    a0 = xe_mova(r2.z);
    ps = r2.z;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r16.xyz = r6.yyy * BoneMatrices[a0].xyz + r16.xyz;
    r13.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.z = ps;
    a0 = xe_mova(r2.z);
    ps = r2.z;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r16.xyz = r6.zzz * BoneMatrices[a0].xyz + r16.xyz;
    r13.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r16.xyz = r6.www * BoneMatrices[a0].xyz + r16.xyz;
            r13.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r2.z = dot(r14.zxy, r16.zxy);
    r2.w = dot(r14.zxy, r13.zxy);
    r5.z = dot(r11.zxy, r16.zxy);
    r5.w = dot(r11.zxy, r4.zxy);
    r17.x = dot(r11.zxy, r13.zxy);
    r17.y = dot(r14.zxy, r4.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r11.x = dot(r3.zxy, r16.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r11.y = dot(r3.zxy, r13.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r11.z = dot(r3.zxy, r4.zxy);
    r14.z = ps;
    r3.xyz = r0.xxx * WorldToLocal[1].xzy + r14.xyz;
    r4.xyz = r0.yyy * WorldToLocal[0].xyz + r3.xzy;
    r3.xy = r17.xy * r4.yz;
    r3.w = dot(r5.wz, r4.zx) + 0.0;
    r0.xy = r2.zw * r4.xy;
    ps = r0.x + r0.y;
    r4.x = dot(r11.zxy, r4.zxy);
    r3.z = ps;
    r4.yz = r3.xz + r3.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r11.xyz = r10.xyz + r15.xyz;
    r3 = r6.xxxx * BoneMatrices[a0];
    r10 = r6.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r6.yyyy * BoneMatrices[a0] + r3;
    r10 = r6.yyyy * BoneMatrices[a0 + 1] + r10;
    r0.xyw = r6.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r6.y * BoneMatrices[a0 + 2].w + r11.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r6.zzzz * BoneMatrices[a0] + r3;
    r10 = r6.zzzz * BoneMatrices[a0 + 1] + r10;
    r0.xyw = r6.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r6.z * BoneMatrices[a0 + 2].w + r11.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r6.wwww * BoneMatrices[a0] + r3;
    r10 = r6.wwww * BoneMatrices[a0 + 1] + r10;
    r0.xyw = r6.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r6.w * BoneMatrices[a0 + 2].w + r11.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r6);
    r1.y = dot(r10.zxyw, r6);
    r0.x = dot(r11.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r5.xy;
    o2.zw = r2.xy;
    o2.xy = 1.0;
    o6.xyz = r9.xyz;
    o6.w = 0.0;
    o1.xyz = r4.xyz;
    o1.w = 0.0;
    o3.xyz = r12.xyz;
    o3.w = 0.0;
    o4.xyz = r7.xyz;
    o4.w = 0.0;
    o5 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.texcoord8 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
