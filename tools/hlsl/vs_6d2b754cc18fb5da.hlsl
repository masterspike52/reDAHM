// vs_6d2b754cc18fb5da.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 600 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000960 00410012 00000000 00000000 000044A5 00000001 00000008 00000005 00000290 00100018 00006019 0000301A 0020201B 0010101D 0000501E 0006501F 00275020 00003050 0001F156 00027257 0003F3A0 0004F4A1 000010C4 000010C3 000010C2 000010C6 000010C5
//   vertex element: instruction 24 -> POSITION0
//   vertex element: instruction 25 -> TANGENT0
//   vertex element: instruction 26 -> NORMAL0
//   vertex element: instruction 27 -> BLENDINDICES0
//   vertex element: instruction 29 -> BLENDWEIGHT0
//   vertex element: instruction 30 -> TEXCOORD0
//   vertex element: instruction 31 -> TEXCOORD6
//   vertex element: instruction 32 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38

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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r9.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    ps = r1.z;
    r1.z = r1.y;
    r0.z = ps;
    r10 = In.blendweight0;
    r4.xy = In.texcoord0.xy;
    r8.xyz = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r5.xyz + r3.xyz;
    r2.w = ps;
    r3.yzw = r3.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r3.x = dot(r3.ywz, r3.ywz);
    r0.xyw = r10.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r6.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r13.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r13.zxy, r2.xzy);
    r5.xyz = -r13.zyx * r3.xxx + r2.xyz;
    ps = r1.x;
    r2.x = dot(r5.xzy, r5.xzy);
    r1.x = ps;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.w;
    r15.xyz = r5.zyx * r2.xxx;
    r1.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r13.zxy * r15.yzx;
    r5.xyz = r13.yzx * r15.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r10.yyy * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r3.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r3.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyw = r10.zzz * BoneMatrices[a0].xyz + r0.xyw;
    r6.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r6.xyz;
    r3.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r3.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r0.xyw = r10.www * BoneMatrices[a0].xyz + r0.xyw;
            r6.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r6.xyz;
            r3.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r3.xyz;
        }
    }
    r11.x = dot(r15.zxy, r0.wxy);
    r11.z = dot(r15.zxy, r3.zxy);
    ps = r9.x;
    r12.x = dot(r5.zxy, r3.zxy);
    ps = r8.x + ps;
    r12.y = dot(r5.zxy, r6.zxy);
    r16.x = ps;
    ps = r9.y;
    r12.z = dot(r5.zxy, r0.wxy);
    ps = r8.y + ps;
    r2.x = dot(r13.zxy, r6.zxy);
    r16.y = ps;
    ps = r9.z;
    r2.y = dot(r13.zxy, r0.wxy);
    ps = r8.z + ps;
    r2.z = dot(r13.zxy, r3.zxy);
    r16.z = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r11.w = dot(r15.zxy, r6.zxy);
    r3 = r10.xxxx * BoneMatrices[a0];
    r14 = r10.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r10.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r11.w;
    r16.w = r10.x * BoneMatrices[a0 + 2].w;
    r11.y = ps;
    ps = 0.5 * r2.x;
    r6.xyz = r12.xxy * r2.xyy;
    r6.w = ps;
    r7.xyz = r11.xwz * 0.5 + 0.5;
    r6.xyz = r12.yzz * r2.zzx - r6.xyz;
    ps = 0.5 * r2.y;
    r4.z = dot(r11.xyz, r6.xyz);
    r6.y = ps;
    ps = 0.5 * r2.z;
    r6.x = r4.z * 0.5;
    r6.z = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6 = r6.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r10.yyyy * BoneMatrices[a0] + r3;
    r14 = r10.yyyy * BoneMatrices[a0 + 1] + r14;
    r0.xyw = r10.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r16.w = r10.y * BoneMatrices[a0 + 2].w + r16.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.y = ps;
    a0 = xe_mova(r2.y);
    ps = r2.y;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r10.zzzz * BoneMatrices[a0] + r3;
    r14 = r10.zzzz * BoneMatrices[a0 + 1] + r14;
    r0.xyw = r10.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r16.w = r10.z * BoneMatrices[a0 + 2].w + r16.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r3 = r10.wwww * BoneMatrices[a0] + r3;
            r14 = r10.wwww * BoneMatrices[a0 + 1] + r14;
            r0.xyw = r10.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
            r16.w = r10.w * BoneMatrices[a0 + 2].w + r16.w;
        }
    }
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r18 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r16.zxyy : 1.0;
    r2.xyz = r10.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r10.xxx * BoneMatrices[a0 + 1].xyz;
    r11.xyz = r10.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = dot(r3.zxyw, r18);
    r0.y = dot(r14.zxyw, r18);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = dot(r16.zxyw, r17);
    r3 = r0.wwww * LocalToWorld[2] + LocalToWorld[3];
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3.xzyw;
    r3 = r0.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    r0.xyw = -r3.yxw * CameraPosition.www + CameraPosition.yxz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r10.yyy * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r10.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r10.yyy * BoneMatrices[a0 + 2].xyz + r11.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r1.y = float((MaxBoneInfluences.x > 3.0));
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r10.zzz * BoneMatrices[a0].xyz + r2.xyz;
    r12.xyz = r10.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r11.xyz = r10.zzz * BoneMatrices[a0 + 2].xyz + r11.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.y = ps;
            a0 = xe_mova(r1.y);
            ps = r1.y;
            r2.xyz = r10.www * BoneMatrices[a0].xyz + r2.xyz;
            r12.xyz = r10.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r11.xyz = r10.www * BoneMatrices[a0 + 2].xyz + r11.xyz;
        }
    }
    r4.z = dot(r13.zxy, r2.zxy);
    r4.w = dot(r13.zxy, r12.zxy);
    r14.x = dot(r5.zxy, r2.zxy);
    r14.y = dot(r5.zxy, r11.zxy);
    r14.z = dot(r5.zxy, r12.zxy);
    r14.w = dot(r13.zxy, r11.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r13.x = dot(r15.zxy, r2.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r13.y = dot(r15.zxy, r12.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r13.z = dot(r15.zxy, r11.zxy);
    r2.z = ps;
    r2.xyz = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r5.xyz = r0.yyy * WorldToLocal[0].xyz + r2.xzy;
    r2.xy = r14.zw * r5.yz;
    r2.w = dot(r14.yx, r5.zx) + 0.0;
    r0.xy = r4.zw * r5.xy;
    ps = r0.x + r0.y;
    r5.x = dot(r13.zxy, r5.zxy);
    r2.z = ps;
    r5.yz = r2.xz + r2.wy;
    ps = 3.0 * r1.z;
    r1.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r9.xyz = r8.xyz + r9.xyz;
    r2 = r10.xxxx * BoneMatrices[a0];
    r8 = r10.xxxx * BoneMatrices[a0 + 1];
    r0.xyw = r10.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r10.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r1.x = r1.x * 3.0;
    a0 = xe_mova(r1.x);
    ps = r1.x;
    r2 = r10.yyyy * BoneMatrices[a0] + r2;
    r8 = r10.yyyy * BoneMatrices[a0 + 1] + r8;
    r0.xyw = r10.yyy * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r10.y * BoneMatrices[a0 + 2].w + r9.w;
    r1.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r0.z * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r10.zzzz * BoneMatrices[a0] + r2;
    r8 = r10.zzzz * BoneMatrices[a0 + 1] + r8;
    r0.xyw = r10.zzz * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r10.z * BoneMatrices[a0 + 2].w + r9.w;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.z = r1.w * 3.0;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r2 = r10.wwww * BoneMatrices[a0] + r2;
    r8 = r10.wwww * BoneMatrices[a0 + 1] + r8;
    r0.xyw = r10.www * BoneMatrices[a0 + 2].xyz + r0.xyw;
    r9.w = r10.w * BoneMatrices[a0 + 2].w + r9.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r0.wxyy : 1.0;
    r10 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r10);
    r1.y = dot(r8.zxyw, r10);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r3.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o2.xyz = r5.xyz;
    o1 = r3.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r4.xy;
    o4.xyz = r7.xyz;
    o4.w = 0.0;
    o3 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
