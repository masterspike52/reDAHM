// vs_d6bb3da7a1cdbb9d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 696 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000AE0 0051000F 00000000 00000000 000050C6 00000001 00000008 00000006 00000290 0010001B 0000601C 0000701D 0000301E 0000201F 00001020 00005021 00215022 00003050 00013151 0002F254 0003F356 0004F457 0005F558 000010E1 000010E2 000010E4 000010E3 000010E5 000010E6
//   vertex element: instruction 27 -> POSITION0
//   vertex element: instruction 28 -> TANGENT0
//   vertex element: instruction 29 -> BINORMAL0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> BLENDINDICES0
//   vertex element: instruction 32 -> BLENDWEIGHT0
//   vertex element: instruction 33 -> TEXCOORD0
//   vertex element: instruction 34 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 40
// NOTE: unhandled control flow cjmp at cf 43
// NOTE: unhandled control flow cjmp at cf 46

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightPositionAndInvRadius : register(c239); // float4[2]
float4 LightType : register(c238); // float[2]
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    r2.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r8 = In.blendweight0;
    r7.zw = In.texcoord0.xy;
    r7.xy = In.texcoord1.xy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r6 = r8.xxxx * BoneMatrices[a0];
    r10 = r8.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.w != 0.0);
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r3.x = 3.0 * r1.x;
    a0 = xe_mova(r3.x);
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    r6 = r8.yyyy * BoneMatrices[a0] + r6;
    r10 = r8.yyyy * BoneMatrices[a0 + 1] + r10;
    r4.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    r3.x = 3.0 * r1.z;
    a0 = xe_mova(r3.x);
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    r6 = r8.zzzz * BoneMatrices[a0] + r6;
    r10 = r8.zzzz * BoneMatrices[a0 + 1] + r10;
    r4.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            r0.x = 3.0 * r1.w;
            a0 = xe_mova(r0.x);
            r6 = r8.wwww * BoneMatrices[a0] + r6;
            r10 = r8.wwww * BoneMatrices[a0 + 1] + r10;
            r4.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r5.xyz = r2.xyz * 0.007843138 - 1.0;
    r3.xyz = r0.yzw * 0.007843138 - 1.0;
    r12.xyz = r9.xyz * 0.007843138 - 1.0;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    r0.x = dot(r11.zxyw, r0);
    r2.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r9.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r4.x = dot(r6.zxyw, r13);
    r4.y = dot(r10.zxyw, r13);
    r0 = r0.xxxx * LocalToWorld[2].xzyw;
    r0 = r4.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r4.xxxx * LocalToWorld[0].wxzy + r0.wxyz;
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = r0.x;
    r13.xyz = r0.ywz + LocalToWorld[3].xyz;
    r0.z = LocalToWorld[3].w + r0.x;
    r0.xyw = -r13.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.w != 0.0);
    r4.xy = r0.zz * ViewProjectionMatrix[3].zw;
    r4.xy = r13.zz * ViewProjectionMatrix[2].zw + r4.xy;
    r4.xy = r13.yy * ViewProjectionMatrix[1].zw + r4.xy;
    r4.xy = r13.xx * ViewProjectionMatrix[0].zw + r4.xy;
    // UNHANDLED control flow: cjmp
    r4.z = 3.0 * r1.x;
    a0 = xe_mova(r4.z);
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    r2.xyz = r8.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r9.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r4.z = 3.0 * r1.z;
    a0 = xe_mova(r4.z);
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    r2.xyz = r8.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r9.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.z = 3.0 * r1.w;
            a0 = xe_mova(r0.z);
            r2.xyz = r8.www * BoneMatrices[a0].xyz + r2.xyz;
            r9.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r4.z = dot(r12.zxy, r2.zxy);
    r4.w = dot(r12.zxy, r9.zxy);
    r14.x = dot(r3.zxy, r2.zxy);
    r14.y = dot(r3.zxy, r6.zxy);
    r14.z = dot(r3.zxy, r9.zxy);
    r14.w = dot(r12.zxy, r6.zxy);
    r10.x = WorldToLocal[2].x * r0.w;
    r15.x = dot(r5.zxy, r2.zxy);
    r10.y = WorldToLocal[2].z * r0.w;
    r15.y = dot(r5.zxy, r9.zxy);
    r10.z = WorldToLocal[2].y * r0.w;
    a0 = xe_mova(r2.w);
    r15.z = dot(r5.zxy, r6.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r10.xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r9.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r2.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r6.x = dot(r15.zxy, r2.zxy);
    r0.xy = r14.zw * r2.yz;
    r0.w = dot(r14.yx, r2.zx) + 0.0;
    r4.zw = r4.zw * r2.xy;
    r2.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r0.z = r4.z + r4.w;
    p0 = (r3.w != 0.0);
    r6.yz = r0.xz + r0.wy;
    // UNHANDLED control flow: cjmp
    r0.y = 3.0 * r1.x;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r8.www * BoneMatrices[a0].xyz + r2.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r13.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r14.x = dot(r12.zxy, r2.zxy);
    r14.y = dot(r12.zxy, r10.zxy);
    r14.z = dot(r12.zxy, r9.zxy);
    r15.x = dot(r3.zxy, r2.zxy);
    r15.y = dot(r3.zxy, r10.zxy);
    r15.z = dot(r3.zxy, r9.zxy);
    r2.x = dot(r5.zxy, r2.zxy);
    r2.y = dot(r5.zxy, r10.zxy);
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r2.z = dot(r5.zxy, r9.zxy);
    r13.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r9.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = dot(r2.zxy, WorldToLocal[2].zxy);
    r2.y = dot(r15.zxy, WorldToLocal[2].zxy);
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = dot(r14.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.xyz = r8.yyy * BoneMatrices[a0].xyz + r13.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.xyz = r8.zzz * BoneMatrices[a0].xyz + r13.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r13.xyz = r8.www * BoneMatrices[a0].xyz + r13.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r4.z = dot(r12.zxy, r13.zxy);
    r4.w = dot(r12.zxy, r10.zxy);
    r14.x = dot(r3.zxy, r13.zxy);
    r14.y = dot(r3.zxy, r9.zxy);
    r3.x = dot(r3.zxy, r10.zxy);
    r3.y = dot(r12.zxy, r9.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r12.x = dot(r5.zxy, r13.zxy);
    r13.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r12.y = dot(r5.zxy, r10.zxy);
    r13.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r12.z = dot(r5.zxy, r9.zxy);
    r13.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r13.xyz;
    r5.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r3.xy = r3.xy * r5.yz;
    r3.w = dot(r14.yx, r5.zx) + 0.0;
    r0.yz = r4.zw * r5.xy;
    ps = r0.y + r0.z;
    r0.x = dot(r12.zxy, r5.zxy);
    r3.z = ps;
    r0.yz = r3.xz + r3.wy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r9 = r8.xxxx * BoneMatrices[a0];
    r5 = r8.xxxx * BoneMatrices[a0 + 1];
    r3.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r8.yyyy * BoneMatrices[a0] + r9;
    r5 = r8.yyyy * BoneMatrices[a0 + 1] + r5;
    r3.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r8.zzzz * BoneMatrices[a0] + r9;
    r5 = r8.zzzz * BoneMatrices[a0 + 1] + r5;
    r3.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r9 = r8.wwww * BoneMatrices[a0] + r9;
    r5 = r8.wwww * BoneMatrices[a0 + 1] + r5;
    r3.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
    r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.w = dot(r9.zxyw, r3);
    r2.w = dot(r5.zxyw, r3);
    r1.x = dot(r11.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r3 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r3.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r3.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r7.zw;
    o1.xy = r7.xy;
    o3.zw = r4.xy;
    o3.xy = 1.0;
    o2.xyz = r0.xyz;
    o2.w = 0.0;
    o4.xyz = r6.xyz;
    o4.w = 0.0;
    o5.xyz = r2.xyz;
    o5.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
