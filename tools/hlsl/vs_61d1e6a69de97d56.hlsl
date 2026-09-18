// vs_61d1e6a69de97d56.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 573 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008F4 00510012 00000000 00000000 000044C6 00000001 0000000A 00000006 00000290 00100015 00006016 00003017 00002018 00001019 0000501A 0001501B 0002501C 0006501D 0027501E 00003050 00013151 00023252 0003F355 00047456 0005F557 000010B8 000010B9 000010BA 000010BC 000010BB 000010BD
//   vertex element: instruction 21 -> POSITION0
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> BLENDINDICES0
//   vertex element: instruction 25 -> BLENDWEIGHT0
//   vertex element: instruction 26 -> TEXCOORD0
//   vertex element: instruction 27 -> TEXCOORD1
//   vertex element: instruction 28 -> TEXCOORD2
//   vertex element: instruction 29 -> TEXCOORD6
//   vertex element: instruction 30 -> TEXCOORD7
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
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 r18 = 0.0;
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

    r12.xyz = In.position0.xyz;
    r9.xyz = In.tangent0.zyx;
    r3.xyz = In.normal0.zyx;
    r1 = In.blendindices0.xwyz;
    r6 = In.blendweight0;
    r2.yz = In.texcoord0.xy;
    r11.xy = In.texcoord1.xy;
    r11.zw = In.texcoord2.xy;
    r5.xyz = In.texcoord6.xyz;
    r4.xyz = In.texcoord7.zyx;
    ps = r1.x;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r1.x = ps;
    ps = r1.y;
    r1.y = r1.x * 3.0;
    r2.x = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r7.xyz = r12.xyz + r5.xyz;
    r8 = r6.xxxx * BoneMatrices[a0];
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r6.x * BoneMatrices[a0 + 2].w;
    ps = r1.w;
    r10.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r1.w = ps;
    ps = r1.z;
    r0 = r6.xxxx * BoneMatrices[a0 + 1];
    r1.z = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r6.yyyy * BoneMatrices[a0] + r8;
    r0 = r6.yyyy * BoneMatrices[a0 + 1] + r0;
    r10.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    r7.w = r6.y * BoneMatrices[a0 + 2].w + r7.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r6.zzzz * BoneMatrices[a0] + r8;
    r0 = r6.zzzz * BoneMatrices[a0 + 1] + r0;
    r10.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    r7.w = r6.z * BoneMatrices[a0 + 2].w + r7.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r8 = r6.wwww * BoneMatrices[a0] + r8;
            r0 = r6.wwww * BoneMatrices[a0 + 1] + r0;
            r10.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
            r7.w = r6.w * BoneMatrices[a0 + 2].w + r7.w;
        }
    }
    r13 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r16.xyz = r9.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r3.xyz = r3.xyz + r4.xyz;
    r10 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r9.xyz = r6.xxx * BoneMatrices[a0].xyz;
    r15.xyz = r6.xxx * BoneMatrices[a0 + 1].xyz;
    r1.y = dot(r0.zxyw, r4);
    ps = FogMaxHeight.w;
    r0.x = dot(r7.zxyw, r10);
    r3.yzw = r3.xyz * 0.007843138 - 1.0;
    ps = -CameraPosition.z + ps;
    r3.x = dot(r3.ywz, r3.ywz);
    r10.x = ps;
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    ps = rsqrt(abs(r3.x));
    r1.y = dot(r8.zxyw, r4);
    r3.x = ps;
    ps = FogMaxHeight.z;
    r7.xyz = r3.wzy * r3.xxx;
    r3 = r1.yyyy * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r3.zyx * CameraPosition.www + CameraPosition.yxz;
    ps = -CameraPosition.z + ps;
    r14.xyz = r3.yzx - CameraPosition.xyz;
    r10.y = ps;
    ps = FogMaxHeight.y;
    r0.y = dot(r7.zxy, r16.xzy);
    ps = -CameraPosition.z + ps;
    r4 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r10.z = ps;
    r8 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r4;
    r4.xyz = -r7.zyx * r0.yyy + r16.xyz;
    ps = FogMaxHeight.x;
    r4.w = dot(r14.zxy, r14.zxy);
    ps = -CameraPosition.z + ps;
    r0.y = float((0.001 >= abs(r14.z)));
    r10.w = ps;
    r0.y = (r0.y == 0.0) ? r14.z : 0.001;
    ps = sqrt(abs(r4.w));
    r1.y = dot(r4.xzy, r4.xzy);
    r3.x = ps;
    r8 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r8.xzwy;
    r8 = r3.yyyy * ViewProjectionMatrix[0] + r8.xzyw;
    ps = rsqrt(abs(r1.y));
    r3 = r3.xxxx - FogStartDistance.wzyx;
    r1.y = ps;
    ps = 1.0 / r0.y;
    r4.xyz = r4.zyx * r1.yyy;
    r0.y = ps;
    r16 = saturate(r10.wzyx * r0.yyyy);
    r10 = saturate(r13.wzyx * r0.yyyy);
    r14 = max(r3, 0.0);
    r3.xyz = r14.xyz * FogDistanceScale.wzy;
    r13.xyz = r7.zxy * r4.yzx;
    r10 = r16.wzyx - r10.wzyx;
    r13.xyz = r7.yzx * r4.zxy - r13.xyz;
    r3.xyz = r3.xzy * abs(r10.xzy);
    ps = pow(2.0, r3.y);
    r0.y = abs(r10.w) * FogDistanceScale.x;
    r3.y = ps;
    ps = pow(2.0, r3.z);
    r10 = abs(r10) * r14;
    r3.z = ps;
    ps = pow(2.0, r3.x);
    r0.y = r0.y * r14.w;
    r3.w = ps;
    ps = pow(2.0, r0.y);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r3.x = ps;
    r16 = r10.wzyx * r3;
    ps = r16.y * r16.x;
    r3 = r16.wzyx - 1.0;
    r18.w = ps;
    ps = r3.x;
    r14.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r17.xyz = r3.yyy * FogInScattering[2].xyz;
    r10.x = ps;
    ps = FogInScattering[3].y * r3.x;
    r18.xyz = r3.www * FogInScattering[0].xyz;
    r10.y = ps;
    ps = FogInScattering[3].z * r3.x;
    r18 = r16.yyyz * r18;
    r10.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r16.w * r18.w;
    r3.xyz = r3.zzz * FogInScattering[1].xyz + r18.xyz;
    r3.xyz = r16.zzz * r3.xyz + r17.xyz;
    r10.xyz = r16.www * r3.xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.xyz = r6.yyy * BoneMatrices[a0].xyz + r9.xyz;
    r15.xyz = r6.yyy * BoneMatrices[a0 + 1].xyz + r15.xyz;
    r14.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r14.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.xyz = r6.zzz * BoneMatrices[a0].xyz + r9.xyz;
    r15.xyz = r6.zzz * BoneMatrices[a0 + 1].xyz + r15.xyz;
    r14.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r14.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r9.xyz = r6.www * BoneMatrices[a0].xyz + r9.xyz;
            r15.xyz = r6.www * BoneMatrices[a0 + 1].xyz + r15.xyz;
            r14.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r14.xyz;
        }
    }
    r3.x = dot(r7.zxy, r9.zxy);
    r3.y = dot(r7.zxy, r15.zxy);
    r3.z = dot(r13.zxy, r9.zxy);
    r3.w = dot(r13.zxy, r14.zxy);
    r13.x = dot(r13.zxy, r15.zxy);
    r13.y = dot(r7.zxy, r14.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r7.x = dot(r4.zxy, r9.zxy);
    r9.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r7.y = dot(r4.zxy, r15.zxy);
    r9.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r7.z = dot(r4.zxy, r14.zxy);
    r9.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r9.xyz;
    r4.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r13.xy * r4.yz;
    r0.w = dot(r3.wz, r4.zx) + 0.0;
    r3.xy = r3.xy * r4.xy;
    ps = r3.x + r3.y;
    r7.x = dot(r7.zxy, r4.zxy);
    r0.z = ps;
    r7.yz = r0.xz + r0.wy;
    ps = 3.0 * r1.x;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r5.xyz = r5.xyz + r12.xyz;
    r0 = r6.xxxx * BoneMatrices[a0];
    r3 = r6.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r6.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r6.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.z * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r6.yyyy * BoneMatrices[a0] + r0;
    r3 = r6.yyyy * BoneMatrices[a0 + 1] + r3;
    r4.xyz = r6.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r5.w = r6.y * BoneMatrices[a0 + 2].w + r5.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r6.zzzz * BoneMatrices[a0] + r0;
    r3 = r6.zzzz * BoneMatrices[a0 + 1] + r3;
    r4.xyz = r6.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r5.w = r6.z * BoneMatrices[a0 + 2].w + r5.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r2.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r6.wwww * BoneMatrices[a0] + r0;
    r3 = r6.wwww * BoneMatrices[a0 + 1] + r3;
    r4.xyz = r6.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r5.w = r6.w * BoneMatrices[a0 + 2].w + r5.w;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r6);
    r1.y = dot(r3.zxyw, r6);
    r0.x = dot(r5.zxyw, r4);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r2.yz;
    o1.xy = r11.xy;
    o2.xy = r11.zw;
    o4.xyz = r7.xyz;
    o3 = r8;
    o5 = r10;

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
