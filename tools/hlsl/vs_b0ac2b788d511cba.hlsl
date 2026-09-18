// vs_b0ac2b788d511cba.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 684 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000AB0 00510013 00000000 00000000 000054C6 00000001 00000008 00000006 00000290 00100019 0000601A 0000301B 0020201C 0010101E 0000501F 00065020 00275021 00003050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 000010DD 000010E1 000010DF 000010E2 000010E0 000010DE
//   vertex element: instruction 25 -> POSITION0
//   vertex element: instruction 26 -> TANGENT0
//   vertex element: instruction 27 -> NORMAL0
//   vertex element: instruction 28 -> BLENDINDICES0
//   vertex element: instruction 30 -> BLENDWEIGHT0
//   vertex element: instruction 31 -> TEXCOORD0
//   vertex element: instruction 32 -> TEXCOORD6
//   vertex element: instruction 33 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled control flow cjmp at cf 39
// NOTE: unhandled control flow cjmp at cf 42

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r7.xyz = In.position0.xyz;
    r0.yzw = In.tangent0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.blendindices0.wxzy;
    ps = r1.y;
    r2.x = ps;
    r12 = In.blendweight0;
    r14.xy = In.texcoord0.xy;
    r5.xyz = In.texcoord6.xyz;
    r2.yzw = In.texcoord7.xyz;
    r0.yzw = r0.wzy * 0.007843138 - 1.0;
    ps = r2.x;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r2.yzw = r3.xyz + r2.yzw;
    r0.x = ps;
    r3.xyz = r2.wzy * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.y = dot(r3.xzy, r3.xzy);
    r9.xyz = r12.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r2.y));
    r4.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r2.y = ps;
    r10.xyz = r3.zyx * r2.yyy;
    ps = r1.w;
    r2.y = dot(r10.zxy, r0.ywz);
    r1.w = ps;
    r2.yzw = -r10.zyx * r2.yyy + r0.yzw;
    ps = r1.z;
    r0.y = dot(r2.ywz, r2.ywz);
    r1.z = ps;
    ps = rsqrt(abs(r0.y));
    r3.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    r0.y = ps;
    ps = r1.x;
    r2.yzw = r2.wzy * r0.yyy;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yzw = r10.zxy * r2.zwy;
    r8.xyz = r10.yzx * r2.wyz - r0.yzw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r0.z = ps;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.xyz = r12.yyy * BoneMatrices[a0].xyz + r9.xyz;
    r4.xyz = r12.yyy * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.z = ps;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.xyz = r12.zzz * BoneMatrices[a0].xyz + r9.xyz;
    r4.xyz = r12.zzz * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r9.xyz = r12.www * BoneMatrices[a0].xyz + r9.xyz;
            r4.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r4.xyz;
            r3.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r15.x = dot(r2.wyz, r9.zxy);
    r15.z = dot(r2.wyz, r3.zxy);
    ps = r7.x;
    r16.x = dot(r8.zxy, r3.zxy);
    ps = r5.x + ps;
    r16.y = dot(r8.zxy, r4.zxy);
    r6.x = ps;
    ps = r7.y;
    r16.z = dot(r8.zxy, r9.zxy);
    ps = r5.y + ps;
    r0.y = dot(r10.zxy, r4.zxy);
    r6.y = ps;
    ps = r7.z;
    r0.z = dot(r10.zxy, r9.zxy);
    ps = r5.z + ps;
    r0.w = dot(r10.zxy, r3.zxy);
    r6.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r15.w = dot(r2.wyz, r4.zxy);
    r11 = r12.xxxx * BoneMatrices[a0];
    r3 = r12.xxxx * BoneMatrices[a0 + 1];
    r9.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r15.w;
    r6.w = r12.x * BoneMatrices[a0 + 2].w;
    r15.y = ps;
    ps = 0.5 * r0.z;
    r13.xzw = r16.xxy * r0.yzz;
    r13.y = ps;
    r4.xyz = r15.xwz * 0.5 + 0.5;
    r13.xzw = r16.yzz * r0.wwy - r13.xzw;
    ps = 0.5 * r0.y;
    r4.w = dot(r15.xyz, r13.xzw);
    r13.z = ps;
    ps = 0.5 * r0.w;
    r13.x = r4.w * 0.5;
    r13.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13 = r13.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.w;
    r0.z = ps;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r12.yyyy * BoneMatrices[a0] + r11;
    r3 = r12.yyyy * BoneMatrices[a0 + 1] + r3;
    r9.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    r6.w = r12.y * BoneMatrices[a0 + 2].w + r6.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.z = ps;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11 = r12.zzzz * BoneMatrices[a0] + r11;
    r3 = r12.zzzz * BoneMatrices[a0 + 1] + r3;
    r9.xyz = r12.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    r6.w = r12.z * BoneMatrices[a0 + 2].w + r6.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r11 = r12.wwww * BoneMatrices[a0] + r11;
            r3 = r12.wwww * BoneMatrices[a0 + 1] + r3;
            r9.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
            r6.w = r12.w * BoneMatrices[a0 + 2].w + r6.w;
        }
    }
    r15 = FogMinHeight.wzyx - CameraPosition.zzzz;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r17 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r18 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r9.xyz = r12.xxx * BoneMatrices[a0].xyz;
    r16.xyz = r12.xxx * BoneMatrices[a0 + 1].xyz;
    r4.w = dot(r11.zxyw, r18);
    r3.x = dot(r3.zxyw, r18);
    r0.x = dot(r6.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r3.xxxx * LocalToWorld[1].xzyw + r0.xzyw;
    r3 = r4.wwww * LocalToWorld[0].zxyw + r0.yxzw;
    r0.xzw = -r3.zyx * CameraPosition.www + CameraPosition.yxz;
    r11.xyz = r3.xzy - CameraPosition.zyx;
    r6 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r6 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r6;
    r4.w = dot(r11.xzy, r11.xzy);
    ps = sqrt(abs(r4.w));
    r0.y = float((0.001 >= abs(r11.x)));
    r3.x = ps;
    r0.y = (-abs(r0.y) >= 0.0) ? r11.x : 0.001;
    r6 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r3.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
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
    r9.xyz = r12.yyy * BoneMatrices[a0].xyz + r9.xyz;
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
    r9.xyz = r12.zzz * BoneMatrices[a0].xyz + r9.xyz;
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
            r9.xyz = r12.www * BoneMatrices[a0].xyz + r9.xyz;
            r16.xyz = r12.www * BoneMatrices[a0 + 1].xyz + r16.xyz;
            r15.xyz = r12.www * BoneMatrices[a0 + 2].xyz + r15.xyz;
        }
    }
    r14.z = dot(r10.zxy, r9.zxy);
    r14.w = dot(r10.zxy, r16.zxy);
    r17.x = dot(r8.zxy, r9.zxy);
    r17.y = dot(r8.zxy, r15.zxy);
    r17.z = dot(r8.zxy, r16.zxy);
    r17.w = dot(r10.zxy, r15.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r8.x = dot(r2.wyz, r9.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r8.y = dot(r2.wyz, r16.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r8.z = dot(r2.wyz, r15.zxy);
    r3.z = ps;
    r0.xyw = r0.xxx * WorldToLocal[1].xzy + r3.xyz;
    r3.xyz = r0.zzz * WorldToLocal[0].xyz + r0.xwy;
    r0.xy = r17.zw * r3.yz;
    r0.w = dot(r17.yx, r3.zx) + 0.0;
    r2.yz = r14.zw * r3.xy;
    ps = r2.y + r2.z;
    r8.x = dot(r8.zxy, r3.zxy);
    r0.z = ps;
    r8.yz = r0.xz + r0.wy;
    ps = 3.0 * r2.x;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r5.xyz = r5.xyz + r7.xyz;
    r0 = r12.xxxx * BoneMatrices[a0];
    r3 = r12.xxxx * BoneMatrices[a0 + 1];
    r2.xyz = r12.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r12.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.y = r1.w * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0 = r12.yyyy * BoneMatrices[a0] + r0;
    r3 = r12.yyyy * BoneMatrices[a0 + 1] + r3;
    r2.xyz = r12.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    r5.w = r12.y * BoneMatrices[a0 + 2].w + r5.w;
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
    r5.w = r12.z * BoneMatrices[a0 + 2].w + r5.w;
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
    r5.w = r12.w * BoneMatrices[a0 + 2].w + r5.w;
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r1.x = dot(r0.zxyw, r7);
    r1.y = dot(r3.zxyw, r7);
    r0.x = dot(r5.zxyw, r2);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r14.xy;
    o5.xyz = r4.xyz;
    o5.w = 0.0;
    o2.xyz = r8.xyz;
    o4 = r13;
    o1 = r6;
    o3 = r11;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
