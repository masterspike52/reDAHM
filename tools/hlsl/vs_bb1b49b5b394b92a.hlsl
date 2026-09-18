// vs_bb1b49b5b394b92a.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 429 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006B4 00510011 00000000 00000000 00004CC6 00000001 00000008 00000006 00000290 0010000D 0000300E 0000600F 00005010 00001011 00015012 00025013 00235014 00003050 00013151 0002F252 0003F353 0004F456 00057557 0000108A 0000108B 0000108C 0000108D 00001089 00001088
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   vertex element: instruction 19 -> TEXCOORD2
//   vertex element: instruction 20 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r7 = In.position0;
    r6 = In.normal0;
    r0.yz = In.tangent0.xy;
    r8.xy = In.texcoord0.xy;
    r3.x = In.blendweight0.x;
    r3.yz = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r5 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2.xyz = r6.www * LocalToWorld[3].xyz;
    r3.w = ps;
    r11.xy = (r3.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r3.x * 0.15915494 + 0.5;
    r4.xyz = r6.zzz * LocalToWorld[2].xzy + r2.xzy;
    ps = frac(r0.x);
    r2 = r7.wwww * LocalToWorld[3];
    r0.x = ps;
    r2 = r7.zzzz * LocalToWorld[2] + r2;
    r2 = r7.yyyy * LocalToWorld[1] + r2;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r4.xyz = r6.yyy * LocalToWorld[1].xyz + r4.xzy;
    r12.xyz = r6.xxx * LocalToWorld[0].xzy + r4.xzy;
    ps = sin(r0.x);
    r14.x = CameraUp.x * (-1.0);
    r10.x = ps;
    r2 = r7.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r4.xy = r1.zx - 0.5;
    r0.w = ps;
    ps = r2.z;
    r8.zw = r4.yx * r0.yz;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r13 = r10.xxxx * CameraRight.xzyw;
    r10.y = ps;
    ps = CameraWorldPosition.y - r2.x;
    r9 = r0.wwww * CameraRight.wzyx;
    r10.z = ps;
    ps = CameraWorldPosition.x - r2.y;
    r14.yzw = r2.yxz - r12.xzy;
    r10.w = ps;
    r4.z = dot(r10.ywz, r10.ywz);
    ps = (-1.0) * r0.w;
    r4.w = dot(r14.wyz, r14.wyz);
    r0.x = ps;
    r9 = r10.xxxx * CameraUp.wyzx + r9.xzyw;
    r12 = r0.xxxx * CameraUp.wyzx + r13.wzyx;
    r12 = r12.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r12.w;
    r9 = r9.wyzx * ParticleUpRightResultScalars.xxxx;
    ps = r0.y * ps;
    r4.zw = max(r4.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r4.z));
    r10.x = r0.x * r4.y;
    r0.x = ps;
    ps = rsqrt(abs(r4.w));
    r17.xyz = r10.wzy * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r15 = r14.xwzy * r0.wxxx;
    r14.xyz = r17.zxy * AxisRotationVectors[a0].yzx;
    r10.yzw = -r15.wzy * ParticleUpRightResultScalars.yyy + r9.xyz;
    r16.xyz = r17.zxy * r15.zyw;
    r14.xyz = r17.xzy * AxisRotationVectors[a0].yxz - r14.zyx;
    r0.x = dot(r14.xzy, r14.xzy);
    r13.yzw = r17.xzy * r15.zwy - r16.zyx;
    r0.w = dot(r13.ywz, r13.ywz);
    r0.xw = max(r0.xw, 0.01);
    ps = rsqrt(abs(r0.w));
    r13.x = r15.x + r13.x;
    r4.z = ps;
    ps = rsqrt(abs(r0.x));
    r13.yzw = r13.ywz * r4.zzz;
    r0.x = ps;
    r14.xyz = r14.xyz * r0.xxx;
    r4.yzw = r14.zyx * AxisRotationVectors[a0].www;
    r15.xyz = (r3.www == 0.0) ? r4.ywz : AxisRotationVectors[a0].xzy;
    r14 = r13.xzwy * ParticleUpRightResultScalars.xyyy;
    r13 = (-abs(r11.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r4.ywzw;
    r0.xw = (-abs(r11.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r4.zy;
    r11.xy = r0.wx * ParticleUpRightResultScalars.zz + r10.yz;
    r11.z = r13.w * ParticleUpRightResultScalars.z + r10.w;
    r12.xyz = r12.xzy + r14.zwy;
    r10.yzw = r15.yzx * ParticleUpRightResultScalars.zzz + r10.wzy;
    ps = r14.x + r14.y;
    r4.yzw = r8.www * r10.wyz;
    r12.w = ps;
    r12 = r13.yxzx * ParticleUpRightResultScalars.zzzz + r12.yzxw;
    ps = r9.w;
    r10.yzw = r8.zzz * r12.wzx;
    ps = r0.z * ps;
    r9.xyz = r12.xyz * r11.yzx;
    r0.x = ps;
    r9.xyz = r12.yxz * r11.yxz - r9.zyx;
    ps = r0.x;
    r2 = r2.wxzy + r10.xzwy;
    ps = r4.x * ps;
    r0.x = dot(r9.xzy, r9.xzy);
    r4.x = ps;
    ps = rsqrt(abs(r0.x));
    r4 = r2.xwyz + r4.xywz;
    r0.x = ps;
    r10.xyz = r9.xyz * r0.xxx;
    r9.xyz = -r4.wzy * CameraPosition.www + CameraPosition.zyx;
    r2.x = dot(r12.xyz, r9.xzy);
    r2.y = dot(r11.zxy, r9.xzy);
    r2.z = dot(r10.xzy, r9.xzy);
    r0.x = r3.x * 0.15915494 + 0.5;
    r10.xyz = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r9 = r7.wwww * LocalToWorld[3];
    r8.z = ps;
    r10.xyz = r6.zzz * LocalToWorld[2].xyz + r10.xzy;
    r9 = r7.zzzz * LocalToWorld[2] + r9;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r9 = r7.yyyy * LocalToWorld[1].xzwy + r9.xzwy;
    r6.yzw = r6.yyy * LocalToWorld[1].xzy + r10.xzy;
    r6.xyz = r6.xxx * LocalToWorld[0].xyz + r6.ywz;
    r7 = r7.xxxx * LocalToWorld[0].xwyz + r9.xzwy;
    ps = cos(r0.w);
    r3.xw = r8.zw * r0.yz;
    r0.x = ps;
    r11.xyz = -r7.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r6.xyz = r7.wzx - r6.zyx;
    r6.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r10 = r6.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r9 = r0.xxxx * CameraRight.wzyx;
    r2.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    r9 = r6.wwww * CameraUp.wxzy + r9.xwyz;
    r10 = r0.xxxx * CameraUp.wxzy + r10.xwyz;
    ps = r2.w;
    r0.z = dot(r6.xzy, r6.xzy);
    ps = r9.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r8.w;
    r2.w = ps;
    ps = rsqrt(abs(r0.z));
    r13.xyz = r11.xyz * r2.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r6.zyx * r0.yyy;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r11.xyz = r13.zxy * r12.yzx;
    r6.xyz = r13.zxy * AxisRotationVectors[a0].yzx;
    r6.yzw = r13.xzy * AxisRotationVectors[a0].yxz - r6.zyx;
    r11.xyz = r13.xzy * r12.yxz - r11.zyx;
    r0.y = dot(r11.xzy, r11.xzy);
    ps = r0.w;
    r0.z = dot(r6.ywz, r6.ywz);
    ps = r10.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r6.x = r0.w * r8.z;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r11.xyz = r11.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r6.wzy * r0.yyy;
    r6.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r2.www == 0.0) ? r6.ywz : AxisRotationVectors[a0].xzy;
    r6.yzw = (r2.www == 0.0) ? AxisRotationVectors[a0].xzy : r6.ywz;
    r6.yzw = r6.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r12.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r6.yzw = r11.yzx * ParticleUpRightResultScalars.yyy + r6.zwy;
    r6.yzw = r10.yzw * ParticleUpRightResultScalars.xxx + r6.wyz;
    r0.yzw = r9.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r3.www * r0.yzw;
    r6.yzw = r3.xxx * r6.yzw;
    r6 = r7.ywzx + r6.xzwy;
    r6 = r6.xywz + r0.xwyz;
    r0 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r4.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r4.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o5.xyz = r2.xyz;
    o4 = r4.yyyy * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r8.xy;
    o1.xy = r3.yz;
    o2 = r1.ywxz;
    o3 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
