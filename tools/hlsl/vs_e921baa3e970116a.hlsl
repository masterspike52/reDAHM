// vs_e921baa3e970116a.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 369 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000005C4 0021000C 00000000 00000000 00002863 00000001 00000006 00000003 00000290 0010000B 0000300C 0000600D 0000500E 0000100F 00215010 00003050 0001F151 0002F257 00001078 00001079 00001077
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> TANGENT0
//   vertex element: instruction 14 -> TEXCOORD0
//   vertex element: instruction 15 -> BLENDWEIGHT0
//   vertex element: instruction 16 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c8); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c15); // float3
float4 ProjectionMatrix[4] : register(c20); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c16); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 tangent0 : TANGENT0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r4 = In.position0;
    r3 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.yz = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.x = r0.w * 0.15915494 + 0.5;
    r5.xyz = r3.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.y;
    r6 = r4.wwww * LocalToWorld[3];
    r8.y = ps;
    r5.xyz = r3.zzz * LocalToWorld[2].xzy + r5.xzy;
    r7 = r4.zzzz * LocalToWorld[2] + r6;
    ps = (-0.5) + r0.z;
    r0.x = frac(r0.x);
    r8.z = ps;
    r6.x = r0.x * 6.2831855 - 3.1415927;
    r7 = r4.yyyy * LocalToWorld[1].xzwy + r7.xzwy;
    r5.xyz = r3.yyy * LocalToWorld[1].xyz + r5.xzy;
    r5.xyz = r3.xxx * LocalToWorld[0].xzy + r5.xzy;
    r7 = r4.xxxx * LocalToWorld[0].xwyz + r7.xzwy;
    ps = cos(r6.x);
    r1.xw = r8.yz * r1.yz;
    r0.x = ps;
    r10.xyz = -r7.xzw + CameraWorldPosition.xyz;
    r9.xyz = r7.wzx - r5.yzx;
    ps = sin(r6.x);
    r5 = r0.xxxx * CameraRight.wzyx;
    r8.w = ps;
    r6 = r8.wwww * CameraRight.wzyx;
    ps = (-1.0) * r0.x;
    r8.x = dot(r10.zxy, r10.zxy);
    r0.x = ps;
    r6 = r0.xxxx * CameraUp.wxzy + r6.xwyz;
    r5 = r8.wwww * CameraUp.wxzy + r5.xwyz;
    r5 = r5.xywz * ParticleUpRightResultScalars.xxxx;
    r6 = r6.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r5.x;
    r8.w = dot(r9.xzy, r9.xzy);
    ps = r1.z * ps;
    r8.xw = max(r8.xw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r8.x));
    r5.x = r0.x * r8.z;
    r0.x = ps;
    ps = rsqrt(abs(r8.w));
    r11.xyz = r10.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r9.zyx * r0.xxx;
    r0.x = ps;
    r5.yzw = -r12.xyz * ParticleUpRightResultScalars.yyy + r5.yzw;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r9.xyz = r11.zxy * r12.yzx;
    r10.xyz = r11.zxy * AxisRotationVectors[a0].yzx;
    r9.xyz = r11.xzy * r12.yxz - r9.zyx;
    r10.xyz = r11.xzy * AxisRotationVectors[a0].yxz - r10.zyx;
    r8.x = dot(r10.xzy, r10.xzy);
    ps = r6.x;
    r8.w = dot(r9.xzy, r9.xzy);
    ps = r1.y * ps;
    r8.xw = max(r8.xw, 0.01);
    r9.w = ps;
    ps = rsqrt(abs(r8.x));
    r6.x = r9.w * r8.y;
    r8.y = ps;
    ps = rsqrt(abs(r8.w));
    r8.xyz = r10.zyx * r8.yyy;
    r8.w = ps;
    r9.xyz = r9.zxy * r8.www;
    r6.yzw = r9.xyz * ParticleUpRightResultScalars.yyy + r6.ywz;
    r9.xyz = r8.xyz * AxisRotationVectors[a0].www;
    r8.xyz = (r0.xxx == 0.0) ? r9.xzy : AxisRotationVectors[a0].xzy;
    r9.xyz = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r9.xzy;
    r6.yzw = r9.yzx * ParticleUpRightResultScalars.zzz + r6.zwy;
    r5.yzw = r8.yzx * ParticleUpRightResultScalars.zzz + r5.wzy;
    r5.yzw = r1.www * r5.wyz;
    r6.yzw = r1.xxx * r6.wyz;
    r6 = r7.ywzx + r6.xzwy;
    r5 = r6.xywz + r5.xzyw;
    r0.x = r0.w * 0.15915494 + 0.5;
    r6.xyw = r3.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.y;
    r7 = r4.wwww * LocalToWorld[3];
    r6.z = ps;
    r8.xyz = r3.zzz * LocalToWorld[2].xzy + r6.xwy;
    r7 = r4.zzzz * LocalToWorld[2] + r7;
    ps = (-0.5) + r0.z;
    r0.x = frac(r0.x);
    r6.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r7 = r4.yyyy * LocalToWorld[1].xzwy + r7.xzwy;
    r3.yzw = r3.yyy * LocalToWorld[1].xyz + r8.xzy;
    r3.xyz = r3.xxx * LocalToWorld[0].xzy + r3.ywz;
    r4 = r4.xxxx * LocalToWorld[0].xwyz + r7.xzwy;
    ps = cos(r0.w);
    r6.xy = r6.zw * r1.yz;
    r0.x = ps;
    r9.xyz = -r4.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r3.xyz = r4.wzx - r3.yzx;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r8 = r1.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r7 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r9.zxy, r9.zxy);
    r0.x = ps;
    r7 = r1.wwww * CameraUp.wxzy + r7.xwyz;
    r8 = r0.xxxx * CameraUp.wxzy + r8.xwyz;
    ps = r1.z;
    r1.y = dot(r3.xzy, r3.xzy);
    ps = r7.x * ps;
    r1.yz = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r1.x = r0.x * r6.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r9.xyz = r9.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r10.xyz = r3.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.xyz = r9.zxy * r10.yzx;
    r1.yzw = r9.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r9.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r9.xyz = r9.xzy * r10.yxz - r3.zyx;
    r3.x = dot(r9.xzy, r9.xzy);
    ps = r0.w;
    r3.y = dot(r1.ywz, r1.ywz);
    ps = r8.x * ps;
    r3.yz = max(r3.xy, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r3.y));
    r3.x = r0.w * r6.z;
    r0.w = ps;
    ps = rsqrt(abs(r3.z));
    r9.xyz = r9.zxy * r0.www;
    r0.w = ps;
    r1.yzw = r1.wzy * r0.www;
    r3.yzw = r1.yzw * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r3.ywz : AxisRotationVectors[a0].xzy;
    r3.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r3.ywz;
    r3.yzw = r3.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r10.zxy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r3.yzw = r9.yzx * ParticleUpRightResultScalars.yyy + r3.zwy;
    r3.yzw = r8.yzw * ParticleUpRightResultScalars.xxx + r3.wyz;
    r1.yzw = r7.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r6.yyy * r1.yzw;
    r3.yzw = r6.xxx * r3.yzw;
    r3 = r4.ywzx + r3.xzwy;
    r3 = r3.xywz + r1.xwyz;
    r1 = r3.xxxx * ProjectionMatrix[3].xwzy;
    r1 = r3.yyyy * ProjectionMatrix[2].xwzy + r1;
    r1 = r3.wwww * ProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r3.zzzz * ProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r5.xxxx * ShadowMatrix[3].xwzy;
    r1 = r5.yyyy * ShadowMatrix[2].xwzy + r1;
    r1 = r5.wwww * ShadowMatrix[1].xzyw + r1.xzwy;
    o2 = r5.zzzz * ShadowMatrix[0] + r1.xzyw;
    o0.xy = r0.yz;
    o1 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    return Out;
}
