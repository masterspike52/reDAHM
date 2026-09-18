// vs_1b3dd385b5d1ec2d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000288 00110006 00000000 00000000 00001842 00000001 00000005 00000002 00000290 00100007 00002008 00001009 0000500A 0026500B 00003050 0001F156 00001033 00001034
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> BLENDINDICES0
//   vertex element: instruction 9 -> BLENDWEIGHT0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> TEXCOORD6
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;
    bool p0 = false;
    int a0 = 0;

    r2.xyz = In.position0.xyz;
    r1 = In.blendindices0.yzwx;
    r3 = In.blendweight0;
    r6.xy = In.texcoord0.xy;
    r0.yzw = In.texcoord6.xyz;
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = r1.w * 3.0;
    a0 = xe_mova(r0.x);
    r2.xyz = r2.xyz + r0.yzw;
    r0 = r3.xxxx * BoneMatrices[a0];
    r5 = r3.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r2.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r6.z = 3.0 * r1.x;
    a0 = xe_mova(r6.z);
    r4.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.w != 0.0);
    r0 = r3.yyyy * BoneMatrices[a0] + r0;
    r5 = r3.yyyy * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r2.w = r3.y * BoneMatrices[a0 + 2].w + r2.w;
    // UNHANDLED control flow: cjmp
    r6.z = 3.0 * r1.y;
    a0 = xe_mova(r6.z);
    r4.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.w != 0.0);
    r0 = r3.zzzz * BoneMatrices[a0] + r0;
    r5 = r3.zzzz * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r2.w = r3.z * BoneMatrices[a0 + 2].w + r2.w;
    if (p0)
    {
        if (p0)
        {
            r1.x = 3.0 * r1.z;
            a0 = xe_mova(r1.x);
            r0 = r3.wwww * BoneMatrices[a0] + r0;
            r5 = r3.wwww * BoneMatrices[a0 + 1] + r5;
            r4.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r2.w = r3.w * BoneMatrices[a0 + 2].w + r2.w;
        }
    }
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r4);
    r1.y = dot(r5.zxyw, r4);
    r0.x = dot(r2.zxyw, r3);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r0 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    o0.xy = r6.xy;
    o1 = r0.xywz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    return Out;
}
