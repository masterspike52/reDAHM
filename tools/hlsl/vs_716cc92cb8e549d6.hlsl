// vs_716cc92cb8e549d6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 576 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000900 0051000F 00000000 00000000 00004CC6 00000001 00000008 00000006 00000290 00100017 00006018 00007019 0000301A 0000201B 0000101C 0000501D 0021501E 00003050 00013151 0002F255 00037356 0004F4A0 0005F5A1 000010B9 000010BA 000010BE 000010BC 000010BD 000010BB
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   vertex element: instruction 29 -> TEXCOORD0
//   vertex element: instruction 30 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
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
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 37

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
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
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
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

    r11.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r8 = In.blendweight0;
    r6.zw = In.texcoord0.xy;
    r6.xy = In.texcoord1.xy;
    r14.xyz = r3.xyz * 0.007843138 - 1.0;
    r4.xyz = r2.xyz * 0.007843138 - 1.0;
    r12.xyz = r0.yzw * 0.007843138 - 1.0;
    r0.w = r1.y * 3.0;
    a0 = xe_mova(r0.w);
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r2.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r5.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r2.w != 0.0);
    r3.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r0.y = 3.0 * r1.x;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r8.www * BoneMatrices[a0].xyz + r2.xyz;
            r5.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r3.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r9.x = dot(r14.zxy, r2.zxy);
    r9.z = dot(r14.zxy, r3.zxy);
    r10.x = dot(r4.zxy, r3.zxy);
    r10.y = dot(r4.zxy, r5.zxy);
    r10.z = dot(r4.zxy, r2.zxy);
    r0.x = dot(r12.zxy, r5.zxy);
    r0.y = dot(r12.zxy, r2.zxy);
    r0.z = dot(r12.zxy, r3.zxy);
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9.w = dot(r14.zxy, r5.zxy);
    r3 = r8.xxxx * BoneMatrices[a0];
    r13 = r8.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r9.w;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    r9.y = ps;
    ps = 0.5 * r0.x;
    r5.xyz = r10.xxy * r0.xyy;
    r5.w = ps;
    r7.xyz = r9.xwz * 0.5 + 0.5;
    r5.xyz = r10.yzz * r0.zzx - r5.xyz;
    ps = 0.5 * r0.y;
    r4.w = dot(r9.xyz, r5.xyz);
    r5.y = ps;
    ps = 0.5 * r0.z;
    r5.x = r4.w * 0.5;
    r5.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r5.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r8.yyyy * BoneMatrices[a0] + r3;
    r13 = r8.yyyy * BoneMatrices[a0 + 1] + r13;
    r2.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r8.zzzz * BoneMatrices[a0] + r3;
    r13 = r8.zzzz * BoneMatrices[a0 + 1] + r13;
    r2.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r8.wwww * BoneMatrices[a0] + r3;
            r13 = r8.wwww * BoneMatrices[a0 + 1] + r13;
            r2.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
            r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = dot(r11.zxyw, r9);
    r2.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r9.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = dot(r3.zxyw, r15);
    r3.y = dot(r13.zxyw, r15);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r13 = r3.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r13.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r13.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r13.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r13.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r13.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r2.xyz = r8.www * BoneMatrices[a0].xyz + r2.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r13.x = dot(r12.zxy, r2.zxy);
    r13.y = dot(r12.zxy, r10.zxy);
    r13.z = dot(r4.zxy, r2.zxy);
    r13.w = dot(r4.zxy, r9.zxy);
    r15.x = dot(r4.zxy, r10.zxy);
    r15.y = dot(r12.zxy, r9.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r12.x = dot(r14.zxy, r2.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r12.y = dot(r14.zxy, r10.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r12.z = dot(r14.zxy, r9.zxy);
    r2.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r4.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.xy = r15.xy * r4.yz;
    r0.w = dot(r13.wz, r4.zx) + 0.0;
    r2.xy = r13.xy * r4.xy;
    ps = r2.x + r2.y;
    r9.x = dot(r12.zxy, r4.zxy);
    r0.z = ps;
    r9.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r8.xxxx * BoneMatrices[a0];
    r4 = r8.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r8.yyyy * BoneMatrices[a0] + r0;
    r4 = r8.yyyy * BoneMatrices[a0 + 1] + r4;
    r2.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2.w = r1.z * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0 = r8.zzzz * BoneMatrices[a0] + r0;
    r4 = r8.zzzz * BoneMatrices[a0 + 1] + r4;
    r2.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r8.wwww * BoneMatrices[a0] + r0;
    r4 = r8.wwww * BoneMatrices[a0 + 1] + r4;
    r2.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r8);
    r1.y = dot(r4.zxyw, r8);
    r0.x = dot(r11.zxyw, r2);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r6.zw;
    o1.xy = r6.xy;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o3.xyz = r9.xyz;
    o4 = r5;
    o2 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
