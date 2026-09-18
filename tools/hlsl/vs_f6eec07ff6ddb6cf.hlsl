// vs_f6eec07ff6ddb6cf.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 432 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006C0 0021000A 00000000 00000000 00003063 00000001 00000006 00000003 00000290 00100012 00006013 00007014 00003015 00002016 00201017 0000F057 0001F1A0 0002F2A1 0000108C 0000108E 0000108D
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> BINORMAL0
//   vertex element: instruction 21 -> NORMAL0
//   vertex element: instruction 22 -> BLENDINDICES0
//   vertex element: instruction 23 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 28

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c10); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ProjectionMatrix[4] : register(c239); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c235); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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

    r7.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r5 = In.blendweight0;
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.xyz = r0.yzw * 0.007843138 - 1.0;
    r4.yzw = r3.xyz * 0.007843138 - 1.0;
    r0.w = r1.y * 3.0;
    a0 = xe_mova(r0.w);
    r4.x = float((MaxBoneInfluences.x > 1.0));
    r3.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r8.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r4.x != 0.0);
    r6.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.x;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r5.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r8.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.z;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r5.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r8.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r2.w = 3.0 * r1.w;
            a0 = xe_mova(r2.w);
            r3.xyz = r5.www * BoneMatrices[a0].xyz + r3.xyz;
            r8.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r6.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r9.x = dot(r2.zxy, r3.zxy);
    r9.z = dot(r2.zxy, r6.zxy);
    r10.x = dot(r0.zxy, r6.zxy);
    r10.y = dot(r0.zxy, r8.zxy);
    r10.z = dot(r0.zxy, r3.zxy);
    r0.x = dot(r4.wyz, r8.zxy);
    r0.y = dot(r4.wyz, r3.zxy);
    r0.z = dot(r4.wyz, r6.zxy);
    a0 = xe_mova(r0.w);
    r9.w = dot(r2.zxy, r8.zxy);
    r2 = r5.xxxx * BoneMatrices[a0];
    r8 = r5.xxxx * BoneMatrices[a0 + 1];
    r4.yzw = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r7.w = r5.x * BoneMatrices[a0 + 2].w;
    r9.y = -r9.w;
    r3.xyz = r10.xxy * r0.xyy;
    r3.w = 0.5 * r0.x;
    r6.xyz = r9.xwz * 0.5 + 0.5;
    r3.xyz = r10.yzz * r0.zzx - r3.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r9.xyz, r3.xyz);
    r3.y = ps;
    ps = 0.5 * r0.z;
    r3.x = r0.w * 0.5;
    r3.z = ps;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r3.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.yyyy * BoneMatrices[a0] + r2;
    r8 = r5.yyyy * BoneMatrices[a0 + 1] + r8;
    r4.yzw = r5.yyy * BoneMatrices[a0 + 2].xyz + r4.yzw;
    r7.w = r5.y * BoneMatrices[a0 + 2].w + r7.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.zzzz * BoneMatrices[a0] + r2;
    r8 = r5.zzzz * BoneMatrices[a0 + 1] + r8;
    r4.yzw = r5.zzz * BoneMatrices[a0 + 2].xyz + r4.yzw;
    r7.w = r5.z * BoneMatrices[a0 + 2].w + r7.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r5.wwww * BoneMatrices[a0] + r2;
            r8 = r5.wwww * BoneMatrices[a0 + 1] + r8;
            r4.yzw = r5.www * BoneMatrices[a0 + 2].xyz + r4.yzw;
            r7.w = r5.w * BoneMatrices[a0 + 2].w + r7.w;
        }
    }
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.wyzz : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r2.x = dot(r2.zxyw, r4);
    r2.y = dot(r8.zxyw, r4);
    r0.x = dot(r7.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r8 = r5.xxxx * BoneMatrices[a0];
    r4 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r5.yyyy * BoneMatrices[a0] + r8;
    r4 = r5.yyyy * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r5.y * BoneMatrices[a0 + 2].w + r7.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r5.zzzz * BoneMatrices[a0] + r8;
    r4 = r5.zzzz * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r5.z * BoneMatrices[a0 + 2].w + r7.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r8 = r5.wwww * BoneMatrices[a0] + r8;
    r4 = r5.wwww * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r5.w * BoneMatrices[a0 + 2].w + r7.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r1.x = dot(r8.zxyw, r5);
    r1.y = dot(r4.zxyw, r5);
    r0.x = dot(r7.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r2.zzzz * ShadowMatrix[3].xwzy;
    r0 = r2.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o0 = r2.xxxx * ShadowMatrix[0] + r0.xzyw;
    o2.xyz = r6.xyz;
    o2.w = 0.0;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
