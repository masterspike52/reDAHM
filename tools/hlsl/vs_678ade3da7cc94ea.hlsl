// vs_678ade3da7cc94ea.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 618 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000009A8 00610011 00000000 00000000 000050E7 00000001 0000000A 00000007 00000290 00100018 00006019 0000301A 0020201B 0010101D 0000501E 0001501F 00025020 00065021 00375022 00003050 00013151 00023252 00037354 0004F455 00057556 0006F657 000010C7 000010C8 000010C9 000010CA 000010C6 000010CB 000010CC
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD1
//   vertex element: instruction 32 -> TEXCOORD2
//   vertex element: instruction 33 -> TEXCOORD6
//   vertex element: instruction 34 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled control flow cjmp at cf 39

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
    float4 texcoord4 : TEXCOORD4;
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
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r6.xyz = In.position0.xyz;
    r4.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.zyx;
    r1 = In.blendindices0.zxwy;
    ps = r1.w;
    r1.w = r1.y;
    r0.z = ps;
    r9 = In.blendweight0;
    r7.zw = In.texcoord0.xy;
    r7.xy = In.texcoord1.xy;
    r10.xy = In.texcoord2.xy;
    r13.xyz = In.texcoord6.xyz;
    r0.xyw = In.texcoord7.zyx;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.xyz = r6.xyz + r13.xyz;
    r8 = r9.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.w = r9.x * BoneMatrices[a0 + 2].w;
    ps = r1.z;
    r11.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r1.z = ps;
    ps = r1.x;
    r3 = r9.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r6.w = ps;
    a0 = xe_mova(r6.w);
    ps = r6.w;
    r5.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r9.yyyy * BoneMatrices[a0] + r8;
    r3 = r9.yyyy * BoneMatrices[a0 + 1] + r3;
    r11.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    r2.w = r9.y * BoneMatrices[a0 + 2].w + r2.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r6.w = ps;
    a0 = xe_mova(r6.w);
    ps = r6.w;
    r5.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8 = r9.zzzz * BoneMatrices[a0] + r8;
    r3 = r9.zzzz * BoneMatrices[a0 + 1] + r3;
    r11.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    r2.w = r9.z * BoneMatrices[a0 + 2].w + r2.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r5.w = ps;
            a0 = xe_mova(r5.w);
            ps = r5.w;
            r8 = r9.wwww * BoneMatrices[a0] + r8;
            r3 = r9.wwww * BoneMatrices[a0 + 1] + r3;
            r11.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
            r2.w = r9.w * BoneMatrices[a0 + 2].w + r2.w;
        }
    }
    r12.xyz = r4.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r14.xyz = r5.xyz + r0.xyw;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.zxyy : 1.0;
    r4.xyz = r9.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r3.zxyw, r5);
    r0.w = dot(r2.zxyw, r15);
    r3.xyz = r14.xyz * 0.007843138 - 1.0;
    r0.y = dot(r3.xzy, r3.xzy);
    r2 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r2 = r0.xxxx * LocalToWorld[1].xzyw + r2.xzyw;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r8.zxyw, r5);
    r0.y = ps;
    r5.xyz = r3.zyx * r0.yyy;
    r8 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r0.xyw = -r8.yxw * CameraPosition.www + CameraPosition.yxz;
    r2.x = dot(r5.zxy, r12.zxy);
    r3 = r8.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r8.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r2.yzw = -r5.zyx * r2.xxx + r12.zyx;
    r2.x = dot(r2.ywz, r2.ywz);
    r3 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r14 = r8.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    r2.xyz = r2.wzy * r2.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r5.zxy * r2.yzx;
    r12.xyz = r5.yzx * r2.zxy - r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r9.yyy * BoneMatrices[a0].xyz + r4.xyz;
    r11.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r3.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r9.zzz * BoneMatrices[a0].xyz + r4.xyz;
    r11.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r3.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r2.w = ps;
            a0 = xe_mova(r2.w);
            ps = r2.w;
            r4.xyz = r9.www * BoneMatrices[a0].xyz + r4.xyz;
            r11.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r3.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r8.y = dot(r5.zxy, r4.zxy);
    r8.z = dot(r5.zxy, r11.zxy);
    r10.z = dot(r12.zxy, r4.zxy);
    r10.w = dot(r12.zxy, r3.zxy);
    r15.x = dot(r12.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.y = dot(r5.zxy, r3.zxy);
    r17.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r16.x = dot(r2.zxy, r4.zxy);
    r17.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r16.y = dot(r2.zxy, r11.zxy);
    r17.z = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r16.z = dot(r2.zxy, r3.zxy);
    r11.xyz = r0.xxx * WorldToLocal[1].xzy + r17.xyz;
    r4.xyz = r9.xxx * BoneMatrices[a0 + 1].xyz;
    r3.xyz = r9.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyw = r0.yyy * WorldToLocal[0].xyz + r11.xzy;
    r8.x = dot(r16.zxy, r0.wxy);
    r11.xy = r15.xy * r0.yw;
    r11.w = dot(r10.wz, r0.wx) + 0.0;
    r8.yz = r8.yz * r0.xy;
    ps = r8.y + r8.z;
    r0.xyw = r9.xxx * BoneMatrices[a0].xyz;
    r11.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.yz = r11.xz + r11.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r9.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r4.xyz = r9.yyy * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r9.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r9.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r4.xyz = r9.zzz * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r3.xyz = r9.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.z;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r0.xyw = r9.www * BoneMatrices[a0].xyz + r0.xyw;
            r4.xyz = r9.www * BoneMatrices[a0 + 1].xyz + r4.xyz;
            r3.xyz = r9.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r10.z = dot(r5.zxy, r0.wxy);
    r10.w = dot(r5.zxy, r4.zxy);
    r11.x = dot(r12.zxy, r0.wxy);
    ps = WorldToLocal[2].x;
    r11.y = dot(r12.zxy, r3.zxy);
    ps = LightDirection.z * ps;
    r11.z = dot(r12.zxy, r4.zxy);
    r12.x = ps;
    ps = WorldToLocal[2].z;
    r11.w = dot(r5.zxy, r3.zxy);
    ps = LightDirection.z * ps;
    r5.x = dot(r2.zxy, r0.wxy);
    r12.y = ps;
    ps = WorldToLocal[2].y;
    r5.y = dot(r2.zxy, r4.zxy);
    ps = LightDirection.z * ps;
    r5.z = dot(r2.zxy, r3.zxy);
    r12.z = ps;
    r0.xyw = WorldToLocal[1].xzy * LightDirection.yyy + r12.xyz;
    r3.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r0.xwy;
    r2.xy = r11.zw * r3.yz;
    r2.w = dot(r11.yx, r3.zx) + 0.0;
    r0.xy = r10.zw * r3.xy;
    ps = r0.x + r0.y;
    r4.x = dot(r5.zxy, r3.zxy);
    r2.z = ps;
    r4.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.w;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.xyz = r13.xyz + r6.xyz;
    r5 = r9.xxxx * BoneMatrices[a0];
    r2 = r9.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r9.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = r9.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r5 = r9.yyyy * BoneMatrices[a0] + r5;
    r2 = r9.yyyy * BoneMatrices[a0 + 1] + r2;
    r0.xyw = r9.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r3.w = r9.y * BoneMatrices[a0 + 2].w + r3.w;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.x * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r5 = r9.zzzz * BoneMatrices[a0] + r5;
    r2 = r9.zzzz * BoneMatrices[a0 + 1] + r2;
    r0.xyw = r9.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r3.w = r9.z * BoneMatrices[a0 + 2].w + r3.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r5 = r9.wwww * BoneMatrices[a0] + r5;
    r2 = r9.wwww * BoneMatrices[a0 + 1] + r2;
    r0.xyw = r9.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r3.w = r9.w * BoneMatrices[a0 + 2].w + r3.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zxyy : 1.0;
    r1.x = dot(r5.zxyw, r6);
    r1.y = dot(r2.zxyw, r6);
    r0.x = dot(r3.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o0.xy = r7.zw;
    o1.xy = r7.xy;
    o2.xy = r10.xy;
    o3.xyz = r4.xyz;
    o5.xyz = r8.xyz;
    o6 = r14;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    return Out;
}
