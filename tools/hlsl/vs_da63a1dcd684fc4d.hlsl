// vs_da63a1dcd684fc4d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 738 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B88 00710011 00000000 00000000 00006908 00000001 00000009 00000008 00000290 0010001D 0000601E 0000301F 00202020 00101022 00005023 00015024 00265025 00075027 00003050 00013151 00027254 0003F355 00047456 0005F557 0006F6A0 0007F7A1 000010EE 000010EF 000010F1 000010ED 000010F2 000010F4 000010F3 000010F0
//   vertex element: instruction 29 -> POSITION0
//   vertex element: instruction 30 -> TANGENT0
//   vertex element: instruction 31 -> NORMAL0
//   vertex element: instruction 32 -> BLENDINDICES0
//   vertex element: instruction 34 -> BLENDWEIGHT0
//   vertex element: instruction 35 -> TEXCOORD0
//   vertex element: instruction 36 -> TEXCOORD1
//   vertex element: instruction 37 -> TEXCOORD6
//   vertex element: instruction 39 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled control flow cjmp at cf 45
// NOTE: unhandled control flow cjmp at cf 48

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
float4 LightDirection : register(c238); // float3
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c10); // float3x3 (matrix_columns)

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
    float4 texcoord4 : TEXCOORD4;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r15.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0;
    ps = r1.y;
    r0.w = ps;
    r4 = In.blendweight0;
    r7.xy = In.texcoord0.xy;
    r2.yw = In.texcoord1.xy;
    r8.xyz = In.texcoord6.xyz;
    ps = r1.z;
    r2.x = r1.x;
    r0.z = ps;
    r1.xyz = In.texcoord7.xyz;
    r3.xyz = r3.zyx * 0.007843138 - 1.0;
    ps = r2.x;
    r0.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r1.xyz = r5.xyz + r1.xyz;
    r0.x = ps;
    r6.xyz = r1.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1.x = dot(r6.xzy, r6.xzy);
    ps = r1.w;
    r1.yzw = r4.xxx * BoneMatrices[a0].xyz;
    r2.z = ps;
    ps = rsqrt(abs(r1.x));
    r5.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r1.x = ps;
    r14.xyz = r6.zyx * r1.xxx;
    r1.x = dot(r14.zxy, r3.xzy);
    r6.xyz = -r14.zyx * r1.xxx + r3.xyz;
    r1.x = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r1.x));
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    r10.xyz = r6.zyx * r1.xxx;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r14.zxy * r10.yzx;
    r16.xyz = r14.yzx * r10.zxy - r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yzw = r4.yyy * BoneMatrices[a0].xyz + r1.yzw;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yzw = r4.zzz * BoneMatrices[a0].xyz + r1.yzw;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r1.yzw = r4.www * BoneMatrices[a0].xyz + r1.yzw;
            r5.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r13.x = dot(r10.zxy, r1.wyz);
    r13.z = dot(r10.zxy, r3.zxy);
    ps = r15.x;
    r17.x = dot(r16.zxy, r3.zxy);
    ps = r8.x + ps;
    r17.y = dot(r16.zxy, r5.zxy);
    r12.x = ps;
    ps = r15.y;
    r17.z = dot(r16.zxy, r1.wyz);
    ps = r8.y + ps;
    r1.x = dot(r14.zxy, r5.zxy);
    r12.y = ps;
    ps = r15.z;
    r1.y = dot(r14.zxy, r1.wyz);
    ps = r8.z + ps;
    r1.z = dot(r14.zxy, r3.zxy);
    r12.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r13.w = dot(r10.zxy, r5.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r11 = r4.xxxx * BoneMatrices[a0 + 1];
    r5.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r13.w;
    r12.w = r4.x * BoneMatrices[a0 + 2].w;
    r13.y = ps;
    ps = 0.5 * r1.x;
    r9.xyz = r17.xxy * r1.xyy;
    r9.w = ps;
    r6.xyz = r13.xwz * 0.5 + 0.5;
    r9.xyz = r17.yzz * r1.zzx - r9.xyz;
    ps = 0.5 * r1.y;
    r1.w = dot(r13.xyz, r9.xyz);
    r9.y = ps;
    ps = 0.5 * r1.z;
    r9.x = r1.w * 0.5;
    r9.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9 = r9.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r11 = r4.yyyy * BoneMatrices[a0 + 1] + r11;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r4.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r11 = r4.zzzz * BoneMatrices[a0 + 1] + r11;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r5.xyz;
    r12.w = r4.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r11 = r4.wwww * BoneMatrices[a0 + 1] + r11;
            r5.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r5.xyz;
            r12.w = r4.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r5.zxyy : 1.0;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1.x = dot(r12.zxyw, r1);
    r5.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r13.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r12.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r3.x = dot(r3.zxyw, r17);
    r3.y = dot(r11.zxyw, r17);
    r1 = r1.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r1 = r3.yyyy * LocalToWorld[1].xzyw + r1.xzyw;
    r11 = r3.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r1.xyw = -r11.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r11.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r11.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r11.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r11 = r11.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r3.x = ps;
    a0 = xe_mova(r3.x);
    ps = r3.x;
    r1.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r13.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r12.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.x = ps;
    a0 = xe_mova(r3.x);
    ps = r3.x;
    r1.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r4.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r13.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r13.xyz;
    r12.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r12.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r1.z = ps;
            a0 = xe_mova(r1.z);
            ps = r1.z;
            r5.xyz = r4.www * BoneMatrices[a0].xyz + r5.xyz;
            r13.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r13.xyz;
            r12.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r12.xyz;
        }
    }
    r7.z = dot(r14.zxy, r5.zxy);
    r7.w = dot(r14.zxy, r13.zxy);
    r17.x = dot(r16.zxy, r5.zxy);
    r17.y = dot(r16.zxy, r12.zxy);
    r17.z = dot(r16.zxy, r13.zxy);
    ps = WorldToLocal[2].x * r1.w;
    r17.w = dot(r14.zxy, r12.zxy);
    r3.x = ps;
    ps = WorldToLocal[2].z * r1.w;
    r5.x = dot(r10.zxy, r5.zxy);
    r3.y = ps;
    ps = WorldToLocal[2].y * r1.w;
    r5.y = dot(r10.zxy, r13.zxy);
    r3.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r5.z = dot(r10.zxy, r12.zxy);
    r1.xzw = r1.xxx * WorldToLocal[1].xzy + r3.xyz;
    r12.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.xyz = r1.yyy * WorldToLocal[0].xyz + r1.xwz;
    r5.x = dot(r5.zxy, r1.zxy);
    r13.xy = r17.zw * r1.yz;
    r13.w = dot(r17.yx, r1.zx) + 0.0;
    r5.yz = r7.zw * r1.xy;
    ps = r5.y + r5.z;
    r1.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r13.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yz = r13.xz + r13.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r4.yyy * BoneMatrices[a0].xyz + r1.xyz;
    r12.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r4.zzz * BoneMatrices[a0].xyz + r1.xyz;
    r12.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.z;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r1.xyz = r4.www * BoneMatrices[a0].xyz + r1.xyz;
            r12.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r0.x = dot(r14.zxy, r1.zxy);
    r0.y = dot(r14.zxy, r12.zxy);
    r7.z = dot(r16.zxy, r1.zxy);
    ps = WorldToLocal[2].x;
    r7.w = dot(r16.zxy, r3.zxy);
    ps = LightDirection.z * ps;
    r16.x = dot(r16.zxy, r12.zxy);
    r17.x = ps;
    ps = WorldToLocal[2].z;
    r16.y = dot(r14.zxy, r3.zxy);
    ps = LightDirection.z * ps;
    r13.x = dot(r10.zxy, r1.zxy);
    r17.y = ps;
    ps = WorldToLocal[2].y;
    r13.y = dot(r10.zxy, r12.zxy);
    ps = LightDirection.z * ps;
    r13.z = dot(r10.zxy, r3.zxy);
    r17.z = ps;
    r1.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r17.xyz;
    r3.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r1.xzy;
    r1.xy = r16.xy * r3.yz;
    r1.w = dot(r7.wz, r3.zx) + 0.0;
    r0.xy = r0.xy * r3.xy;
    ps = r0.x + r0.y;
    r3.x = dot(r13.zxy, r3.zxy);
    r1.z = ps;
    r3.yz = r1.xz + r1.wy;
    ps = 3.0 * r2.x;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r12.xyz = r8.xyz + r15.xyz;
    r1 = r4.xxxx * BoneMatrices[a0];
    r10 = r4.xxxx * BoneMatrices[a0 + 1];
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.yyyy * BoneMatrices[a0] + r1;
    r10 = r4.yyyy * BoneMatrices[a0 + 1] + r10;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r12.w = r4.y * BoneMatrices[a0 + 2].w + r12.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.zzzz * BoneMatrices[a0] + r1;
    r10 = r4.zzzz * BoneMatrices[a0 + 1] + r10;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r12.w = r4.z * BoneMatrices[a0 + 2].w + r12.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.wwww * BoneMatrices[a0] + r1;
    r10 = r4.wwww * BoneMatrices[a0 + 1] + r10;
    r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r12.w = r4.w * BoneMatrices[a0 + 2].w + r12.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r1.x = dot(r1.zxyw, r4);
    r1.y = dot(r10.zxyw, r4);
    r0.x = dot(r12.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r7.xy;
    o1.xy = r2.yw;
    o7.xyz = r6.xyz;
    o7.w = 0.0;
    o2.xyz = r3.xyz;
    o4.xyz = r5.xyz;
    o6 = r9;
    o5 = r11;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
