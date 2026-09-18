// vs_dbc6e038b51ab313.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 384 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000600 0041000D 00000000 00000000 000040A5 00000001 00000008 00000005 00000290 0010000C 0000300D 0000600E 0000500F 00001010 00015011 00025012 00235013 00003050 00013151 0002F252 0003F353 0004F457 0000107B 0000107C 0000107D 0000107E 0000107A
//   vertex element: instruction 12 -> POSITION0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> TANGENT0
//   vertex element: instruction 15 -> TEXCOORD0
//   vertex element: instruction 16 -> BLENDWEIGHT0
//   vertex element: instruction 17 -> TEXCOORD1
//   vertex element: instruction 18 -> TEXCOORD2
//   vertex element: instruction 19 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r6 = In.position0;
    r5 = In.normal0;
    r0.zw = In.tangent0.xy;
    r2.xy = In.texcoord0.xy;
    r7.x = In.blendweight0.x;
    r2.zw = In.texcoord1.xy;
    r1 = In.texcoord2.xzwy;
    r4 = In.texcoord3;
    r0.x = r7.x * 0.15915494 + 0.5;
    ps = r1.y;
    r3.xyz = r5.www * LocalToWorld[3].xyz;
    r0.y = ps;
    ps = (-0.5) + r0.y;
    r9 = r6.wwww * LocalToWorld[3];
    r8.x = ps;
    r3.xyz = r5.zzz * LocalToWorld[2].xzy + r3.xzy;
    r9 = r6.zzzz * LocalToWorld[2] + r9;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r9 = r6.yyyy * LocalToWorld[1].xzwy + r9.xzwy;
    r3.xyz = r5.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r5.xxx * LocalToWorld[0].xzy + r3.xzy;
    r9 = r6.xxxx * LocalToWorld[0].xwyz + r9.xzwy;
    ps = cos(r0.y);
    r8.yz = r8.xw * r0.zw;
    r0.x = ps;
    r10.yzw = -r9.xzw + CameraWorldPosition.xyz;
    r7.yzw = r9.wzx - r3.yzx;
    ps = sin(r0.y);
    r3 = r0.xxxx * CameraRight.wzyx;
    r0.y = ps;
    r11 = r0.yyyy * CameraRight.wzyx;
    ps = (-1.0) * r0.x;
    r12.x = dot(r10.wyz, r10.wyz);
    r0.x = ps;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    r3 = r0.yyyy * CameraUp.wxzy + r3.xwyz;
    r3 = r3.xywz * ParticleUpRightResultScalars.xxxx;
    r11 = r11.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r3.x;
    r12.y = dot(r7.ywz, r7.ywz);
    ps = r0.w * ps;
    r0.xy = max(r12.xy, 0.01);
    r10.x = ps;
    ps = rsqrt(abs(r0.x));
    r3.x = r10.x * r8.w;
    r10.x = ps;
    ps = rsqrt(abs(r0.y));
    r12.xyz = r10.yzw * r10.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r7.wzy * r0.xxx;
    r0.x = ps;
    r3.yzw = -r13.xyz * ParticleUpRightResultScalars.yyy + r3.yzw;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7.yzw = r12.zxy * r13.yzx;
    r10.xyz = r12.zxy * AxisRotationVectors[a0].yzx;
    r7.yzw = r12.xzy * r13.yxz - r7.wzy;
    r12.xyz = r12.xzy * AxisRotationVectors[a0].yxz - r10.zyx;
    r10.x = dot(r12.xzy, r12.xzy);
    ps = r11.w;
    r10.y = dot(r7.ywz, r7.ywz);
    ps = r0.z * ps;
    r10.xw = max(r10.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r10.x));
    r8.x = r0.y * r8.x;
    r0.y = ps;
    ps = rsqrt(abs(r10.w));
    r10.xyz = r12.zyx * r0.yyy;
    r0.y = ps;
    r7.yzw = r7.wyz * r0.yyy;
    r7.yzw = r7.yzw * ParticleUpRightResultScalars.yyy + r11.xzy;
    r11.xyz = r10.xyz * AxisRotationVectors[a0].www;
    r10.xyz = (r0.xxx == 0.0) ? r11.xzy : AxisRotationVectors[a0].xzy;
    r11.xyz = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r11.xzy;
    r7.yzw = r11.yzx * ParticleUpRightResultScalars.zzz + r7.zwy;
    r3.yzw = r10.yzx * ParticleUpRightResultScalars.zzz + r3.wzy;
    r3.yzw = r8.zzz * r3.wyz;
    r8.yzw = r8.yyy * r7.wyz;
    r8 = r9.ywzx + r8.xzwy;
    r3 = r8.xywz + r3.xzyw;
    r0.x = r7.x * 0.15915494 + 0.5;
    r8.xyz = r5.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r1.y;
    r7 = r6.wwww * LocalToWorld[3];
    r12.x = ps;
    r8.xyz = r5.zzz * LocalToWorld[2].xzy + r8.xzy;
    r7 = r6.zzzz * LocalToWorld[2] + r7;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r12.y = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r7 = r6.yyyy * LocalToWorld[1].xzwy + r7.xzwy;
    r5.yzw = r5.yyy * LocalToWorld[1].xyz + r8.xzy;
    r5.xyz = r5.xxx * LocalToWorld[0].xzy + r5.ywz;
    r6 = r6.xxxx * LocalToWorld[0].xwyz + r7.xzwy;
    ps = cos(r0.y);
    r7.xy = r12.xy * r0.zw;
    r0.x = ps;
    r10.xyz = -r6.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r5.yzw = r6.wzx - r5.yzx;
    r7.z = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r9 = r7.zzzz * CameraRight.wzyx;
    r5.x = ps;
    ps = ParticleUpRightResultScalars.x * r0.w;
    r8 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r10.zxy, r10.zxy);
    r0.x = ps;
    r8 = r7.zzzz * CameraUp.wxzy + r8.xwyz;
    r9 = r0.xxxx * CameraUp.wxzy + r9.xwyz;
    ps = r0.w;
    r0.z = dot(r5.ywz, r5.ywz);
    ps = r8.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r12.y;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r10.xyz * r0.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.xyz = r5.wzy * r0.yyy;
    r7.z = ps;
    a0 = xe_mova(r7.z);
    ps = r7.z;
    r0.yzw = r10.zxy * r11.yzx;
    r5.yzw = r10.zxy * AxisRotationVectors[a0].yzx;
    r5.yzw = r10.xzy * AxisRotationVectors[a0].yxz - r5.wzy;
    r10.xyz = r10.xzy * r11.yxz - r0.wzy;
    r0.y = dot(r10.xzy, r10.xzy);
    ps = r5.x;
    r0.z = dot(r5.ywz, r5.ywz);
    ps = r9.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r5.x = r0.w * r12.x;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r10.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r5.wzy * r0.yyy;
    r5.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r7.zzz == 0.0) ? r5.ywz : AxisRotationVectors[a0].xzy;
    r5.yzw = (r7.zzz == 0.0) ? AxisRotationVectors[a0].xzy : r5.ywz;
    r5.yzw = r5.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r11.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r5.yzw = r10.yzx * ParticleUpRightResultScalars.yyy + r5.zwy;
    r5.yzw = r9.yzw * ParticleUpRightResultScalars.xxx + r5.wyz;
    r0.yzw = r8.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r7.yyy * r0.yzw;
    r5.yzw = r7.xxx * r5.yzw;
    r5 = r6.ywzx + r5.xzwy;
    r5 = r5.xywz + r0.xwyz;
    r0 = r5.xxxx * ProjectionMatrix[3].xwzy;
    r0 = r5.yyyy * ProjectionMatrix[2].xwzy + r0;
    r0 = r5.wwww * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.zzzz * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r3.xxxx * ShadowMatrix[3].xwzy;
    r0 = r3.yyyy * ShadowMatrix[2].xwzy + r0;
    r0 = r3.wwww * ShadowMatrix[1].xzyw + r0.xzwy;
    o4 = r3.zzzz * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r2.xy;
    o1.xy = r2.zw;
    o2 = r1.xwyz;
    o3 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord7 = o4;
    return Out;
}
