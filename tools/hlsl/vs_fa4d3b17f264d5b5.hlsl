// vs_fa4d3b17f264d5b5.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 549 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000894 00510010 00000000 00000000 000044C6 00000001 00000006 00000006 00000290 00100015 00006016 00007017 00003018 00002019 0020101A 00003050 00013151 00023252 0003F355 00047456 0005F557 000010B0 000010B1 000010B2 000010B4 000010B3 000010B5
//   vertex element: instruction 21 -> POSITION0
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> BLENDINDICES0
//   vertex element: instruction 26 -> BLENDWEIGHT0
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

float4 BoneMatrices[225] : register(c25); // float4x3 (matrix_columns)[75]
float4 BoneToDecalRow0 : register(c22); // float4
float4 BoneToDecalRow1 : register(c23); // float4
float4 CameraPosition : register(c4); // float4
float4 DecalLocation : register(c24); // float3
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

    r13 = In.position0;
    r2.xyz = In.tangent0.zyx;
    r6.xyz = In.binormal0.zyx;
    r4.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yzxw;
    r8 = In.blendweight0;
    r2.w = r1.z * 3.0;
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = r13.w;
    r5.xyz = r13.xyz - DecalLocation.xyz;
    r5.w = (-1.0) - -r0.x;
    r3.x = dot(r5.wzxy, BoneToDecalRow0.wzxy);
    a0 = xe_mova(r2.w);
    r3.y = dot(r5.wzxy, BoneToDecalRow1.wzxy);
    r5 = r8.xxxx * BoneMatrices[a0];
    r0 = r8.xxxx * BoneMatrices[a0 + 1];
    r7.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r13.w = r8.x * BoneMatrices[a0 + 2].w;
    p0 = (r3.w != 0.0);
    r10.xy = -r3.xy + 0.5;
    // UNHANDLED control flow: cjmp
    r3.y = 3.0 * r1.x;
    a0 = xe_mova(r3.y);
    ps = r3.y;
    r3.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r8.yyyy * BoneMatrices[a0] + r5;
    r0 = r8.yyyy * BoneMatrices[a0 + 1] + r0;
    r7.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r13.w = r8.y * BoneMatrices[a0 + 2].w + r13.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.y;
    r3.y = ps;
    a0 = xe_mova(r3.y);
    ps = r3.y;
    r3.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r8.zzzz * BoneMatrices[a0] + r5;
    r0 = r8.zzzz * BoneMatrices[a0 + 1] + r0;
    r7.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r13.w = r8.z * BoneMatrices[a0 + 2].w + r13.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r3.x = ps;
            a0 = xe_mova(r3.x);
            ps = r3.x;
            r5 = r8.wwww * BoneMatrices[a0] + r5;
            r0 = r8.wwww * BoneMatrices[a0 + 1] + r0;
            r7.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r13.w = r8.w * BoneMatrices[a0 + 2].w + r13.w;
        }
    }
    r11 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r3.xyz = r2.zyx * 0.007843138 - 1.0;
    r9.xyz = r6.zyx * 0.007843138 - 1.0;
    r4.xyz = r4.zyx * 0.007843138 - 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r13.zxyy : 1.0;
    r6.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r5.zxyw, r15);
    r2.y = dot(r0.zxyw, r15);
    r0.x = dot(r13.zxyw, r7);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r2 = r2.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r7.xyz = r2.yzx - CameraPosition.xyz;
    r5 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r5 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r5;
    r4.w = dot(r7.zxy, r7.zxy);
    ps = sqrt(abs(r4.w));
    r0.y = float((0.001 >= abs(r7.z)));
    r2.x = ps;
    r0.y = (r0.y == 0.0) ? r7.z : 0.001;
    r5 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r2.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    ps = 1.0 / r0.y;
    r2 = r2.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    r14 = saturate(r14.wzyx * r0.yyyy);
    r7 = saturate(r11.wzyx * r0.yyyy);
    r11 = max(r2, 0.0);
    r2.xyz = r11.xyz * FogDistanceScale.wzy;
    r7 = r14.wzyx - r7.wzyx;
    r2.xyz = r2.xzy * abs(r7.xzy);
    ps = pow(2.0, r2.y);
    r0.y = abs(r7.w) * FogDistanceScale.x;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r7 = abs(r7) * r11;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.y = r0.y * r11.w;
    r2.w = ps;
    ps = pow(2.0, r0.y);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r2.x = ps;
    r14 = r7.wzyx * r2;
    ps = r14.y * r14.x;
    r2 = r14.wzyx - 1.0;
    r16.w = ps;
    ps = r2.x;
    r11.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r15.xyz = r2.yyy * FogInScattering[2].xyz;
    r7.x = ps;
    ps = FogInScattering[3].y * r2.x;
    r16.xyz = r2.www * FogInScattering[0].xyz;
    r7.y = ps;
    ps = FogInScattering[3].z * r2.x;
    r16 = r14.yyyz * r16;
    r7.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r14.w * r16.w;
    r2.xyz = r2.zzz * FogInScattering[1].xyz + r16.xyz;
    r2.xyz = r14.zzz * r2.xyz + r15.xyz;
    r7.xyz = r14.www * r2.xyz + r7.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r12.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.y;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r12.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r6.xyz = r8.www * BoneMatrices[a0].xyz + r6.xyz;
            r12.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r2.x = dot(r4.zxy, r6.zxy);
    r2.y = dot(r4.zxy, r12.zxy);
    r2.z = dot(r9.zxy, r6.zxy);
    r2.w = dot(r9.zxy, r11.zxy);
    r9.x = dot(r9.zxy, r12.zxy);
    r9.y = dot(r4.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r4.x = dot(r3.zxy, r6.zxy);
    r6.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r4.y = dot(r3.zxy, r12.zxy);
    r6.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r4.z = dot(r3.zxy, r11.zxy);
    r6.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r6.xyz;
    r3.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r9.xy * r3.yz;
    r0.w = dot(r2.wz, r3.zx) + 0.0;
    r2.xy = r2.xy * r3.xy;
    ps = r2.x + r2.y;
    r4.x = dot(r4.zxy, r3.zxy);
    r0.z = ps;
    r4.yz = r0.xz + r0.wy;
    r0.x = r1.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r3 = r8.xxxx * BoneMatrices[a0];
    r0 = r8.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r2.w = r1.x * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3 = r8.yyyy * BoneMatrices[a0] + r3;
    r0 = r8.yyyy * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r13.w = r8.y * BoneMatrices[a0 + 2].w + r13.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3 = r8.zzzz * BoneMatrices[a0] + r3;
    r0 = r8.zzzz * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r13.w = r8.z * BoneMatrices[a0 + 2].w + r13.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r8.wwww * BoneMatrices[a0] + r3;
    r0 = r8.wwww * BoneMatrices[a0 + 1] + r0;
    r2.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r13.w = r8.w * BoneMatrices[a0 + 2].w + r13.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r13.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r6);
    r1.y = dot(r0.zxyw, r6);
    r0.x = dot(r13.zxyw, r2);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r10.xy;
    o1.xy = r10.xy;
    o2.xy = r10.xy;
    o4.xyz = r4.xyz;
    o3 = r5;
    o5 = r7;

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
