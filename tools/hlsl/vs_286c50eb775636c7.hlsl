// vs_286c50eb775636c7.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 693 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000AD4 00610013 00000000 00000000 00005CE7 00000001 00000009 00000007 00000290 0010001A 0000601B 0000301C 0020201D 0010101F 00005020 00015021 00065022 00275023 00003050 00013151 0002F255 00037356 0004F457 0005F5A0 0006F6A1 000010DF 000010E0 000010E4 000010E2 000010E5 000010E3 000010E1
//   vertex element: instruction 26 -> POSITION0
//   vertex element: instruction 27 -> TANGENT0
//   vertex element: instruction 28 -> NORMAL0
//   vertex element: instruction 29 -> BLENDINDICES0
//   vertex element: instruction 31 -> BLENDWEIGHT0
//   vertex element: instruction 32 -> TEXCOORD0
//   vertex element: instruction 33 -> TEXCOORD1
//   vertex element: instruction 34 -> TEXCOORD6
//   vertex element: instruction 35 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 28
// NOTE: unhandled control flow cjmp at cf 30
// NOTE: unhandled control flow cjmp at cf 37
// NOTE: unhandled control flow cjmp at cf 40
// NOTE: unhandled control flow cjmp at cf 43

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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

    r14.xyz = In.position0.xyz;
    r2.yzw = In.tangent0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.wxzy;
    ps = r1.y;
    r2.x = ps;
    r12 = In.blendweight0;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.xy;
    r6.xyz = In.texcoord6.xyz;
    r0.yzw = In.texcoord7.xyz;
    r2.yzw = r2.wzy * 0.007843138 - 1.0;
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r0.yzw = r3.xyz + r0.yzw;
    r4.w = ps;
    r4.xyz = r0.wzy * 0.007843138 - 1.0;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r0.y = dot(r4.xzy, r4.xzy);
    r0.xzw = r12.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r0.y));
    r3.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r0.y = ps;
    r10.xyz = r4.zyx * r0.yyy;
    ps = r1.w;
    r0.y = dot(r10.zxy, r2.ywz);
    r1.w = ps;
    r4.xyz = -r10.zyx * r0.yyy + r2.yzw;
    ps = r1.z;
    r0.y = dot(r4.xzy, r4.xzy);
    r1.z = ps;
    ps = rsqrt(abs(r0.y));
    r2.yzw = r12.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = r1.x;
    r7.xyz = r4.zyx * r0.yyy;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r10.zxy * r7.yzx;
    r8.xyz = r10.yzx * r7.zxy - r4.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xzw = r12.yyy * BoneMatrices[a0].xyz + r0.xzw;
    r3.xyz = r12.yyy * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.yzw = r12.yyy * BoneMatrices[a0 + 2].xyz + r2.yzw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xzw = r12.zzz * BoneMatrices[a0].xyz + r0.xzw;
    r3.xyz = r12.zzz * BoneMatrices[a0 + 1].xyz + r3.xyz;
    r2.yzw = r12.zzz * BoneMatrices[a0 + 2].xyz + r2.yzw;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r0.xzw = r12.www * BoneMatrices[a0].xyz + r0.xzw;
            r3.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r3.xyz;
            r2.yzw = r12.www * BoneMatrices[a0 + 2].xyz + r2.yzw;
        }
    }
    r15.x = dot(r7.zxy, r0.wxz);
    r15.z = dot(r7.zxy, r2.wyz);
    ps = r14.x;
    r16.x = dot(r8.zxy, r2.wyz);
    ps = r6.x + ps;
    r16.y = dot(r8.zxy, r3.zxy);
    r9.x = ps;
    ps = r14.y;
    r16.z = dot(r8.zxy, r0.wxz);
    ps = r6.y + ps;
    r0.y = dot(r10.zxy, r3.zxy);
    r9.y = ps;
    ps = r14.z;
    r0.z = dot(r10.zxy, r0.wxz);
    ps = r6.z + ps;
    r0.w = dot(r10.zxy, r2.wyz);
    r9.z = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r15.w = dot(r7.zxy, r3.zxy);
    r11 = r12.xxxx * BoneMatrices[a0];
    r3 = r12.xxxx * BoneMatrices[a0 + 1];
    r2.yzw = r12.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r15.w;
    r9.w = r12.x * BoneMatrices[a0 + 2].w;
    r15.y = ps;
    ps = 0.5 * r0.z;
    r13.xzw = r16.xxy * r0.yzz;
    r13.y = ps;
    r4.xyz = r15.xwz * 0.5 + 0.5;
    r13.xzw = r16.yzz * r0.wwy - r13.xzw;
    ps = 0.5 * r0.y;
    r0.x = dot(r15.xyz, r13.xzw);
    r13.z = ps;
    ps = 0.5 * r0.w;
    r13.x = r0.x * 0.5;
    r13.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13 = r13.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r12.yyyy * BoneMatrices[a0] + r11;
    r3 = r12.yyyy * BoneMatrices[a0 + 1] + r3;
    r2.yzw = r12.yyy * BoneMatrices[a0 + 2].xyz + r2.yzw;
    r9.w = r12.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r12.zzzz * BoneMatrices[a0] + r11;
    r3 = r12.zzzz * BoneMatrices[a0 + 1] + r3;
    r2.yzw = r12.zzz * BoneMatrices[a0 + 2].xyz + r2.yzw;
    r9.w = r12.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r11 = r12.wwww * BoneMatrices[a0] + r11;
            r3 = r12.wwww * BoneMatrices[a0 + 1] + r3;
            r2.yzw = r12.www * BoneMatrices[a0 + 2].xyz + r2.yzw;
            r9.w = r12.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r15 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r17 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.wyzz : 1.0;
    r18 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r2.yzw = r12.xxx * BoneMatrices[a0].xyz;
    r16.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r4.w = dot(r11.zxyw, r18);
    r3.x = dot(r3.zxyw, r18);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.xxxx * LocalToWorld[1].xzyw + r0.xzyw;
    r3 = r4.wwww * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r3.zyx * CameraPosition.www + CameraPosition.yxz;
    r11.xyz = r3.xzy - CameraPosition.zyx;
    r9 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r9 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r9;
    r4.w = dot(r11.xzy, r11.xzy);
    ps = sqrt(abs(r4.w));
    r0.y = float((0.001 >= abs(r11.x)));
    r3.x = ps;
    r0.y = (-abs(r0.y) >= 0.0) ? r11.x : 0.001;
    r9 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r9.xzwy;
    r9 = r3.yyyy * ViewProjectionMatrix[0] + r9.xzyw;
    ps = 1.0 / r0.y;
    r3 = r3.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    r17 = saturate(r17.wzyx * r0.yyyy);
    r11 = saturate(r15.wzyx * r0.yyyy);
    r15 = max(r3, 0.0);
    r3.xyz = r15.xyz * FogDistanceScale.wzy;
    r11 = r17.wzyx - r11.wzyx;
    r3.xyz = r3.xzy * abs(r11.xzy);
    ps = pow(2.0, r3.y);
    r0.y = abs(r11.w) * FogDistanceScale.x;
    r3.y = ps;
    ps = pow(2.0, r3.z);
    r11 = abs(r11) * r15;
    r3.z = ps;
    ps = pow(2.0, r3.x);
    r0.y = r0.y * r15.w;
    r3.w = ps;
    ps = pow(2.0, r0.y);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r3.x = ps;
    r17 = r11.wzyx * r3;
    ps = r17.y * r17.x;
    r3 = r17.wzyx - 1.0;
    r19.w = ps;
    ps = r3.x;
    r15.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r18.xyz = r3.yyy * FogInScattering[2].xyz;
    r11.x = ps;
    ps = FogInScattering[3].y * r3.x;
    r19.xyz = r3.www * FogInScattering[0].xyz;
    r11.y = ps;
    ps = FogInScattering[3].z * r3.x;
    r19 = r17.yyyz * r19;
    r11.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r17.w * r19.w;
    r3.xyz = r3.zzz * FogInScattering[1].xyz + r19.xyz;
    r3.xyz = r17.zzz * r3.xyz + r18.xyz;
    r11.xyz = r17.www * r3.xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r12.yyy * BoneMatrices[a0].xyz + r2.yzw;
    r16.xyz = r12.yyy * BoneMatrices[a0 + 1].xyz + r16.xyz;
    r15.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r15.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r12.zzz * BoneMatrices[a0].xyz + r2.yzw;
    r16.xyz = r12.zzz * BoneMatrices[a0 + 1].xyz + r16.xyz;
    r15.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r15.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r2.yzw = r12.www * BoneMatrices[a0].xyz + r2.yzw;
            r16.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r16.xyz;
            r15.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r15.xyz;
        }
    }
    r17.x = dot(r10.zxy, r2.wyz);
    r17.y = dot(r10.zxy, r16.zxy);
    r17.z = dot(r8.zxy, r2.wyz);
    r17.w = dot(r8.zxy, r15.zxy);
    r18.x = dot(r8.zxy, r16.zxy);
    r18.y = dot(r10.zxy, r15.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r8.x = dot(r7.zxy, r2.wyz);
    r2.y = ps;
    ps = WorldToLocal[2].z * r0.w;
    r8.y = dot(r7.zxy, r16.zxy);
    r2.z = ps;
    ps = WorldToLocal[2].y * r0.w;
    r8.z = dot(r7.zxy, r15.zxy);
    r2.w = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r2.yzw;
    r3.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r18.xy * r3.yz;
    r0.w = dot(r17.wz, r3.zx) + 0.0;
    r2.yz = r17.xy * r3.xy;
    ps = r2.y + r2.z;
    r7.x = dot(r8.zxy, r3.zxy);
    r0.z = ps;
    r7.yz = r0.xz + r0.wy;
    ps = 3.0 * r2.x;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6.xyz = r6.xyz + r14.xyz;
    r0 = r12.xxxx * BoneMatrices[a0];
    r3 = r12.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r12.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.y = r1.w * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0 = r12.yyyy * BoneMatrices[a0] + r0;
    r3 = r12.yyyy * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r6.w = r12.y * BoneMatrices[a0 + 2].w + r6.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.y = r1.z * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0 = r12.zzzz * BoneMatrices[a0] + r0;
    r3 = r12.zzzz * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r6.w = r12.z * BoneMatrices[a0 + 2].w + r6.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r0 = r12.wwww * BoneMatrices[a0] + r0;
    r3 = r12.wwww * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r6.w = r12.w * BoneMatrices[a0 + 2].w + r6.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r8);
    r1.y = dot(r3.zxyw, r8);
    r0.x = dot(r6.zxyw, r2);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r5.xy;
    o1.xy = r5.zw;
    o6.xyz = r4.xyz;
    o6.w = 0.0;
    o3.xyz = r7.xyz;
    o5 = r13;
    o2 = r9;
    o4 = r11;

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
