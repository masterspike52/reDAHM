// vs_09c657a333dd2290.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 573 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008F4 0041000E 00000000 00000000 000040A5 00000001 00000007 00000005 00000290 00100017 00006018 00007019 0000301A 0000201B 0000101C 0020501D 00003050 00017154 0002F255 00037356 0004F457 000010BA 000010BB 000010B9 000010BC 000010BD
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   vertex element: instruction 29 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightDirection : register(c238); // float3
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
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r9.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r8.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r3.xy = In.texcoord0.xy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.z = float((MaxBoneInfluences.x > 1.0));
    r6 = r7.xxxx * BoneMatrices[a0];
    r12 = r7.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r7.yyyy * BoneMatrices[a0] + r6;
    r12 = r7.yyyy * BoneMatrices[a0 + 1] + r12;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r9.w = r7.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r7.zzzz * BoneMatrices[a0] + r6;
    r12 = r7.zzzz * BoneMatrices[a0 + 1] + r12;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r9.w = r7.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r6 = r7.wwww * BoneMatrices[a0] + r6;
            r12 = r7.wwww * BoneMatrices[a0 + 1] + r12;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r9.w = r7.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r4.xyz = r2.xyz * 0.007843138 - 1.0;
    r13.xyz = r0.yzw * 0.007843138 - 1.0;
    r11.xyz = r8.xyz * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = dot(r9.zxyw, r0);
    r2.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r8.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r3.w = dot(r6.zxyw, r5);
    r4.w = dot(r12.zxyw, r5);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r4.wwww * LocalToWorld[1].xzyw + r0.xzyw;
    r6 = r3.wwww * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r6.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r6.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r6.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r7.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r7.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r2.xyz = r7.www * BoneMatrices[a0].xyz + r2.xyz;
            r10.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r8.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r12.x = dot(r11.zxy, r2.zxy);
    r12.y = dot(r11.zxy, r10.zxy);
    r12.z = dot(r13.zxy, r2.zxy);
    r12.w = dot(r13.zxy, r8.zxy);
    r14.x = dot(r13.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r14.y = dot(r11.zxy, r8.zxy);
    r6.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r2.x = dot(r4.zxy, r2.zxy);
    r6.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r2.y = dot(r4.zxy, r10.zxy);
    r6.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.z = dot(r4.zxy, r8.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r6.xyz;
    r8.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r6.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r2.x = dot(r2.zxy, r0.zxy);
    r10.xy = r14.xy * r0.yz;
    r10.w = dot(r12.wz, r0.zx) + 0.0;
    r2.yz = r12.xy * r0.xy;
    ps = r2.y + r2.z;
    r0.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r10.z = ps;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yz = r10.xz + r10.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r7.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r8.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r6.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r7.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r8.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r6.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r7.www * BoneMatrices[a0].xyz + r0.xyz;
            r8.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r6.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r3.z = dot(r13.zxy, r0.zxy);
    r3.w = dot(r13.zxy, r8.zxy);
    r12.x = dot(r11.zxy, r0.zxy);
    ps = WorldToLocal[2].x;
    r12.y = dot(r11.zxy, r6.zxy);
    ps = LightDirection.z * ps;
    r12.z = dot(r13.zxy, r6.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].y;
    r12.w = dot(r11.zxy, r8.zxy);
    ps = LightDirection.z * ps;
    r10.x = dot(r4.zxy, r0.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].z;
    r10.y = dot(r4.zxy, r6.zxy);
    ps = LightDirection.z * ps;
    r10.z = dot(r4.zxy, r8.zxy);
    r13.z = ps;
    r0.xyz = WorldToLocal[1].xyz * LightDirection.yyy + r13.xyz;
    r4.xyz = WorldToLocal[0].xzy * LightDirection.xxx + r0.xzy;
    r0.yz = r12.zw * r4.yz;
    r0.w = dot(r12.yx, r4.yx) + 0.0;
    r3.zw = r3.zw * r4.xz;
    ps = r3.z + r3.w;
    r4.x = dot(r10.yxz, r4.yxz);
    r0.x = ps;
    r4.yz = r0.xz + r0.yw;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r8 = r7.xxxx * BoneMatrices[a0];
    r6 = r7.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r7.yyyy * BoneMatrices[a0] + r8;
    r6 = r7.yyyy * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r9.w = r7.y * BoneMatrices[a0 + 2].w + r9.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r7.zzzz * BoneMatrices[a0] + r8;
    r6 = r7.zzzz * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r9.w = r7.z * BoneMatrices[a0 + 2].w + r9.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r7.wwww * BoneMatrices[a0] + r8;
    r6 = r7.wwww * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r9.w = r7.w * BoneMatrices[a0 + 2].w + r9.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r8.zxyw, r7);
    r1.y = dot(r6.zxyw, r7);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.x = ps;
    o2.yzw = 0.0;
    o0.xy = r3.xy;
    o1.xyz = r4.xyz;
    o3.xyz = r2.xyz;
    o4 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
