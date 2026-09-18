// vs_f2caf36909b8e607.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 561 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008C4 0021000D 00000000 00000000 00003063 00000001 00000006 00000003 00000290 00100017 00006018 00007019 0000301A 0000201B 0020101C 0000F056 0001F1A0 0002F2A1 000010B7 000010B9 000010B8
//   vertex element: instruction 23 -> POSITION0
//   vertex element: instruction 24 -> TANGENT0
//   vertex element: instruction 25 -> BINORMAL0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 28 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r12.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r2.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.xyz = r0.yzw * 0.007843138 - 1.0;
    r8.xyz = r3.xyz * 0.007843138 - 1.0;
    r1.y = r1.y * 3.0;
    a0 = xe_mova(r1.y);
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r3.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r5.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r0.w != 0.0);
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.x;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r7.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r5.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    r3.w = 3.0 * r1.z;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    r3.xyz = r7.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r5.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            r2.w = 3.0 * r1.w;
            a0 = xe_mova(r2.w);
            r3.xyz = r7.www * BoneMatrices[a0].xyz + r3.xyz;
            r5.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r9.x = dot(r2.zxy, r3.zxy);
    r9.z = dot(r2.zxy, r4.zxy);
    r10.x = dot(r0.zxy, r4.zxy);
    r10.y = dot(r0.zxy, r5.zxy);
    r10.z = dot(r0.zxy, r3.zxy);
    r0.x = dot(r8.zxy, r5.zxy);
    r0.y = dot(r8.zxy, r3.zxy);
    r0.z = dot(r8.zxy, r4.zxy);
    a0 = xe_mova(r1.y);
    r9.w = dot(r2.zxy, r5.zxy);
    r3 = r7.xxxx * BoneMatrices[a0];
    r6 = r7.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r12.w = r7.x * BoneMatrices[a0 + 2].w;
    r9.y = -r9.w;
    r4.xyz = r10.xxy * r0.xyy;
    r4.w = 0.5 * r0.x;
    r2.xyz = r9.xwz * 0.5 + 0.5;
    r4.xyz = r10.yzz * r0.zzx - r4.xyz;
    r2.w = dot(r9.xyz, r4.xyz);
    r4.y = 0.5 * r0.y;
    r4.x = r2.w * 0.5;
    r4.z = 0.5 * r0.z;
    p0 = (r0.w != 0.0);
    r4 = r4.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    r0.y = 3.0 * r1.x;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.yyyy * BoneMatrices[a0] + r3;
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
    r3 = r7.zzzz * BoneMatrices[a0] + r3;
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
            r3 = r7.wwww * BoneMatrices[a0] + r3;
            r6 = r7.wwww * BoneMatrices[a0 + 1] + r6;
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r12.w = r7.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r11 = r7.xxxx * BoneMatrices[a0];
    r9 = r7.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.w = r7.x * BoneMatrices[a0 + 2].w;
    r2.w = dot(r3.zxyw, r5);
    r5.x = dot(r6.zxyw, r5);
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.x = dot(r12.zxyw, r13);
    r3 = r3.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r3 = r5.xxxx * LocalToWorld[1].xzyw + r3.xzwy;
    r3 = r2.wwww * LocalToWorld[0] + r3.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.x = ps;
    a0 = xe_mova(r5.x);
    ps = r5.x;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r7.yyyy * BoneMatrices[a0] + r11;
    r9 = r7.yyyy * BoneMatrices[a0 + 1] + r9;
    r0.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r10.w = r7.y * BoneMatrices[a0 + 2].w + r10.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r5.x = ps;
    a0 = xe_mova(r5.x);
    ps = r5.x;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
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
            r2.w = ps;
            a0 = xe_mova(r2.w);
            ps = r2.w;
            r11 = r7.wwww * BoneMatrices[a0] + r11;
            r9 = r7.wwww * BoneMatrices[a0 + 1] + r9;
            r0.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
            r10.w = r7.w * BoneMatrices[a0 + 2].w + r10.w;
        }
    }
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r10.z = r12.z;
    ps = r12.x;
    r5.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r10.x = ps;
    ps = r12.y;
    r6.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r10.y = ps;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r0.xyz = r7.xxx * BoneMatrices[a0].xyz;
    r2.w = dot(r11.zxyw, r12);
    r5.w = dot(r9.zxyw, r12);
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = dot(r10.zxyw, r13);
    r9 = r6.wwww * PreviousLocalToWorld[2].xzyw + PreviousLocalToWorld[3].xzyw;
    r9 = r5.wwww * PreviousLocalToWorld[1].xzyw + r9;
    r9 = r2.wwww * PreviousLocalToWorld[0] + r9.xzyw;
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
    r5.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
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
    r5.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
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
            r5.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
        }
    }
    r1.xyz = r3.xyz - r9.xyz;
    r0.w = dot(r8.zxy, r0.zxy);
    r1.w = dot(r8.zxy, r6.zxy);
    r0.x = dot(r8.zxy, r5.zxy);
    r0.xyz = r0.xxx * LocalToWorld[2].xzy;
    r0.xyz = r1.www * LocalToWorld[1].xzy + r0.xyz;
    r0.xyz = r0.www * LocalToWorld[0].xyz + r0.xzy;
    r0.x = dot(r0.zxy, r1.zxy);
    p0 = (r0.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r0.xyz = r9.www * PrevViewProjectionMatrix[3].xyw;
        r1 = r3.wwww * ViewProjectionMatrix[3].xwzy;
        r1 = r3.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    }
    if (p0)
    {
        if (p0)
        {
            r0.xyz = r9.zzz * PrevViewProjectionMatrix[2].xyw + r0.xyz;
            r0.xyz = r9.yyy * PrevViewProjectionMatrix[1].xyw + r0.xyz;
            r1 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
            r1 = r3.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
            r0.xyz = r9.xxx * PrevViewProjectionMatrix[0].wxy + r0.zxy;
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
        r3 = -r1.xyzz * StretchTimeScale.xxxw + r3;
        r1 = r3.wwww * ViewProjectionMatrix[3].xwyz;
        r1 = r3.zzzz * ViewProjectionMatrix[2].xwyz + r1;
    }
    if (!p0)
    {
        if (!p0)
        {
            r1 = r3.yyyy * ViewProjectionMatrix[1].xwyz + r1;
            r1 = r3.xxxx * ViewProjectionMatrix[0] + r1.xzwy;
        }
    }
    r1.z = r1.w * StretchTimeScale.y + r1.z;
    oPos = r1;
    o0.xy = r0.xy;
    o0.zw = 0.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    return Out;
}
