// vs_1b22c608a76d345b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 474 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000768 0031000D 00000000 00000000 00003884 00000001 00000008 00000004 00000290 00100014 00006015 00003016 00202017 00101019 0000501A 0026501B 0007501D 00003050 0001F157 0002F2A0 0003F3A1 0000109A 00001099 0000109C 0000109B
//   vertex element: instruction 20 -> POSITION0
//   vertex element: instruction 21 -> TANGENT0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> BLENDINDICES0
//   vertex element: instruction 25 -> BLENDWEIGHT0
//   vertex element: instruction 26 -> TEXCOORD0
//   vertex element: instruction 27 -> TEXCOORD6
//   vertex element: instruction 29 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r10.xyz = In.position0.xyz;
    r1.xyz = In.tangent0.xyz;
    r3.xyz = In.normal0.xyz;
    r2 = In.blendindices0.wxyz;
    ps = r2.z;
    r0.w = ps;
    r4 = In.blendweight0;
    r7.xy = In.texcoord0.xy;
    r6.xyz = In.texcoord6.xyz;
    ps = r2.w;
    r1.w = r2.y;
    r0.z = ps;
    r2.yzw = In.texcoord7.xyz;
    r1.xyz = r1.zyx * 0.007843138 - 1.0;
    ps = r1.w;
    r0.y = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r2.yzw = r3.xyz + r2.yzw;
    r0.x = ps;
    r3.yzw = r2.wzy * 0.007843138 - 1.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.x = dot(r3.ywz, r3.ywz);
    r2.yzw = r4.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r3.x));
    r9.xyz = r4.xxx * BoneMatrices[a0 + 1].xyz;
    r3.x = ps;
    r5.xyz = r3.wzy * r3.xxx;
    r3.x = dot(r5.zxy, r1.xzy);
    r3.xyz = -r5.zyx * r3.xxx + r1.xyz;
    r1.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r1.x));
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    r1.x = ps;
    ps = r2.x;
    r3.xyz = r3.zyx * r1.xxx;
    r2.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r5.zxy * r3.yzx;
    r1.xyz = r5.yzx * r3.zxy - r1.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r4.yyy * BoneMatrices[a0].xyz + r2.yzw;
    r9.xyz = r4.yyy * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r3.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yzw = r4.zzz * BoneMatrices[a0].xyz + r2.yzw;
    r9.xyz = r4.zzz * BoneMatrices[a0 + 1].xyz + r9.xyz;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r3.w = ps;
            a0 = xe_mova(r3.w);
            ps = r3.w;
            r2.yzw = r4.www * BoneMatrices[a0].xyz + r2.yzw;
            r9.xyz = r4.www * BoneMatrices[a0 + 1].xyz + r9.xyz;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
        }
    }
    r12.x = dot(r3.zxy, r2.wyz);
    r12.z = dot(r3.zxy, r8.zxy);
    ps = r10.x;
    r13.x = dot(r1.zxy, r8.zxy);
    ps = r6.x + ps;
    r13.y = dot(r1.zxy, r9.zxy);
    r11.x = ps;
    ps = r10.y;
    r13.z = dot(r1.zxy, r2.wyz);
    ps = r6.y + ps;
    r1.x = dot(r5.zxy, r9.zxy);
    r11.y = ps;
    ps = r10.z;
    r1.y = dot(r5.zxy, r2.wyz);
    ps = r6.z + ps;
    r1.z = dot(r5.zxy, r8.zxy);
    r11.z = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r12.w = dot(r3.zxy, r9.zxy);
    r3 = r4.xxxx * BoneMatrices[a0];
    r9 = r4.xxxx * BoneMatrices[a0 + 1];
    r8.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r12.w;
    r11.w = r4.x * BoneMatrices[a0 + 2].w;
    r12.y = ps;
    ps = 0.5 * r1.y;
    r5.xzw = r13.xxy * r1.xyy;
    r5.y = ps;
    r2.yzw = r12.xwz * 0.5 + 0.5;
    r5.xzw = r13.yzz * r1.zzx - r5.xzw;
    ps = 0.5 * r1.x;
    r0.x = dot(r12.xyz, r5.xzw);
    r5.z = ps;
    ps = 0.5 * r1.z;
    r5.x = r0.x * 0.5;
    r5.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5 = r5.yzwx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.w;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.yyyy * BoneMatrices[a0] + r3;
    r9 = r4.yyyy * BoneMatrices[a0 + 1] + r9;
    r8.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r11.w = r4.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r0.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r4.zzzz * BoneMatrices[a0] + r3;
    r9 = r4.zzzz * BoneMatrices[a0 + 1] + r9;
    r8.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r8.xyz;
    r11.w = r4.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r2.x;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r3 = r4.wwww * BoneMatrices[a0] + r3;
            r9 = r4.wwww * BoneMatrices[a0 + 1] + r9;
            r8.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r8.xyz;
            r11.w = r4.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r8.zxyy : 1.0;
    r12 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.x = dot(r3.zxyw, r12);
    r0.y = dot(r9.zxyw, r12);
    r1.x = dot(r11.zxyw, r8);
    r3 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r3 = r0.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r3 = r0.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    ps = 3.0 * r1.w;
    r0.x = float((MaxBoneInfluences.x > 1.0));
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r9.xyz = r6.xyz + r10.xyz;
    r1 = r4.xxxx * BoneMatrices[a0];
    r8 = r4.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r4.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.w = r4.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.x = r0.w * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.yyyy * BoneMatrices[a0] + r1;
    r8 = r4.yyyy * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r9.w = r4.y * BoneMatrices[a0 + 2].w + r9.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r0.z * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.zzzz * BoneMatrices[a0] + r1;
    r8 = r4.zzzz * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r9.w = r4.z * BoneMatrices[a0 + 2].w + r9.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.x = r2.x * 3.0;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r1 = r4.wwww * BoneMatrices[a0] + r1;
    r8 = r4.wwww * BoneMatrices[a0 + 1] + r8;
    r6.xyz = r4.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r9.w = r4.w * BoneMatrices[a0 + 2].w + r9.w;
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r9.zxyy : 1.0;
    r1.x = dot(r1.zxyw, r4);
    r1.y = dot(r8.zxyw, r4);
    r0.x = dot(r9.zxyw, r0);
    r0 = r0.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r0 = r1.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r1 = r1.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r1.zzzz * ProjectionMatrix[3].xwzy;
    r0 = r1.wwww * ProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.zzzz * ShadowMatrix[3].xwzy;
    r0 = r3.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r3.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r3.xxxx * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r7.xy;
    o3.xyz = r2.yzw;
    o3.w = 0.0;
    o2 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
