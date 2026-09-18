// vs_cb232cc10c91503d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 480 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000780 0031000E 00000000 00000000 00002C84 00000001 00000009 00000004 00000290 00100013 00006014 00003015 00202016 00101018 00005019 0001501A 0006501B 0027501C 00003050 00013151 0002F256 00037357 0000109D 0000109E 0000109C 0000109B
//   vertex element: instruction 19 -> POSITION0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> NORMAL0
//   vertex element: instruction 22 -> BLENDINDICES0
//   vertex element: instruction 24 -> BLENDWEIGHT0
//   vertex element: instruction 25 -> TEXCOORD0
//   vertex element: instruction 26 -> TEXCOORD1
//   vertex element: instruction 27 -> TEXCOORD6
//   vertex element: instruction 28 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 29

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c13); // float4x3 (matrix_columns)[75]
float4 CameraPosition : register(c4); // float4
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r10.xyz = In.position0.xyz;
    r11.xyz = In.tangent0.zyx;
    r2.xyz = In.normal0.zyx;
    r1 = In.blendindices0.yxzw;
    ps = r1.z;
    r1.z = r1.y;
    r0.z = ps;
    r3 = In.blendweight0;
    r4.zw = In.texcoord0.xy;
    r4.xy = In.texcoord1.xy;
    r6.xyz = In.texcoord6.xyz;
    r5.xyz = In.texcoord7.zyx;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r9.xyz = r10.xyz + r6.xyz;
    r7 = r3.xxxx * BoneMatrices[a0];
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r3.x * BoneMatrices[a0 + 2].w;
    ps = r1.w;
    r8.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r1.w = ps;
    ps = r1.x;
    r12 = r3.xxxx * BoneMatrices[a0 + 1];
    r1.x = ps;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r3.yyyy * BoneMatrices[a0] + r7;
    r12 = r3.yyyy * BoneMatrices[a0 + 1] + r12;
    r8.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r9.w = r3.y * BoneMatrices[a0 + 2].w + r9.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r0.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r3.zzzz * BoneMatrices[a0] + r7;
    r12 = r3.zzzz * BoneMatrices[a0 + 1] + r12;
    r8.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r9.w = r3.z * BoneMatrices[a0 + 2].w + r9.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.y = ps;
            a0 = xe_mova(r0.y);
            ps = r0.y;
            r7 = r3.wwww * BoneMatrices[a0] + r7;
            r12 = r3.wwww * BoneMatrices[a0 + 1] + r12;
            r8.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r9.w = r3.w * BoneMatrices[a0 + 2].w + r9.w;
        }
    }
    r13.xyz = r11.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.xyz = r2.xyz + r5.xyz;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r14 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r8.xyz = r3.xxx * BoneMatrices[a0].xyz;
    r11.xyz = r3.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = dot(r12.zxyw, r14);
    r0.w = dot(r9.zxyw, r5);
    r5.xyz = r2.xyz * 0.007843138 - 1.0;
    r0.y = dot(r5.xzy, r5.xzy);
    r2 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r2 = r0.xxxx * LocalToWorld[1].xzyw + r2.xzyw;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r7.zxyw, r14);
    r0.y = ps;
    r12.xyz = r5.zyx * r0.yyy;
    r7 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    r0.xyw = -r7.yxw * CameraPosition.www + CameraPosition.yxz;
    r2.x = dot(r12.zxy, r13.xzy);
    r2.yzw = -r12.zyx * r2.xxx + r13.xyz;
    r2.x = dot(r2.ywz, r2.ywz);
    ps = rsqrt(abs(r2.x));
    r9.xyz = r3.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    r5.xyz = r2.wzy * r2.xxx;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r12.zxy * r5.yzx;
    r2.xyz = r12.yzx * r5.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r3.yyy * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r3.yyy * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r9.xyz = r3.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xyz = r3.zzz * BoneMatrices[a0].xyz + r8.xyz;
    r11.xyz = r3.zzz * BoneMatrices[a0 + 1].xyz + r11.xyz;
    r9.xyz = r3.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r8.xyz = r3.www * BoneMatrices[a0].xyz + r8.xyz;
            r11.xyz = r3.www * BoneMatrices[a0 + 1].xyz + r11.xyz;
            r9.xyz = r3.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r13.x = dot(r12.zxy, r8.zxy);
    r13.y = dot(r12.zxy, r11.zxy);
    r13.z = dot(r2.zxy, r8.zxy);
    r13.w = dot(r2.zxy, r9.zxy);
    r14.x = dot(r2.zxy, r11.zxy);
    r14.y = dot(r12.zxy, r9.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r8.x = dot(r5.zxy, r8.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r8.y = dot(r5.zxy, r11.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r8.z = dot(r5.zxy, r9.zxy);
    r2.z = ps;
    r2.xyz = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r2.xyz = r0.yyy * WorldToLocal[0].xyz + r2.xzy;
    r5.xy = r14.xy * r2.yz;
    r5.w = dot(r13.wz, r2.zx) + 0.0;
    r0.xy = r13.xy * r2.xy;
    ps = r0.x + r0.y;
    r2.x = dot(r8.zxy, r2.zxy);
    r5.z = ps;
    r2.yz = r5.xz + r5.wy;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r8.xyz = r6.xyz + r10.xyz;
    r5 = r3.xxxx * BoneMatrices[a0];
    r6 = r3.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r3.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r3.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r5 = r3.yyyy * BoneMatrices[a0] + r5;
    r6 = r3.yyyy * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r3.y * BoneMatrices[a0 + 2].w + r8.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r5 = r3.zzzz * BoneMatrices[a0] + r5;
    r6 = r3.zzzz * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r3.z * BoneMatrices[a0 + 2].w + r8.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r5 = r3.wwww * BoneMatrices[a0] + r5;
    r6 = r3.wwww * BoneMatrices[a0 + 1] + r6;
    r0.xyw = r3.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r8.w = r3.w * BoneMatrices[a0 + 2].w + r8.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r1.x = dot(r5.zxyw, r3);
    r1.y = dot(r6.zxyw, r3);
    r0.x = dot(r8.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r7.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o3.xyz = r2.xyz;
    o2 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r4.zw;
    o1.xy = r4.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
