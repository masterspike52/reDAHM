// vs_9b444d3133d1b98e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 306 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004C8 00110009 00000000 00000000 00001842 00000001 00000005 00000002 00000290 0010000E 0000200F 00201010 00105013 00265014 00003050 0001F157 00001064 00001063
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> BLENDINDICES0
//   vertex element: instruction 16 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> TEXCOORD6
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o1 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r8.xyz = In.position0.xyz;
    r1 = In.blendindices0.xwyz;
    r2 = In.blendweight0;
    ps = r1.z;
    r1.x = r1.x;
    r0.z = ps;
    ps = r1.w;
    r0.w = r1.x * 3.0;
    r0.y = ps;
    r1.zw = In.texcoord0.xy;
    r5.xyz = In.texcoord6.xyz;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r4.xyz = r8.xyz + r5.xyz;
    r3 = r2.xxxx * BoneMatrices[a0];
    r7 = r2.xxxx * BoneMatrices[a0 + 1];
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r2.x * BoneMatrices[a0 + 2].w;
    ps = r1.y;
    r6.xyz = r2.xxx * BoneMatrices[a0 + 2].xyz;
    r1.y = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r2.yyyy * BoneMatrices[a0] + r3;
    r7 = r2.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r2.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r4.w = r2.y * BoneMatrices[a0 + 2].w + r4.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.y;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r2.zzzz * BoneMatrices[a0] + r3;
    r7 = r2.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r2.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r4.w = r2.z * BoneMatrices[a0 + 2].w + r4.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.y;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r2.wwww * BoneMatrices[a0] + r3;
            r7 = r2.wwww * BoneMatrices[a0 + 1] + r7;
            r6.xyz = r2.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r4.w = r2.w * BoneMatrices[a0 + 2].w + r4.w;
        }
    }
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r0.x = dot(r3.zxyw, r9);
    r0.w = dot(r7.zxyw, r9);
    r3.x = dot(r4.zxyw, r6);
    r3 = r3.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r3 = r0.wwww * LocalToWorld[1].xzyw + r3.xzwy;
    r4 = r0.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    ps = 3.0 * r1.x;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7.xyz = r5.xyz + r8.xyz;
    r3 = r2.xxxx * BoneMatrices[a0];
    r6 = r2.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r2.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r2.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.yyyy * BoneMatrices[a0] + r3;
    r6 = r2.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r2.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r2.y * BoneMatrices[a0 + 2].w + r7.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.zzzz * BoneMatrices[a0] + r3;
    r6 = r2.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r2.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r2.z * BoneMatrices[a0 + 2].w + r7.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3 = r2.wwww * BoneMatrices[a0] + r3;
    r6 = r2.wwww * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r2.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r7.w = r2.w * BoneMatrices[a0 + 2].w + r7.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r2);
    r1.y = dot(r6.zxyw, r2);
    r0.x = dot(r7.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r4.zzzz * ShadowMatrix[3].xwzy;
    r0 = r4.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r4.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r1.zw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    return Out;
}
