// vs_53d47fec31d12927.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 624 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000009C0 00610011 00000000 00000000 000050E7 00000001 0000000A 00000007 00000290 00100018 00006019 0000301A 0000201B 0000101C 0000501D 0001501E 0002501F 00065020 00375021 00003050 00013151 00023252 00037354 0004F455 00057556 0006F657 000010C8 000010C9 000010CA 000010CB 000010CC 000010CD 000010CE
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   vertex element: instruction 29 -> TEXCOORD0
//   vertex element: instruction 30 -> TEXCOORD1
//   vertex element: instruction 31 -> TEXCOORD2
//   vertex element: instruction 32 -> TEXCOORD6
//   vertex element: instruction 33 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 r17 = 0.0;
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

    r8.xyz = In.position0.xyz;
    r1.xyw = In.tangent0.xyz;
    r5.xyz = In.normal0.zyx;
    r2 = In.blendindices0.zxwy;
    r10 = In.blendweight0;
    r9.zw = In.texcoord0.xy;
    r9.xy = In.texcoord1.xy;
    r11.xy = In.texcoord2.xy;
    r14.xyz = In.texcoord6.xyz;
    r0.xyz = In.texcoord7.zyx;
    ps = r2.y;
    r2.y = float((MaxBoneInfluences.x > 1.0));
    r0.w = ps;
    ps = r2.w;
    r2.w = r0.w * 3.0;
    r1.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.xyz = r8.xyz + r14.xyz;
    r6 = r10.xxxx * BoneMatrices[a0];
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = r10.x * BoneMatrices[a0 + 2].w;
    ps = r2.z;
    r7.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r2.z = ps;
    ps = r2.x;
    r4 = r10.xxxx * BoneMatrices[a0 + 1];
    r2.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r10.yyyy * BoneMatrices[a0] + r6;
    r4 = r10.yyyy * BoneMatrices[a0 + 1] + r4;
    r7.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r3.w = r10.y * BoneMatrices[a0 + 2].w + r3.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r10.zzzz * BoneMatrices[a0] + r6;
    r4 = r10.zzzz * BoneMatrices[a0 + 1] + r4;
    r7.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r3.w = r10.z * BoneMatrices[a0 + 2].w + r3.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r5.w = ps;
            a0 = xe_mova(r5.w);
            ps = r5.w;
            r6 = r10.wwww * BoneMatrices[a0] + r6;
            r4 = r10.wwww * BoneMatrices[a0 + 1] + r4;
            r7.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r3.w = r10.w * BoneMatrices[a0 + 2].w + r3.w;
        }
    }
    r13.xyz = r1.xyw * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.xyw = r5.xyz + r0.xyz;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r12.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r5.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r4.zxyw, r7);
    r0.z = dot(r3.zxyw, r15);
    r1.xyw = r1.xyw * 0.007843138 - 1.0;
    r0.y = dot(r1.xwy, r1.xwy);
    r3 = r0.zzzz * LocalToWorld[2].xzyw;
    r3 = r0.xxxx * LocalToWorld[1].xzyw + r3;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r6.zxyw, r7);
    r0.y = ps;
    r15.xyz = r1.wyx * r0.yyy;
    r4 = r0.xxxx * LocalToWorld[0].xzyw + r3;
    ps = r4.w;
    r3.y = dot(r15.zxy, r13.zxy);
    r1.x = ps;
    ps = LocalToWorld[3].w + r1.x;
    r0.xyz = r4.yxz + LocalToWorld[3].zxy;
    r3.x = ps;
    r1.xyw = -r0.zyx * CameraPosition.www + CameraPosition.yxz;
    r3.yzw = -r15.zyx * r3.yyy + r13.zyx;
    r4 = r3.xxxx * ViewProjectionMatrix[3].xwzy;
    r6 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r4;
    r3.x = dot(r3.ywz, r3.ywz);
    ps = rsqrt(abs(r3.x));
    r4.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = ps;
    r6 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r13 = r0.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    r7.xyz = r3.wzy * r3.xxx;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r15.zxy * r7.yzx;
    r3.xyz = r15.yzx * r7.zxy - r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.xyz = r10.yyy * BoneMatrices[a0].xyz + r12.xyz;
    r5.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.xyz = r10.zzz * BoneMatrices[a0].xyz + r12.xyz;
    r5.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r12.xyz = r10.www * BoneMatrices[a0].xyz + r12.xyz;
            r5.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r11.z = dot(r15.zxy, r12.zxy);
    r11.w = dot(r15.zxy, r5.zxy);
    r16.z = dot(r3.zxy, r12.zxy);
    r16.w = dot(r3.zxy, r4.zxy);
    r16.x = dot(r3.zxy, r5.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r16.y = dot(r15.zxy, r4.zxy);
    r6.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r17.x = dot(r7.zxy, r12.zxy);
    r6.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r17.y = dot(r7.zxy, r5.zxy);
    r6.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r17.z = dot(r7.zxy, r4.zxy);
    r12.xyz = r1.xxx * WorldToLocal[1].xzy + r6.xyz;
    r4.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r6.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r5.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r12.yzw = r1.yyy * WorldToLocal[0].xyz + r12.xzy;
    r12.x = dot(r17.zxy, r12.wyz);
    ps = LightPositionAndInvRadius.x - r0.y;
    r16.xy = r16.xy * r12.zw;
    r1.x = ps;
    r16.w = dot(r16.wz, r12.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r0.z;
    r11.zw = r11.zw * r12.yz;
    r1.y = ps;
    ps = LightPositionAndInvRadius.z - r0.x;
    r16.z = r11.z + r11.w;
    r1.w = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.yz = r16.xz + r16.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r6.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r6.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r4.xyz = r10.www * BoneMatrices[a0].xyz + r4.xyz;
            r6.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r5.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r0.x = dot(r15.zxy, r4.zxy);
    r0.y = dot(r15.zxy, r6.zxy);
    r2.y = dot(r3.zxy, r4.zxy);
    r2.w = dot(r3.zxy, r5.zxy);
    r3.x = dot(r3.zxy, r6.zxy);
    r3.y = dot(r15.zxy, r5.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r15.x = dot(r7.zxy, r4.zxy);
    r4.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r15.y = dot(r7.zxy, r6.zxy);
    r4.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r15.z = dot(r7.zxy, r5.zxy);
    r4.z = ps;
    r4.xyz = r1.yyy * WorldToLocal[1].xzy + r4.xyz;
    r4.xyz = r1.xxx * WorldToLocal[0].xyz + r4.xzy;
    r3.xy = r3.xy * r4.yz;
    r3.w = dot(r2.wy, r4.zx) + 0.0;
    r0.xy = r0.xy * r4.xy;
    ps = r0.x + r0.y;
    r6.x = dot(r15.zxy, r4.zxy);
    r3.z = ps;
    r6.yz = r3.xz + r3.wy;
    ps = 3.0 * r0.w;
    r2.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r4.xyz = r14.xyz + r8.xyz;
    r5 = r10.xxxx * BoneMatrices[a0];
    r3 = r10.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r10.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r10.yyyy * BoneMatrices[a0] + r5;
    r3 = r10.yyyy * BoneMatrices[a0 + 1] + r3;
    r0.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r4.w = r10.y * BoneMatrices[a0 + 2].w + r4.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r2.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r10.zzzz * BoneMatrices[a0] + r5;
    r3 = r10.zzzz * BoneMatrices[a0 + 1] + r3;
    r0.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r4.w = r10.z * BoneMatrices[a0 + 2].w + r4.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r2.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r10.wwww * BoneMatrices[a0] + r5;
    r3 = r10.wwww * BoneMatrices[a0 + 1] + r3;
    r0.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r4.w = r10.w * BoneMatrices[a0 + 2].w + r4.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r1.z = dot(r5.zxyw, r2);
    r2.x = dot(r3.zxyw, r2);
    r0.x = dot(r4.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r2.xxxx * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r1.zzzz * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r9.zw;
    o1.xy = r9.xy;
    o2.xy = r11.xy;
    o3.xyz = r6.xyz;
    o4.xyz = r1.xyw * LightPositionAndInvRadius.www;
    o4.w = 0.0;
    o5.xyz = r12.xyz;
    o6 = r13;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    return Out;
}
