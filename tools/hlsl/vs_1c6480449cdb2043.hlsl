// vs_1c6480449cdb2043.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 525 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000834 0021000F 00000000 00000000 00002C63 00000001 00000006 00000003 00000290 00100014 00006015 00007016 00003017 00002018 00201019 0000F055 00017156 0002F257 000010AC 000010AB 000010AD
//   vertex element: instruction 20 -> POSITION0
//   vertex element: instruction 21 -> TANGENT0
//   vertex element: instruction 22 -> BINORMAL0
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> BLENDINDICES0
//   vertex element: instruction 25 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 19
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled control flow cjmp at cf 32

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c22); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c15); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c14); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c19); // float3x3 (matrix_columns)

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
    float4 texcoord5 : TEXCOORD5;
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
    float4 r15 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r12.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.zyx;
    r4.xyz = In.binormal0.zyx;
    r7.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r3 = In.blendweight0;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r5 = r3.xxxx * BoneMatrices[a0];
    r0 = r3.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r12.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r7.w = 3.0 * r1.x;
    a0 = xe_mova(r7.w);
    r6.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r6.w != 0.0);
    r5 = r3.yyyy * BoneMatrices[a0] + r5;
    r0 = r3.yyyy * BoneMatrices[a0 + 1] + r0;
    r6.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r12.w = r3.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    r7.w = 3.0 * r1.z;
    a0 = xe_mova(r7.w);
    r6.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r6.w != 0.0);
    r5 = r3.zzzz * BoneMatrices[a0] + r5;
    r0 = r3.zzzz * BoneMatrices[a0 + 1] + r0;
    r6.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r12.w = r3.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            r6.w = 3.0 * r1.w;
            a0 = xe_mova(r6.w);
            r5 = r3.wwww * BoneMatrices[a0] + r5;
            r0 = r3.wwww * BoneMatrices[a0 + 1] + r0;
            r6.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r12.w = r3.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r2.w);
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r9.xyz = r2.zyx * 0.007843138 - 1.0;
    r8.xyz = r4.zyx * 0.007843138 - 1.0;
    r4.xyz = r7.zyx * 0.007843138 - 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r7.xyz = r3.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r3.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r5.zxyw, r14);
    r2.y = dot(r0.zxyw, r14);
    r0.x = dot(r12.zxyw, r6);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r2 = r2.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r6.xyz = r2.yzx - CameraPosition.xyz;
    r5 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r5 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r5;
    r6.w = dot(r6.zxy, r6.zxy);
    r0.y = float((0.001 >= abs(r6.z)));
    r2.x = sqrt(abs(r6.w));
    r0.y = (r0.y == 0.0) ? r6.z : 0.001;
    r5 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r2.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    r2 = r2.xxxx - FogStartDistance.wzyx;
    r0.y = 1.0 / r0.y;
    r13 = saturate(r13.wzyx * r0.yyyy);
    r6 = saturate(r10.wzyx * r0.yyyy);
    r10 = max(r2, 0.0);
    r2.xyz = r10.xyz * FogDistanceScale.wzy;
    r6 = r13.wzyx - r6.wzyx;
    r2.xyz = r2.xzy * abs(r6.xzy);
    r0.y = abs(r6.w) * FogDistanceScale.x;
    r2.y = pow(2.0, r2.y);
    r6 = abs(r6) * r10;
    r2.z = pow(2.0, r2.z);
    r0.y = r0.y * r10.w;
    r2.w = pow(2.0, r2.x);
    r6 = float4((FogExtinctionDistance.wzyx > r6));
    r2.x = pow(2.0, r0.y);
    r13 = r6.wzyx * r2;
    r2 = r13.wzyx - 1.0;
    r15.w = r13.y * r13.x;
    r10.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = r2.x;
    r14.xyz = r2.yyy * FogInScattering[2].xyz;
    r6.x = FogInScattering[3].x * r0.y;
    r15.xyz = r2.www * FogInScattering[0].xyz;
    r6.y = FogInScattering[3].y * r2.x;
    r15 = r13.yyyz * r15;
    r6.z = FogInScattering[3].z * r2.x;
    p0 = (r4.w != 0.0);
    r6.w = r13.w * r15.w;
    r2.xyz = r2.zzz * FogInScattering[1].xyz + r15.xyz;
    r2.xyz = r13.zzz * r2.xyz + r14.xyz;
    r6.xyz = r13.www * r2.xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    r2.x = 3.0 * r1.x;
    a0 = xe_mova(r2.x);
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    r7.xyz = r3.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r11.xyz = r3.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    r2.x = 3.0 * r1.z;
    a0 = xe_mova(r2.x);
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    r7.xyz = r3.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r11.xyz = r3.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.y = 3.0 * r1.w;
            a0 = xe_mova(r0.y);
            r7.xyz = r3.www * BoneMatrices[a0].xyz + r7.xyz;
            r11.xyz = r3.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r2.x = dot(r4.zxy, r7.zxy);
    r2.y = dot(r4.zxy, r11.zxy);
    r2.z = dot(r8.zxy, r7.zxy);
    r2.w = dot(r8.zxy, r10.zxy);
    r8.x = dot(r8.zxy, r11.zxy);
    r8.y = dot(r4.zxy, r10.zxy);
    r7.x = dot(r9.zxy, r7.zxy);
    r4.x = WorldToLocal[2].x * r0.w;
    r7.y = dot(r9.zxy, r11.zxy);
    r4.y = WorldToLocal[2].z * r0.w;
    r7.z = dot(r9.zxy, r10.zxy);
    r4.z = WorldToLocal[2].y * r0.w;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r4.xyz;
    r4.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r8.xy * r4.yz;
    r0.w = dot(r2.wz, r4.zx) + 0.0;
    r2.xy = r2.xy * r4.xy;
    r7.x = dot(r7.zxy, r4.zxy);
    r0.z = r2.x + r2.y;
    r7.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r4 = r3.xxxx * BoneMatrices[a0];
    r2 = r3.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r4 = r3.yyyy * BoneMatrices[a0] + r4;
    r2 = r3.yyyy * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r3.y * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r4 = r3.zzzz * BoneMatrices[a0] + r4;
    r2 = r3.zzzz * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r3.z * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r4 = r3.wwww * BoneMatrices[a0] + r4;
    r2 = r3.wwww * BoneMatrices[a0 + 1] + r2;
    r0.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r3.w * BoneMatrices[a0 + 2].w + r12.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r1.x = dot(r4.zxyw, r3);
    r1.y = dot(r2.zxyw, r3);
    r0.x = dot(r12.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o1.xyz = r7.xyz;
    o0 = r5;
    o2 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
