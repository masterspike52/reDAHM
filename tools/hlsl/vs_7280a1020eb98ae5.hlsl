// vs_7280a1020eb98ae5.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 699 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000AEC 00610011 00000000 00000000 000060E7 00000001 00000007 00000007 00000290 0010001C 0000601D 0000701E 0000301F 00002020 00001021 00205022 00003050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A1 000010E2 000010E4 000010E1 000010E5 000010E7 000010E6 000010E3
//   vertex element: instruction 28 -> POSITION0
//   vertex element: instruction 29 -> TANGENT0
//   vertex element: instruction 30 -> BINORMAL0
//   vertex element: instruction 31 -> NORMAL0
//   vertex element: instruction 32 -> BLENDINDICES0
//   vertex element: instruction 33 -> BLENDWEIGHT0
//   vertex element: instruction 34 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 22
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 40
// NOTE: unhandled control flow cjmp at cf 43
// NOTE: unhandled control flow cjmp at cf 46

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
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 blendindices0 : BLENDINDICES0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord0 : TEXCOORD0;
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

    r11.xyz = In.position0.xyz;
    r4.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.blendindices0.yxzw;
    r8 = In.blendweight0;
    r3.xy = In.texcoord0.xy;
    r7.xyz = r4.xyz * 0.007843138 - 1.0;
    r14.xyz = r2.xyz * 0.007843138 - 1.0;
    r13.xyz = r0.yzw * 0.007843138 - 1.0;
    r3.z = r1.y * 3.0;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r3.w = float((MaxBoneInfluences.x > 1.0));
    r0.yzw = r8.xxx * BoneMatrices[a0].xyz;
    r4.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yzw = r8.yyy * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r2.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r2.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yzw = r8.zzz * BoneMatrices[a0].xyz + r0.yzw;
    r4.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r4.xyz;
    r2.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r2.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r0.yzw = r8.www * BoneMatrices[a0].xyz + r0.yzw;
            r4.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r4.xyz;
            r2.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r2.xyz;
        }
    }
    r10.x = dot(r7.zxy, r0.wyz);
    r10.z = dot(r7.zxy, r2.zxy);
    r12.x = dot(r14.zxy, r2.zxy);
    r12.y = dot(r14.zxy, r4.zxy);
    r12.z = dot(r14.zxy, r0.wyz);
    r0.x = dot(r13.zxy, r4.zxy);
    r0.y = dot(r13.zxy, r0.wyz);
    r0.z = dot(r13.zxy, r2.zxy);
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r10.w = dot(r7.zxy, r4.zxy);
    r2 = r8.xxxx * BoneMatrices[a0];
    r9 = r8.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    ps = -r10.w;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    r10.y = ps;
    ps = 0.5 * r0.x;
    r4.xyz = r12.xxy * r0.xyy;
    r4.w = ps;
    r5.xyz = r10.xwz * 0.5 + 0.5;
    r4.xyz = r12.yzz * r0.zzx - r4.xyz;
    ps = 0.5 * r0.y;
    r0.w = dot(r10.xyz, r4.xyz);
    r4.y = ps;
    ps = 0.5 * r0.z;
    r4.x = r0.w * 0.5;
    r4.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4 = r4.ywzx + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r8.yyyy * BoneMatrices[a0] + r2;
    r9 = r8.yyyy * BoneMatrices[a0 + 1] + r9;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r0.y = ps;
    a0 = xe_mova(r0.y);
    ps = r0.y;
    r0.x = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r8.zzzz * BoneMatrices[a0] + r2;
    r9 = r8.zzzz * BoneMatrices[a0 + 1] + r9;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.x = ps;
            a0 = xe_mova(r0.x);
            ps = r0.x;
            r2 = r8.wwww * BoneMatrices[a0] + r2;
            r9 = r8.wwww * BoneMatrices[a0 + 1] + r9;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
            r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
        }
    }
    r0 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r0.x = dot(r11.zxyw, r0);
    r6.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r12.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r2.x = dot(r2.zxyw, r15);
    r2.y = dot(r9.zxyw, r15);
    r0 = r0.xxxx * LocalToWorld[2] + LocalToWorld[3];
    r0 = r2.yyyy * LocalToWorld[1].xzyw + r0.xzyw;
    r9 = r2.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0.xyw = -r9.yxw * CameraPosition.www + CameraPosition.yxz;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2 = r9.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r9.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r9.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r9 = r9.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.z = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.yyy * BoneMatrices[a0].xyz + r6.xyz;
    r12.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r10.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r0.z = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r8.zzz * BoneMatrices[a0].xyz + r6.xyz;
    r12.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r12.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r10.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.z = ps;
            a0 = xe_mova(r0.z);
            ps = r0.z;
            r6.xyz = r8.www * BoneMatrices[a0].xyz + r6.xyz;
            r12.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r12.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r10.xyz;
        }
    }
    r2.y = dot(r13.zxy, r6.zxy);
    r2.z = dot(r13.zxy, r12.zxy);
    r15.x = dot(r14.zxy, r6.zxy);
    r15.y = dot(r14.zxy, r10.zxy);
    r15.z = dot(r14.zxy, r12.zxy);
    ps = WorldToLocal[2].x * r0.w;
    r15.w = dot(r13.zxy, r10.zxy);
    r17.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r16.x = dot(r7.zxy, r6.zxy);
    r17.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r16.y = dot(r7.zxy, r12.zxy);
    r17.z = ps;
    a0 = xe_mova(r3.z);
    ps = r3.z;
    r16.z = dot(r7.zxy, r10.zxy);
    r0.xzw = r0.xxx * WorldToLocal[1].xzy + r17.xyz;
    r10.xyz = r8.xxx * BoneMatrices[a0 + 1].xyz;
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    r0.xyz = r0.yyy * WorldToLocal[0].xyz + r0.xwz;
    r2.x = dot(r16.zxy, r0.zxy);
    r12.xy = r15.zw * r0.yz;
    r12.w = dot(r15.yx, r0.zx) + 0.0;
    r2.yz = r2.yz * r0.xy;
    ps = r2.y + r2.z;
    r0.xyz = r8.xxx * BoneMatrices[a0].xyz;
    r12.z = ps;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.yz = r12.xz + r12.wy;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.x;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r8.yyy * BoneMatrices[a0].xyz + r0.xyz;
    r10.xyz = r8.yyy * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    // UNHANDLED control flow: cjmp
    ps = 3.0 * r1.z;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r8.zzz * BoneMatrices[a0].xyz + r0.xyz;
    r10.xyz = r8.zzz * BoneMatrices[a0 + 1].xyz + r10.xyz;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    if (p0)
    {
        if (p0)
        {
            ps = 3.0 * r1.w;
            r0.w = ps;
            a0 = xe_mova(r0.w);
            ps = r0.w;
            r0.xyz = r8.www * BoneMatrices[a0].xyz + r0.xyz;
            r10.xyz = r8.www * BoneMatrices[a0 + 1].xyz + r10.xyz;
            r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
        }
    }
    r3.z = dot(r14.zxy, r0.zxy);
    r3.w = dot(r14.zxy, r10.zxy);
    r15.x = dot(r13.zxy, r0.zxy);
    ps = LightDirection.z;
    r15.y = dot(r13.zxy, r6.zxy);
    ps = WorldToLocal[2].x * ps;
    r14.x = dot(r14.zxy, r6.zxy);
    r16.x = ps;
    ps = LightDirection.z;
    r14.y = dot(r13.zxy, r10.zxy);
    ps = WorldToLocal[2].y * ps;
    r12.x = dot(r7.zxy, r0.zxy);
    r16.y = ps;
    ps = LightDirection.z;
    r12.y = dot(r7.zxy, r6.zxy);
    ps = WorldToLocal[2].z * ps;
    r12.z = dot(r7.zxy, r10.zxy);
    r16.z = ps;
    r0.xyz = LightDirection.yyy * WorldToLocal[1].xyz + r16.xyz;
    r7.xyz = LightDirection.xxx * WorldToLocal[0].xzy + r0.xzy;
    r6.yz = r14.xy * r7.yz;
    r6.w = dot(r15.yx, r7.yx) + 0.0;
    r0.yz = r3.zw * r7.xz;
    ps = r0.y + r0.z;
    r0.x = dot(r12.yxz, r7.yxz);
    r6.x = ps;
    r0.yz = r6.xz + r6.yw;
    r2.w = r1.y * 3.0;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r0.w = float((MaxBoneInfluences.x > 1.0));
    r10 = r8.xxxx * BoneMatrices[a0];
    r7 = r8.xxxx * BoneMatrices[a0 + 1];
    r6.xyz = r8.xxx * BoneMatrices[a0 + 2].xyz;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.w = r8.x * BoneMatrices[a0 + 2].w;
    // UNHANDLED control flow: cjmp
    r0.w = r1.x * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r8.yyyy * BoneMatrices[a0] + r10;
    r7 = r8.yyyy * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r8.yyy * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r11.w = r8.y * BoneMatrices[a0 + 2].w + r11.w;
    r0.w = float((MaxBoneInfluences.x > 2.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.z * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r8.zzzz * BoneMatrices[a0] + r10;
    r7 = r8.zzzz * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r8.zzz * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r11.w = r8.z * BoneMatrices[a0 + 2].w + r11.w;
    r0.w = float((MaxBoneInfluences.x > 3.0));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0.w = r1.w * 3.0;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r10 = r8.wwww * BoneMatrices[a0] + r10;
    r7 = r8.wwww * BoneMatrices[a0 + 1] + r7;
    r6.xyz = r8.www * BoneMatrices[a0 + 2].xyz + r6.xyz;
    r11.w = r8.w * BoneMatrices[a0 + 2].w + r11.w;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r6.zxyy : 1.0;
    r6 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r11.zxyy : 1.0;
    r0.w = dot(r10.zxyw, r6);
    r2.w = dot(r7.zxyw, r6);
    r1.x = dot(r11.zxyw, r1);
    r1 = r1.xxxx * LocalToWorld[2].xwzy + LocalToWorld[3].xwzy;
    r1 = r2.wwww * LocalToWorld[1].xzyw + r1.xzwy;
    r6 = r0.wwww * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r6.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r6.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o2.x = ps;
    o2.yzw = 0.0;
    o0.xy = r3.xy;
    o6.xyz = r5.xyz;
    o6.w = 0.0;
    o1.xyz = r0.xyz;
    o3.xyz = r2.xyz;
    o5 = r4;
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
