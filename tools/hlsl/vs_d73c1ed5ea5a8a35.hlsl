// vs_d73c1ed5ea5a8a35.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 435 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006CC 0021000C 00000000 00000000 00002063 00000001 00000006 00000003 00000290 00100012 00003013 00002014 00001015 00005016 00215017 00003050 00013151 0002F256 0000108E 0000108F 0000108D
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> NORMAL0
//   vertex element: instruction 20 -> BLENDINDICES0
//   vertex element: instruction 21 -> BLENDWEIGHT0
//   vertex element: instruction 22 -> TEXCOORD0
//   vertex element: instruction 23 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c14); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 PrevViewProjectionMatrix[4] : register(c239); // float4x4 (matrix_columns)
float4 PreviousLocalToWorld[4] : register(c10); // float4x4 (matrix_columns)
float4 StretchTimeScale : register(c243); // float4 // default: 1.0, 0.0, 0.0, 0.0
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
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
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r4.xyz = In.position0.xyz;
    r5.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r6 = In.blendweight0;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r1.y = r1.y * 3.0;
    a0 = xe_mova(r1.y);
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r6.xxxx * BoneMatrices[a0];
    r7 = r6.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    r4.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r8.x = 3.0 * r1.x;
    a0 = xe_mova(r8.x);
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    r0 = r6.yyyy * BoneMatrices[a0] + r0;
    r7 = r6.yyyy * BoneMatrices[a0 + 1] + r7;
    r2.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r4.w = r6.y * BoneMatrices[a0 + 2].w + r4.w;
    // UNHANDLED control flow: cjmp
    r8.x = 3.0 * r1.z;
    a0 = xe_mova(r8.x);
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    r0 = r6.zzzz * BoneMatrices[a0] + r0;
    r7 = r6.zzzz * BoneMatrices[a0 + 1] + r7;
    r2.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r4.w = r6.z * BoneMatrices[a0 + 2].w + r4.w;
    if (p0)
    {
        if (p0)
        {
            r5.w = 3.0 * r1.w;
            a0 = xe_mova(r5.w);
            r0 = r6.wwww * BoneMatrices[a0] + r0;
            r7 = r6.wwww * BoneMatrices[a0 + 1] + r7;
            r2.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
            r4.w = r6.w * BoneMatrices[a0 + 2].w + r4.w;
        }
    }
    a0 = xe_mova(r1.y);
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r10 = r6.xxxx * BoneMatrices[a0];
    r8 = r6.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    r5.w = dot(r0.zxyw, r12);
    r7.x = dot(r7.zxyw, r12);
    p0 = (r2.w != 0.0);
    r0.x = dot(r4.zxyw, r11);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r7.xxxx * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r5.wwww * LocalToWorld[0].wzyx + r0.wyzx;
    // UNHANDLED control flow: cjmp
    r5.w = 3.0 * r1.x;
    a0 = xe_mova(r5.w);
    r4.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.w != 0.0);
    r10 = r6.yyyy * BoneMatrices[a0] + r10;
    r8 = r6.yyyy * BoneMatrices[a0 + 1] + r8;
    r2.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    r5.w = 3.0 * r1.z;
    a0 = xe_mova(r5.w);
    r4.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.w != 0.0);
    r10 = r6.zzzz * BoneMatrices[a0] + r10;
    r8 = r6.zzzz * BoneMatrices[a0 + 1] + r8;
    r2.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            r4.w = 3.0 * r1.w;
            a0 = xe_mova(r4.w);
            r10 = r6.wwww * BoneMatrices[a0] + r10;
            r8 = r6.wwww * BoneMatrices[a0 + 1] + r8;
            r2.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
            r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r7.xyz = r5.zyx * 0.007843138 - 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    a0 = xe_mova(r1.y);
    r9.z = r4.z;
    r5.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r9.y = r4.y;
    ps = r4.x;
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r9.x = ps;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r2.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r4.w = dot(r10.zxyw, r12);
    r5.w = dot(r8.zxyw, r12);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = dot(r9.zxyw, r11);
    r8 = r7.wwww * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r8 = r5.wwww * PreviousLocalToWorld[1].xzyw + r8;
    r8 = r4.wwww * PreviousLocalToWorld[0] + r8.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r6.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r6.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r5.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r2.xyz = r6.www * BoneMatrices[a0].xyz + r2.xyz;
            r5.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r1.xyz = r0.yzw - r8.zyx;
    r1.w = dot(r7.zxy, r2.zxy);
    r2.w = dot(r7.zxy, r5.zxy);
    r2.x = dot(r7.zxy, r4.zxy);
    r2.xyz = r2.xxx * LocalToWorld[2].xzy;
    r2.xyz = r2.www * LocalToWorld[1].xzy + r2.xyz;
    r2.xyz = r1.www * LocalToWorld[0].xyz + r2.xzy;
    r1.w = dot(r2.zxy, r1.xzy);
    p0 = (r1.w >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r1.xyz = r8.www * PrevViewProjectionMatrix[3].xyw;
        r2 = r0.xxxx * ViewProjectionMatrix[3].xwzy;
        r2 = r0.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    }
    if (p0)
    {
        if (p0)
        {
            r1.xyz = r8.zzz * PrevViewProjectionMatrix[2].xyw + r1.xyz;
            r1.xyz = r8.yyy * PrevViewProjectionMatrix[1].xyw + r1.xyz;
            r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
            r0 = r0.wwww * ViewProjectionMatrix[0] + r2.xzyw;
            r1.xyz = r8.xxx * PrevViewProjectionMatrix[0].wxy + r1.zxy;
            ps = 1.0 / r1.x;
            r1.x = ps;
        }
    }
    if (p0)
    {
        ps = 1.0 / r0.w;
        r1.xy = r1.yz * r1.xx;
        r1.z = ps;
        r2.xy = r0.xy * r1.zz - r1.xy;
    }
    if (!p0)
    {
        r2.xy = float2((-abs(r0.xx) > 0.0));
        r1 = -r1.xxyz * StretchTimeScale.wxxx + r0;
        r0 = r1.xxxx * ViewProjectionMatrix[3].xwyz;
        r0 = r1.yyyy * ViewProjectionMatrix[2].xwyz + r0;
    }
    if (!p0)
    {
        if (!p0)
        {
            r0 = r1.zzzz * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r1.wwww * ViewProjectionMatrix[0] + r0.xzwy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o2.xy = r2.xy;
    o2.zw = 0.0;
    o0.xy = r3.zw;
    o1.xy = r3.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
