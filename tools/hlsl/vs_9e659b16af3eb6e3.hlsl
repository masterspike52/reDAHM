// vs_9e659b16af3eb6e3.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 726 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000B58 00610012 00000000 00000000 000060E7 00000001 00000008 00000007 00000290 0010001C 0000601D 0000301E 0020201F 00101021 00005022 00065023 00275024 00003050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A1 000010EB 000010ED 000010EA 000010EE 000010F0 000010EF 000010EC
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> NORMAL0
//   vertex element: instruction 31 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD0
//   vertex element: instruction 35 -> TEXCOORD6
//   vertex element: instruction 36 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 34
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled control flow cjmp at cf 47

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 r18 = 0.0;
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
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0.zxyw;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r4 = In.blendweight0;
    r10.xy = In.texcoord0.xy;
    r7.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r5.xyz + r3.xyz;
    r2.w = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.x = dot(r3.ywz, r3.ywz);
    r0.xyw = r4.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r5.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r13.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r13.zxy, r2.xzy);
    r6.xyz = -r13.zyx * r3.xxx + r2.xyz;
    ps = r1.z;
    r2.x = dot(r6.xzy, r6.xzy);
    r1.z = ps;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.x;
    r8.xyz = r6.zyx * r2.xxx;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r13.zxy * r8.yzx;
    r15.xyz = r13.yzx * r8.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r5.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r5.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r5.xyz;
    r3.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r4.www * BoneMatrices[a0].xyz + r0.xyw;
            r5.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r5.xyz;
            r3.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r12.x = dot(r8.zxy, r0.wxy);
    r12.z = dot(r8.zxy, r3.zxy);
    ps = r14.x;
    r16.x = dot(r15.zxy, r3.zxy);
    ps = r7.x + ps;
    r16.y = dot(r15.zxy, r5.zxy);
    r11.x = ps;
    ps = r14.y;
    r16.z = dot(r15.zxy, r0.wxy);
    ps = r7.y + ps;
    r2.x = dot(r13.zxy, r5.zxy);
    r11.y = ps;
    ps = r14.z;
    r2.y = dot(r13.zxy, r0.wxy);
    ps = r7.z + ps;
    r2.z = dot(r13.zxy, r3.zxy);
    r11.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r12.w = dot(r8.zxy, r5.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r9 = r4.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r12.w;
    r11.w = r4.x * BoneMatrices[a0 + 2].w;
    r12.y = ps;
    ps = 0.5 * r2.x;
    r5.xyz = r16.xxy * r2.xyy;
    r5.w = ps;
    r6.xyz = r12.xwz * 0.5 + 0.5;
    r5.xyz = r16.yzz * r2.zzx - r5.xyz;
    ps = 0.5 * r2.y;
    r5.x = dot(r12.xyz, r5.xyz);
    r5.y = ps;
    ps = 0.5 * r2.z;
    r5.x = r5.x * 0.5;
    r5.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r5.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r9 = r4.yyyy * BoneMatrices[a0 + 1] + r9;
    r0.xyw = r4.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r4.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r9 = r4.zzzz * BoneMatrices[a0 + 1] + r9;
    r0.xyw = r4.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r11.w = r4.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r9 = r4.wwww * BoneMatrices[a0 + 1] + r9;
            r0.xyw = r4.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r11.w = r4.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = dot(r11.zxyw, r12);
    r2.xyz = r4.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r11.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = dot(r3.zxyw, r16);
    r0.y = dot(r9.zxyw, r16);
    r3 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3.xzyw;
    r9 = r0.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    r0.xyw = -r9.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r9.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r9 = r9.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.y = ps;
    a0 = xe_mova(r3.y);
    ps = r3.y;
    r3.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r4.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.y = ps;
    a0 = xe_mova(r3.y);
    ps = r3.y;
    r3.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r4.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r3.x = ps;
            a0 = xe_mova(r3.x);
            ps = r3.x;
            r2.xyz = r4.www * BoneMatrices[a0].xyz + r2.xyz;
            r12.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r3.y = dot(r13.zxy, r2.zxy);
    r3.z = dot(r13.zxy, r12.zxy);
    r10.z = dot(r15.zxy, r2.zxy);
    r10.w = dot(r15.zxy, r11.zxy);
    r16.x = dot(r15.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r16.y = dot(r13.zxy, r11.zxy);
    r18.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r17.x = dot(r8.zxy, r2.zxy);
    r18.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r17.y = dot(r8.zxy, r12.zxy);
    r18.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r17.z = dot(r8.zxy, r11.zxy);
    r12.xyz = r0.xxx * WorldToLocal[1].xzy + r18.xyz;
    r11.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r2.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r12.xzy;
    r3.x = dot(r17.zxy, r0.wxy);
    r12.xy = r16.xy * r0.yw;
    r12.w = dot(r10.wz, r0.wx) + 0.0;
    r3.yz = r3.yz * r0.xy;
    ps = r3.y + r3.z;
    r0.xyw = r4.xxx * BoneMatrices[a0].xyz;
    r12.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.yz = r12.xz + r12.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r11.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r2.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r4.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r11.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r2.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r0.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r0.xyw = r4.www * BoneMatrices[a0].xyz + r0.xyw;
            r11.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r2.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r10.z = dot(r13.zxy, r0.wxy);
    r10.w = dot(r13.zxy, r11.zxy);
    r16.x = dot(r15.zxy, r0.wxy);
    ps = WorldToLocal[2].x;
    r16.y = dot(r15.zxy, r2.zxy);
    ps = LightDirection.z * ps;
    r15.x = dot(r15.zxy, r11.zxy);
    r17.x = ps;
    ps = WorldToLocal[2].z;
    r15.y = dot(r13.zxy, r2.zxy);
    ps = LightDirection.z * ps;
    r12.x = dot(r8.zxy, r0.wxy);
    r17.y = ps;
    ps = WorldToLocal[2].y;
    r12.y = dot(r8.zxy, r11.zxy);
    ps = LightDirection.z * ps;
    r12.z = dot(r8.zxy, r2.zxy);
    r17.z = ps;
    r0.xyw = WorldToLocal[1].xzy * LightDirection.yyy + r17.xyz;
    r8.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r0.xwy;
    r2.xy = r15.xy * r8.yz;
    r2.w = dot(r16.yx, r8.zx) + 0.0;
    r0.yw = r10.zw * r8.xy;
    ps = r0.y + r0.w;
    r0.x = dot(r12.zxy, r8.zxy);
    r2.z = ps;
    r0.yw = r2.xz + r2.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r11.xyz = r7.xyz + r14.xyz;
    r2 = r4.xxxx * BoneMatrices[a0];
    r8 = r4.xxxx * BoneMatrices[a0 + 1];
    r7.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.y = r1.z * 3.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r8 = r4.yyyy * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r11.w = r4.y * BoneMatrices[a0 + 2].w + r11.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r8 = r4.zzzz * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r11.w = r4.z * BoneMatrices[a0 + 2].w + r11.w;
    r1.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r4.wwww * BoneMatrices[a0] + r2;
    r8 = r4.wwww * BoneMatrices[a0 + 1] + r8;
    r7.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r7.xyz;
    r11.w = r4.w * BoneMatrices[a0 + 2].w + r11.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r7.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.z = dot(r2.zxyw, r4);
    r2.x = dot(r8.zxyw, r4);
    r1.x = dot(r11.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.xxxx * LocalToWorld[1].xzyw + r1.xzwy;
    r2 = r0.zzzz * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.x = ps;
    o2.yzw = 0.0;
    o0.xy = r10.xy;
    o6.xyz = r6.xyz;
    o6.w = 0.0;
    o1.xyz = r0.xyw;
    o3.xyz = r3.xyz;
    o5 = r5;
    o4 = r9;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
