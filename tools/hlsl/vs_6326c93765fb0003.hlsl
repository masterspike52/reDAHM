// vs_6326c93765fb0003.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 852 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000D50 00710013 00000000 00000000 00007108 00000001 00000009 00000008 00000290 00100021 00006022 00003023 00202024 00101026 00005027 00015028 00065029 0027502A 00003050 00013151 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 00001113 00001114 00001117 00001115 00001118 00001119 0000111A 00001116
//   vertex element: instruction 33 -> POSITION0
//   vertex element: instruction 34 -> TANGENT0
//   vertex element: instruction 35 -> NORMAL0
//   vertex element: instruction 36 -> BLENDINDICES0
//   vertex element: instruction 38 -> BLENDWEIGHT0
//   vertex element: instruction 39 -> TEXCOORD0
//   vertex element: instruction 40 -> TEXCOORD1
//   vertex element: instruction 41 -> TEXCOORD6
//   vertex element: instruction 42 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 43
// NOTE: unhandled control flow cjmp at cf 50
// NOTE: unhandled control flow cjmp at cf 53
// NOTE: unhandled control flow cjmp at cf 56

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

    r15.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r4.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxwz;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r5 = In.blendweight0;
    r8.xy = In.texcoord0.xy;
    r6.zw = In.texcoord1.xy;
    r9.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r4.xyz + r3.xyz;
    r1.y = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r3.x = dot(r3.ywz, r3.ywz);
    r0.xyw = r5.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r7.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r14.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r14.zxy, r2.xzy);
    r4.xyz = -r14.zyx * r3.xxx + r2.xyz;
    ps = r1.x;
    r2.x = dot(r4.xzy, r4.xzy);
    r1.x = ps;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.z;
    r4.xyz = r4.zyx * r2.xxx;
    r1.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r14.zxy * r4.yzx;
    r11.xyz = r14.yzx * r4.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r5.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r7.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r3.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r5.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r7.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r3.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r5.www * BoneMatrices[a0].xyz + r0.xyw;
            r7.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r3.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r16.x = dot(r4.zxy, r0.wxy);
    r16.z = dot(r4.zxy, r3.zxy);
    ps = r15.x;
    r17.x = dot(r11.zxy, r3.zxy);
    ps = r9.x + ps;
    r17.y = dot(r11.zxy, r7.zxy);
    r12.x = ps;
    ps = r15.y;
    r17.z = dot(r11.zxy, r0.wxy);
    ps = r9.y + ps;
    r2.x = dot(r14.zxy, r7.zxy);
    r12.y = ps;
    ps = r15.z;
    r2.y = dot(r14.zxy, r0.wxy);
    ps = r9.z + ps;
    r2.z = dot(r14.zxy, r3.zxy);
    r12.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r16.w = dot(r4.zxy, r7.zxy);
    r3 = r5.xxxx * BoneMatrices[a0];
    r13 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r5.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r16.w;
    r12.w = r5.x * BoneMatrices[a0 + 2].w;
    r16.y = ps;
    ps = 0.5 * r2.x;
    r10.xyz = r17.xxy * r2.xyy;
    r10.w = ps;
    r7.xyz = r16.xwz * 0.5 + 0.5;
    r10.xyz = r17.yzz * r2.zzx - r10.xyz;
    ps = 0.5 * r2.y;
    r4.w = dot(r16.xyz, r10.xyz);
    r10.y = ps;
    ps = 0.5 * r2.z;
    r10.x = r4.w * 0.5;
    r10.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10 = r10.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r5.yyyy * BoneMatrices[a0] + r3;
    r13 = r5.yyyy * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r12.w = r5.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r5.zzzz * BoneMatrices[a0] + r3;
    r13 = r5.zzzz * BoneMatrices[a0 + 1] + r13;
    r0.xyw = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r12.w = r5.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r3 = r5.wwww * BoneMatrices[a0] + r3;
            r13 = r5.wwww * BoneMatrices[a0 + 1] + r13;
            r0.xyw = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r12.w = r5.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.w = dot(r12.zxyw, r17);
    r2.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r3.zxyw, r16);
    r0.y = dot(r13.zxyw, r16);
    r3 = r0.wwww * LocalToWorld[2].xzyw;
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3;
    r13 = r0.xxxx * LocalToWorld[0].xzyw + r3;
    ps = r13.w;
    r3.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r16.xyz = r13.xzy + LocalToWorld[3].xyz;
    r3.w = ps;
    r0.xyw = -r16.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xy = r3.ww * ViewProjectionMatrix[3].zw;
    r6.xy = r16.zz * ViewProjectionMatrix[2].zw + r6.xy;
    r6.xy = r16.yy * ViewProjectionMatrix[1].zw + r6.xy;
    r6.xy = r16.xx * ViewProjectionMatrix[0].zw + r6.xy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r5.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r3.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r5.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r3.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r2.xyz = r5.www * BoneMatrices[a0].xyz + r2.xyz;
            r12.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r3.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r8.z = dot(r14.zxy, r2.zxy);
    r8.w = dot(r14.zxy, r12.zxy);
    r17.z = dot(r11.zxy, r2.zxy);
    r17.w = dot(r11.zxy, r3.zxy);
    r17.x = dot(r11.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r17.y = dot(r14.zxy, r3.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r2.x = dot(r4.zxy, r2.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r2.y = dot(r4.zxy, r12.zxy);
    r13.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r2.z = dot(r4.zxy, r3.zxy);
    r3.xyz = r0.xxx * WorldToLocal[1].xzy + r13.xyz;
    r13.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r12.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r3.xzy;
    r2.x = dot(r2.zxy, r0.wxy);
    r17.xy = r17.xy * r0.yw;
    r17.w = dot(r17.wz, r0.wx) + 0.0;
    r0.xy = r8.zw * r0.xy;
    ps = r0.x + r0.y;
    r3.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r17.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yz = r17.xz + r17.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r5.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r13.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r5.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r13.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3.xyz = r5.www * BoneMatrices[a0].xyz + r3.xyz;
            r13.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r12.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r16.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r17.x = dot(r14.zxy, r3.zxy);
    r17.y = dot(r14.zxy, r13.zxy);
    r17.z = dot(r14.zxy, r12.zxy);
    r18.x = dot(r11.zxy, r3.zxy);
    r18.y = dot(r11.zxy, r13.zxy);
    r18.z = dot(r11.zxy, r12.zxy);
    r19.x = dot(r4.zxy, r3.zxy);
    r19.y = dot(r4.zxy, r13.zxy);
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r19.z = dot(r4.zxy, r12.zxy);
    r16.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r3.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r12.x = dot(r19.zxy, WorldToLocal[2].zxy);
    r12.y = dot(r18.zxy, WorldToLocal[2].zxy);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.z = dot(r17.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r16.xyz = r5.yyy * BoneMatrices[a0].xyz + r16.xyz;
    r13.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r3.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r16.xyz = r5.zzz * BoneMatrices[a0].xyz + r16.xyz;
    r13.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r3.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r16.xyz = r5.www * BoneMatrices[a0].xyz + r16.xyz;
            r13.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r3.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r8.z = dot(r14.zxy, r16.zxy);
    r8.w = dot(r14.zxy, r13.zxy);
    r17.x = dot(r11.zxy, r16.zxy);
    r17.y = dot(r11.zxy, r3.zxy);
    r17.z = dot(r11.zxy, r13.zxy);
    r17.w = dot(r14.zxy, r3.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r11.x = dot(r4.zxy, r16.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r11.y = dot(r4.zxy, r13.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r11.z = dot(r4.zxy, r3.zxy);
    r14.z = ps;
    r3.xyz = r0.xxx * WorldToLocal[1].xzy + r14.xyz;
    r4.xyz = r0.yyy * WorldToLocal[0].xyz + r3.xzy;
    r3.xy = r17.zw * r4.yz;
    r3.w = dot(r17.yx, r4.zx) + 0.0;
    r0.xy = r8.zw * r4.xy;
    ps = r0.x + r0.y;
    r4.x = dot(r11.zxy, r4.zxy);
    r3.z = ps;
    r4.yz = r3.xz + r3.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r11.xyz = r9.xyz + r15.xyz;
    r3 = r5.xxxx * BoneMatrices[a0];
    r9 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r5.yyyy * BoneMatrices[a0] + r3;
    r9 = r5.yyyy * BoneMatrices[a0 + 1] + r9;
    r0.xyw = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r5.y * BoneMatrices[a0 + 2].w + r11.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r5.zzzz * BoneMatrices[a0] + r3;
    r9 = r5.zzzz * BoneMatrices[a0 + 1] + r9;
    r0.xyw = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r5.z * BoneMatrices[a0 + 2].w + r11.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r3 = r5.wwww * BoneMatrices[a0] + r3;
    r9 = r5.wwww * BoneMatrices[a0 + 1] + r9;
    r0.xyw = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r5.w * BoneMatrices[a0 + 2].w + r11.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r5);
    r1.y = dot(r9.zxyw, r5);
    r0.x = dot(r11.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r8.xy;
    o1.xy = r6.zw;
    o3.zw = r6.xy;
    o3.xy = 1.0;
    o7.xyz = r7.xyz;
    o7.w = 0.0;
    o2.xyz = r4.xyz;
    o2.w = 0.0;
    o4.xyz = r2.xyz;
    o4.w = 0.0;
    o5.xyz = r12.xyz;
    o5.w = 0.0;
    o6 = r10;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
