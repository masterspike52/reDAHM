// vs_4c5c9593c80a5453.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 606 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000978 0041000E 00000000 00000000 000040A5 00000001 00000008 00000005 00000290 00100018 00006019 0000301A 0020201B 0010101D 0000501E 0006501F 00375020 00003050 00017154 0002F255 00037356 0004F457 000010C5 000010C6 000010C4 000010C7 000010C8
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD6
//   vertex element: instruction 32 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
float4 LightDirection : register(c238); // float3
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

    r12.xyz = In.position0.xyz;
    r10.xyz = In.tangent0.xyz;
    r2.xyz = In.normal0.zyx;
    r1 = In.blendindices0.wxyz;
    ps = r1.z;
    r1.z = r1.y;
    r0.z = ps;
    r3 = In.blendweight0;
    r4.xy = In.texcoord0.xy;
    r6.xyz = In.texcoord6.xyz;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r8.xyz = r12.xyz + r6.xyz;
    r5 = r3.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r3.x * BoneMatrices[a0 + 2].w;
    ps = r1.x;
    r7.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    ps = r1.w;
    r9 = r3.xxxx * BoneMatrices[a0 + 1];
    r1.w = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r3.yyyy * BoneMatrices[a0] + r5;
    r9 = r3.yyyy * BoneMatrices[a0 + 1] + r9;
    r7.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r8.w = r3.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r3.zzzz * BoneMatrices[a0] + r5;
    r9 = r3.zzzz * BoneMatrices[a0 + 1] + r9;
    r7.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r8.w = r3.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r4.z = ps;
            a0 = xe_mova(r4.z);
            ps = r4.z;
            r5 = r3.wwww * BoneMatrices[a0] + r5;
            r9 = r3.wwww * BoneMatrices[a0 + 1] + r9;
            r7.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r8.w = r3.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    r13.xyz = r10.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.xyz = r2.xyz + r0.xyw;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r7.xyz = r3.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r3.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r9.zxyw, r11);
    r0.w = dot(r8.zxyw, r14);
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.y = dot(r2.xzy, r2.xzy);
    r8 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r8 = r0.xxxx * LocalToWorld[1].xzyw + r8.xzyw;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r5.zxyw, r11);
    r0.y = ps;
    r11.xyz = r2.zyx * r0.yyy;
    r9 = r0.xxxx * LocalToWorld[0].xywz + r8.xzwy;
    r0.xyw = -r9.yxw * CameraPosition.www + CameraPosition.yxz;
    r2.x = dot(r11.zxy, r13.zxy);
    r5 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r8 = r9.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5.xyz = -r11.zyx * r2.xxx + r13.zyx;
    r2.x = dot(r5.xzy, r5.xzy);
    r8 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r8.xzwy;
    r8 = r9.xxxx * ViewProjectionMatrix[0] + r8.xzyw;
    ps = rsqrt(abs(r2.x));
    r9.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    r2.xyz = r5.zyx * r2.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r11.zxy * r2.yzx;
    r5.xyz = r11.yzx * r2.zxy - r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r3.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r10.xyz = r3.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r3.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r10.xyz = r3.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r4.z = ps;
            a0 = xe_mova(r4.z);
            ps = r4.z;
            r7.xyz = r3.www * BoneMatrices[a0].xyz + r7.xyz;
            r10.xyz = r3.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r4.z = dot(r11.zxy, r7.zxy);
    r4.w = dot(r11.zxy, r10.zxy);
    r13.z = dot(r5.zxy, r7.zxy);
    r13.w = dot(r5.zxy, r9.zxy);
    r13.x = dot(r5.zxy, r10.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.y = dot(r11.zxy, r9.zxy);
    r14.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r7.x = dot(r2.zxy, r7.zxy);
    r14.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r7.y = dot(r2.zxy, r10.zxy);
    r14.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r7.z = dot(r2.zxy, r9.zxy);
    r14.xyz = r0.xxx * WorldToLocal[1].xzy + r14.xyz;
    r10.xyz = r3.xxx * BoneMatrices[a0 + 1].xyz;
    r9.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r14.xzy;
    r7.x = dot(r7.zxy, r0.wxy);
    r13.xy = r13.xy * r0.yw;
    r13.w = dot(r13.wz, r0.wx) + 0.0;
    r4.zw = r4.zw * r0.xy;
    ps = r4.z + r4.w;
    r0.xyw = r3.xxx * BoneMatrices[a0].xyz;
    r13.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.yz = r13.xz + r13.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r3.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r10.xyz = r3.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r3.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r10.xyz = r3.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r0.xyw = r3.www * BoneMatrices[a0].xyz + r0.xyw;
            r10.xyz = r3.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r4.z = dot(r11.zxy, r0.wxy);
    r4.w = dot(r11.zxy, r10.zxy);
    r13.x = dot(r5.zxy, r0.wxy);
    ps = WorldToLocal[2].x;
    r13.y = dot(r5.zxy, r9.zxy);
    ps = LightDirection.z * ps;
    r13.z = dot(r5.zxy, r10.zxy);
    r5.x = ps;
    ps = WorldToLocal[2].z;
    r13.w = dot(r11.zxy, r9.zxy);
    ps = LightDirection.z * ps;
    r11.x = dot(r2.zxy, r0.wxy);
    r5.y = ps;
    ps = WorldToLocal[2].y;
    r11.y = dot(r2.zxy, r10.zxy);
    ps = LightDirection.z * ps;
    r11.z = dot(r2.zxy, r9.zxy);
    r5.z = ps;
    r0.xyw = WorldToLocal[1].xzy * LightDirection.yyy + r5.xyz;
    r5.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r0.xwy;
    r2.xy = r13.zw * r5.yz;
    r2.w = dot(r13.yx, r5.zx) + 0.0;
    r0.xy = r4.zw * r5.xy;
    ps = r0.x + r0.y;
    r5.x = dot(r11.zxy, r5.zxy);
    r2.z = ps;
    r5.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r9.xyz = r6.xyz + r12.xyz;
    r2 = r3.xxxx * BoneMatrices[a0];
    r6 = r3.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r3.yyyy * BoneMatrices[a0] + r2;
    r6 = r3.yyyy * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r3.y * BoneMatrices[a0 + 2].w + r9.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r3.zzzz * BoneMatrices[a0] + r2;
    r6 = r3.zzzz * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r3.z * BoneMatrices[a0 + 2].w + r9.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r3.wwww * BoneMatrices[a0] + r2;
    r6 = r3.wwww * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r3.w * BoneMatrices[a0 + 2].w + r9.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r3);
    r1.y = dot(r6.zxyw, r3);
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
    o0.xy = r4.xy;
    o1.xyz = r5.xyz;
    o3.xyz = r7.xyz;
    o4 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
