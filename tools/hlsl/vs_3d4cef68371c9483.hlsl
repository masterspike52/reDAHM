// vs_3d4cef68371c9483.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000288 00210007 00000000 00000000 00002063 00000001 00000005 00000003 00000290 00100007 00002008 00001009 0000500A 0031500B 00003050 00013151 0002F256 00001032 00001033 00001034
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> BLENDINDICES0
//   vertex element: instruction 9 -> BLENDWEIGHT0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c10); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3.xyz = In.position0.xyz;
    r1 = In.blendindices0.yzwx;
    r4 = In.blendweight0;
    r0.zw = In.texcoord0.xy;
    r0.xy = In.texcoord1.xy;
    r2.x = r1.w * 3.0;
    a0 = xe_mova(r2.x);
    r5.w = float((MaxBoneInfluences.x > 1.0));
    r2 = r4.xxxx * BoneMatrices[a0];
    r6 = r4.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r5.w != 0.0);
    r3.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.x;
    a0 = xe_mova(r7.x);
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r6 = r4.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r3.w = r4.y * BoneMatrices[a0 + 2].w + r3.w;
    // UNHANDLED control flow: cjmp
    r7.x = 3.0 * r1.y;
    a0 = xe_mova(r7.x);
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r6 = r4.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r3.w = r4.z * BoneMatrices[a0 + 2].w + r3.w;
    if (p0)
    {
        if (p0)
        {
            r1.x = 3.0 * r1.z;
            a0 = xe_mova(r1.x);
            r2 = r4.wwww * BoneMatrices[a0] + r2;
            r6 = r4.wwww * BoneMatrices[a0 + 1] + r6;
            r5.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r3.w = r4.w * BoneMatrices[a0 + 2].w + r3.w;
        }
    }
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r2.x = dot(r2.zxyw, r4);
    r2.y = dot(r6.zxyw, r4);
    r1.x = dot(r3.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r1 = r2.yyyy * LocalToWorld[1].xzyw + r1.xzyw;
    r1 = r2.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r2 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r1.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    oPos = r1.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    o0.xy = r0.zw;
    o1.xy = r0.xy;
    o2 = r1.xywz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
