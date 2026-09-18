// vs_873040fd5f78f246.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 417 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000684 0031000E 00000000 00000000 00003484 00000001 00000006 00000004 00000290 0010000D 0000300E 0000600F 00005010 00001011 00215012 00003050 0001F151 0002F256 00037357 00001088 00001089 00001087 00001086
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
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
    int a0 = 0;

    r6 = In.position0;
    r5 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r1.x = In.blendweight0.x;
    r4 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2.xyz = r5.www * LocalToWorld[3].xyz;
    r1.w = ps;
    r13.xy = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r3.xyz = r5.zzz * LocalToWorld[2].xzy + r2.xzy;
    ps = frac(r0.x);
    r2 = r6.wwww * LocalToWorld[3];
    r0.x = ps;
    r2 = r6.zzzz * LocalToWorld[2] + r2;
    r2 = r6.yyyy * LocalToWorld[1] + r2;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r3.xyz = r5.yyy * LocalToWorld[1].xyz + r3.xzy;
    r9.yzw = r5.xxx * LocalToWorld[0].xzy + r3.xzy;
    ps = sin(r0.x);
    r11.x = CameraUp.x * (-1.0);
    r9.x = ps;
    r2 = r6.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r7.xw = r0.zw - 0.5;
    r0.y = ps;
    ps = r2.z;
    r7.yz = r7.xw * r1.yz;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r8 = r9.xxxx * CameraRight.zywx;
    r10.y = ps;
    ps = CameraWorldPosition.y - r2.x;
    r3 = r0.yyyy * CameraRight.wzyx;
    r10.z = ps;
    ps = CameraWorldPosition.x - r2.y;
    r11.yzw = r2.yxz - r9.ywz;
    r10.w = ps;
    r12.x = dot(r10.ywz, r10.ywz);
    ps = (-1.0) * r0.y;
    r12.y = dot(r11.wyz, r11.wyz);
    r0.x = ps;
    r3 = r9.xxxx * CameraUp.wyzx + r3.xzyw;
    r9 = r0.xxxx * CameraUp.wyzx + r8.zyxw;
    r9 = r9.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r9.w;
    r3 = r3.xwyz * ParticleUpRightResultScalars.xxxx;
    ps = r1.y * ps;
    r8.xy = max(r12.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r8.x));
    r10.x = r0.x * r7.x;
    r0.x = ps;
    ps = rsqrt(abs(r8.y));
    r14.xyz = r10.wzy * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r11 = r11.xwzy * r0.yxxx;
    r10.yzw = r14.zxy * AxisRotationVectors[a0].yzx;
    r8.xyz = -r11.wzy * ParticleUpRightResultScalars.yyy + r3.yzw;
    r12.xyz = r14.zxy * r11.zyw;
    r10.yzw = r14.xzy * AxisRotationVectors[a0].yxz - r10.wzy;
    r0.x = dot(r10.ywz, r10.ywz);
    r11.yzw = r14.xzy * r11.zwy - r12.zyx;
    r0.y = dot(r11.ywz, r11.ywz);
    r0.xy = max(r0.xy, 0.01);
    ps = rsqrt(abs(r0.y));
    r11.x = r11.x + r8.w;
    r8.w = ps;
    ps = rsqrt(abs(r0.x));
    r11.yzw = r11.ywz * r8.www;
    r0.x = ps;
    r10.yzw = r10.yzw * r0.xxx;
    r3.yzw = r10.wzy * AxisRotationVectors[a0].www;
    r10.yzw = (r1.www == 0.0) ? r3.ywz : AxisRotationVectors[a0].xzy;
    r12 = r11.xzwy * ParticleUpRightResultScalars.xyyy;
    r11 = (-abs(r13.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r3.ywzw;
    r0.xy = (-abs(r13.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r3.zy;
    r3.yz = r0.yx * ParticleUpRightResultScalars.zz + r8.xy;
    r3.w = r11.w * ParticleUpRightResultScalars.z + r8.z;
    r9.xyz = r9.xzy + r12.zwy;
    r8.xyz = r10.zwy * ParticleUpRightResultScalars.zzz + r8.zyx;
    ps = r12.x + r12.y;
    r8.yzw = r7.zzz * r8.zxy;
    r9.w = ps;
    r9 = r11.yxzx * ParticleUpRightResultScalars.zzzz + r9.yzxw;
    ps = r3.x;
    r10.yzw = r7.yyy * r9.wzx;
    ps = r1.z * ps;
    r11.xyz = r9.xyz * r3.zwy;
    r0.x = ps;
    r7.xyz = r9.yxz * r3.zyw - r11.zyx;
    ps = r0.x;
    r2 = r2.wxzy + r10.xzwy;
    ps = r7.w * ps;
    r0.x = dot(r7.xzy, r7.xzy);
    r8.x = ps;
    ps = rsqrt(abs(r0.x));
    r2 = r2.xwyz + r8.xywz;
    r0.x = ps;
    r8.xyz = r7.xyz * r0.xxx;
    r7.xyz = -r2.wzy * CameraPosition.www + CameraPosition.zyx;
    r3.x = dot(r9.xyz, r7.xzy);
    r3.y = dot(r3.wyz, r7.xzy);
    r3.z = dot(r8.xzy, r7.xzy);
    r0.x = r1.x * 0.15915494 + 0.5;
    r7.xyw = r5.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r8 = r6.wwww * LocalToWorld[3];
    r7.z = ps;
    r9.xyz = r5.zzz * LocalToWorld[2].xyz + r7.xwy;
    r8 = r6.zzzz * LocalToWorld[2] + r8;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r7.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r8 = r6.yyyy * LocalToWorld[1].xzwy + r8.xzwy;
    r5.yzw = r5.yyy * LocalToWorld[1].xzy + r9.xzy;
    r5.xyz = r5.xxx * LocalToWorld[0].xyz + r5.ywz;
    r6 = r6.xxxx * LocalToWorld[0].xwyz + r8.xzwy;
    ps = cos(r0.y);
    r7.xy = r7.zw * r1.yz;
    r0.x = ps;
    r10.xyz = -r6.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r5.xyz = r6.wzx - r5.zyx;
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
    r1.y = dot(r5.xzy, r5.xzy);
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
    r11.xyz = r5.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r5.xyz = r10.zxy * r11.yzx;
    r1.yzw = r10.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r10.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r10.xyz = r10.xzy * r11.yxz - r5.zyx;
    r5.x = dot(r10.xzy, r10.xzy);
    ps = r0.y;
    r5.y = dot(r1.ywz, r1.ywz);
    ps = r9.x * ps;
    r5.yz = max(r5.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r0.y * r7.z;
    r0.y = ps;
    ps = rsqrt(abs(r5.z));
    r10.xyz = r10.zxy * r0.yyy;
    r0.y = ps;
    r1.yzw = r1.wzy * r0.yyy;
    r5.yzw = r1.yzw * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r5.ywz : AxisRotationVectors[a0].xzy;
    r5.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r5.ywz;
    r5.yzw = r5.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r11.zxy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r5.yzw = r10.yzx * ParticleUpRightResultScalars.yyy + r5.zwy;
    r5.yzw = r9.yzw * ParticleUpRightResultScalars.xxx + r5.wyz;
    r1.yzw = r8.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r7.yyy * r1.yzw;
    r5.yzw = r7.xxx * r5.yzw;
    r5 = r6.ywzx + r5.xzwy;
    r5 = r5.xywz + r1.xwyz;
    r1 = r5.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r5.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r5.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r5.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r2.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    o3.xyz = r3.xyz;
    o2 = r2.yyyy * ViewProjectionMatrix[0] + r1.xzyw;
    o0.xy = r0.zw;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    return Out;
}
