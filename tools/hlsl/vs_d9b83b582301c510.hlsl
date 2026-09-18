// vs_d9b83b582301c510.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 453 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000714 0071000F 00000000 00000000 00006908 00000001 00000008 00000008 00000290 0010000E 0000300F 00006010 00005011 00001012 00015013 00025014 00235015 00003050 00013151 0002F252 0003F353 00047454 0005F555 00067656 0007F757 0000108F 00001090 00001093 00001094 00001091 0000108E 00001092 00001095
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> NORMAL0
//   vertex element: instruction 16 -> TANGENT0
//   vertex element: instruction 17 -> TEXCOORD0
//   vertex element: instruction 18 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD1
//   vertex element: instruction 20 -> TEXCOORD2
//   vertex element: instruction 21 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r7 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LightDirection : register(c16); // float3
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
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r8 = In.position0;
    r7 = In.normal0;
    r0.yz = In.tangent0.xy;
    r9.xy = In.texcoord0.xy;
    r2.z = In.blendweight0.x;
    r2.xy = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r6 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r3.w = CameraUp.x * (-1.0);
    r2.w = ps;
    r5.xy = (r2.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.w = r2.z * 0.15915494 + 0.5;
    ps = r1.x;
    r3.xyz = r7.www * LocalToWorld[3].xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r4 = r8.wwww * LocalToWorld[3];
    r13.x = ps;
    r3.xyz = r7.zzz * LocalToWorld[2].xzy + r3.xzy;
    r4 = r8.zzzz * LocalToWorld[2] + r4;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.w);
    r13.y = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r4 = r8.yyyy * LocalToWorld[1] + r4;
    r3.xyz = r7.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r7.xxx * LocalToWorld[0].xzy + r3.xzy;
    r12 = r8.xxxx * LocalToWorld[0] + r4;
    ps = cos(r0.x);
    r5.zw = r13.xy * r0.yz;
    r0.w = ps;
    r14.xyz = -r12.zyx + CameraWorldPosition.zyx;
    r3.xyz = r12.xyz - r3.xzy;
    ps = sin(r0.x);
    r10 = r0.wwww * CameraRight.wzyx;
    r0.x = ps;
    r4 = r0.xxxx * CameraRight.zywx;
    ps = (-1.0) * r0.w;
    r9.z = dot(r14.xzy, r14.xzy);
    r9.w = ps;
    r11 = r9.wwww * CameraUp.wyzx + r4.zyxw;
    r10 = r0.xxxx * CameraUp.wyzx + r10.xzyw;
    r10 = r10.xwyz * ParticleUpRightResultScalars.xxxx;
    r11 = r11.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r10.x;
    r9.w = dot(r3.zxy, r3.zxy);
    ps = r0.z * ps;
    r4.xy = max(r9.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r4.x));
    r10.x = r0.x * r13.y;
    r0.x = ps;
    ps = rsqrt(abs(r4.y));
    r14.xyz = r14.zyx * r0.xxx;
    r0.x = ps;
    r15.xyz = r3.zyx * r0.xxx;
    r4.xyz = -r15.zyx * ParticleUpRightResultScalars.yyy + r10.yzw;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r10.yzw = r14.zxy * r15.yxz;
    r3.xyz = r14.zxy * AxisRotationVectors[a0].yzx;
    r10.yzw = r14.xzy * r15.yzx - r10.wzy;
    r3.xyz = r14.xzy * AxisRotationVectors[a0].yxz - r3.zyx;
    r9.z = dot(r3.xzy, r3.xzy);
    ps = r11.x;
    r9.w = dot(r10.ywz, r10.ywz);
    ps = r0.y * ps;
    r9.zw = max(r9.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r9.w));
    r11.x = r0.x * r13.x;
    r0.x = ps;
    ps = rsqrt(abs(r9.z));
    r13.yzw = r10.ywz * r0.xxx;
    r0.x = ps;
    r3 = r3 * r0.xxxw;
    r13.x = r3.w + r4.w;
    r3.xyz = r3.zyx * AxisRotationVectors[a0].www;
    r10.yzw = (r2.www == 0.0) ? r3.xzy : AxisRotationVectors[a0].xzy;
    r14 = (-abs(r5.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r3.xzyz;
    r0.xw = (-abs(r5.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r3.yx;
    r3.yz = r0.wx * ParticleUpRightResultScalars.zz + r4.xy;
    r3.w = r14.w * ParticleUpRightResultScalars.z + r4.z;
    r4.xyw = r10.zyw * ParticleUpRightResultScalars.zzz + r4.zxy;
    r15 = r13.xzwy * ParticleUpRightResultScalars.xyyy;
    ps = r15.x + r15.y;
    r13.xyz = r11.ywz + r15.zwy;
    r13.w = ps;
    ps = r5.w;
    r5.y = dot(r3.wyz, LightDirection.zxy);
    r13 = r14.yxzx * ParticleUpRightResultScalars.zzzz + r13.yzxw;
    ps = r4.y * ps;
    r5.x = dot(r13.xyz, LightDirection.zxy);
    r10.y = ps;
    ps = r5.w;
    r11.yzw = r5.zzz * r13.wzx;
    ps = r4.x * ps;
    r14.xyz = r13.xyz * r3.zwy;
    r10.z = ps;
    r4.xyz = r13.yxz * r3.zyw - r14.zyx;
    ps = r5.w;
    r11 = r12.wyzx + r11.xzwy;
    ps = r4.w * ps;
    r0.x = dot(r4.xzy, r4.xzy);
    r10.w = ps;
    ps = rsqrt(abs(r0.x));
    r10 = r11.xwyz + r10.xywz;
    r0.x = ps;
    r11.xyz = r4.xyz * r0.xxx;
    r4 = r10.xxxx * ViewProjectionMatrix[3].xwzy;
    r12.xyz = -r10.wzy * CameraPosition.www + CameraPosition.zyx;
    r3.x = dot(r13.xyz, r12.xzy);
    r3.y = dot(r3.wyz, r12.xzy);
    r3.z = dot(r11.xzy, r12.xzy);
    r5.z = dot(r11.xzy, LightDirection.zxy);
    r4 = r10.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r10.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r10.yyyy * ViewProjectionMatrix[0] + r4.xzyw;
    r0.x = r2.z * 0.15915494 + 0.5;
    r11.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r10 = r8.wwww * LocalToWorld[3];
    r9.z = ps;
    r11.xyz = r7.zzz * LocalToWorld[2].xyz + r11.xzy;
    r10 = r8.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r9.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r10 = r8.yyyy * LocalToWorld[1].xzwy + r10.xzwy;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r11.xzy;
    r7.xyz = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0].xwyz + r10.xzwy;
    ps = cos(r0.w);
    r2.zw = r9.zw * r0.yz;
    r0.x = ps;
    r12.xyz = -r8.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r7.xyz = r8.wzx - r7.zyx;
    r5.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r11 = r5.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r3.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r12.zxy, r12.zxy);
    r0.x = ps;
    r10 = r5.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r3.w;
    r0.z = dot(r7.xzy, r7.xzy);
    ps = r10.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r9.w;
    r3.w = ps;
    ps = rsqrt(abs(r0.z));
    r14.xyz = r12.xyz * r3.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r7.zyx * r0.yyy;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r12.xyz = r14.zxy * r13.yzx;
    r7.xyz = r14.zxy * AxisRotationVectors[a0].yzx;
    r7.yzw = r14.xzy * AxisRotationVectors[a0].yxz - r7.zyx;
    r12.xyz = r14.xzy * r13.yxz - r12.zyx;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r0.w;
    r0.z = dot(r7.ywz, r7.ywz);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r7.x = r0.w * r9.z;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r12.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r7.wzy * r0.yyy;
    r7.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r3.www == 0.0) ? r7.ywz : AxisRotationVectors[a0].xzy;
    r7.yzw = (r3.www == 0.0) ? AxisRotationVectors[a0].xzy : r7.ywz;
    r7.yzw = r7.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r13.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r7.yzw = r12.yzx * ParticleUpRightResultScalars.yyy + r7.zwy;
    r7.yzw = r11.yzw * ParticleUpRightResultScalars.xxx + r7.wyz;
    r0.yzw = r10.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r2.www * r0.yzw;
    r7.yzw = r2.zzz * r7.yzw;
    r7 = r8.ywzx + r7.xzwy;
    r7 = r7.xywz + r0.xwyz;
    r0 = r7.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.x = ps;
    o5.yzw = 0.0;
    o0.xy = r9.xy;
    o1.xy = r2.xy;
    o4.xyz = r5.xyz;
    o6.xyz = r3.xyz;
    o2 = r1.ywxz;
    o3 = r6;
    o7 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord4 = o4;
    Out.texcoord5 = o5;
    Out.texcoord6 = o6;
    Out.texcoord7 = o7;
    return Out;
}
