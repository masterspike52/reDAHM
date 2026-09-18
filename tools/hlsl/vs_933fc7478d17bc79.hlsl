// vs_933fc7478d17bc79.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 426 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006A8 0031000E 00000000 00000000 00003484 00000001 00000006 00000004 00000290 0010000D 0000300E 0000600F 00005010 00001011 00215012 00003050 0001F151 0002F255 00037356 00001089 0000108B 0000108C 0000108A
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c8); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c15); // float3
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

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
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
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
    int a0 = 0;

    r5 = In.position0;
    r4 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r1.x = In.blendweight0.x;
    r2 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r3.w = CameraUp.x * (-1.0);
    r1.w = ps;
    r6.zw = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r3.xyz = r4.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.z;
    r7 = r5.wwww * LocalToWorld[3];
    r11.z = ps;
    r3.xyz = r4.zzz * LocalToWorld[2].xzy + r3.xzy;
    r7 = r5.zzzz * LocalToWorld[2] + r7;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r11.w = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r7 = r5.yyyy * LocalToWorld[1] + r7;
    r3.xyz = r4.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r4.xxx * LocalToWorld[0].xzy + r3.xzy;
    r9 = r5.xxxx * LocalToWorld[0] + r7;
    ps = cos(r0.x);
    r6.xy = r11.zw * r1.yz;
    r0.y = ps;
    r12.xyz = -r9.zyx + CameraWorldPosition.zyx;
    r3.xyz = r9.xyz - r3.xzy;
    ps = sin(r0.x);
    r7 = r0.yyyy * CameraRight.wzyx;
    r0.x = ps;
    r10 = r0.xxxx * CameraRight.xzyw;
    ps = (-1.0) * r0.y;
    r11.x = dot(r12.xzy, r12.xzy);
    r8.x = ps;
    r8 = r8.xxxx * CameraUp.wyzx + r10.wzyx;
    r7 = r0.xxxx * CameraUp.wyzx + r7.xzyw;
    r7 = r7.xwyz * ParticleUpRightResultScalars.xxxx;
    r8 = r8.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r7.x;
    r11.y = dot(r3.zxy, r3.zxy);
    ps = r1.z * ps;
    r10.yz = max(r11.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r10.y));
    r7.x = r0.x * r11.w;
    r0.x = ps;
    ps = rsqrt(abs(r10.z));
    r13.xyz = r12.zyx * r0.xxx;
    r0.x = ps;
    r14.xyz = r3.zyx * r0.xxx;
    r7.yzw = -r14.zyx * ParticleUpRightResultScalars.yyy + r7.yzw;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r12.xyz = r13.zxy * r14.yxz;
    r3.xyz = r13.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r13.xzy * r14.yzx - r12.zyx;
    r3.xyz = r13.xzy * AxisRotationVectors[a0].yxz - r3.zyx;
    r11.x = dot(r3.xzy, r3.xzy);
    ps = r8.x;
    r11.y = dot(r12.xzy, r12.xzy);
    ps = r1.y * ps;
    r11.xy = max(r11.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r11.y));
    r8.x = r0.x * r11.z;
    r0.x = ps;
    ps = rsqrt(abs(r11.x));
    r10.yzw = r12.xzy * r0.xxx;
    r0.x = ps;
    r3 = r3 * r0.xxxy;
    r10.x = r3.w + r10.x;
    r3.xyz = r3.zyx * AxisRotationVectors[a0].www;
    r12.xyz = (r1.www == 0.0) ? r3.xzy : AxisRotationVectors[a0].xzy;
    r11 = (-abs(r6.zzzw) >= 0.0) ? AxisRotationVectors[a0].xzyz : r3.xzyz;
    r0.xy = (-abs(r6.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r3.yx;
    r3.yz = r0.yx * ParticleUpRightResultScalars.zz + r7.yz;
    r3.w = r11.w * ParticleUpRightResultScalars.z + r7.w;
    r7.yzw = r12.yzx * ParticleUpRightResultScalars.zzz + r7.wzy;
    r12 = r10.xzwy * ParticleUpRightResultScalars.xyyy;
    r7.yzw = r6.yyy * r7.wyz;
    ps = r12.x + r12.y;
    r10.xyz = r8.ywz + r12.zwy;
    r10.w = ps;
    r10 = r11.yxzx * ParticleUpRightResultScalars.zzzz + r10.yzxw;
    r8.yzw = r6.xxx * r10.wzx;
    r6.xyz = r10.xyz * r3.zwy;
    r6.xyz = r10.yxz * r3.zyw - r6.zyx;
    r8 = r9.wyzx + r8.xzwy;
    r0.x = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r0.x));
    r7 = r8.xwyz + r7.xywz;
    r0.x = ps;
    r9.xyz = r6.xyz * r0.xxx;
    r6 = r7.xxxx * ViewProjectionMatrix[3].xwzy;
    r8.xyz = -r7.wzy * CameraPosition.www + CameraPosition.zyx;
    r3.x = dot(r10.xyz, r8.xzy);
    r3.y = dot(r3.wyz, r8.xzy);
    r3.z = dot(r9.xzy, r8.xzy);
    r6 = r7.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r7.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r7.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    r0.x = r1.x * 0.15915494 + 0.5;
    r7.xyw = r4.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r8 = r5.wwww * LocalToWorld[3];
    r7.z = ps;
    r9.xyz = r4.zzz * LocalToWorld[2].xyz + r7.xwy;
    r8 = r5.zzzz * LocalToWorld[2] + r8;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r7.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r8 = r5.yyyy * LocalToWorld[1].xzwy + r8.xzwy;
    r4.yzw = r4.yyy * LocalToWorld[1].xzy + r9.xzy;
    r4.xyz = r4.xxx * LocalToWorld[0].xyz + r4.ywz;
    r5 = r5.xxxx * LocalToWorld[0].xwyz + r8.xzwy;
    ps = cos(r0.y);
    r7.xy = r7.zw * r1.yz;
    r0.x = ps;
    r10.xyz = -r5.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r4.xyz = r5.wzx - r4.zyx;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r9 = r1.wwww * CameraRight.wzyx;
    r0.y = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r8 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r10.zxy, r10.zxy);
    r0.x = ps;
    r8 = r1.wwww * CameraUp.wxzy + r8.xwyz;
    r9 = r0.xxxx * CameraUp.wxzy + r9.xwyz;
    ps = r1.z;
    r1.y = dot(r4.xzy, r4.xzy);
    ps = r8.x * ps;
    r1.yz = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r1.x = r0.x * r7.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r10.xyz = r10.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.xyz = r4.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r4.xyz = r10.zxy * r11.yzx;
    r1.yzw = r10.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r10.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r10.xyz = r10.xzy * r11.yxz - r4.zyx;
    r4.x = dot(r10.xzy, r10.xzy);
    ps = r0.y;
    r4.y = dot(r1.ywz, r1.ywz);
    ps = r9.x * ps;
    r4.yz = max(r4.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r4.y));
    r4.x = r0.y * r7.z;
    r0.y = ps;
    ps = rsqrt(abs(r4.z));
    r10.xyz = r10.zxy * r0.yyy;
    r0.y = ps;
    r1.yzw = r1.wzy * r0.yyy;
    r4.yzw = r1.yzw * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r4.ywz : AxisRotationVectors[a0].xzy;
    r4.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r4.ywz;
    r4.yzw = r4.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r11.zxy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r4.yzw = r10.yzx * ParticleUpRightResultScalars.yyy + r4.zwy;
    r4.yzw = r9.yzw * ParticleUpRightResultScalars.xxx + r4.wyz;
    r1.yzw = r8.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r7.yyy * r1.yzw;
    r4.yzw = r7.xxx * r4.yzw;
    r4 = r5.ywzx + r4.xzwy;
    r4 = r4.xywz + r1.xwyz;
    r1 = r4.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r0.zw;
    o3.xyz = r3.xyz;
    o1 = r2;
    o2 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    return Out;
}
