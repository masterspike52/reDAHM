// vs_30e08803d91eb686.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 663 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000A5C 00610013 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 00100019 0000601A 0000701B 0000301C 0000201D 0000101E 0000501F 00215020 00003050 00013151 0002F255 00037356 0004F457 0005F5A0 0006F6A1 000010D5 000010D6 000010DA 000010D8 000010DB 000010D9 000010D7
//   vertex element: instruction 25 -> POSITION0
//   vertex element: instruction 26 -> TANGENT0
//   vertex element: instruction 27 -> BINORMAL0
//   vertex element: instruction 28 -> NORMAL0
//   vertex element: instruction 29 -> BLENDINDICES0
//   vertex element: instruction 30 -> BLENDWEIGHT0
//   vertex element: instruction 31 -> TEXCOORD0
//   vertex element: instruction 32 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 28
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38
// NOTE: unhandled control flow cjmp at cf 41

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
    float4 r19 = 0.0;
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

    r16.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r10 = In.blendweight0;
    r4.xy = In.texcoord0.xy;
    r13.xy = In.texcoord1.xy;
    r5.xyz = r3.xyz * 0.007843138 - 1.0;
    r6.xyz = r2.xyz * 0.007843138 - 1.0;
    r9.xyz = r0.yzw * 0.007843138 - 1.0;
    r4.z = r1.y * 3.0;
    a0 = xe_mova(r4.z);
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0.xzw = r10.xxx * BoneMatrices[a0].xyz;
    r3.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r3.w != 0.0);
    r2.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.x;
    a0 = xe_mova(r2.w);
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    r0.xzw = r10.yyy * BoneMatrices[a0].xyz + r0.xzw;
    r3.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    r2.w = 3.0 * r1.z;
    a0 = xe_mova(r2.w);
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    r0.xzw = r10.zzz * BoneMatrices[a0].xyz + r0.xzw;
    r3.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            r0.y = 3.0 * r1.w;
            a0 = xe_mova(r0.y);
            r0.xzw = r10.www * BoneMatrices[a0].xyz + r0.xzw;
            r3.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r3.xyz;
            r2.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r12.x = dot(r5.zxy, r0.wxz);
    r12.z = dot(r5.zxy, r2.zxy);
    r14.x = dot(r6.zxy, r2.zxy);
    r14.y = dot(r6.zxy, r3.zxy);
    r14.z = dot(r6.zxy, r0.wxz);
    r0.y = dot(r9.zxy, r3.zxy);
    r0.z = dot(r9.zxy, r0.wxz);
    r0.w = dot(r9.zxy, r2.zxy);
    a0 = xe_mova(r4.z);
    r12.w = dot(r5.zxy, r3.zxy);
    r8 = r10.xxxx * BoneMatrices[a0];
    r2 = r10.xxxx * BoneMatrices[a0 + 1];
    r7.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r16.w = r10.x * BoneMatrices[a0 + 2].w;
    r12.y = -r12.w;
    r11.xzw = r14.xxy * r0.yzz;
    r11.y = 0.5 * r0.z;
    r3.xyz = r12.xwz * 0.5 + 0.5;
    r11.xzw = r14.yzz * r0.wwy - r11.xzw;
    ps = 0.5 * r0.y;
    r0.x = dot(r12.xyz, r11.xzw);
    r11.z = ps;
    ps = 0.5 * r0.w;
    r11.x = r0.x * 0.5;
    r11.w = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r11.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r10.yyyy * BoneMatrices[a0] + r8;
    r2 = r10.yyyy * BoneMatrices[a0 + 1] + r2;
    r7.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r16.w = r10.y * BoneMatrices[a0 + 2].w + r16.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r10.zzzz * BoneMatrices[a0] + r8;
    r2 = r10.zzzz * BoneMatrices[a0 + 1] + r2;
    r7.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r16.w = r10.z * BoneMatrices[a0 + 2].w + r16.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r8 = r10.wwww * BoneMatrices[a0] + r8;
            r2 = r10.wwww * BoneMatrices[a0 + 1] + r2;
            r7.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
            r16.w = r10.w * BoneMatrices[a0 + 2].w + r16.w;
        }
    }
    r12 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r4.z);
    ps = r4.z;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r16.zxyy : 1.0;
    r7.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r15.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r4.z = dot(r8.zxyw, r17);
    r2.x = dot(r2.zxyw, r17);
    r0.x = dot(r16.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.xxxx * LocalToWorld[1].xzyw + r0.xzyw;
    r2 = r4.zzzz * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r2.zyx * CameraPosition.www + CameraPosition.yxz;
    r17.xyz = r2.xzy - CameraPosition.zyx;
    r8 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r8 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r8;
    r4.z = dot(r17.xzy, r17.xzy);
    ps = sqrt(abs(r4.z));
    r0.y = float((0.001 >= abs(r17.x)));
    r2.x = ps;
    r0.y = (-abs(r0.y) >= 0.0) ? r17.x : 0.001;
    r8 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r8.xzwy;
    r8 = r2.yyyy * ViewProjectionMatrix[0] + r8.xzyw;
    ps = 1.0 / r0.y;
    r2 = r2.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    r17 = saturate(r14.wzyx * r0.yyyy);
    r12 = saturate(r12.wzyx * r0.yyyy);
    r14 = max(r2, 0.0);
    r2.xyz = r14.xyz * FogDistanceScale.wzy;
    r12 = r17.wzyx - r12.wzyx;
    r2.xyz = r2.xzy * abs(r12.xzy);
    ps = pow(2.0, r2.y);
    r0.y = abs(r12.w) * FogDistanceScale.x;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r12 = abs(r12) * r14;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.y = r0.y * r14.w;
    r2.w = ps;
    ps = pow(2.0, r0.y);
    r12 = float4((FogExtinctionDistance.wzyx > r12));
    r2.x = ps;
    r17 = r12.wzyx * r2;
    ps = r17.y * r17.x;
    r2 = r17.wzyx - 1.0;
    r19.w = ps;
    ps = r2.x;
    r14.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r18.xyz = r2.yyy * FogInScattering[2].xyz;
    r12.x = ps;
    ps = FogInScattering[3].y * r2.x;
    r19.xyz = r2.www * FogInScattering[0].xyz;
    r12.y = ps;
    ps = FogInScattering[3].z * r2.x;
    r19 = r17.yyyz * r19;
    r12.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r17.w * r19.w;
    r2.xyz = r2.zzz * FogInScattering[1].xyz + r19.xyz;
    r2.xyz = r17.zzz * r2.xyz + r18.xyz;
    r12.xyz = r17.www * r2.xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r10.yyy * BoneMatrices[a0].xyz + r7.xyz;
    r15.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r15.xyz;
    r14.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r14.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r10.zzz * BoneMatrices[a0].xyz + r7.xyz;
    r15.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r15.xyz;
    r14.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r14.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r7.xyz = r10.www * BoneMatrices[a0].xyz + r7.xyz;
            r15.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r15.xyz;
            r14.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r14.xyz;
        }
    }
    r2.x = dot(r9.zxy, r7.zxy);
    r2.y = dot(r9.zxy, r15.zxy);
    r2.z = dot(r6.zxy, r7.zxy);
    r2.w = dot(r6.zxy, r14.zxy);
    r4.z = dot(r6.zxy, r15.zxy);
    r4.w = dot(r9.zxy, r14.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r6.x = dot(r5.zxy, r7.zxy);
    r7.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r6.y = dot(r5.zxy, r15.zxy);
    r7.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r6.z = dot(r5.zxy, r14.zxy);
    r7.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r7.xyz;
    r5.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r4.zw * r5.yz;
    r0.w = dot(r2.wz, r5.zx) + 0.0;
    r2.xy = r2.xy * r5.xy;
    ps = r2.x + r2.y;
    r6.x = dot(r6.zxy, r5.zxy);
    r0.z = ps;
    r6.yz = r0.xz + r0.wy;
    r0.x = r1.y * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0 = r10.xxxx * BoneMatrices[a0];
    r2 = r10.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r16.w = r10.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r3.w = r1.x * 3.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0 = r10.yyyy * BoneMatrices[a0] + r0;
    r2 = r10.yyyy * BoneMatrices[a0 + 1] + r2;
    r5.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r16.w = r10.y * BoneMatrices[a0 + 2].w + r16.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r3.w = r1.z * 3.0;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0 = r10.zzzz * BoneMatrices[a0] + r0;
    r2 = r10.zzzz * BoneMatrices[a0 + 1] + r2;
    r5.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r16.w = r10.z * BoneMatrices[a0 + 2].w + r16.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.w * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r10.wwww * BoneMatrices[a0] + r0;
    r2 = r10.wwww * BoneMatrices[a0 + 1] + r2;
    r5.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r16.w = r10.w * BoneMatrices[a0 + 2].w + r16.w;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r16.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r7);
    r1.y = dot(r2.zxyw, r7);
    r0.x = dot(r16.zxyw, r5);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r4.xy;
    o1.xy = r13.xy;
    o6.xyz = r3.xyz;
    o6.w = 0.0;
    o3.xyz = r6.xyz;
    o5 = r11;
    o2 = r8;
    o4 = r12;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
