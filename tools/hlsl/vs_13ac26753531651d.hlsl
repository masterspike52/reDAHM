// vs_13ac26753531651d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 438 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006D8 00510010 00000000 00000000 00004CC6 00000001 00000008 00000006 00000290 0010000D 0000300E 0000600F 00005010 00001011 00015012 00025013 00235014 00003050 00013151 0002F252 0003F353 0004F455 00057556 0000108B 0000108C 0000108E 0000108F 00001090 0000108D
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
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
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
    r4.zw = In.texcoord0.xy;
    r3.x = In.blendweight0.x;
    r4.xy = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r2 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.w = CameraUp.x * (-1.0);
    r3.w = ps;
    r14.xy = (r3.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.w = r3.x * 0.15915494 + 0.5;
    ps = r1.x;
    r5.xyz = r6.www * LocalToWorld[3].xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r8 = r7.wwww * LocalToWorld[3];
    r12.z = ps;
    r5.xyz = r6.zzz * LocalToWorld[2].xzy + r5.xzy;
    r8 = r7.zzzz * LocalToWorld[2] + r8;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.w);
    r12.w = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r8 = r7.yyyy * LocalToWorld[1] + r8;
    r5.xyz = r6.yyy * LocalToWorld[1].xyz + r5.xzy;
    r5.xyz = r6.xxx * LocalToWorld[0].xzy + r5.xzy;
    r9 = r7.xxxx * LocalToWorld[0] + r8;
    ps = cos(r0.x);
    r3.yz = r12.zw * r0.yz;
    r0.w = ps;
    r13.xyz = -r9.zyx + CameraWorldPosition.zyx;
    r11.xyz = r9.xyz - r5.xzy;
    ps = sin(r0.x);
    r5 = r0.wwww * CameraRight.wzyx;
    r0.x = ps;
    r10 = r0.xxxx * CameraRight.xzyw;
    ps = (-1.0) * r0.w;
    r12.x = dot(r13.xzy, r13.xzy);
    r8.x = ps;
    r8 = r8.xxxx * CameraUp.wyzx + r10.wzyx;
    r5 = r0.xxxx * CameraUp.wyzx + r5.xzyw;
    r5 = r5.xwyz * ParticleUpRightResultScalars.xxxx;
    r8 = r8.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r5.x;
    r12.y = dot(r11.zxy, r11.zxy);
    ps = r0.z * ps;
    r10.yz = max(r12.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r10.y));
    r5.x = r0.x * r12.w;
    r0.x = ps;
    ps = rsqrt(abs(r10.z));
    r15.xyz = r13.zyx * r0.xxx;
    r0.x = ps;
    r16.xyz = r11.zyx * r0.xxx;
    r5.yzw = -r16.zyx * ParticleUpRightResultScalars.yyy + r5.yzw;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r13.xyz = r15.zxy * r16.yxz;
    r11.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r13.xyz = r15.xzy * r16.yzx - r13.zyx;
    r11.xyz = r15.xzy * AxisRotationVectors[a0].yxz - r11.zyx;
    r12.x = dot(r11.xzy, r11.xzy);
    ps = r8.x;
    r12.y = dot(r13.xzy, r13.xzy);
    ps = r0.y * ps;
    r12.xy = max(r12.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r12.y));
    r8.x = r0.x * r12.z;
    r0.x = ps;
    ps = rsqrt(abs(r12.x));
    r10.yzw = r13.xzy * r0.xxx;
    r0.x = ps;
    r11 = r11 * r0.xxxw;
    r10.x = r11.w + r10.x;
    r11.xyz = r11.zyx * AxisRotationVectors[a0].www;
    r13.xyz = (r3.www == 0.0) ? r11.xzy : AxisRotationVectors[a0].xzy;
    r12 = (-abs(r14.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r11.xzyz;
    r0.xw = (-abs(r14.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r11.yx;
    r11.xy = r0.wx * ParticleUpRightResultScalars.zz + r5.yz;
    r11.z = r12.w * ParticleUpRightResultScalars.z + r5.w;
    r5.yzw = r13.yzx * ParticleUpRightResultScalars.zzz + r5.wzy;
    r13 = r10.xzwy * ParticleUpRightResultScalars.xyyy;
    r5.yzw = r3.zzz * r5.wyz;
    ps = r13.x + r13.y;
    r10.xyz = r8.ywz + r13.zwy;
    r10.w = ps;
    r12 = r12.yxzx * ParticleUpRightResultScalars.zzzz + r10.yzxw;
    r8.yzw = r3.yyy * r12.wzx;
    r3.yzw = r12.xyz * r11.yzx;
    r3.yzw = r12.yxz * r11.yxz - r3.wzy;
    r8 = r9.wyzx + r8.xzwy;
    r0.x = dot(r3.ywz, r3.ywz);
    ps = rsqrt(abs(r0.x));
    r8 = r8.xwyz + r5.xywz;
    r0.x = ps;
    r10.xyz = r3.yzw * r0.xxx;
    r5 = r8.xxxx * ViewProjectionMatrix[3].xwzy;
    r9.xyz = -r8.wzy * CameraPosition.www + CameraPosition.zyx;
    r3.y = dot(r12.xyz, r9.xzy);
    r3.z = dot(r11.zxy, r9.xzy);
    r3.w = dot(r10.xzy, r9.xzy);
    r5 = r8.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r8.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r8.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    r0.x = r3.x * 0.15915494 + 0.5;
    r8.xyw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r9 = r7.wwww * LocalToWorld[3];
    r8.z = ps;
    r10.xyz = r6.zzz * LocalToWorld[2].xyz + r8.xwy;
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
    r8.xy = r8.zw * r0.yz;
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
    r3.x = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    r9 = r6.wwww * CameraUp.wxzy + r9.xwyz;
    r10 = r0.xxxx * CameraUp.wxzy + r10.xwyz;
    ps = r3.x;
    r0.z = dot(r6.xzy, r6.xzy);
    ps = r9.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r8.w;
    r3.x = ps;
    ps = rsqrt(abs(r0.z));
    r13.xyz = r11.xyz * r3.xxx;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r6.zyx * r0.yyy;
    r3.x = ps;
    a0 = xe_mova(r3.x);
    ps = r3.x;
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
    r0.yzw = (r3.xxx == 0.0) ? r6.ywz : AxisRotationVectors[a0].xzy;
    r6.yzw = (r3.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r6.ywz;
    r6.yzw = r6.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r12.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r6.yzw = r11.yzx * ParticleUpRightResultScalars.yyy + r6.zwy;
    r6.yzw = r10.yzw * ParticleUpRightResultScalars.xxx + r6.wyz;
    r0.yzw = r9.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r8.yyy * r0.yzw;
    r6.yzw = r8.xxx * r6.yzw;
    r6 = r7.ywzx + r6.xzwy;
    r6 = r6.xywz + r0.xwyz;
    r0 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r4.zw;
    o1.xy = r4.xy;
    o5.xyz = r3.yzw;
    o2 = r1.ywxz;
    o3 = r2;
    o4 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    return Out;
}
