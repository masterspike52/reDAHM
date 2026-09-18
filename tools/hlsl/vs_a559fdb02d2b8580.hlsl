// vs_a559fdb02d2b8580.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002AC 00210007 00000000 00000000 00002063 00000001 00000006 00000003 00000290 00100008 00002009 0000100A 0000500B 0001500C 0026500D 00003050 00013151 0002F256 00001035 00001036 00001037
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> BLENDINDICES0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> TEXCOORD1
//   vertex element: instruction 13 -> TEXCOORD6
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6

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
    float4 texcoord6 : TEXCOORD6;
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
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r4.xyz = In.position0.xyz;
    r1 = In.blendindices0.yzwx;
    r5 = In.blendweight0;
    r0.yz = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r2.xyz = In.texcoord6.xyz;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    r4.xyz = r4.xyz + r2.xyz;
    r2 = r5.xxxx * BoneMatrices[a0];
    r7 = r5.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    r4.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = 3.0 * r1.x;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.yyyy * BoneMatrices[a0] + r2;
    r7 = r5.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r4.w = r5.y * BoneMatrices[a0 + 2].w + r4.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.y;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.zzzz * BoneMatrices[a0] + r2;
    r7 = r5.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r4.w = r5.z * BoneMatrices[a0 + 2].w + r4.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r5.wwww * BoneMatrices[a0] + r2;
            r7 = r5.wwww * BoneMatrices[a0 + 1] + r7;
            r6.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r4.w = r5.w * BoneMatrices[a0 + 2].w + r4.w;
        }
    }
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r0.x = dot(r2.zxyw, r5);
    r0.w = dot(r7.zxyw, r5);
    r1.x = dot(r4.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r1 = r0.wwww * LocalToWorld[1].xzyw + r1.xzyw;
    r1 = r0.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r2 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r1.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    oPos = r1.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    o0.xy = r0.yz;
    o1.xy = r3.xy;
    o2 = r1.xywz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
