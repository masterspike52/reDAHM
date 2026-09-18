// vs_9b7ca40efca3ec62.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 711 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B1C 00710012 00000000 00000000 00006908 00000001 00000008 00000008 00000290 0010001C 0000601D 0000701E 0000301F 00002020 00001021 00005022 00215023 00003050 00013151 00027254 0003F355 00047456 0005F557 0006F6A0 0007F7A1 000010E4 000010E5 000010E7 000010E8 000010E9 000010EB 000010EA 000010E6
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> BINORMAL0
//   vertex element: instruction 31 -> NORMAL0
//   vertex element: instruction 32 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD0
//   vertex element: instruction 35 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 40
// NOTE: unhandled control flow cjmp at cf 43
// NOTE: unhandled control flow cjmp at cf 46

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c238); // float4
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r14.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r2 = In.blendindices0.yxzw;
    r10 = In.blendweight0;
    r5.zw = In.texcoord0.xy;
    r5.xy = In.texcoord1.xy;
    r9.xyz = r3.xyz * 0.007843138 - 1.0;
    r3.xyz = r1.xyz * 0.007843138 - 1.0;
    r15.xyz = r0.yzw * 0.007843138 - 1.0;
    r4.w = r2.y * 3.0;
    a0 = xe_mova(r4.w);
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0.yzw = r10.xxx * BoneMatrices[a0].xyz;
    r4.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r3.w != 0.0);
    r1.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r1.w = 3.0 * r2.x;
    a0 = xe_mova(r1.w);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r10.yyy * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r1.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r1.xyz;
    // UNHANDLED control flow: cjmp
    r1.w = 3.0 * r2.z;
    a0 = xe_mova(r1.w);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r0.yzw = r10.zzz * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r1.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r1.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r2.w;
            a0 = xe_mova(r0.x);
            r0.yzw = r10.www * BoneMatrices[a0].xyz + r0.yzw;
            r4.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r4.xyz;
            r1.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r1.xyz;
        }
    }
    r11.x = dot(r9.zxy, r0.wyz);
    r11.z = dot(r9.zxy, r1.zxy);
    r12.x = dot(r3.zxy, r1.zxy);
    r12.y = dot(r3.zxy, r4.zxy);
    r12.z = dot(r3.zxy, r0.wyz);
    r0.x = dot(r15.zxy, r4.zxy);
    r0.y = dot(r15.zxy, r0.wyz);
    r0.z = dot(r15.zxy, r1.zxy);
    a0 = xe_mova(r4.w);
    r11.w = dot(r9.zxy, r4.zxy);
    r1 = r10.xxxx * BoneMatrices[a0];
    r8 = r10.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r14.w = r10.x * BoneMatrices[a0 + 2].w;
    r11.y = -r11.w;
    r6.xyz = r12.xxy * r0.xyy;
    r6.w = 0.5 * r0.x;
    r7.xyz = r11.xwz * 0.5 + 0.5;
    r6.xyz = r12.yzz * r0.zzx - r6.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r11.xyz, r6.xyz);
    r6.y = ps;
    ps = 0.5 * r0.z;
    r6.x = r0.w * 0.5;
    r6.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r6.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1 = r10.yyyy * BoneMatrices[a0] + r1;
    r8 = r10.yyyy * BoneMatrices[a0 + 1] + r8;
    r4.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r14.w = r10.y * BoneMatrices[a0 + 2].w + r14.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1 = r10.zzzz * BoneMatrices[a0] + r1;
    r8 = r10.zzzz * BoneMatrices[a0 + 1] + r8;
    r4.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r14.w = r10.z * BoneMatrices[a0 + 2].w + r14.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r1 = r10.wwww * BoneMatrices[a0] + r1;
            r8 = r10.wwww * BoneMatrices[a0 + 1] + r8;
            r4.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r14.w = r10.w * BoneMatrices[a0 + 2].w + r14.w;
        }
    }
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r11 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r14.zxyy : 1.0;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r0.x = dot(r14.zxyw, r0);
    r4.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = dot(r1.zxyw, r11);
    r1.y = dot(r8.zxyw, r11);
    r0 = r0.xxxx * LocalToWorld[2].xzyw;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r1.xxxx * LocalToWorld[0].wxzy + r0.wxyz;
    ps = r0.x;
    r8.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r1.xyz = r0.zyw + LocalToWorld[3].zxy;
    r0.z = ps;
    r0.xyw = -r1.zyx * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r11 = r1.xxxx * ViewProjectionMatrix[2].xwzy + r11;
    r11 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r11.xzwy;
    r11 = r1.yyyy * ViewProjectionMatrix[0] + r11.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r12.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r8.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.z;
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r12.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r8.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r4.xyz = r10.www * BoneMatrices[a0].xyz + r4.xyz;
            r12.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r8.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r17.x = dot(r15.zxy, r4.zxy);
    r17.y = dot(r15.zxy, r12.zxy);
    r16.z = dot(r3.zxy, r4.zxy);
    r16.w = dot(r3.zxy, r8.zxy);
    r16.x = dot(r3.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r16.y = dot(r15.zxy, r8.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r18.x = dot(r9.zxy, r4.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r18.y = dot(r9.zxy, r12.zxy);
    r13.z = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r18.z = dot(r9.zxy, r8.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r13.xyz;
    r4.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r12.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r0.yzw = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r8.x = dot(r18.zxy, r0.wyz);
    ps = LightPositionAndInvRadius.x - r1.y;
    r16.xy = r16.xy * r0.zw;
    r0.x = ps;
    r16.w = dot(r16.wz, r0.wy) + 0.0;
    ps = LightPositionAndInvRadius.y - r1.z;
    r0.zw = r17.xy * r0.yz;
    r0.y = ps;
    ps = LightPositionAndInvRadius.z - r1.x;
    r16.z = r0.z + r0.w;
    r0.w = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.yz = r16.xz + r16.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.x;
    r1.x = ps;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r13.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r2.z;
    r1.x = ps;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r13.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r4.xyz = r10.www * BoneMatrices[a0].xyz + r4.xyz;
            r13.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r12.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
        }
    }
    r16.x = dot(r15.zxy, r4.zxy);
    r16.y = dot(r15.zxy, r13.zxy);
    r1.z = dot(r3.zxy, r4.zxy);
    r1.w = dot(r3.zxy, r12.zxy);
    r1.x = dot(r3.zxy, r13.zxy);
    r1.y = dot(r15.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.x = dot(r9.zxy, r4.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r15.y = dot(r9.zxy, r13.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r15.z = dot(r9.zxy, r12.zxy);
    r3.z = ps;
    r3.xyz = r0.yyy * WorldToLocal[1].xzy + r3.xyz;
    r4.xyz = r0.xxx * WorldToLocal[0].xyz + r3.xzy;
    r1.xy = r1.xy * r4.yz;
    r1.w = dot(r1.wz, r4.zx) + 0.0;
    r3.yz = r16.xy * r4.xy;
    ps = r3.y + r3.z;
    r3.x = dot(r15.zxy, r4.zxy);
    r1.z = ps;
    r3.yz = r1.xz + r1.wy;
    r1.x = r2.y * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0.z = float((MaxBoneInfluences.x > 1.0));
    r9 = r10.xxxx * BoneMatrices[a0];
    r4 = r10.xxxx * BoneMatrices[a0 + 1];
    r1.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r14.w = r10.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r2.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r9 = r10.yyyy * BoneMatrices[a0] + r9;
    r4 = r10.yyyy * BoneMatrices[a0 + 1] + r4;
    r1.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r14.w = r10.y * BoneMatrices[a0 + 2].w + r14.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r2.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r9 = r10.zzzz * BoneMatrices[a0] + r9;
    r4 = r10.zzzz * BoneMatrices[a0 + 1] + r4;
    r1.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r14.w = r10.z * BoneMatrices[a0 + 2].w + r14.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r2.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r9 = r10.wwww * BoneMatrices[a0] + r9;
    r4 = r10.wwww * BoneMatrices[a0 + 1] + r4;
    r1.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r1.xyz;
    r14.w = r10.w * BoneMatrices[a0 + 2].w + r14.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.zxyy : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r14.zxyy : 1.0;
    r0.z = dot(r9.zxyw, r2);
    r2.x = dot(r4.zxyw, r2);
    r1.x = dot(r14.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.xxxx * LocalToWorld[1].xzyw + r1.xzwy;
    r2 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r5.zw;
    o1.xy = r5.xy;
    o7.xyz = r7.xyz;
    o7.w = 0.0;
    o2.xyz = r3.xyz;
    o3.xyz = r0.xyw * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r8.xyz;
    o6 = r6;
    o5 = r11;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
