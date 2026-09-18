// vs_d6406d17f8f15f50.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 294 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000498 00010009 00000000 00000000 00001021 00000001 00000004 00000001 00000290 0010000D 0000200E 0000100F 00265010 0000F057 00001060
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> BLENDINDICES0
//   vertex element: instruction 15 -> BLENDWEIGHT0
//   vertex element: instruction 16 -> TEXCOORD6
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 18

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c10); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ProjectionMatrix[4] : register(c239); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c235); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord6 : TEXCOORD6;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3.xyz = In.position0.zyx;
    r1 = In.blendindices0.xwyz;
    r2 = In.blendweight0;
    r8.xyz = In.texcoord6.zyx;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r1.x = r1.x;
    r0.w = 3.0 * r1.x;
    a0 = xe_mova(r0.w);
    r5.xyz = r3.zyx + r8.zyx;
    p0 = (r0.x != 0.0);
    r5.w = r2.x * BoneMatrices[a0 + 2].w;
    r6.xyz = r2.xxx * BoneMatrices[a0 + 2].xyz;
    r1.y = r1.y;
    r7 = r2.xxxx * BoneMatrices[a0 + 1];
    r0.z = r1.w;
    r4 = r2.xxxx * BoneMatrices[a0];
    r0.y = r1.z;
    // UNHANDLED control flow: cjmp
    r0.w = 3.0 * r0.y;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r2.yyyy * BoneMatrices[a0] + r4;
    r7 = r2.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r2.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r5.w = r2.y * BoneMatrices[a0 + 2].w + r5.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r2.zzzz * BoneMatrices[a0] + r4;
    r7 = r2.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r2.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r5.w = r2.z * BoneMatrices[a0 + 2].w + r5.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.y;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r4 = r2.wwww * BoneMatrices[a0] + r4;
            r7 = r2.wwww * BoneMatrices[a0 + 1] + r7;
            r6.xyz = r2.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r5.w = r2.w * BoneMatrices[a0 + 2].w + r5.w;
        }
    }
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r0.x = dot(r4.zxyw, r9);
    r0.w = dot(r7.zxyw, r9);
    r1.z = dot(r5.zxyw, r6);
    r4 = r1.zzzz * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r4 = r0.wwww * LocalToWorld[1].xzyw + r4.xzwy;
    r4 = r0.xxxx * LocalToWorld[0].xywz + r4.xzwy;
    ps = 3.0 * r1.x;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r6.xyz = r3.zyx + r8.zyx;
    r3 = r2.xxxx * BoneMatrices[a0];
    r5 = r2.xxxx * BoneMatrices[a0 + 1];
    r1.xzw = r2.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r2.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.yyyy * BoneMatrices[a0] + r3;
    r5 = r2.yyyy * BoneMatrices[a0 + 1] + r5;
    r1.xzw = r2.yyy * BoneMatrices[a0 + 2].xyz + r1.xzw;
    r6.w = r2.y * BoneMatrices[a0 + 2].w + r6.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.zzzz * BoneMatrices[a0] + r3;
    r5 = r2.zzzz * BoneMatrices[a0 + 1] + r5;
    r1.xzw = r2.zzz * BoneMatrices[a0 + 2].xyz + r1.xzw;
    r6.w = r2.z * BoneMatrices[a0 + 2].w + r6.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.wwww * BoneMatrices[a0] + r3;
    r5 = r2.wwww * BoneMatrices[a0 + 1] + r5;
    r1.xzw = r2.www * BoneMatrices[a0 + 2].xyz + r1.xzw;
    r6.w = r2.w * BoneMatrices[a0 + 2].w + r6.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.wxzz : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r2);
    r1.y = dot(r5.zxyw, r2);
    r0.x = dot(r6.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r4.zzzz * ShadowMatrix[3].xwzy;
    r0 = r4.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o0 = r4.xxxx * ShadowMatrix[0] + r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    return Out;
}
