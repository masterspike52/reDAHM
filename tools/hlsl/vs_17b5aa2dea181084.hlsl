// vs_17b5aa2dea181084.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 705 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B04 00610010 00000000 00000000 000058E7 00000001 00000009 00000007 00000290 0010001C 0000601D 0000701E 0000301F 00002020 00001021 00005022 00015023 00225024 00003050 00013151 00023252 0003F354 0004F456 0005F557 0006F658 000010E3 000010E4 000010E5 000010E7 000010E6 000010E8 000010E9
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> BINORMAL0
//   vertex element: instruction 31 -> NORMAL0
//   vertex element: instruction 32 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD0
//   vertex element: instruction 35 -> TEXCOORD1
//   vertex element: instruction 36 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r8.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r13 = In.blendweight0;
    r12.zw = In.texcoord0.xy;
    r12.xy = In.texcoord1.xy;
    r4.xy = In.texcoord2.xy;
    r3.w = r1.y * 3.0;
    a0 = xe_mova(r3.w);
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r7 = r13.xxxx * BoneMatrices[a0];
    r0 = r13.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r13.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    r8.w = r13.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r1.x;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r13.yyyy * BoneMatrices[a0] + r7;
    r0 = r13.yyyy * BoneMatrices[a0 + 1] + r0;
    r6.xyz = r13.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r13.y * BoneMatrices[a0 + 2].w + r8.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r13.zzzz * BoneMatrices[a0] + r7;
    r0 = r13.zzzz * BoneMatrices[a0 + 1] + r0;
    r6.xyz = r13.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r8.w = r13.z * BoneMatrices[a0 + 2].w + r8.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r4.z = ps;
            a0 = xe_mova(r4.z);
            ps = r4.z;
            r7 = r13.wwww * BoneMatrices[a0] + r7;
            r0 = r13.wwww * BoneMatrices[a0 + 1] + r0;
            r6.xyz = r13.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r8.w = r13.w * BoneMatrices[a0 + 2].w + r8.w;
        }
    }
    r5.xyz = r3.xyz * 0.007843138 - 1.0;
    r3.xyz = r2.xyz * 0.007843138 - 1.0;
    r10.xyz = r9.xyz * 0.007843138 - 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r9 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.z = dot(r8.zxyw, r6);
    r11.xyz = r13.xxx * BoneMatrices[a0].xyz;
    r6.xyz = r13.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r7.zxyw, r9);
    r2.y = dot(r0.zxyw, r9);
    r0 = r2.zzzz * LocalToWorld[2].xzyw;
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r2.xxxx * LocalToWorld[0].wxzy + r0.wxyz;
    ps = r0.x;
    r2.xyz = r13.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    ps = LocalToWorld[3].w + r0.x;
    r9.xyz = r0.ywz + LocalToWorld[3].xyz;
    r0.z = ps;
    r0.xyw = -r9.yxz * CameraPosition.www + CameraPosition.yxz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.zw = r0.zz * ViewProjectionMatrix[3].zw;
    r4.zw = r9.zz * ViewProjectionMatrix[2].zw + r4.zw;
    r4.zw = r9.yy * ViewProjectionMatrix[1].zw + r4.zw;
    r4.zw = r9.xx * ViewProjectionMatrix[0].zw + r4.zw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xyz = r13.yyy * BoneMatrices[a0].xyz + r11.xyz;
    r6.xyz = r13.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r2.xyz = r13.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xyz = r13.zzz * BoneMatrices[a0].xyz + r11.xyz;
    r6.xyz = r13.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r2.xyz = r13.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r11.xyz = r13.www * BoneMatrices[a0].xyz + r11.xyz;
            r6.xyz = r13.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r2.xyz = r13.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r14.x = dot(r10.zxy, r11.zxy);
    r14.y = dot(r10.zxy, r6.zxy);
    r14.z = dot(r3.zxy, r11.zxy);
    r14.w = dot(r3.zxy, r2.zxy);
    r15.x = dot(r3.zxy, r6.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.y = dot(r10.zxy, r2.zxy);
    r7.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r16.x = dot(r5.zxy, r11.zxy);
    r7.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r16.y = dot(r5.zxy, r6.zxy);
    r7.z = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r16.z = dot(r5.zxy, r2.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r7.xyz;
    r11.xyz = r13.xxx * BoneMatrices[a0 + 1].xyz;
    r7.xyz = r13.xxx * BoneMatrices[a0 + 2].xyz;
    r2.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r6.x = dot(r16.zxy, r2.zxy);
    r0.xy = r15.xy * r2.yz;
    r0.w = dot(r14.wz, r2.zx) + 0.0;
    r6.yz = r14.xy * r2.xy;
    ps = r6.y + r6.z;
    r2.xyz = r13.xxx * BoneMatrices[a0].xyz;
    r0.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.yz = r0.xz + r0.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r13.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r13.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r7.xyz = r13.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r13.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r11.xyz = r13.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r7.xyz = r13.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2.xyz = r13.www * BoneMatrices[a0].xyz + r2.xyz;
            r11.xyz = r13.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r7.xyz = r13.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
        }
    }
    r0.x = float((LightType.x >= 0.9));
    r0.xyw = -r9.yxz * r0.xxx + LightPositionAndInvRadius.yxz;
    r14.x = dot(r10.zxy, r2.zxy);
    r14.y = dot(r10.zxy, r11.zxy);
    r14.z = dot(r10.zxy, r7.zxy);
    r9.y = dot(r3.zxy, r2.zxy);
    r9.z = dot(r3.zxy, r11.zxy);
    r9.w = dot(r3.zxy, r7.zxy);
    r15.x = dot(r5.zxy, r2.zxy);
    r15.y = dot(r5.zxy, r11.zxy);
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r15.z = dot(r5.zxy, r7.zxy);
    r11.xyz = r13.xxx * BoneMatrices[a0].xyz;
    r7.xyz = r13.xxx * BoneMatrices[a0 + 1].xyz;
    r2.xyz = r13.xxx * BoneMatrices[a0 + 2].xyz;
    r9.x = dot(r15.zxy, WorldToLocal[2].zxy);
    r9.y = dot(r9.wyz, WorldToLocal[2].zxy);
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.z = dot(r14.zxy, WorldToLocal[2].zxy);
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xyz = r13.yyy * BoneMatrices[a0].xyz + r11.xyz;
    r7.xyz = r13.yyy * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r2.xyz = r13.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xyz = r13.zzz * BoneMatrices[a0].xyz + r11.xyz;
    r7.xyz = r13.zzz * BoneMatrices[a0 + 1].xyz + r7.xyz;
    r2.xyz = r13.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r11.xyz = r13.www * BoneMatrices[a0].xyz + r11.xyz;
            r7.xyz = r13.www * BoneMatrices[a0 + 1].xyz + r7.xyz;
            r2.xyz = r13.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r14.x = dot(r10.zxy, r11.zxy);
    r14.y = dot(r10.zxy, r7.zxy);
    r14.z = dot(r3.zxy, r11.zxy);
    r14.w = dot(r3.zxy, r2.zxy);
    r15.x = dot(r3.zxy, r7.zxy);
    r15.y = dot(r10.zxy, r2.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r10.x = dot(r5.zxy, r11.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r10.y = dot(r5.zxy, r7.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r10.z = dot(r5.zxy, r2.zxy);
    r3.z = ps;
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r2.xy = r15.xy * r3.yz;
    r2.w = dot(r14.wz, r3.zx) + 0.0;
    r0.yz = r14.xy * r3.xy;
    ps = r0.y + r0.z;
    r0.x = dot(r10.zxy, r3.zxy);
    r2.z = ps;
    r0.yz = r2.xz + r2.wy;
    r2.x = r1.y * 3.0;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r5 = r13.xxxx * BoneMatrices[a0];
    r3 = r13.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r13.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r13.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r13.yyyy * BoneMatrices[a0] + r5;
    r3 = r13.yyyy * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r13.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r8.w = r13.y * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r13.zzzz * BoneMatrices[a0] + r5;
    r3 = r13.zzzz * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r13.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r8.w = r13.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r5 = r13.wwww * BoneMatrices[a0] + r5;
    r3 = r13.wwww * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r13.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r8.w = r13.w * BoneMatrices[a0 + 2].w + r8.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r0.w = dot(r5.zxyw, r2);
    r2.x = dot(r3.zxyw, r2);
    r1.x = dot(r8.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.xxxx * LocalToWorld[1].xzyw + r1.xzwy;
    r2 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r12.zw;
    o1.xy = r12.xy;
    o2.xy = r4.xy;
    o4.zw = r4.zw;
    o4.xy = 1.0;
    o3.xyz = r0.xyz;
    o3.w = 0.0;
    o5.xyz = r6.xyz;
    o5.w = 0.0;
    o6.xyz = r9.xyz;
    o6.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.texcoord8 = o6;
    return Out;
}
