// vs_8d2e5bf3abf889fd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 717 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B34 00310010 00000000 00000000 00004084 00000001 00000007 00000004 00000290 0010001C 0000601D 0000301E 0020201F 00101021 00065022 00375023 0000F054 0001F156 0002F257 0003F358 000010EB 000010EA 000010EC 000010ED
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD6
//   vertex element: instruction 35 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
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
    r8.xyz = In.tangent0.xyz;
    r3.xyz = In.normal0.zyx;
    r1 = In.blendindices0.zxyw;
    ps = r1.z;
    r1.z = r1.y;
    r0.z = ps;
    r9 = In.blendweight0;
    r13.xyz = In.texcoord6.zyx;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r4.xyz = r7.zyx + r13.zyx;
    r2 = r9.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r9.x * BoneMatrices[a0 + 2].w;
    ps = r1.w;
    r5.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r1.w = ps;
    ps = r1.x;
    r6 = r9.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.yyyy * BoneMatrices[a0] + r2;
    r6 = r9.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r4.w = r9.y * BoneMatrices[a0 + 2].w + r4.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.zzzz * BoneMatrices[a0] + r2;
    r6 = r9.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r4.w = r9.z * BoneMatrices[a0 + 2].w + r4.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r5.w = ps;
            a0 = xe_mova(r5.w);
            ps = r5.w;
            r2 = r9.wwww * BoneMatrices[a0] + r2;
            r6 = r9.wwww * BoneMatrices[a0 + 1] + r6;
            r5.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r4.w = r9.w * BoneMatrices[a0 + 2].w + r4.w;
        }
    }
    r10.xyz = r8.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r12.xyz = r3.xyz + r0.xyw;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r3.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r8.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r6.zxyw, r11);
    r0.w = dot(r4.zxyw, r5);
    r5.xyz = r12.xyz * 0.007843138 - 1.0;
    r0.y = dot(r5.xzy, r5.xzy);
    r4 = r0.wwww * LocalToWorld[2].xzyw;
    r4 = r0.xxxx * LocalToWorld[1].xzyw + r4;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r2.zxyw, r11);
    r0.y = ps;
    r12.xyz = r5.zyx * r0.yyy;
    r4 = r0.xxxx * LocalToWorld[0].xzyw + r4;
    ps = r4.w;
    r2.y = dot(r12.zxy, r10.zxy);
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r11.xyz = r4.xzy + LocalToWorld[3].xyz;
    r2.x = ps;
    r0.xyw = -r11.yxz * CameraPosition.www + CameraPosition.yxz;
    r2.yzw = -r12.zyx * r2.yyy + r10.zyx;
    r4.xy = r2.xx * ViewProjectionMatrix[3].zw;
    r4.xy = r11.zz * ViewProjectionMatrix[2].zw + r4.xy;
    r2.x = dot(r2.ywz, r2.ywz);
    ps = rsqrt(abs(r2.x));
    r5.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    r4.xy = r11.yy * ViewProjectionMatrix[1].zw + r4.xy;
    r6.xy = r11.xx * ViewProjectionMatrix[0].zw + r4.xy;
    r4.xyz = r2.wzy * r2.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r12.zxy * r4.yzx;
    r2.xyz = r12.yzx * r4.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r8.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r5.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r8.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r5.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r2.w = ps;
            a0 = xe_mova(r2.w);
            ps = r2.w;
            r3.xyz = r9.www * BoneMatrices[a0].xyz + r3.xyz;
            r8.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r5.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r6.z = dot(r12.zxy, r3.zxy);
    r6.w = dot(r12.zxy, r8.zxy);
    r14.z = dot(r2.zxy, r3.zxy);
    r14.w = dot(r2.zxy, r5.zxy);
    r14.x = dot(r2.zxy, r8.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r14.y = dot(r12.zxy, r5.zxy);
    r10.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r3.x = dot(r4.zxy, r3.zxy);
    r10.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r3.y = dot(r4.zxy, r8.zxy);
    r10.z = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r3.z = dot(r4.zxy, r5.zxy);
    r5.xyz = r0.xxx * WorldToLocal[1].xzy + r10.xyz;
    r10.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r8.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r5.xzy;
    r5.x = dot(r3.zxy, r0.wxy);
    r14.xy = r14.xy * r0.yw;
    r14.w = dot(r14.wz, r0.wx) + 0.0;
    r0.xy = r6.zw * r0.xy;
    ps = r0.x + r0.y;
    r3.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r14.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yz = r14.xz + r14.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r10.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r10.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3.xyz = r9.www * BoneMatrices[a0].xyz + r3.xyz;
            r10.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r8.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r11.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r14.x = dot(r12.zxy, r3.zxy);
    r14.y = dot(r12.zxy, r10.zxy);
    r14.z = dot(r12.zxy, r8.zxy);
    r15.x = dot(r2.zxy, r3.zxy);
    r15.y = dot(r2.zxy, r10.zxy);
    r15.z = dot(r2.zxy, r8.zxy);
    r16.x = dot(r4.zxy, r3.zxy);
    r16.y = dot(r4.zxy, r10.zxy);
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r16.z = dot(r4.zxy, r8.zxy);
    r3.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r8.x = dot(r16.zxy, WorldToLocal[2].zxy);
    r8.y = dot(r15.zxy, WorldToLocal[2].zxy);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.z = dot(r14.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r11.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r9.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r11.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r3.xyz = r9.www * BoneMatrices[a0].xyz + r3.xyz;
            r11.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r6.z = dot(r12.zxy, r3.zxy);
    r6.w = dot(r12.zxy, r11.zxy);
    r14.x = dot(r2.zxy, r3.zxy);
    r14.y = dot(r2.zxy, r10.zxy);
    r2.x = dot(r2.zxy, r11.zxy);
    r2.y = dot(r12.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r12.x = dot(r4.zxy, r3.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r12.y = dot(r4.zxy, r11.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r12.z = dot(r4.zxy, r10.zxy);
    r3.z = ps;
    r3.xyz = r0.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r0.yyy * WorldToLocal[0].xyz + r3.xzy;
    r2.xy = r2.xy * r3.yz;
    r2.w = dot(r14.yx, r3.zx) + 0.0;
    r0.xy = r6.zw * r3.xy;
    ps = r0.x + r0.y;
    r3.x = dot(r12.zxy, r3.zxy);
    r2.z = ps;
    r3.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7.xyz = r7.zyx + r13.zyx;
    r2 = r9.xxxx * BoneMatrices[a0];
    r4 = r9.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r9.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r9.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r9.yyyy * BoneMatrices[a0] + r2;
    r4 = r9.yyyy * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r9.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r7.w = r9.y * BoneMatrices[a0 + 2].w + r7.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r9.zzzz * BoneMatrices[a0] + r2;
    r4 = r9.zzzz * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r9.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r7.w = r9.z * BoneMatrices[a0 + 2].w + r7.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r9.wwww * BoneMatrices[a0] + r2;
    r4 = r9.wwww * BoneMatrices[a0 + 1] + r4;
    r0.xyw = r9.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r7.w = r9.w * BoneMatrices[a0 + 2].w + r7.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r9);
    r1.y = dot(r4.zxyw, r9);
    r0.x = dot(r7.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o1.zw = r6.xy;
    o1.xy = 1.0;
    o0.xyz = r3.xyz;
    o0.w = 0.0;
    o2.xyz = r5.xyz;
    o2.w = 0.0;
    o3.xyz = r8.xyz;
    o3.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.texcoord8 = o3;
    return Out;
}
