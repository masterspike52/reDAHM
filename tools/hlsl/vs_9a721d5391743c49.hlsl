// vs_9a721d5391743c49.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 300 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004B0 00210008 00000000 00000000 00002063 00000001 00000005 00000003 00000290 0010000D 0000200E 0000100F 00005010 00215011 00003050 00013151 0002F257 00001061 00001062 00001060
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> BLENDINDICES0
//   vertex element: instruction 15 -> BLENDWEIGHT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r6.xyz = In.position0.xyz;
    r1 = In.blendindices0.yzwx;
    r4 = In.blendweight0;
    r2.xy = In.texcoord0.xy;
    r2.zw = In.texcoord1.xy;
    r0.x = r1.w * 3.0;
    a0 = xe_mova(r0.x);
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r4.xxxx * BoneMatrices[a0];
    r5 = r4.xxxx * BoneMatrices[a0 + 1];
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.w != 0.0);
    r6.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.x;
    a0 = xe_mova(r7.x);
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    r0 = r4.yyyy * BoneMatrices[a0] + r0;
    r5 = r4.yyyy * BoneMatrices[a0 + 1] + r5;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r6.w = r4.y * BoneMatrices[a0 + 2].w + r6.w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.y;
    a0 = xe_mova(r7.x);
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    r0 = r4.zzzz * BoneMatrices[a0] + r0;
    r5 = r4.zzzz * BoneMatrices[a0 + 1] + r5;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r6.w = r4.z * BoneMatrices[a0 + 2].w + r6.w;
    if (p0)
    {
        if (p0)
        {
            r3.w = 3.0 * r1.z;
            a0 = xe_mova(r3.w);
            r0 = r4.wwww * BoneMatrices[a0] + r0;
            r5 = r4.wwww * BoneMatrices[a0 + 1] + r5;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
            r6.w = r4.w * BoneMatrices[a0 + 2].w + r6.w;
        }
    }
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r3.x = dot(r0.zxyw, r8);
    r3.y = dot(r5.zxyw, r8);
    r0.x = dot(r6.zxyw, r7);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r3.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r3 = r3.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.x = r1.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r7 = r4.xxxx * BoneMatrices[a0];
    r5 = r4.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r4.yyyy * BoneMatrices[a0] + r7;
    r5 = r4.yyyy * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r6.w = r4.y * BoneMatrices[a0 + 2].w + r6.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.y * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r4.zzzz * BoneMatrices[a0] + r7;
    r5 = r4.zzzz * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r6.w = r4.z * BoneMatrices[a0 + 2].w + r6.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r4.wwww * BoneMatrices[a0] + r7;
    r5 = r4.wwww * BoneMatrices[a0 + 1] + r5;
    r0.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r6.w = r4.w * BoneMatrices[a0 + 2].w + r6.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r1.x = dot(r7.zxyw, r4);
    r1.y = dot(r5.zxyw, r4);
    r0.x = dot(r6.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ShadowMatrix[3].xwzy;
    r0 = r3.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o2 = r3.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r2.xy;
    o1.xy = r2.zw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    return Out;
}
