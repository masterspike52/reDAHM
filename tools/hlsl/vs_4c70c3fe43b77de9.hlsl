// vs_4c70c3fe43b77de9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 609 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000984 00510011 00000000 00000000 00004CC6 00000001 00000009 00000006 00000290 00100018 00006019 0000301A 0020201B 0010101D 0000501E 0001501F 00265020 00075022 00003050 00013151 0002F255 00037356 0004F4A0 0005F5A1 000010C4 000010C5 000010C9 000010C7 000010C8 000010C6
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD1
//   vertex element: instruction 32 -> TEXCOORD6
//   vertex element: instruction 34 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled control flow cjmp at cf 39

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c10); // float3x3 (matrix_columns)

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
    float4 texcoord5 : TEXCOORD5;
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r11.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r4.xyz = In.normal0.xyz;
    r1 = In.blendindices0;
    ps = r1.y;
    r0.w = ps;
    r5 = In.blendweight0;
    r2.yw = In.texcoord0.xy;
    r10.xy = In.texcoord1.xy;
    r8.xyz = In.texcoord6.xyz;
    ps = r1.z;
    r2.x = r1.x;
    r0.z = ps;
    r1.xyz = In.texcoord7.xyz;
    r3.xyz = r3.zyx * 0.007843138 - 1.0;
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r1.xyz = r4.xyz + r1.xyz;
    r0.x = ps;
    r4.xyz = r1.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1.x = dot(r4.xzy, r4.xzy);
    ps = r1.w;
    r1.yzw = r5.xxx * BoneMatrices[a0].xyz;
    r2.z = ps;
    ps = rsqrt(abs(r1.x));
    r6.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = ps;
    r14.xyz = r4.zyx * r1.xxx;
    r1.x = dot(r14.zxy, r3.xzy);
    r3.xyz = -r14.zyx * r1.xxx + r3.xyz;
    r1.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r1.x));
    r4.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    r16.xyz = r3.zyx * r1.xxx;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r14.zxy * r16.yzx;
    r3.xyz = r14.yzx * r16.zxy - r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yzw = r5.yyy * BoneMatrices[a0].xyz + r1.yzw;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yzw = r5.zzz * BoneMatrices[a0].xyz + r1.yzw;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r4.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r1.yzw = r5.www * BoneMatrices[a0].xyz + r1.yzw;
            r6.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r4.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
        }
    }
    r13.x = dot(r16.zxy, r1.wyz);
    r13.z = dot(r16.zxy, r4.zxy);
    ps = r11.x;
    r17.x = dot(r3.zxy, r4.zxy);
    ps = r8.x + ps;
    r17.y = dot(r3.zxy, r6.zxy);
    r12.x = ps;
    ps = r11.y;
    r17.z = dot(r3.zxy, r1.wyz);
    ps = r8.y + ps;
    r1.x = dot(r14.zxy, r6.zxy);
    r12.y = ps;
    ps = r11.z;
    r1.y = dot(r14.zxy, r1.wyz);
    ps = r8.z + ps;
    r1.z = dot(r14.zxy, r4.zxy);
    r12.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r13.w = dot(r16.zxy, r6.zxy);
    r4 = r5.xxxx * BoneMatrices[a0];
    r15 = r5.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r13.w;
    r12.w = r5.x * BoneMatrices[a0 + 2].w;
    r13.y = ps;
    ps = 0.5 * r1.x;
    r9.xyz = r17.xxy * r1.xyy;
    r9.w = ps;
    r7.xyz = r13.xwz * 0.5 + 0.5;
    r9.xyz = r17.yzz * r1.zzx - r9.xyz;
    ps = 0.5 * r1.y;
    r1.w = dot(r13.xyz, r9.xyz);
    r9.y = ps;
    ps = 0.5 * r1.z;
    r9.x = r1.w * 0.5;
    r9.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9 = r9.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r5.yyyy * BoneMatrices[a0] + r4;
    r15 = r5.yyyy * BoneMatrices[a0 + 1] + r15;
    r6.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r12.w = r5.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r5.zzzz * BoneMatrices[a0] + r4;
    r15 = r5.zzzz * BoneMatrices[a0 + 1] + r15;
    r6.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r12.w = r5.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r4 = r5.wwww * BoneMatrices[a0] + r4;
            r15 = r5.wwww * BoneMatrices[a0 + 1] + r15;
            r6.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r12.w = r5.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1.x = dot(r12.zxyw, r1);
    r6.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r12.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = dot(r4.zxyw, r17);
    r3.w = dot(r15.zxyw, r17);
    r1 = r1.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r1 = r3.wwww * LocalToWorld[1].xzyw + r1.xzyw;
    r15 = r0.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r1.xyw = -r15.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r15.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r15.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r15.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r15.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r5.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r13.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r5.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r13.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r6.xyz = r5.www * BoneMatrices[a0].xyz + r6.xyz;
            r13.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r12.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
        }
    }
    r0.x = dot(r14.zxy, r6.zxy);
    r0.y = dot(r14.zxy, r13.zxy);
    r10.z = dot(r3.zxy, r6.zxy);
    r10.w = dot(r3.zxy, r12.zxy);
    r15.x = dot(r3.zxy, r13.zxy);
    r15.y = dot(r14.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r6.x = dot(r16.zxy, r6.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r6.y = dot(r16.zxy, r13.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r6.z = dot(r16.zxy, r12.zxy);
    r3.z = ps;
    r1.xzw = r1.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r1.yyy * WorldToLocal[0].xyz + r1.xwz;
    r1.xy = r15.xy * r3.yz;
    r1.w = dot(r10.wz, r3.zx) + 0.0;
    r0.xy = r0.xy * r3.xy;
    ps = r0.x + r0.y;
    r12.x = dot(r6.zxy, r3.zxy);
    r1.z = ps;
    r12.yz = r1.xz + r1.wy;
    ps = 3.0 * r2.x;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r8.xyz = r8.xyz + r11.xyz;
    r1 = r5.xxxx * BoneMatrices[a0];
    r6 = r5.xxxx * BoneMatrices[a0 + 1];
    r3.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r5.yyyy * BoneMatrices[a0] + r1;
    r6 = r5.yyyy * BoneMatrices[a0 + 1] + r6;
    r3.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r8.w = r5.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r5.zzzz * BoneMatrices[a0] + r1;
    r6 = r5.zzzz * BoneMatrices[a0 + 1] + r6;
    r3.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r8.w = r5.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r5.wwww * BoneMatrices[a0] + r1;
    r6 = r5.wwww * BoneMatrices[a0 + 1] + r6;
    r3.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r8.w = r5.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r1.zxyw, r3);
    r1.y = dot(r6.zxyw, r3);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r2.yw;
    o1.xy = r10.xy;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o3.xyz = r12.xyz;
    o4 = r9;
    o2 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
