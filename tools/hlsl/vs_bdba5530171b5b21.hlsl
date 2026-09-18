// vs_bdba5530171b5b21.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 459 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000072C 0041000E 00000000 00000000 000034A5 00000001 00000009 00000005 00000290 00100013 00006014 00007015 00003016 00002017 00001018 00005019 0001501A 0022501B 00003050 00013151 00023252 0003F356 00047457 00001095 00001096 00001097 00001094 00001093
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> BLENDINDICES0
//   vertex element: instruction 24 -> BLENDWEIGHT0
//   vertex element: instruction 25 -> TEXCOORD0
//   vertex element: instruction 26 -> TEXCOORD1
//   vertex element: instruction 27 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 28

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
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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

    r7.xyz = In.position0.xyz;
    r6.xyz = In.tangent0.zyx;
    r3.xyz = In.binormal0.zyx;
    r9.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r11 = In.blendweight0;
    r10.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.xy;
    r5.xy = In.texcoord2.xy;
    r2.x = r1.y * 3.0;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r4 = r11.xxxx * BoneMatrices[a0];
    r0 = r11.xxxx * BoneMatrices[a0 + 1];
    r12.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r11.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.z = ps;
    a0 = xe_mova(r2.z);
    ps = r2.z;
    r2.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r11.yyyy * BoneMatrices[a0] + r4;
    r0 = r11.yyyy * BoneMatrices[a0 + 1] + r0;
    r12.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    r7.w = r11.y * BoneMatrices[a0 + 2].w + r7.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.z = ps;
    a0 = xe_mova(r2.z);
    ps = r2.z;
    r2.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r11.zzzz * BoneMatrices[a0] + r4;
    r0 = r11.zzzz * BoneMatrices[a0 + 1] + r0;
    r12.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    r7.w = r11.z * BoneMatrices[a0 + 2].w + r7.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r2.y = ps;
            a0 = xe_mova(r2.y);
            ps = r2.y;
            r4 = r11.wwww * BoneMatrices[a0] + r4;
            r0 = r11.wwww * BoneMatrices[a0 + 1] + r0;
            r12.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
            r7.w = r11.w * BoneMatrices[a0 + 2].w + r7.w;
        }
    }
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r8.xyz = r6.zyx * 0.007843138 - 1.0;
    r2.xyz = r3.zyx * 0.007843138 - 1.0;
    r9.xyz = r9.zyx * 0.007843138 - 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r3.xyz = r11.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r11.xxx * BoneMatrices[a0 + 1].xyz;
    r6.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    r3.w = dot(r4.zxyw, r14);
    r4.x = dot(r0.zxyw, r14);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = dot(r7.zxyw, r13);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r4.xxxx * LocalToWorld[1].xzyw + r0.xzyw;
    r4 = r3.wwww * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r4.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r11.yyy * BoneMatrices[a0].xyz + r3.xyz;
    r12.xyz = r11.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r6.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r11.zzz * BoneMatrices[a0].xyz + r3.xyz;
    r12.xyz = r11.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r6.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r3.xyz = r11.www * BoneMatrices[a0].xyz + r3.xyz;
            r12.xyz = r11.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r6.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r10.z = dot(r9.zxy, r3.zxy);
    r10.w = dot(r9.zxy, r12.zxy);
    r13.x = dot(r2.zxy, r3.zxy);
    r13.y = dot(r2.zxy, r6.zxy);
    r2.x = dot(r2.zxy, r12.zxy);
    r2.y = dot(r9.zxy, r6.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r9.x = dot(r8.zxy, r3.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r9.y = dot(r8.zxy, r12.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r9.z = dot(r8.zxy, r6.zxy);
    r3.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r0.xy = r2.xy * r3.yz;
    r0.w = dot(r13.yx, r3.zx) + 0.0;
    r2.xy = r10.zw * r3.xy;
    ps = r2.x + r2.y;
    r6.x = dot(r9.zxy, r3.zxy);
    r0.z = ps;
    r6.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r3 = r11.xxxx * BoneMatrices[a0];
    r2 = r11.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r11.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r11.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r3 = r11.yyyy * BoneMatrices[a0] + r3;
    r2 = r11.yyyy * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r11.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r11.y * BoneMatrices[a0 + 2].w + r7.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r3 = r11.zzzz * BoneMatrices[a0] + r3;
    r2 = r11.zzzz * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r11.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r11.z * BoneMatrices[a0 + 2].w + r7.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r3 = r11.wwww * BoneMatrices[a0] + r3;
    r2 = r11.wwww * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r11.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r7.w = r11.w * BoneMatrices[a0 + 2].w + r7.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r8);
    r1.y = dot(r2.zxyw, r8);
    r0.x = dot(r7.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r4.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o4.xyz = r6.xyz;
    o3 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r10.xy;
    o1.xy = r5.zw;
    o2.xy = r5.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
