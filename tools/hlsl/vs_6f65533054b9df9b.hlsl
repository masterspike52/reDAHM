// vs_6f65533054b9df9b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 597 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000954 0041000E 00000000 00000000 000040A5 00000001 00000009 00000005 00000290 00100017 00006018 00003019 0000201A 0000101B 0000501C 0001501D 0006501E 0027501F 00003050 00013151 0002F256 0003F3A0 0004F4A1 000010C2 000010C3 000010C1 000010C5 000010C4
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> NORMAL0
//   vertex element: instruction 26 -> BLENDINDICES0
//   vertex element: instruction 27 -> BLENDWEIGHT0
//   vertex element: instruction 28 -> TEXCOORD0
//   vertex element: instruction 29 -> TEXCOORD1
//   vertex element: instruction 30 -> TEXCOORD6
//   vertex element: instruction 31 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r5.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r6.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r8 = In.blendweight0;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r0.yzw = In.texcoord6.xyz;
    r4.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.y;
    r5.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r4.xyz = r6.xyz + r4.xyz;
    r1.y = ps;
    r4.xyz = r4.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.x = dot(r4.xzy, r4.xzy);
    r6.xyz = r8.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = ps;
    r9.xyz = r4.zyx * r0.xxx;
    r0.x = dot(r9.zxy, r2.xzy);
    r2.xyz = -r9.zyx * r0.xxx + r2.xyz;
    r0.x = dot(r2.xzy, r2.xzy);
    ps = rsqrt(abs(r0.x));
    r7.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    r2.xyz = r2.zyx * r0.xxx;
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r9.zxy * r2.yzx;
    r4.xyz = r9.yzx * r2.zxy - r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r7.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r7.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r6.xyz = r8.www * BoneMatrices[a0].xyz + r6.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r7.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r11.x = dot(r2.zxy, r6.zxy);
    r11.z = dot(r2.zxy, r7.zxy);
    ps = r5.x;
    r12.x = dot(r4.zxy, r7.zxy);
    ps = r0.y + ps;
    r12.y = dot(r4.zxy, r10.zxy);
    r13.x = ps;
    ps = r5.y;
    r12.z = dot(r4.zxy, r6.zxy);
    ps = r0.z + ps;
    r0.x = dot(r9.zxy, r10.zxy);
    r13.y = ps;
    ps = r5.z;
    r0.y = dot(r9.zxy, r6.zxy);
    ps = r0.w + ps;
    r0.z = dot(r9.zxy, r7.zxy);
    r13.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r11.w = dot(r2.zxy, r10.zxy);
    r4 = r8.xxxx * BoneMatrices[a0];
    r7 = r8.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r11.w;
    r13.w = r8.x * BoneMatrices[a0 + 2].w;
    r11.y = ps;
    ps = 0.5 * r0.y;
    r2.xzw = r12.xxy * r0.xyy;
    r2.y = ps;
    r5.xyz = r11.xwz * 0.5 + 0.5;
    r2.xzw = r12.yzz * r0.zzx - r2.xzw;
    ps = 0.5 * r0.x;
    r0.w = dot(r11.xyz, r2.xzw);
    r2.z = ps;
    ps = 0.5 * r0.z;
    r2.x = r0.w * 0.5;
    r2.w = ps;
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r2.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r8.yyyy * BoneMatrices[a0] + r4;
    r7 = r8.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r13.w = r8.y * BoneMatrices[a0 + 2].w + r13.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r8.zzzz * BoneMatrices[a0] + r4;
    r7 = r8.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r13.w = r8.z * BoneMatrices[a0 + 2].w + r13.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r4 = r8.wwww * BoneMatrices[a0] + r4;
            r7 = r8.wwww * BoneMatrices[a0 + 1] + r7;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r13.w = r8.w * BoneMatrices[a0 + 2].w + r13.w;
        }
    }
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r13.zxyy : 1.0;
    r12 = r8.xxxx * BoneMatrices[a0];
    r10 = r8.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    r0.w = dot(r4.zxyw, r6);
    r6.x = dot(r7.zxyw, r6);
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.x = dot(r13.zxyw, r14);
    r4 = r4.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r4 = r6.xxxx * LocalToWorld[1].xzyw + r4.xzwy;
    r4 = r0.wwww * LocalToWorld[0].wzyx + r4.wyzx;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r6.x = ps;
    a0 = xe_mova(r6.x);
    ps = r6.x;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12 = r8.yyyy * BoneMatrices[a0] + r12;
    r10 = r8.yyyy * BoneMatrices[a0 + 1] + r10;
    r0.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r6.x = ps;
    a0 = xe_mova(r6.x);
    ps = r6.x;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12 = r8.zzzz * BoneMatrices[a0] + r12;
    r10 = r8.zzzz * BoneMatrices[a0 + 1] + r10;
    r0.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r12 = r8.wwww * BoneMatrices[a0] + r12;
            r10 = r8.wwww * BoneMatrices[a0 + 1] + r10;
            r0.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
            r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r11.z = r13.z;
    ps = r13.x;
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r11.x = ps;
    ps = r13.y;
    r7.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r11.y = ps;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r0.w = dot(r12.zxyw, r13);
    r6.w = dot(r10.zxyw, r13);
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = dot(r11.zxyw, r14);
    r10 = r7.wwww * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r10 = r6.wwww * PreviousLocalToWorld[1].xzyw + r10;
    r10 = r0.wwww * PreviousLocalToWorld[0] + r10.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r8.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r7.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r8.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r7.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r8.www * BoneMatrices[a0].xyz + r0.xyz;
            r7.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r1.xyz = r4.yzw - r10.zyx;
    r0.w = dot(r9.zxy, r0.zxy);
    r1.w = dot(r9.zxy, r7.zxy);
    r0.x = dot(r9.zxy, r6.zxy);
    r0.xyz = r0.xxx * LocalToWorld[2].xzy;
    r0.xyz = r1.www * LocalToWorld[1].xzy + r0.xyz;
    r0.xyz = r0.www * LocalToWorld[0].xyz + r0.xzy;
    r0.x = dot(r0.zxy, r1.xzy);
    p0 = (r0.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r0.xyz = r10.www * PrevViewProjectionMatrix[3].xyw;
        r1 = r4.xxxx * ViewProjectionMatrix[3].xwzy;
        r1 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    }
    if (p0)
    {
        if (p0)
        {
            r0.xyz = r10.zzz * PrevViewProjectionMatrix[2].xyw + r0.xyz;
            r0.xyz = r10.yyy * PrevViewProjectionMatrix[1].xyw + r0.xyz;
            r1 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
            r1 = r4.wwww * ViewProjectionMatrix[0] + r1.xzyw;
            r0.xyz = r10.xxx * PrevViewProjectionMatrix[0].wxy + r0.zxy;
            ps = 1.0 / r0.x;
            r0.x = ps;
        }
    }
    if (p0)
    {
        ps = 1.0 / r1.w;
        r0.xy = r0.yz * r0.xx;
        r0.z = ps;
        r0.xy = r1.xy * r0.zz - r0.xy;
    }
    if (!p0)
    {
        r0.xy = float2((-abs(r0.xx) > 0.0));
        r4 = -r1.xxyz * StretchTimeScale.wxxx + r4;
        r1 = r4.xxxx * ViewProjectionMatrix[3].xwyz;
        r1 = r4.yyyy * ViewProjectionMatrix[2].xwyz + r1;
    }
    if (!p0)
    {
        if (!p0)
        {
            r1 = r4.zzzz * ViewProjectionMatrix[1].xwyz + r1;
            r1 = r4.wwww * ViewProjectionMatrix[0] + r1.xzwy;
        }
    }
    r1.z = r1.w * StretchTimeScale.y + r1.z;
    oPos = r1;
    o2.xy = r0.xy;
    o2.zw = 0.0;
    o0.xy = r3.zw;
    o1.xy = r3.xy;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o3 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
