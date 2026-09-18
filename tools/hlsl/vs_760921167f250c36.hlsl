// vs_760921167f250c36.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 540 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000870 00410010 00000000 00000000 00003CA5 00000001 00000008 00000005 00000290 00100015 00006016 00007017 00003018 00002019 0000101A 0000501B 0021501C 00003050 00013151 0002F255 00037356 0004F457 000010AE 000010AF 000010B1 000010B0 000010B2
//   vertex element: instruction 21 -> POSITION0
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> BLENDINDICES0
//   vertex element: instruction 26 -> BLENDWEIGHT0
//   vertex element: instruction 27 -> TEXCOORD0
//   vertex element: instruction 28 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r12.xyz = In.position0.xyz;
    r8.xyz = In.tangent0.zyx;
    r4.xyz = In.binormal0.zyx;
    r2.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    r5 = In.blendweight0;
    r6.xy = In.texcoord0.xy;
    r6.zw = In.texcoord1.xy;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    r4.w = float((MaxBoneInfluences.x > 1.0));
    r3 = r5.xxxx * BoneMatrices[a0];
    r0 = r5.xxxx * BoneMatrices[a0 + 1];
    r7.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r4.w != 0.0);
    r12.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r8.w = 3.0 * r1.x;
    a0 = xe_mova(r8.w);
    r7.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r7.w != 0.0);
    r3 = r5.yyyy * BoneMatrices[a0] + r3;
    r0 = r5.yyyy * BoneMatrices[a0 + 1] + r0;
    r7.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r12.w = r5.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    r8.w = 3.0 * r1.z;
    a0 = xe_mova(r8.w);
    r7.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r7.w != 0.0);
    r3 = r5.zzzz * BoneMatrices[a0] + r3;
    r0 = r5.zzzz * BoneMatrices[a0 + 1] + r0;
    r7.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r12.w = r5.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            r7.w = 3.0 * r1.w;
            a0 = xe_mova(r7.w);
            r3 = r5.wwww * BoneMatrices[a0] + r3;
            r0 = r5.wwww * BoneMatrices[a0 + 1] + r0;
            r7.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r12.w = r5.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r2.w);
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r8.xyz = r8.zyx * 0.007843138 - 1.0;
    r9.xyz = r4.zyx * 0.007843138 - 1.0;
    r4.xyz = r2.zyx * 0.007843138 - 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r7.xyz = r5.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r5.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = dot(r3.zxyw, r15);
    r2.y = dot(r0.zxyw, r15);
    r0.x = dot(r12.zxyw, r14);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r2 = r2.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r14.xyz = r2.yzx - CameraPosition.xyz;
    r3 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r3 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    r7.w = dot(r14.zxy, r14.zxy);
    r0.y = float((0.001 >= abs(r14.z)));
    r2.x = sqrt(abs(r7.w));
    r0.y = (r0.y == 0.0) ? r14.z : 0.001;
    r3 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r2.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    r2 = r2.xxxx - FogStartDistance.wzyx;
    r0.y = 1.0 / r0.y;
    r14 = saturate(r13.wzyx * r0.yyyy);
    r10 = saturate(r10.wzyx * r0.yyyy);
    r13 = max(r2, 0.0);
    r2.xyz = r13.xyz * FogDistanceScale.wzy;
    r10 = r14.wzyx - r10.wzyx;
    r2.xyz = r2.xzy * abs(r10.xzy);
    r0.y = abs(r10.w) * FogDistanceScale.x;
    r2.y = pow(2.0, r2.y);
    r10 = abs(r10) * r13;
    r2.z = pow(2.0, r2.z);
    r0.y = r0.y * r13.w;
    r2.w = pow(2.0, r2.x);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r2.x = pow(2.0, r0.y);
    r14 = r10.wzyx * r2;
    r2 = r14.wzyx - 1.0;
    r16.w = r14.y * r14.x;
    r10.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = r2.x;
    r15.xyz = r2.yyy * FogInScattering[2].xyz;
    r13.x = FogInScattering[3].x * r0.y;
    r16.xyz = r2.www * FogInScattering[0].xyz;
    r13.y = FogInScattering[3].y * r2.x;
    r16 = r14.yyyz * r16;
    r13.z = FogInScattering[3].z * r2.x;
    p0 = (r4.w != 0.0);
    r2.x = r14.w * r16.w;
    r2.yzw = r2.zzz * FogInScattering[1].xyz + r16.xyz;
    r2.yzw = r14.zzz * r2.yzw + r15.xyz;
    r2.yzw = r14.www * r2.yzw + r13.xyz;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r1.x;
    a0 = xe_mova(r4.w);
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    r7.xyz = r5.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r11.xyz = r5.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    r4.w = 3.0 * r1.z;
    a0 = xe_mova(r4.w);
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    r7.xyz = r5.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r11.xyz = r5.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r10.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.y = 3.0 * r1.w;
            a0 = xe_mova(r0.y);
            r7.xyz = r5.www * BoneMatrices[a0].xyz + r7.xyz;
            r11.xyz = r5.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r10.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r13.x = dot(r4.zxy, r7.zxy);
    r13.y = dot(r4.zxy, r11.zxy);
    r13.z = dot(r9.zxy, r7.zxy);
    r13.w = dot(r9.zxy, r10.zxy);
    r14.x = dot(r9.zxy, r11.zxy);
    r14.y = dot(r4.zxy, r10.zxy);
    r9.x = dot(r8.zxy, r7.zxy);
    r4.x = WorldToLocal[2].x * r0.w;
    r9.y = dot(r8.zxy, r11.zxy);
    r4.y = WorldToLocal[2].z * r0.w;
    r9.z = dot(r8.zxy, r10.zxy);
    r4.z = WorldToLocal[2].y * r0.w;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r4.xyz;
    r7.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r14.xy * r7.yz;
    r0.w = dot(r13.wz, r7.zx) + 0.0;
    r4.xy = r13.xy * r7.xy;
    r8.x = dot(r9.zxy, r7.zxy);
    r0.z = r4.x + r4.y;
    r8.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r7 = r5.xxxx * BoneMatrices[a0];
    r4 = r5.xxxx * BoneMatrices[a0 + 1];
    r0.xyz = r5.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r5.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r5.yyyy * BoneMatrices[a0] + r7;
    r4 = r5.yyyy * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.yyy * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r5.y * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r5.zzzz * BoneMatrices[a0] + r7;
    r4 = r5.zzzz * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.zzz * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r5.z * BoneMatrices[a0 + 2].w + r12.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7 = r5.wwww * BoneMatrices[a0] + r7;
    r4 = r5.wwww * BoneMatrices[a0 + 1] + r4;
    r0.xyz = r5.www * BoneMatrices[a0 + 2].xyz + r0.xyz;
    r12.w = r5.w * BoneMatrices[a0 + 2].w + r12.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r1.x = dot(r7.zxyw, r5);
    r1.y = dot(r4.zxyw, r5);
    r0.x = dot(r12.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r6.xy;
    o1.xy = r6.zw;
    o3.xyz = r8.xyz;
    o2 = r3;
    o4 = r2.yzwx;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
