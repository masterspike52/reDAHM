// vs_6d7cdc12d9ea8e38.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 327 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000051C 0031000D 00000000 00000000 00003884 00000001 00000008 00000004 00000290 0010000D 0000600E 0000300F 00002010 00001011 00005012 00065013 00275014 00003050 0001F156 0002F2A0 0003F3A1 00001068 0000106B 0000106A 00001069
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> TANGENT0
//   vertex element: instruction 15 -> NORMAL0
//   vertex element: instruction 16 -> BLENDINDICES0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD0
//   vertex element: instruction 19 -> TEXCOORD6
//   vertex element: instruction 20 -> TEXCOORD7
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled control flow cjmp at cf 16

#include "xenos_common.hlsli"

float4 BoneMatrices[225] : register(c10); // float4x3 (matrix_columns)[75]
float4 LocalToWorld[4] : register(c6); // float4x4 (matrix_columns)
float4 MaxBoneInfluences : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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

    r4.xyz = In.position0.xyz;
    r2.xyz = In.tangent0.xyz;
    r5.xyz = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r7 = In.blendweight0;
    r8.xy = In.texcoord0.xy;
    r0.yzw = In.texcoord6.xyz;
    r3.xyz = In.texcoord7.xyz;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r1.y;
    r2.w = float((MaxBoneInfluences.x > 1.0));
    r0.x = ps;
    ps = 3.0 * r0.x;
    r3.xyz = r5.xyz + r3.xyz;
    r1.y = ps;
    r3.xyz = r3.xyz * 0.007843138 - 1.0;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.xyz = r7.xxx * BoneMatrices[a0].xyz;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r7.xxx * BoneMatrices[a0 + 1].xyz;
    r0.x = ps;
    r6.xyz = r3.xyz * r0.xxx;
    r0.x = dot(r6.zxy, r2.xzy);
    r2.xyz = -r6.xyz * r0.xxx + r2.zyx;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r0.x));
    r9.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    r0.x = ps;
    r3.xyz = r2.xyz * r0.xxx;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r6.zxy * r3.yzx;
    r2.xyz = r6.yzx * r3.zxy - r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r7.yyy * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r7.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r9.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r7.zzz * BoneMatrices[a0].xyz + r5.xyz;
    r10.xyz = r7.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r9.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r9.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r5.xyz = r7.www * BoneMatrices[a0].xyz + r5.xyz;
            r10.xyz = r7.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r9.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r9.xyz;
        }
    }
    r12.x = dot(r3.zxy, r5.zxy);
    r12.z = dot(r3.zxy, r9.zxy);
    ps = r4.x;
    r13.x = dot(r2.zxy, r9.zxy);
    ps = r0.y + ps;
    r13.y = dot(r2.zxy, r10.zxy);
    r11.x = ps;
    ps = r4.y;
    r13.z = dot(r2.zxy, r5.zxy);
    ps = r0.z + ps;
    r0.x = dot(r6.zxy, r10.zxy);
    r11.y = ps;
    ps = r4.z;
    r0.y = dot(r6.zxy, r5.zxy);
    ps = r0.w + ps;
    r0.z = dot(r6.zxy, r9.zxy);
    r11.z = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r12.w = dot(r3.zxy, r10.zxy);
    r3 = r7.xxxx * BoneMatrices[a0];
    r5 = r7.xxxx * BoneMatrices[a0 + 1];
    r4.xyz = r7.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r12.w;
    r11.w = r7.x * BoneMatrices[a0 + 2].w;
    r12.y = ps;
    ps = 0.5 * r0.x;
    r6.xyz = r13.xxy * r0.xyy;
    r6.w = ps;
    r2.xyz = r12.xwz * 0.5 + 0.5;
    r6.xyz = r13.yzz * r0.zzx - r6.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r12.xyz, r6.xyz);
    r6.y = ps;
    ps = 0.5 * r0.z;
    r6.x = r0.w * 0.5;
    r6.z = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0 = r6.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.yyyy * BoneMatrices[a0] + r3;
    r5 = r7.yyyy * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r7.yyy * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r7.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r2.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3 = r7.zzzz * BoneMatrices[a0] + r3;
    r5 = r7.zzzz * BoneMatrices[a0 + 1] + r5;
    r4.xyz = r7.zzz * BoneMatrices[a0 + 2].xyz + r4.xyz;
    r11.w = r7.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r1.x = ps;
            a0 = xe_mova(r1.x);
            ps = r1.x;
            r3 = r7.wwww * BoneMatrices[a0] + r3;
            r5 = r7.wwww * BoneMatrices[a0 + 1] + r5;
            r4.xyz = r7.www * BoneMatrices[a0 + 2].xyz + r4.xyz;
            r11.w = r7.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r4.zxyy : 1.0;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r2.w = dot(r3.zxyw, r4);
    r3.x = dot(r5.zxyw, r4);
    r1.x = dot(r11.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r1 = r3.xxxx * LocalToWorld[1].xzyw + r1.xzyw;
    r1 = r2.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r3 = r1.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r1.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    oPos = r1.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    o0.xy = r8.xy;
    o3.xyz = r2.xyz;
    o3.w = 0.0;
    o2 = r0;
    o1 = r1.xywz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    return Out;
}
