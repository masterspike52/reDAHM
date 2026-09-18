// vs_2fa50e652ffdf07c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 573 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008F4 0041000E 00000000 00000000 000040A5 00000001 00000008 00000005 00000290 00100017 00006018 00007019 0000301A 0000201B 0000101C 0000501D 0021501E 00003050 00013151 0002F256 0003F3A0 0004F4A1 000010BA 000010BB 000010B9 000010BD 000010BC
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   vertex element: instruction 29 -> TEXCOORD0
//   vertex element: instruction 30 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 33

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
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
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

    r8.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r9 = In.blendweight0;
    r4.zw = In.texcoord0.xy;
    r4.xy = In.texcoord1.xy;
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.xyz = r0.yzw * 0.007843138 - 1.0;
    r10.xyz = r3.xyz * 0.007843138 - 1.0;
    r0.w = r1.y * 3.0;
    a0 = xe_mova(r0.w);
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r3.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r6.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r1.y != 0.0);
    r5.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.x;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r9.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r6.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.z;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r9.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r6.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r5.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    if (p0)
    {
        if (p0)
        {
            r2.w = 3.0 * r1.w;
            a0 = xe_mova(r2.w);
            r3.xyz = r9.www * BoneMatrices[a0].xyz + r3.xyz;
            r6.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r5.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r11.x = dot(r2.zxy, r3.zxy);
    r11.z = dot(r2.zxy, r5.zxy);
    r12.x = dot(r0.zxy, r5.zxy);
    r12.y = dot(r0.zxy, r6.zxy);
    r12.z = dot(r0.zxy, r3.zxy);
    r0.x = dot(r10.zxy, r6.zxy);
    r0.y = dot(r10.zxy, r3.zxy);
    r0.z = dot(r10.zxy, r5.zxy);
    a0 = xe_mova(r0.w);
    r11.w = dot(r2.zxy, r6.zxy);
    r2 = r9.xxxx * BoneMatrices[a0];
    r7 = r9.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r8.w = r9.x * BoneMatrices[a0 + 2].w;
    r11.y = -r11.w;
    r3.xzw = r12.xxy * r0.xyy;
    r3.y = 0.5 * r0.y;
    r5.xyz = r11.xwz * 0.5 + 0.5;
    r3.xzw = r12.yzz * r0.zzx - r3.xzw;
    r3.x = dot(r11.xyz, r3.xzw);
    r3.z = 0.5 * r0.x;
    r3.x = r3.x * 0.5;
    r3.w = 0.5 * r0.z;
    p0 = (r1.y != 0.0);
    r3 = r3.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    r0.y = 3.0 * r1.x;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.yyyy * BoneMatrices[a0] + r2;
    r7 = r9.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r9.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.zzzz * BoneMatrices[a0] + r2;
    r7 = r9.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r9.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r9.wwww * BoneMatrices[a0] + r2;
            r7 = r9.wwww * BoneMatrices[a0 + 1] + r7;
            r6.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r8.w = r9.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r13 = r9.xxxx * BoneMatrices[a0];
    r11 = r9.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r12.w = r9.x * BoneMatrices[a0 + 2].w;
    r5.w = dot(r2.zxyw, r6);
    r6.x = dot(r7.zxyw, r6);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.x = dot(r8.zxyw, r14);
    r2 = r2.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r2 = r6.xxxx * LocalToWorld[1].xzyw + r2.xzwy;
    r6 = r5.wwww * LocalToWorld[0].wzyx + r2.wyzx;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13 = r9.yyyy * BoneMatrices[a0] + r13;
    r11 = r9.yyyy * BoneMatrices[a0 + 1] + r11;
    r0.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r9.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13 = r9.zzzz * BoneMatrices[a0] + r13;
    r11 = r9.zzzz * BoneMatrices[a0 + 1] + r11;
    r0.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r9.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r13 = r9.wwww * BoneMatrices[a0] + r13;
            r11 = r9.wwww * BoneMatrices[a0 + 1] + r11;
            r0.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
            r12.w = r9.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r12.z = r8.z;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    ps = r8.x;
    r7.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r12.x = ps;
    ps = r8.y;
    r8.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r12.y = ps;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r2.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r2.w = dot(r13.zxyw, r14);
    r5.w = dot(r11.zxyw, r14);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = dot(r12.zxyw, r0);
    r0 = r0.xxxx * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r0 = r5.wwww * PreviousLocalToWorld[1].xzyw + r0;
    r11 = r2.wwww * PreviousLocalToWorld[0] + r0.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r9.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r8.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r9.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r8.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r8.xyz;
    r7.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r9.www * BoneMatrices[a0].xyz + r2.xyz;
            r8.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r8.xyz;
            r7.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r0.xyz = r6.yzw - r11.zyx;
    r0.w = dot(r10.zxy, r2.zxy);
    r1.w = dot(r10.zxy, r8.zxy);
    r1.x = dot(r10.zxy, r7.zxy);
    r1.xyz = r1.xxx * LocalToWorld[2].xzy;
    r1.xyz = r1.www * LocalToWorld[1].xzy + r1.xyz;
    r1.xyz = r0.www * LocalToWorld[0].xyz + r1.xzy;
    r0.w = dot(r1.zxy, r0.xzy);
    p0 = (r0.w >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r1.xyz = r11.www * PrevViewProjectionMatrix[3].xyw;
        r0 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
        r0 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    }
    if (p0)
    {
        if (p0)
        {
            r1.xyz = r11.zzz * PrevViewProjectionMatrix[2].xyw + r1.xyz;
            r1.xyz = r11.yyy * PrevViewProjectionMatrix[1].xyw + r1.xyz;
            r0 = r6.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
            r0 = r6.wwww * ViewProjectionMatrix[0] + r0.xzyw;
            r1.xyz = r11.xxx * PrevViewProjectionMatrix[0].wxy + r1.zxy;
            ps = 1.0 / r1.x;
            r1.x = ps;
        }
    }
    if (p0)
    {
        ps = 1.0 / r0.w;
        r1.xy = r1.yz * r1.xx;
        r1.z = ps;
        r1.xy = r0.xy * r1.zz - r1.xy;
    }
    if (!p0)
    {
        r1.xy = float2((-abs(r0.xx) > 0.0));
        r2 = -r0.xxyz * StretchTimeScale.wxxx + r6;
        r0 = r2.xxxx * ViewProjectionMatrix[3].xwyz;
        r0 = r2.yyyy * ViewProjectionMatrix[2].xwyz + r0;
    }
    if (!p0)
    {
        if (!p0)
        {
            r0 = r2.zzzz * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r2.wwww * ViewProjectionMatrix[0] + r0.xzwy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o2.xy = r1.xy;
    o2.zw = 0.0;
    o0.xy = r4.zw;
    o1.xy = r4.xy;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o3 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
