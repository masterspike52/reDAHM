// vs_8e24715f51e5d9c5.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 546 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000888 00510011 00000000 00000000 000044C6 00000001 00000009 00000006 00000290 00100015 00006016 00007017 00003018 00002019 0000101A 0000501B 0001501C 0022501D 00003050 00013151 00023252 0003F355 00047456 0005F557 000010AF 000010B0 000010B1 000010B3 000010B2 000010B4
//   vertex element: instruction 21 -> POSITION0
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> BLENDINDICES0
//   vertex element: instruction 26 -> BLENDWEIGHT0
//   vertex element: instruction 27 -> TEXCOORD0
//   vertex element: instruction 28 -> TEXCOORD1
//   vertex element: instruction 29 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 18
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled control flow cjmp at cf 30
// NOTE: unhandled control flow cjmp at cf 33

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

    r14.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.zyx;
    r7.xyz = In.binormal0.zyx;
    r5.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r9 = In.blendweight0;
    r3.zw = In.texcoord0.xy;
    r3.xy = In.texcoord1.xy;
    r11.xy = In.texcoord2.xy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r6 = r9.xxxx * BoneMatrices[a0];
    r0 = r9.xxxx * BoneMatrices[a0 + 1];
    r8.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r14.w = r9.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r4.y = 3.0 * r1.x;
    a0 = xe_mova(r4.y);
    ps = r4.y;
    r4.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r9.yyyy * BoneMatrices[a0] + r6;
    r0 = r9.yyyy * BoneMatrices[a0 + 1] + r0;
    r8.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r14.w = r9.y * BoneMatrices[a0 + 2].w + r14.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.y = ps;
    a0 = xe_mova(r4.y);
    ps = r4.y;
    r4.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r9.zzzz * BoneMatrices[a0] + r6;
    r0 = r9.zzzz * BoneMatrices[a0 + 1] + r0;
    r8.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r14.w = r9.z * BoneMatrices[a0 + 2].w + r14.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r4.x = ps;
            a0 = xe_mova(r4.x);
            ps = r4.x;
            r6 = r9.wwww * BoneMatrices[a0] + r6;
            r0 = r9.wwww * BoneMatrices[a0 + 1] + r0;
            r8.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r14.w = r9.w * BoneMatrices[a0 + 2].w + r14.w;
        }
    }
    r12 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r15 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4.xyz = r2.zyx * 0.007843138 - 1.0;
    r10.xyz = r7.zyx * 0.007843138 - 1.0;
    r5.xyz = r5.zyx * 0.007843138 - 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r14.zxyy : 1.0;
    r7.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r6.zxyw, r16);
    r2.y = dot(r0.zxyw, r16);
    r0.x = dot(r14.zxyw, r8);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r2 = r2.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r8.xyz = r2.yzx - CameraPosition.xyz;
    r6 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r6 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r6;
    r5.w = dot(r8.zxy, r8.zxy);
    ps = sqrt(abs(r5.w));
    r0.y = float((0.001 >= abs(r8.z)));
    r2.x = ps;
    r0.y = (r0.y == 0.0) ? r8.z : 0.001;
    r6 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r2.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    ps = 1.0 / r0.y;
    r2 = r2.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    r15 = saturate(r15.wzyx * r0.yyyy);
    r8 = saturate(r12.wzyx * r0.yyyy);
    r12 = max(r2, 0.0);
    r2.xyz = r12.xyz * FogDistanceScale.wzy;
    r8 = r15.wzyx - r8.wzyx;
    r2.xyz = r2.xzy * abs(r8.xzy);
    ps = pow(2.0, r2.y);
    r0.y = abs(r8.w) * FogDistanceScale.x;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r8 = abs(r8) * r12;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.y = r0.y * r12.w;
    r2.w = ps;
    ps = pow(2.0, r0.y);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r2.x = ps;
    r15 = r8.wzyx * r2;
    ps = r15.y * r15.x;
    r2 = r15.wzyx - 1.0;
    r17.w = ps;
    ps = r2.x;
    r12.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r16.xyz = r2.yyy * FogInScattering[2].xyz;
    r8.x = ps;
    ps = FogInScattering[3].y * r2.x;
    r17.xyz = r2.www * FogInScattering[0].xyz;
    r8.y = ps;
    ps = FogInScattering[3].z * r2.x;
    r17 = r15.yyyz * r17;
    r8.z = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r15.w * r17.w;
    r2.xyz = r2.zzz * FogInScattering[1].xyz + r17.xyz;
    r2.xyz = r15.zzz * r2.xyz + r16.xyz;
    r8.xyz = r15.www * r2.xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r9.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r13.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r9.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r13.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r7.xyz = r9.www * BoneMatrices[a0].xyz + r7.xyz;
            r13.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r12.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
        }
    }
    r2.x = dot(r5.zxy, r7.zxy);
    r2.y = dot(r5.zxy, r13.zxy);
    r2.z = dot(r10.zxy, r7.zxy);
    r2.w = dot(r10.zxy, r12.zxy);
    r10.x = dot(r10.zxy, r13.zxy);
    r10.y = dot(r5.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r5.x = dot(r4.zxy, r7.zxy);
    r7.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r5.y = dot(r4.zxy, r13.zxy);
    r7.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r5.z = dot(r4.zxy, r12.zxy);
    r7.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r7.xyz;
    r4.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r10.xy * r4.yz;
    r0.w = dot(r2.wz, r4.zx) + 0.0;
    r2.xy = r2.xy * r4.xy;
    ps = r2.x + r2.y;
    r5.x = dot(r5.zxy, r4.zxy);
    r0.z = ps;
    r5.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r4 = r9.xxxx * BoneMatrices[a0];
    r0 = r9.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r14.w = r9.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r4 = r9.yyyy * BoneMatrices[a0] + r4;
    r0 = r9.yyyy * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r14.w = r9.y * BoneMatrices[a0 + 2].w + r14.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2.w = r1.z * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r4 = r9.zzzz * BoneMatrices[a0] + r4;
    r0 = r9.zzzz * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r14.w = r9.z * BoneMatrices[a0 + 2].w + r14.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r4 = r9.wwww * BoneMatrices[a0] + r4;
    r0 = r9.wwww * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r14.w = r9.w * BoneMatrices[a0 + 2].w + r14.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r14.zxyy : 1.0;
    r1.x = dot(r4.zxyw, r7);
    r1.y = dot(r0.zxyw, r7);
    r0.x = dot(r14.zxyw, r2);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r3.zw;
    o1.xy = r3.xy;
    o2.xy = r11.xy;
    o4.xyz = r5.xyz;
    o3 = r6;
    o5 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
