// vs_b2eeacc45d508c20.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 567 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008DC 0031000D 00000000 00000000 00003884 00000001 00000006 00000004 00000290 00100017 00006018 00007019 0000301A 0000201B 0020101C 00007054 0001F155 00027256 0003F357 000010B9 000010B8 000010BA 000010BB
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 37

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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r8.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r6 = In.blendweight0;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r5 = r6.xxxx * BoneMatrices[a0];
    r11 = r6.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.x = ps;
    a0 = xe_mova(r3.x);
    ps = r3.x;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.yyyy * BoneMatrices[a0] + r5;
    r11 = r6.yyyy * BoneMatrices[a0 + 1] + r11;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r8.w = r6.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.x = ps;
    a0 = xe_mova(r3.x);
    ps = r3.x;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r6.zzzz * BoneMatrices[a0] + r5;
    r11 = r6.zzzz * BoneMatrices[a0 + 1] + r11;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r8.w = r6.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r5 = r6.wwww * BoneMatrices[a0] + r5;
            r11 = r6.wwww * BoneMatrices[a0 + 1] + r11;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r8.w = r6.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    r3.xyz = r2.xyz * 0.007843138 - 1.0;
    r12.xyz = r0.yzw * 0.007843138 - 1.0;
    r10.xyz = r7.xyz * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = dot(r8.zxyw, r0);
    r2.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r4.x = dot(r5.zxyw, r13);
    r4.y = dot(r11.zxyw, r13);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r4.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r5 = r4.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r5.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r5.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r5.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.x = ps;
    a0 = xe_mova(r5.x);
    ps = r5.x;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r6.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r9.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r5.x = ps;
    a0 = xe_mova(r5.x);
    ps = r5.x;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r6.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r9.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r2.xyz = r6.www * BoneMatrices[a0].xyz + r2.xyz;
            r9.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r11.x = dot(r10.zxy, r2.zxy);
    r11.y = dot(r10.zxy, r9.zxy);
    r11.z = dot(r12.zxy, r2.zxy);
    r11.w = dot(r12.zxy, r7.zxy);
    r13.x = dot(r12.zxy, r9.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.y = dot(r10.zxy, r7.zxy);
    r5.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r2.x = dot(r3.zxy, r2.zxy);
    r5.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r2.y = dot(r3.zxy, r9.zxy);
    r5.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.z = dot(r3.zxy, r7.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r5.xyz;
    r7.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r5.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r2.x = dot(r2.zxy, r0.zxy);
    r9.xy = r13.xy * r0.yz;
    r9.w = dot(r11.wz, r0.zx) + 0.0;
    r2.yz = r11.xy * r0.xy;
    ps = r2.y + r2.z;
    r0.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r9.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yz = r9.xz + r9.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r6.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r7.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r5.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r6.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r7.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r5.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r6.www * BoneMatrices[a0].xyz + r0.xyz;
            r7.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r5.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r11.x = dot(r12.zxy, r0.zxy);
    r11.y = dot(r12.zxy, r7.zxy);
    r11.z = dot(r10.zxy, r0.zxy);
    ps = WorldToLocal[2].x;
    r11.w = dot(r10.zxy, r5.zxy);
    ps = LightDirection.z * ps;
    r12.x = dot(r12.zxy, r5.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].y;
    r12.y = dot(r10.zxy, r7.zxy);
    ps = LightDirection.z * ps;
    r9.x = dot(r3.zxy, r0.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].z;
    r9.y = dot(r3.zxy, r5.zxy);
    ps = LightDirection.z * ps;
    r9.z = dot(r3.zxy, r7.zxy);
    r13.z = ps;
    r0.xyz = WorldToLocal[1].xyz * LightDirection.yyy + r13.xyz;
    r5.xyz = WorldToLocal[0].xzy * LightDirection.xxx + r0.xzy;
    r0.yz = r12.xy * r5.yz;
    r0.w = dot(r11.wz, r5.yx) + 0.0;
    r3.yz = r11.xy * r5.xz;
    ps = r3.y + r3.z;
    r3.x = dot(r9.yxz, r5.yxz);
    r0.x = ps;
    r3.yz = r0.xz + r0.yw;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r7 = r6.xxxx * BoneMatrices[a0];
    r5 = r6.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r6.yyyy * BoneMatrices[a0] + r7;
    r5 = r6.yyyy * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r6.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r6.zzzz * BoneMatrices[a0] + r7;
    r5 = r6.zzzz * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r6.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r6.wwww * BoneMatrices[a0] + r7;
    r5 = r6.wwww * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r6.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r7.zxyw, r6);
    r1.y = dot(r5.zxyw, r6);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o1.x = ps;
    o1.yzw = 0.0;
    o0.xyz = r3.xyz;
    o2.xyz = r2.xyz;
    o3 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord4 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
