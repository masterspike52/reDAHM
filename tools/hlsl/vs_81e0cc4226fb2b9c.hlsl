// vs_81e0cc4226fb2b9c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 585 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000924 0021000E 00000000 00000000 00003063 00000001 00000007 00000003 00000290 00100017 00006018 00003019 0000201A 0000101B 0006501C 0027501D 0000F056 0001F1A0 0002F2A1 000010BF 000010C1 000010C0
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> NORMAL0
//   vertex element: instruction 26 -> BLENDINDICES0
//   vertex element: instruction 27 -> BLENDWEIGHT0
//   vertex element: instruction 28 -> TEXCOORD6
//   vertex element: instruction 29 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
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
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 34

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c14); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 PrevViewProjectionMatrix[4] : register(c239); // float4x4 (matrix_columns)
float4 PreviousLocalToWorld[4] : register(c10); // float4x4 (matrix_columns)
float4 StretchTimeScale : register(c243); // float4 // default: 1.0, 0.0, 0.0, 0.0
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 texcoord6 : TEXCOORD6;
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r5.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r4.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r3.xyz = In.texcoord6.xyz;
    r0.yzw = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.y;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r4.xyz = r4.zyx + r0.wzy;
    r0.w = ps;
    r6.xyz = r4.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.x = dot(r6.xzy, r6.xzy);
    r4.xyz = r7.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = ps;
    r8.xyz = r6.zyx * r0.xxx;
    r0.x = dot(r8.zxy, r2.xzy);
    r2.xyz = -r8.zyx * r0.xxx + r2.xyz;
    r0.x = dot(r2.xzy, r2.xzy);
    ps = rsqrt(abs(r0.x));
    r6.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    r2.xyz = r2.zyx * r0.xxx;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r8.zxy * r2.yzx;
    r0.xyz = r8.yzx * r2.zxy - r0.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r7.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r7.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r4.xyz = r7.www * BoneMatrices[a0].xyz + r4.xyz;
            r9.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r6.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r10.x = dot(r2.zxy, r4.zxy);
    r10.z = dot(r2.zxy, r6.zxy);
    ps = r5.x;
    r11.x = dot(r0.zxy, r6.zxy);
    ps = r3.x + ps;
    r11.y = dot(r0.zxy, r9.zxy);
    r12.x = ps;
    ps = r5.y;
    r11.z = dot(r0.zxy, r4.zxy);
    ps = r3.y + ps;
    r0.x = dot(r8.zxy, r9.zxy);
    r12.y = ps;
    ps = r5.z;
    r0.y = dot(r8.zxy, r4.zxy);
    ps = r3.z + ps;
    r0.z = dot(r8.zxy, r6.zxy);
    r12.z = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10.w = dot(r2.zxy, r9.zxy);
    r4 = r7.xxxx * BoneMatrices[a0];
    r6 = r7.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r10.w;
    r12.w = r7.x * BoneMatrices[a0 + 2].w;
    r10.y = ps;
    ps = 0.5 * r0.x;
    r3.xyz = r11.xxy * r0.xyy;
    r3.w = ps;
    r2.xyz = r10.xwz * 0.5 + 0.5;
    r3.xyz = r11.yzz * r0.zzx - r3.xyz;
    ps = 0.5 * r0.y;
    r3.x = dot(r10.xyz, r3.xyz);
    r3.y = ps;
    ps = 0.5 * r0.z;
    r3.x = r3.x * 0.5;
    r3.z = ps;
    p0 = (r2.w != 0.0);
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
    r4 = r7.yyyy * BoneMatrices[a0] + r4;
    r6 = r7.yyyy * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r7.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r7.zzzz * BoneMatrices[a0] + r4;
    r6 = r7.zzzz * BoneMatrices[a0 + 1] + r6;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r7.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r4 = r7.wwww * BoneMatrices[a0] + r4;
            r6 = r7.wwww * BoneMatrices[a0 + 1] + r6;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r12.w = r7.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r11 = r7.xxxx * BoneMatrices[a0];
    r9 = r7.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    r5.x = dot(r4.zxyw, r14);
    r5.y = dot(r6.zxyw, r14);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.x = dot(r12.zxyw, r13);
    r4 = r4.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r4 = r5.yyyy * LocalToWorld[1].xzyw + r4.xzwy;
    r5 = r5.xxxx * LocalToWorld[0] + r4.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.y = ps;
    a0 = xe_mova(r4.y);
    ps = r4.y;
    r4.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r7.yyyy * BoneMatrices[a0] + r11;
    r9 = r7.yyyy * BoneMatrices[a0 + 1] + r9;
    r0.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.y = ps;
    a0 = xe_mova(r4.y);
    ps = r4.y;
    r4.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r7.zzzz * BoneMatrices[a0] + r11;
    r9 = r7.zzzz * BoneMatrices[a0 + 1] + r9;
    r0.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r10.w = r7.z * BoneMatrices[a0 + 2].w + r10.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r4.x = ps;
            a0 = xe_mova(r4.x);
            ps = r4.x;
            r11 = r7.wwww * BoneMatrices[a0] + r11;
            r9 = r7.wwww * BoneMatrices[a0 + 1] + r9;
            r0.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
            r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10.z = r12.z;
    ps = r12.x;
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.x = ps;
    ps = r12.y;
    r6.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r10.y = ps;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r0.w = dot(r11.zxyw, r12);
    r4.w = dot(r9.zxyw, r12);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = dot(r10.zxyw, r13);
    r9 = r6.wwww * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r9 = r4.wwww * PreviousLocalToWorld[1].xzyw + r9;
    r9 = r0.wwww * PreviousLocalToWorld[0] + r9.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r7.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r6.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r7.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r6.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r7.www * BoneMatrices[a0].xyz + r0.xyz;
            r6.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r1.xyz = r5.xyz - r9.xyz;
    r0.w = dot(r8.zxy, r0.zxy);
    r1.w = dot(r8.zxy, r6.zxy);
    r0.x = dot(r8.zxy, r4.zxy);
    r0.xyz = r0.xxx * LocalToWorld[2].xzy;
    r0.xyz = r1.www * LocalToWorld[1].xzy + r0.xyz;
    r0.xyz = r0.www * LocalToWorld[0].xyz + r0.xzy;
    r0.x = dot(r0.zxy, r1.zxy);
    p0 = (r0.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r1.xyz = r9.www * PrevViewProjectionMatrix[3].xyw;
        r0 = r5.wwww * ViewProjectionMatrix[3].xwzy;
        r0 = r5.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    }
    if (p0)
    {
        if (p0)
        {
            r1.xyz = r9.zzz * PrevViewProjectionMatrix[2].xyw + r1.xyz;
            r1.xyz = r9.yyy * PrevViewProjectionMatrix[1].xyw + r1.xyz;
            r0 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
            r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
            r1.xyz = r9.xxx * PrevViewProjectionMatrix[0].wxy + r1.zxy;
            ps = 1.0 / r1.x;
            r1.x = ps;
        }
    }
    if (p0)
    {
        ps = 1.0 / r0.w;
        r1.xy = r1.yz * r1.xx;
        r1.z = ps;
        r4.xy = r0.xy * r1.zz - r1.xy;
    }
    if (!p0)
    {
        r4.xy = float2((-abs(r0.xx) > 0.0));
        r1 = -r1.xyzz * StretchTimeScale.xxxw + r5;
        r0 = r1.wwww * ViewProjectionMatrix[3].xwyz;
        r0 = r1.zzzz * ViewProjectionMatrix[2].xwyz + r0;
    }
    if (!p0)
    {
        if (!p0)
        {
            r0 = r1.yyyy * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzwy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o0.xy = r4.xy;
    o0.zw = 0.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
