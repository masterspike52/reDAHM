// vs_1a09b7707741ef29.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 441 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006E4 0031000B 00000000 00000000 00003884 00000001 00000007 00000004 00000290 00100013 00006014 00007015 00003016 00002017 00001018 00205019 00003050 0001F157 0002F2A0 0003F3A1 0000108F 0000108E 00001091 00001090
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> BLENDINDICES0
//   vertex element: instruction 24 -> BLENDWEIGHT0
//   vertex element: instruction 25 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 r11 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r8.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r5 = In.blendweight0;
    r7.xy = In.texcoord0.xy;
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.xyz = r0.yzw * 0.007843138 - 1.0;
    r4.xyz = r3.xyz * 0.007843138 - 1.0;
    r0.w = r1.y * 3.0;
    a0 = xe_mova(r0.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r3.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r4.w != 0.0);
    r6.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.x;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r5.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r9.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.z;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r5.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r9.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r2.w = 3.0 * r1.w;
            a0 = xe_mova(r2.w);
            r3.xyz = r5.www * BoneMatrices[a0].xyz + r3.xyz;
            r9.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r6.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r10.x = dot(r2.zxy, r3.zxy);
    r10.z = dot(r2.zxy, r6.zxy);
    r11.x = dot(r0.zxy, r6.zxy);
    r11.y = dot(r0.zxy, r9.zxy);
    r11.z = dot(r0.zxy, r3.zxy);
    r0.x = dot(r4.zxy, r9.zxy);
    r0.y = dot(r4.zxy, r3.zxy);
    r0.z = dot(r4.zxy, r6.zxy);
    a0 = xe_mova(r0.w);
    r10.w = dot(r2.zxy, r9.zxy);
    r2 = r5.xxxx * BoneMatrices[a0];
    r9 = r5.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r8.w = r5.x * BoneMatrices[a0 + 2].w;
    r10.y = -r10.w;
    r3.xzw = r11.xxy * r0.xyy;
    r3.y = 0.5 * r0.y;
    r4.xyz = r10.xwz * 0.5 + 0.5;
    r3.xzw = r11.yzz * r0.zzx - r3.xzw;
    ps = 0.5 * r0.x;
    r0.w = dot(r10.xyz, r3.xzw);
    r3.z = ps;
    ps = 0.5 * r0.z;
    r3.x = r0.w * 0.5;
    r3.w = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r3.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.yyyy * BoneMatrices[a0] + r2;
    r9 = r5.yyyy * BoneMatrices[a0 + 1] + r9;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r5.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r5.zzzz * BoneMatrices[a0] + r2;
    r9 = r5.zzzz * BoneMatrices[a0 + 1] + r9;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r5.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r5.wwww * BoneMatrices[a0] + r2;
            r9 = r5.wwww * BoneMatrices[a0 + 1] + r9;
            r6.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r8.w = r5.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r2.x = dot(r2.zxyw, r6);
    r2.y = dot(r9.zxyw, r6);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r9 = r5.xxxx * BoneMatrices[a0];
    r6 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r5.yyyy * BoneMatrices[a0] + r9;
    r6 = r5.yyyy * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r5.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r5.zzzz * BoneMatrices[a0] + r9;
    r6 = r5.zzzz * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r5.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r5.wwww * BoneMatrices[a0] + r9;
    r6 = r5.wwww * BoneMatrices[a0 + 1] + r6;
    r0.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r8.w = r5.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r9.zxyw, r5);
    r1.y = dot(r6.zxyw, r5);
    r0.x = dot(r8.zxyw, r0);
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
    o1 = r2.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r7.xy;
    o3.xyz = r4.xyz;
    o3.w = 0.0;
    o2 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
