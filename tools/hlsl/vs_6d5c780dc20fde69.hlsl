// vs_6d5c780dc20fde69.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 441 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006E4 0001000D 00000000 00000000 00001021 00000001 00000006 00000001 00000290 00100013 00003014 00002015 00001016 00065017 00275018 0000F056 00001091
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> NORMAL0
//   vertex element: instruction 21 -> BLENDINDICES0
//   vertex element: instruction 22 -> BLENDWEIGHT0
//   vertex element: instruction 23 -> TEXCOORD6
//   vertex element: instruction 24 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 r13 = 0.0;
    float4 o0 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3.xyz = In.position0.xyz;
    r2.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r0.yzw = In.texcoord6.xyz;
    r6.xyz = In.texcoord7.xyz;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r1.y = r1.y * 3.0;
    a0 = xe_mova(r1.y);
    r3.xyz = r3.xyz + r0.yzw;
    r0 = r7.xxxx * BoneMatrices[a0];
    r10 = r7.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    r3.w = r7.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r5.x = 3.0 * r1.x;
    a0 = xe_mova(r5.x);
    r4.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.w != 0.0);
    r0 = r7.yyyy * BoneMatrices[a0] + r0;
    r10 = r7.yyyy * BoneMatrices[a0 + 1] + r10;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r3.w = r7.y * BoneMatrices[a0 + 2].w + r3.w;
    // UNHANDLED control flow: cjmp
    r5.x = 3.0 * r1.z;
    a0 = xe_mova(r5.x);
    r4.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.w != 0.0);
    r0 = r7.zzzz * BoneMatrices[a0] + r0;
    r10 = r7.zzzz * BoneMatrices[a0 + 1] + r10;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r3.w = r7.z * BoneMatrices[a0 + 2].w + r3.w;
    if (p0)
    {
        if (p0)
        {
            r4.w = 3.0 * r1.w;
            a0 = xe_mova(r4.w);
            r0 = r7.wwww * BoneMatrices[a0] + r0;
            r10 = r7.wwww * BoneMatrices[a0 + 1] + r10;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r3.w = r7.w * BoneMatrices[a0 + 2].w + r3.w;
        }
    }
    a0 = xe_mova(r1.y);
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r11 = r7.xxxx * BoneMatrices[a0];
    r8 = r7.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r9.w = r7.x * BoneMatrices[a0 + 2].w;
    r4.x = dot(r0.zxyw, r13);
    r4.y = dot(r10.zxyw, r13);
    p0 = (r2.w != 0.0);
    r0.x = dot(r3.zxyw, r12);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r4.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r4 = r4.xxxx * LocalToWorld[0].wzyx + r0.wyzx;
    // UNHANDLED control flow: cjmp
    r0.y = 3.0 * r1.x;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r7.yyyy * BoneMatrices[a0] + r11;
    r8 = r7.yyyy * BoneMatrices[a0 + 1] + r8;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r9.w = r7.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r7.zzzz * BoneMatrices[a0] + r11;
    r8 = r7.zzzz * BoneMatrices[a0 + 1] + r8;
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
            r11 = r7.wwww * BoneMatrices[a0] + r11;
            r8 = r7.wwww * BoneMatrices[a0 + 1] + r8;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r9.w = r7.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.yzw = r2.xyz + r6.xyz;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    ps = r3.x;
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r9.x = ps;
    ps = r3.y;
    r6.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r9.y = ps;
    ps = r3.z;
    r2.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r9.z = ps;
    r10 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r3.x = dot(r8.zxyw, r10);
    r0.x = dot(r9.zxyw, r12);
    r8.xyz = r0.yzw * 0.007843138 - 1.0;
    r3.y = dot(r8.zxy, r8.zxy);
    r0 = r0.xxxx * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r0 = r3.xxxx * PreviousLocalToWorld[1].xzyw + r0;
    ps = rsqrt(abs(r3.y));
    r3.x = dot(r11.zxyw, r10);
    r3.y = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r8.xyz * r3.yyy;
    r3 = r3.xxxx * PreviousLocalToWorld[0] + r0.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r7.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r6.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r7.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r6.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r7.www * BoneMatrices[a0].xyz + r2.xyz;
            r6.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r0.xyz = r4.yzw - r3.zyx;
    r0.w = dot(r8.zxy, r2.zxy);
    r1.w = dot(r8.zxy, r6.zxy);
    r1.x = dot(r8.zxy, r5.zxy);
    r1.xyz = r1.xxx * LocalToWorld[2].xzy;
    r1.xyz = r1.www * LocalToWorld[1].xzy + r1.xyz;
    r1.xyz = r0.www * LocalToWorld[0].xyz + r1.xzy;
    r0.w = dot(r1.zxy, r0.xzy);
    p0 = (r0.w >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r1.xyz = r3.www * PrevViewProjectionMatrix[3].xyw;
        r0 = r4.xxxx * ViewProjectionMatrix[3].xwzy;
        r0 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    }
    if (p0)
    {
        if (p0)
        {
            r1.xyz = r3.zzz * PrevViewProjectionMatrix[2].xyw + r1.xyz;
            r1.xyz = r3.yyy * PrevViewProjectionMatrix[1].xyw + r1.xyz;
            r0 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
            r0 = r4.wwww * ViewProjectionMatrix[0] + r0.xzyw;
            r1.xyz = r3.xxx * PrevViewProjectionMatrix[0].wxy + r1.zxy;
            ps = 1.0 / r1.x;
            r1.x = ps;
        }
    }
    if (p0)
    {
        ps = 1.0 / r0.w;
        r1.xy = r1.yz * r1.xx;
        r1.z = ps;
        r1.xy = r0.xy * r1.zz - r1.xy;
    }
    if (!p0)
    {
        r1.xy = float2((-abs(r0.xx) > 0.0));
        r2 = -r0.xxyz * StretchTimeScale.wxxx + r4;
        r0 = r2.xxxx * ViewProjectionMatrix[3].xwyz;
        r0 = r2.yyyy * ViewProjectionMatrix[2].xwyz + r0;
    }
    if (!p0)
    {
        if (!p0)
        {
            r0 = r2.zzzz * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r2.wwww * ViewProjectionMatrix[0] + r0.xzwy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o0.xy = r1.xy;
    o0.zw = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    return Out;
}
