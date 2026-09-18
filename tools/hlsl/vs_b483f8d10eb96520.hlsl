// vs_b483f8d10eb96520.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 423 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000069C 0001000B 00000000 00000000 00001021 00000001 00000004 00000001 00000290 00100012 00003013 00002014 00201015 0000F056 0000108B
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> NORMAL0
//   vertex element: instruction 20 -> BLENDINDICES0
//   vertex element: instruction 21 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
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
    float4 o0 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3.xyz = In.position0.xyz;
    r4.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r6 = In.blendweight0;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0 = r6.xxxx * BoneMatrices[a0];
    r5 = r6.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    r3.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.x;
    a0 = xe_mova(r7.x);
    r4.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.w != 0.0);
    r0 = r6.yyyy * BoneMatrices[a0] + r0;
    r5 = r6.yyyy * BoneMatrices[a0 + 1] + r5;
    r2.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r3.w = r6.y * BoneMatrices[a0 + 2].w + r3.w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.z;
    a0 = xe_mova(r7.x);
    r4.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.w != 0.0);
    r0 = r6.zzzz * BoneMatrices[a0] + r0;
    r5 = r6.zzzz * BoneMatrices[a0 + 1] + r5;
    r2.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r3.w = r6.z * BoneMatrices[a0 + 2].w + r3.w;
    if (p0)
    {
        if (p0)
        {
            r4.w = 3.0 * r1.w;
            a0 = xe_mova(r4.w);
            r0 = r6.wwww * BoneMatrices[a0] + r0;
            r5 = r6.wwww * BoneMatrices[a0 + 1] + r5;
            r2.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
            r3.w = r6.w * BoneMatrices[a0 + 2].w + r3.w;
        }
    }
    a0 = xe_mova(r2.w);
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r10 = r6.xxxx * BoneMatrices[a0];
    r8 = r6.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r9.w = r6.x * BoneMatrices[a0 + 2].w;
    r4.w = dot(r0.zxyw, r11);
    r5.x = dot(r5.zxyw, r11);
    p0 = (r1.y != 0.0);
    r0.x = dot(r3.zxyw, r7);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r5.xxxx * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r4.wwww * LocalToWorld[0].wzyx + r0.wyzx;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r1.x;
    a0 = xe_mova(r4.w);
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    r10 = r6.yyyy * BoneMatrices[a0] + r10;
    r8 = r6.yyyy * BoneMatrices[a0 + 1] + r8;
    r2.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r9.w = r6.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r1.z;
    a0 = xe_mova(r4.w);
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    r10 = r6.zzzz * BoneMatrices[a0] + r10;
    r8 = r6.zzzz * BoneMatrices[a0 + 1] + r8;
    r2.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r9.w = r6.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            r3.w = 3.0 * r1.w;
            a0 = xe_mova(r3.w);
            r10 = r6.wwww * BoneMatrices[a0] + r10;
            r8 = r6.wwww * BoneMatrices[a0 + 1] + r8;
            r2.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
            r9.w = r6.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r7.xyz = r4.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    r9.z = r3.z;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r9.x = r3.x;
    r5.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r9.y = r3.y;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r3.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r3.w = dot(r10.zxyw, r11);
    r4.w = dot(r8.zxyw, r11);
    p0 = (r1.y != 0.0);
    r2.x = dot(r9.zxyw, r2);
    r2 = r2.xxxx * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r2 = r4.wwww * PreviousLocalToWorld[1].xzyw + r2;
    r8 = r3.wwww * PreviousLocalToWorld[0] + r2.xzyw;
    // UNHANDLED control flow: cjmp
    r2.y = 3.0 * r1.x;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r6.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r5.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r6.zzz * BoneMatrices[a0].xyz + r3.xyz;
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
            r3.xyz = r6.www * BoneMatrices[a0].xyz + r3.xyz;
            r5.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r2.xyz = r0.yzw - r8.zyx;
    r1.w = dot(r7.zxy, r3.zxy);
    r2.w = dot(r7.zxy, r5.zxy);
    r1.x = dot(r7.zxy, r4.zxy);
    r1.xyz = r1.xxx * LocalToWorld[2].xzy;
    r1.xyz = r2.www * LocalToWorld[1].xzy + r1.xyz;
    r1.xyz = r1.www * LocalToWorld[0].xyz + r1.xzy;
    r1.x = dot(r1.zxy, r2.xzy);
    p0 = (r1.x >= 0.0);
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
        r1.xy = r0.xy * r1.zz - r1.xy;
    }
    if (!p0)
    {
        r1.xy = float2((-abs(r0.xx) > 0.0));
        r2 = -r2.xxyz * StretchTimeScale.wxxx + r0;
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
