// vs_071e2dfa24caeefd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 312 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004E0 0021000A 00000000 00000000 00002063 00000001 00000006 00000003 00000290 0010000E 0000200F 00201010 00105013 00015014 00265015 00003050 00013151 0002F257 00001065 00001066 00001064
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> BLENDINDICES0
//   vertex element: instruction 16 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> TEXCOORD1
//   vertex element: instruction 21 -> TEXCOORD6
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 19

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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord6 : TEXCOORD6;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r9.xyz = In.position0.xyz;
    r1 = In.blendindices0.yxzw;
    r3 = In.blendweight0;
    ps = r1.z;
    r1.y = r1.y;
    r0.z = ps;
    ps = r1.w;
    r0.w = r1.y * 3.0;
    r0.y = ps;
    r1.zw = In.texcoord0.xy;
    r4.xy = In.texcoord1.xy;
    r2.xyz = In.texcoord6.xyz;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5.xyz = r9.xyz + r2.xyz;
    r6 = r3.xxxx * BoneMatrices[a0];
    r8 = r3.xxxx * BoneMatrices[a0 + 1];
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r3.x * BoneMatrices[a0 + 2].w;
    ps = r1.x;
    r7.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r3.yyyy * BoneMatrices[a0] + r6;
    r8 = r3.yyyy * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r5.w = r3.y * BoneMatrices[a0 + 2].w + r5.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r3.zzzz * BoneMatrices[a0] + r6;
    r8 = r3.zzzz * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r5.w = r3.z * BoneMatrices[a0 + 2].w + r5.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.y;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r6 = r3.wwww * BoneMatrices[a0] + r6;
            r8 = r3.wwww * BoneMatrices[a0 + 1] + r8;
            r7.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r5.w = r3.w * BoneMatrices[a0 + 2].w + r5.w;
        }
    }
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r10 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r0.x = dot(r6.zxyw, r10);
    r0.w = dot(r8.zxyw, r10);
    r2.w = dot(r5.zxyw, r7);
    r5 = r2.wwww * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r5 = r0.wwww * LocalToWorld[1].xzyw + r5.xzwy;
    r5 = r0.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    ps = 3.0 * r1.y;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8.xyz = r2.xyz + r9.xyz;
    r2 = r3.xxxx * BoneMatrices[a0];
    r7 = r3.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r1.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r3.yyyy * BoneMatrices[a0] + r2;
    r7 = r3.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r3.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r3.zzzz * BoneMatrices[a0] + r2;
    r7 = r3.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r3.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r3.wwww * BoneMatrices[a0] + r2;
    r7 = r3.wwww * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r3.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r3);
    r1.y = dot(r7.zxyw, r3);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r5.zzzz * ShadowMatrix[3].xwzy;
    r0 = r5.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r5.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o2 = r5.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r1.zw;
    o1.xy = r4.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    return Out;
}
