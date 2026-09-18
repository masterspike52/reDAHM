// vs_11f0a394c8d3be26.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 576 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000900 00510011 00000000 00000000 000044C6 00000001 00000007 00000006 00000290 00100015 00006016 00003017 00002018 00001019 0006501A 0027501B 00003050 00013151 00023252 0003F355 00047456 0005F557 000010B9 000010BA 000010BB 000010BD 000010BC 000010BE
//   vertex element: instruction 21 -> POSITION0
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> BLENDINDICES0
//   vertex element: instruction 25 -> BLENDWEIGHT0
//   vertex element: instruction 26 -> TEXCOORD6
//   vertex element: instruction 27 -> TEXCOORD7
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
// NOTE: unhandled control flow cjmp at cf 19
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled control flow cjmp at cf 28
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 34

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
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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

    r9 = In.position0.zyxw;
    r7.yzw = In.tangent0.zyx;
    r2.yzw = In.normal0.zyx;
    r1 = In.blendindices0.xywz;
    r4 = In.blendweight0;
    r11.xyz = In.texcoord6.zyx;
    r3.xyz = In.texcoord7.zyx;
    ps = r1.z;
    r1.x = r1.x;
    r2.x = ps;
    ps = r1.x;
    r7.x = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = r9.w;
    r6.xyz = r9.zyx - DecalLocation.xyz;
    r0.z = ps;
    ps = (-1.0) - -r0.z;
    r5.xyz = r9.zyx + r11.zyx;
    r6.w = ps;
    ps = 3.0 * r0.x;
    r10.x = dot(r6.wzxy, BoneToDecalRow0.wzxy);
    r1.z = ps;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r10.y = dot(r6.wzxy, BoneToDecalRow1.wzxy);
    r6 = r4.xxxx * BoneMatrices[a0];
    r0 = r4.xxxx * BoneMatrices[a0 + 1];
    p0 = (r7.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.xy = -r10.xy + 0.5;
    ps = r1.w;
    r5.w = r4.x * BoneMatrices[a0 + 2].w;
    r1.w = ps;
    ps = r1.y;
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.y = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.y;
    r8.w = ps;
    a0 = xe_mova(r8.w);
    ps = r8.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r4.yyyy * BoneMatrices[a0] + r6;
    r0 = r4.yyyy * BoneMatrices[a0 + 1] + r0;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r5.w = r4.y * BoneMatrices[a0 + 2].w + r5.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r8.w = ps;
    a0 = xe_mova(r8.w);
    ps = r8.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r4.zzzz * BoneMatrices[a0] + r6;
    r0 = r4.zzzz * BoneMatrices[a0 + 1] + r0;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r5.w = r4.z * BoneMatrices[a0 + 2].w + r5.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r6 = r4.wwww * BoneMatrices[a0] + r6;
            r0 = r4.wwww * BoneMatrices[a0 + 1] + r0;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r5.w = r4.w * BoneMatrices[a0 + 2].w + r5.w;
        }
    }
    r12 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r15.xyz = r7.yzw * 0.007843138 - 1.0;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r2.yzw = r2.yzw + r3.xyz;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r13 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r7.yzw = r4.xxx * BoneMatrices[a0].xyz;
    r14.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r1.z = dot(r0.zxyw, r13);
    ps = FogMaxHeight.w;
    r0.x = dot(r5.zxyw, r3);
    r3.xyz = r2.yzw * 0.007843138 - 1.0;
    ps = -CameraPosition.z + ps;
    r2.y = dot(r3.xzy, r3.xzy);
    r8.x = ps;
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r1.zzzz * LocalToWorld[1].xzyw + r0.xzyw;
    ps = rsqrt(abs(r2.y));
    r1.z = dot(r6.zxyw, r13);
    r2.y = ps;
    ps = FogMaxHeight.z;
    r5.xyz = r3.zyx * r2.yyy;
    r3 = r1.zzzz * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r3.zyx * CameraPosition.www + CameraPosition.yxz;
    ps = -CameraPosition.z + ps;
    r13.xyz = r3.yzx - CameraPosition.xyz;
    r8.y = ps;
    ps = FogMaxHeight.y;
    r0.y = dot(r5.zxy, r15.xzy);
    ps = -CameraPosition.z + ps;
    r6 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r8.z = ps;
    r6 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r6;
    r2.yzw = -r5.zyx * r0.yyy + r15.xyz;
    ps = FogMaxHeight.x;
    r5.w = dot(r13.zxy, r13.zxy);
    ps = -CameraPosition.z + ps;
    r0.y = float((0.001 >= abs(r13.z)));
    r8.w = ps;
    r0.y = (r0.y == 0.0) ? r13.z : 0.001;
    ps = sqrt(abs(r5.w));
    r1.z = dot(r2.ywz, r2.ywz);
    r3.x = ps;
    r6 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r3.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    ps = rsqrt(abs(r1.z));
    r3 = r3.xxxx - FogStartDistance.wzyx;
    r1.z = ps;
    ps = 1.0 / r0.y;
    r2.yzw = r2.wzy * r1.zzz;
    r0.y = ps;
    r15 = saturate(r8.wzyx * r0.yyyy);
    r8 = saturate(r12.wzyx * r0.yyyy);
    r13 = max(r3, 0.0);
    r3.xyz = r13.xyz * FogDistanceScale.wzy;
    r12.xyz = r5.zxy * r2.zwy;
    r8 = r15.wzyx - r8.wzyx;
    r12.xyz = r5.yzx * r2.wyz - r12.xyz;
    r3.xyz = r3.xzy * abs(r8.xzy);
    ps = pow(2.0, r3.y);
    r0.y = abs(r8.w) * FogDistanceScale.x;
    r3.y = ps;
    ps = pow(2.0, r3.z);
    r8 = abs(r8) * r13;
    r3.z = ps;
    ps = pow(2.0, r3.x);
    r0.y = r0.y * r13.w;
    r3.w = ps;
    ps = pow(2.0, r0.y);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r3.x = ps;
    r15 = r8.wzyx * r3;
    ps = r15.y * r15.x;
    r3 = r15.wzyx - 1.0;
    r17.w = ps;
    ps = r3.x;
    r13.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r16.xyz = r3.yyy * FogInScattering[2].xyz;
    r8.x = ps;
    ps = FogInScattering[3].y * r3.x;
    r17.xyz = r3.www * FogInScattering[0].xyz;
    r8.y = ps;
    ps = FogInScattering[3].z * r3.x;
    r17 = r15.yyyz * r17;
    r8.z = ps;
    p0 = (r7.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r15.w * r17.w;
    r3.xyz = r3.zzz * FogInScattering[1].xyz + r17.xyz;
    r3.xyz = r15.zzz * r3.xyz + r16.xyz;
    r8.xyz = r15.www * r3.xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.y;
    r1.z = ps;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.yzw = r4.yyy * BoneMatrices[a0].xyz + r7.yzw;
    r14.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r14.xyz;
    r13.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r13.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r1.z = ps;
    a0 = xe_mova(r1.z);
    ps = r1.z;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.yzw = r4.zzz * BoneMatrices[a0].xyz + r7.yzw;
    r14.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r14.xyz;
    r13.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r13.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r7.yzw = r4.www * BoneMatrices[a0].xyz + r7.yzw;
            r14.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r14.xyz;
            r13.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r13.xyz;
        }
    }
    r10.z = dot(r5.zxy, r7.wyz);
    r10.w = dot(r5.zxy, r14.zxy);
    r15.x = dot(r12.zxy, r7.wyz);
    r15.y = dot(r12.zxy, r13.zxy);
    r12.x = dot(r12.zxy, r14.zxy);
    r12.y = dot(r5.zxy, r13.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r5.x = dot(r2.wyz, r7.wyz);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r5.y = dot(r2.wyz, r14.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r5.z = dot(r2.wyz, r13.zxy);
    r3.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r12.xy * r3.yz;
    r0.w = dot(r15.yx, r3.zx) + 0.0;
    r2.yz = r10.zw * r3.xy;
    ps = r2.y + r2.z;
    r7.x = dot(r5.zxy, r3.zxy);
    r0.z = ps;
    r7.yz = r0.xz + r0.wy;
    ps = 3.0 * r1.x;
    r1.z = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r5.xyz = r9.zyx + r11.zyx;
    r3 = r4.xxxx * BoneMatrices[a0];
    r0 = r4.xxxx * BoneMatrices[a0 + 1];
    r2.yzw = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.y * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r0 = r4.yyyy * BoneMatrices[a0 + 1] + r0;
    r2.yzw = r4.yyy * BoneMatrices[a0 + 2].xyz + r2.yzw;
    r5.w = r4.y * BoneMatrices[a0 + 2].w + r5.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r0 = r4.zzzz * BoneMatrices[a0 + 1] + r0;
    r2.yzw = r4.zzz * BoneMatrices[a0 + 2].xyz + r2.yzw;
    r5.w = r4.z * BoneMatrices[a0 + 2].w + r5.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r2.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r3 = r4.wwww * BoneMatrices[a0] + r3;
    r0 = r4.wwww * BoneMatrices[a0 + 1] + r0;
    r2.yzw = r4.www * BoneMatrices[a0 + 2].xyz + r2.yzw;
    r5.w = r4.w * BoneMatrices[a0 + 2].w + r5.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.wyzz : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r1.x = dot(r3.zxyw, r4);
    r1.y = dot(r0.zxyw, r4);
    r0.x = dot(r5.zxyw, r2);
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
    o4.xyz = r7.xyz;
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
