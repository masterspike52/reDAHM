// vs_8a4f31017e774926.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 480 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000780 0041000E 00000000 00000000 000040A5 00000001 00000009 00000005 00000290 00100014 00006015 00003016 00202017 00001019 0010501B 0001501C 0006501D 0027501E 00003050 00013151 0002F257 0003F3A0 0004F4A1 0000109B 0000109C 0000109A 0000109E 0000109D
//   vertex element: instruction 20 -> POSITION0
//   vertex element: instruction 21 -> TANGENT0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> BLENDINDICES0
//   vertex element: instruction 25 -> BLENDWEIGHT0
//   vertex element: instruction 27 -> TEXCOORD0
//   vertex element: instruction 28 -> TEXCOORD1
//   vertex element: instruction 29 -> TEXCOORD6
//   vertex element: instruction 30 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled control flow cjmp at cf 30

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c10); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ProjectionMatrix[4] : register(c239); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c235); // float4x4 (matrix_columns)

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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r11.xyz = In.position0.xyz;
    r3.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0.wxyz;
    ps = r1.z;
    r0.w = ps;
    r4 = In.blendweight0;
    ps = r1.w;
    r1.z = r1.y;
    r0.z = ps;
    r1.yw = In.texcoord0.xy;
    r9.xy = In.texcoord1.xy;
    r6.xyz = In.texcoord6.xyz;
    r2.xyz = In.texcoord7.xyz;
    r3.xyz = r3.zyx * 0.007843138 - 1.0;
    ps = r1.z;
    r0.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r2.xyz = r5.xyz + r2.xyz;
    r0.x = ps;
    r5.xyz = r2.zyx * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.x = dot(r5.xzy, r5.xzy);
    r2.yzw = r4.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r2.x));
    r10.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r2.x = ps;
    r7.xyz = r5.zyx * r2.xxx;
    r2.x = dot(r7.zxy, r3.xzy);
    r3.xyz = -r7.zyx * r2.xxx + r3.xyz;
    r2.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r2.x));
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = ps;
    ps = r1.x;
    r3.xyz = r3.zyx * r2.xxx;
    r1.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r7.zxy * r3.yzx;
    r5.xyz = r7.yzx * r3.zxy - r5.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r4.yyy * BoneMatrices[a0].xyz + r2.yzw;
    r10.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r2.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r4.zzz * BoneMatrices[a0].xyz + r2.yzw;
    r10.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r2.x = ps;
            a0 = xe_mova(r2.x);
            ps = r2.x;
            r2.yzw = r4.www * BoneMatrices[a0].xyz + r2.yzw;
            r10.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r13.x = dot(r3.zxy, r2.wyz);
    r13.z = dot(r3.zxy, r8.zxy);
    ps = r11.x;
    r14.x = dot(r5.zxy, r8.zxy);
    ps = r6.x + ps;
    r14.y = dot(r5.zxy, r10.zxy);
    r12.x = ps;
    ps = r11.y;
    r14.z = dot(r5.zxy, r2.wyz);
    ps = r6.y + ps;
    r2.x = dot(r7.zxy, r10.zxy);
    r12.y = ps;
    ps = r11.z;
    r2.y = dot(r7.zxy, r2.wyz);
    ps = r6.z + ps;
    r2.z = dot(r7.zxy, r8.zxy);
    r12.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r13.w = dot(r3.zxy, r10.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r10 = r4.xxxx * BoneMatrices[a0 + 1];
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r13.w;
    r12.w = r4.x * BoneMatrices[a0 + 2].w;
    r13.y = ps;
    ps = 0.5 * r2.y;
    r7.xzw = r14.xxy * r2.xyy;
    r7.y = ps;
    r5.xyz = r13.xwz * 0.5 + 0.5;
    r7.xzw = r14.yzz * r2.zzx - r7.xzw;
    ps = 0.5 * r2.x;
    r0.x = dot(r13.xyz, r7.xzw);
    r7.z = ps;
    ps = 0.5 * r2.z;
    r7.x = r0.x * 0.5;
    r7.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7 = r7.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r10 = r4.yyyy * BoneMatrices[a0 + 1] + r10;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r12.w = r4.y * BoneMatrices[a0 + 2].w + r12.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r10 = r4.zzzz * BoneMatrices[a0 + 1] + r10;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r12.w = r4.z * BoneMatrices[a0 + 2].w + r12.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.x;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r10 = r4.wwww * BoneMatrices[a0 + 1] + r10;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r12.w = r4.w * BoneMatrices[a0 + 2].w + r12.w;
        }
    }
    r2 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r12.zxyy : 1.0;
    r0.x = dot(r3.zxyw, r8);
    r0.y = dot(r10.zxyw, r8);
    r2.x = dot(r12.zxyw, r2);
    r2 = r2.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r2 = r0.yyyy * LocalToWorld[1].xzyw + r2.xzwy;
    r3 = r0.xxxx * LocalToWorld[0].xywz + r2.xzwy;
    ps = 3.0 * r1.z;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r10.xyz = r6.xyz + r11.xyz;
    r2 = r4.xxxx * BoneMatrices[a0];
    r8 = r4.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.yyyy * BoneMatrices[a0] + r2;
    r8 = r4.yyyy * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r10.w = r4.y * BoneMatrices[a0 + 2].w + r10.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.zzzz * BoneMatrices[a0] + r2;
    r8 = r4.zzzz * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r10.w = r4.z * BoneMatrices[a0 + 2].w + r10.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r1.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2 = r4.wwww * BoneMatrices[a0] + r2;
    r8 = r4.wwww * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r10.w = r4.w * BoneMatrices[a0 + 2].w + r10.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r10.zxyy : 1.0;
    r1.x = dot(r2.zxyw, r4);
    r1.z = dot(r8.zxyw, r4);
    r0.x = dot(r10.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.zzzz * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r2.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r2.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ShadowMatrix[3].xwzy;
    r0 = r3.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o2 = r3.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r1.yw;
    o1.xy = r9.xy;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o3 = r7;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
