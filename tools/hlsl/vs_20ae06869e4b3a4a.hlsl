// vs_20ae06869e4b3a4a.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 429 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006B4 0041000E 00000000 00000000 000048A5 00000001 00000006 00000005 00000290 0010000D 0000300E 0000600F 00005010 00001011 00215012 00003050 0001F151 0002F257 0003F3A0 0004F4A1 0000108A 0000108D 00001089 0000108C 0000108B
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
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
    int a0 = 0;

    r7 = In.position0;
    r6 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r1.x = In.blendweight0.x;
    r5 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r10.x = CameraUp.x * (-1.0);
    r1.w = ps;
    r4.zw = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r2.xyz = r6.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.z;
    r3 = r7.wwww * LocalToWorld[3];
    r12.x = ps;
    r2.xyz = r6.zzz * LocalToWorld[2].xzy + r2.xzy;
    r3 = r7.zzzz * LocalToWorld[2] + r3;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r12.y = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r3 = r7.yyyy * LocalToWorld[1] + r3;
    r2.xyz = r6.yyy * LocalToWorld[1].xyz + r2.xzy;
    r2.xyz = r6.xxx * LocalToWorld[0].xzy + r2.xzy;
    r11 = r7.xxxx * LocalToWorld[0] + r3;
    ps = cos(r0.y);
    r4.xy = r12.xy * r1.yz;
    r0.x = ps;
    r10.yzw = -r11.xyz + CameraWorldPosition.xyz;
    r8.xyz = r11.zyx - r2.yzx;
    ps = sin(r0.y);
    r3 = r0.xxxx * CameraRight.zyxw;
    r0.y = ps;
    r2 = r0.yyyy * CameraRight.zxyw;
    ps = (-1.0) * r0.x;
    r12.z = dot(r10.wyz, r10.wyz);
    r8.w = ps;
    r9 = r8.wwww * CameraUp.zyxw + r2.xzyw;
    r3 = r0.yyyy * CameraUp.zyxw + r3;
    r3 = r3.zyxw * ParticleUpRightResultScalars.xxxx;
    r9 = r9.wzyx * ParticleUpRightResultScalars.xxxx;
    ps = r3.w;
    r12.w = dot(r8.xzy, r8.xzy);
    ps = r1.z * ps;
    r2.zw = max(r12.zw, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r2.z));
    r2.x = r0.y * r12.y;
    r0.y = ps;
    ps = rsqrt(abs(r2.w));
    r14.xyz = r10.yzw * r0.yyy;
    r0.y = ps;
    r13.xyz = r8.zyx * r0.yyy;
    r3.yzw = -r13.xyz * ParticleUpRightResultScalars.yyy + r3.xyz;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r8.xyz = r14.zxy * r13.yzx;
    r10.yzw = r14.zxy * AxisRotationVectors[a0].yzx;
    r10.yzw = r14.xzy * AxisRotationVectors[a0].yxz - r10.wzy;
    r8.xyz = r14.xzy * r13.yxz - r8.zyx;
    r12.z = dot(r8.xzy, r8.xzy);
    ps = r9.x;
    r12.w = dot(r10.ywz, r10.ywz);
    ps = r1.y * ps;
    r2.zw = max(r12.zw, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r2.z));
    r9.x = r0.y * r12.x;
    r0.y = ps;
    ps = rsqrt(abs(r2.w));
    r8.xyz = r8.zxy * r0.yyy;
    r0.y = ps;
    r10 = r10.xwzy * r0.xyyy;
    r8.w = r10.x + r2.y;
    r2.yzw = r10.yzw * AxisRotationVectors[a0].www;
    r0.xy = (-abs(r4.zz) >= 0.0) ? AxisRotationVectors[a0].yz : r2.zw;
    r12 = (-abs(r4.zwww) >= 0.0) ? AxisRotationVectors[a0].xzyx : r2.ywzy;
    r2.yzw = (r1.www == 0.0) ? r2.ywz : AxisRotationVectors[a0].xzy;
    r10.xyz = r2.zwy * ParticleUpRightResultScalars.zzz + r3.wzy;
    r8 = r8.xzyw * ParticleUpRightResultScalars.yyyx;
    ps = r8.w + r8.x;
    r2.yzw = r9.ywz + r8.xzy;
    r3.x = ps;
    r8.x = r12.x * ParticleUpRightResultScalars.z + r2.y;
    r8.zw = r0.yx * ParticleUpRightResultScalars.zz + r2.zw;
    ps = -r8.w;
    r9.yw = r4.xx * r8.wz;
    r8.y = ps;
    r3 = r12.ywzx * ParticleUpRightResultScalars.zzzz + r3.wyzx;
    ps = r4.x;
    r2.yzw = r4.yyy * r3.yzx;
    r4.xyz = r8.xwz * 0.5 + 0.5;
    ps = r3.w * ps;
    r3.xyz = r8.zxw * r10.yxz;
    r9.z = ps;
    r9 = r11.wyxz + r9;
    r3.xyz = r8.xzw * r10.yzx - r3.zyx;
    r0.x = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r0.x));
    r2 = r9.xwyz + r2.xwzy;
    r0.x = ps;
    r3.xyz = r3.xyz * r0.xxx;
    r9.xyz = r3.yzz * r10.xxy;
    r9.xyz = r3.xxy * r10.yzz - r9.xyz;
    r3.w = dot(r8.xyz, r9.xyz);
    r3 = r3.zyxw * 0.5 + 0.5;
    r0.x = r1.x * 0.15915494 + 0.5;
    r8.xyw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r9 = r7.wwww * LocalToWorld[3].xwzy;
    r8.z = ps;
    r10.xyz = r6.zzz * LocalToWorld[2].xyz + r8.xwy;
    r9 = r7.zzzz * LocalToWorld[2].xwzy + r9;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r9 = r7.yyyy * LocalToWorld[1].xzyw + r9.xzwy;
    r6.yzw = r6.yyy * LocalToWorld[1].xzy + r10.xzy;
    r6.xyz = r6.xxx * LocalToWorld[0].xyz + r6.ywz;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r9.xzwy;
    ps = cos(r0.y);
    r8.xy = r8.zw * r1.yz;
    r0.x = ps;
    r11.xyz = -r7.xyw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r6.xyz = r7.wyx - r6.zyx;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r10 = r1.wwww * CameraRight.wzyx;
    r0.y = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r9 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    r9 = r1.wwww * CameraUp.wxzy + r9.xwyz;
    r10 = r0.xxxx * CameraUp.wxzy + r10.xwyz;
    ps = r1.z;
    r1.y = dot(r6.xzy, r6.xzy);
    ps = r9.x * ps;
    r1.yz = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r1.x = r0.x * r8.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r11.xyz = r11.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r6.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6.xyz = r11.zxy * r12.yzx;
    r1.yzw = r11.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r11.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r11.xyz = r11.xzy * r12.yxz - r6.zyx;
    r6.x = dot(r11.xzy, r11.xzy);
    ps = r0.y;
    r6.y = dot(r1.ywz, r1.ywz);
    ps = r10.x * ps;
    r6.yz = max(r6.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r0.y * r8.z;
    r0.y = ps;
    ps = rsqrt(abs(r6.z));
    r11.xyz = r11.zxy * r0.yyy;
    r0.y = ps;
    r1.yzw = r1.wzy * r0.yyy;
    r6.yzw = r1.yzw * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r6.ywz : AxisRotationVectors[a0].xzy;
    r6.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r6.ywz;
    r6.yzw = r6.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r12.zxy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r6.yzw = r11.yzx * ParticleUpRightResultScalars.yyy + r6.zwy;
    r6.yzw = r10.yzw * ParticleUpRightResultScalars.xxx + r6.wyz;
    r1.yzw = r9.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r8.yyy * r1.yzw;
    r6.yzw = r8.xxx * r6.yzw;
    r6 = r7.zwyx + r6.xzwy;
    r6 = r6.xywz + r1.xwyz;
    r1 = r6.xxxx * ProjectionMatrix[3].xwzy;
    r1 = r6.yyyy * ProjectionMatrix[2].xwzy + r1;
    r1 = r6.wwww * ProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r6.zzzz * ProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.xxxx * ShadowMatrix[3].xwzy;
    r1 = r2.yyyy * ShadowMatrix[2].xwzy + r1;
    r1 = r2.zzzz * ShadowMatrix[1].xzyw + r1.xzwy;
    o2 = r2.wwww * ShadowMatrix[0] + r1.xzyw;
    o0.xy = r0.zw;
    o4.xyz = r4.xyz;
    o4.w = 0.0;
    o3 = r3;
    o1 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
