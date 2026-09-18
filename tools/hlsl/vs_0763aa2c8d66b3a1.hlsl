// vs_0763aa2c8d66b3a1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 465 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000744 0021000C 00000000 00000000 00003063 00000001 00000007 00000003 00000290 00100013 00006014 00003015 00002016 00001017 00265018 0007501B 0000F057 0001F1A0 0002F2A1 00001097 00001099 00001098
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> NORMAL0
//   vertex element: instruction 22 -> BLENDINDICES0
//   vertex element: instruction 23 -> BLENDWEIGHT0
//   vertex element: instruction 24 -> TEXCOORD6
//   vertex element: instruction 27 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 29

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
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r2.yzw = In.position0.zyx;
    r1.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r3 = In.blendindices0;
    r4 = In.blendweight0;
    r9.xyz = In.texcoord6.zyx;
    ps = r3.w;
    r2.x = r3.x;
    r1.w = ps;
    ps = r3.z;
    r0.w = r3.y;
    r0.z = ps;
    r3.xyz = In.texcoord7.xyz;
    r1.xyz = r1.zyx * 0.007843138 - 1.0;
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r5.xyz + r3.xyz;
    r0.x = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.x = dot(r3.ywz, r3.ywz);
    r5.xyz = r4.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r8.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r6.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r6.zxy, r1.xzy);
    r3.xyz = -r6.zyx * r3.xxx + r1.xyz;
    r1.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r1.x));
    r7.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    r3.xyz = r3.zyx * r1.xxx;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r6.zxy * r3.yzx;
    r1.xyz = r6.yzx * r3.zxy - r1.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r5.xyz = r4.www * BoneMatrices[a0].xyz + r5.xyz;
            r8.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r7.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r11.x = dot(r3.zxy, r5.zxy);
    r11.z = dot(r3.zxy, r7.zxy);
    ps = r2.w;
    r12.x = dot(r1.zxy, r7.zxy);
    ps = r9.z + ps;
    r12.y = dot(r1.zxy, r8.zxy);
    r10.x = ps;
    ps = r2.z;
    r12.z = dot(r1.zxy, r5.zxy);
    ps = r9.y + ps;
    r1.x = dot(r6.zxy, r8.zxy);
    r10.y = ps;
    ps = r2.y;
    r1.y = dot(r6.zxy, r5.zxy);
    ps = r9.x + ps;
    r1.z = dot(r6.zxy, r7.zxy);
    r10.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r11.w = dot(r3.zxy, r8.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r8 = r4.xxxx * BoneMatrices[a0 + 1];
    r7.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r11.w;
    r10.w = r4.x * BoneMatrices[a0 + 2].w;
    r11.y = ps;
    ps = 0.5 * r1.y;
    r5.xzw = r12.xxy * r1.xyy;
    r5.y = ps;
    r6.xyz = r11.xwz * 0.5 + 0.5;
    r5.xzw = r12.yzz * r1.zzx - r5.xzw;
    ps = 0.5 * r1.x;
    r0.x = dot(r11.xyz, r5.xzw);
    r5.z = ps;
    ps = 0.5 * r1.z;
    r5.x = r0.x * 0.5;
    r5.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r5.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r8 = r4.yyyy * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r10.w = r4.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r8 = r4.zzzz * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r10.w = r4.z * BoneMatrices[a0 + 2].w + r10.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r8 = r4.wwww * BoneMatrices[a0 + 1] + r8;
            r7.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r10.w = r4.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.x = dot(r3.zxyw, r11);
    r0.y = dot(r8.zxyw, r11);
    r1.x = dot(r10.zxyw, r7);
    r3 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r3 = r0.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    ps = 3.0 * r2.x;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r8.xyz = r2.wzy + r9.zyx;
    r2 = r4.xxxx * BoneMatrices[a0];
    r7 = r4.xxxx * BoneMatrices[a0 + 1];
    r1.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r7 = r4.yyyy * BoneMatrices[a0 + 1] + r7;
    r1.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r8.w = r4.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r7 = r4.zzzz * BoneMatrices[a0 + 1] + r7;
    r1.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r8.w = r4.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r1.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.wwww * BoneMatrices[a0] + r2;
    r7 = r4.wwww * BoneMatrices[a0 + 1] + r7;
    r1.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r8.w = r4.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r4);
    r1.y = dot(r7.zxyw, r4);
    r0.x = dot(r8.zxyw, r0);
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
    o0 = r3.xxxx * ShadowMatrix[0] + r0.xzyw;
    o2.xyz = r6.xyz;
    o2.w = 0.0;
    o1 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord7 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
