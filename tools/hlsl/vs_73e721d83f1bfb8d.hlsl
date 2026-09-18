// vs_73e721d83f1bfb8d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 456 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000720 00710010 00000000 00000000 00006908 00000001 00000008 00000008 00000290 0010000E 0000300F 00006010 00005011 00001012 00015013 00025014 00235015 00003050 00013151 0002F252 0003F353 00047454 0005F555 00067656 0007F757 0000108F 00001090 00001094 00001095 00001091 00001092 00001093 00001096
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
float4 LightPositionAndInvRadius : register(c16); // float4
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
    float4 r16 = 0.0;
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

    r9 = In.position0;
    r8 = In.normal0;
    r0.yz = In.tangent0.xy;
    r5.xy = In.texcoord0.xy;
    r4.w = In.blendweight0.x;
    r5.zw = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r3 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r7.w = CameraUp.x * (-1.0);
    r4.z = ps;
    r14.xy = (r4.zz == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.w = r4.w * 0.15915494 + 0.5;
    ps = r1.x;
    r2.xyz = r8.www * LocalToWorld[3].xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r6 = r9.wwww * LocalToWorld[3];
    r12.z = ps;
    r2.xyz = r8.zzz * LocalToWorld[2].xzy + r2.xzy;
    r6 = r9.zzzz * LocalToWorld[2] + r6;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.w);
    r12.w = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r6 = r9.yyyy * LocalToWorld[1] + r6;
    r2.xyz = r8.yyy * LocalToWorld[1].xyz + r2.xzy;
    r2.xyz = r8.xxx * LocalToWorld[0].xzy + r2.xzy;
    r10 = r9.xxxx * LocalToWorld[0] + r6;
    ps = cos(r0.x);
    r4.xy = r12.zw * r0.yz;
    r0.w = ps;
    r13.xyz = -r10.zyx + CameraWorldPosition.zyx;
    r7.xyz = r10.xyz - r2.xzy;
    ps = sin(r0.x);
    r2 = r0.wwww * CameraRight.wzyx;
    r0.x = ps;
    r11 = r0.xxxx * CameraRight.xzyw;
    ps = (-1.0) * r0.w;
    r12.x = dot(r13.xzy, r13.xzy);
    r6.x = ps;
    r6 = r6.xxxx * CameraUp.wyzx + r11.wzyx;
    r2 = r0.xxxx * CameraUp.wyzx + r2.xzyw;
    r2 = r2.xwyz * ParticleUpRightResultScalars.xxxx;
    r6 = r6.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r2.x;
    r12.y = dot(r7.zxy, r7.zxy);
    ps = r0.z * ps;
    r11.yz = max(r12.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r11.y));
    r2.x = r0.x * r12.w;
    r0.x = ps;
    ps = rsqrt(abs(r11.z));
    r15.xyz = r13.zyx * r0.xxx;
    r0.x = ps;
    r16.xyz = r7.zyx * r0.xxx;
    r2.yzw = -r16.zyx * ParticleUpRightResultScalars.yyy + r2.yzw;
    a0 = xe_mova(r4.z);
    ps = r4.z;
    r13.xyz = r15.zxy * r16.yxz;
    r7.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r13.xyz = r15.xzy * r16.yzx - r13.zyx;
    r7.xyz = r15.xzy * AxisRotationVectors[a0].yxz - r7.zyx;
    r12.x = dot(r7.xzy, r7.xzy);
    ps = r6.x;
    r12.y = dot(r13.xzy, r13.xzy);
    ps = r0.y * ps;
    r12.xy = max(r12.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r12.y));
    r6.x = r0.x * r12.z;
    r0.x = ps;
    ps = rsqrt(abs(r12.x));
    r11.yzw = r13.xzy * r0.xxx;
    r0.x = ps;
    r7 = r7 * r0.xxxw;
    r11.x = r7.w + r11.x;
    r7.xyz = r7.zyx * AxisRotationVectors[a0].www;
    r13.xyz = (r4.zzz == 0.0) ? r7.xzy : AxisRotationVectors[a0].xzy;
    r12 = (-abs(r14.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r7.xzyz;
    r0.xw = (-abs(r14.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r7.yx;
    r7.yz = r0.wx * ParticleUpRightResultScalars.zz + r2.yz;
    r7.w = r12.w * ParticleUpRightResultScalars.z + r2.w;
    r2.yzw = r13.yzx * ParticleUpRightResultScalars.zzz + r2.wzy;
    r13 = r11.xzwy * ParticleUpRightResultScalars.xyyy;
    r2.yzw = r4.yyy * r2.wyz;
    ps = r13.x + r13.y;
    r11.xyz = r6.ywz + r13.zwy;
    r11.w = ps;
    r12 = r12.yxzx * ParticleUpRightResultScalars.zzzz + r11.yzxw;
    r6.yzw = r4.xxx * r12.wzx;
    r4.xyz = r12.xyz * r7.zwy;
    r4.xyz = r12.yxz * r7.zyw - r4.zyx;
    r6 = r10.wyzx + r6.xzwy;
    r0.x = dot(r4.xzy, r4.xzy);
    ps = rsqrt(abs(r0.x));
    r2 = r6.yzxw + r2.wzxy;
    r0.x = ps;
    r11.xyz = r4.xyz * r0.xxx;
    ps = r2.w;
    r10 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r0.w = ps;
    r13.xyz = -r2.yxw * CameraPosition.www + CameraPosition.zyx;
    ps = LightPositionAndInvRadius.x - r0.w;
    r4.x = dot(r12.xyz, r13.xzy);
    r6.x = ps;
    ps = LightPositionAndInvRadius.y - r2.x;
    r4.y = dot(r7.wyz, r13.xzy);
    r6.y = ps;
    ps = LightPositionAndInvRadius.z - r2.y;
    r4.z = dot(r11.xzy, r13.xzy);
    r6.z = ps;
    r7.x = dot(r12.xyz, r6.zxy);
    r7.y = dot(r7.wyz, r6.zxy);
    r7.z = dot(r11.xzy, r6.zxy);
    r10 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r10;
    r10 = r2.xxxx * ViewProjectionMatrix[1].xzyw + r10.xzwy;
    r2 = r2.wwww * ViewProjectionMatrix[0] + r10.xzyw;
    r0.x = r4.w * 0.15915494 + 0.5;
    r10.xyw = r8.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r11 = r9.wwww * LocalToWorld[3];
    r10.z = ps;
    r12.xyz = r8.zzz * LocalToWorld[2].xyz + r10.xwy;
    r11 = r9.zzzz * LocalToWorld[2] + r11;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r10.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r11 = r9.yyyy * LocalToWorld[1].xzwy + r11.xzwy;
    r8.yzw = r8.yyy * LocalToWorld[1].xzy + r12.xzy;
    r8.xyz = r8.xxx * LocalToWorld[0].xyz + r8.ywz;
    r9 = r9.xxxx * LocalToWorld[0].xwyz + r11.xzwy;
    ps = cos(r0.w);
    r10.xy = r10.zw * r0.yz;
    r0.x = ps;
    r13.xyz = -r9.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r8.xyz = r9.wzx - r8.zyx;
    r6.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r12 = r6.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r11 = r0.xxxx * CameraRight.wzyx;
    r4.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r13.zxy, r13.zxy);
    r0.x = ps;
    r11 = r6.wwww * CameraUp.wxzy + r11.xwyz;
    r12 = r0.xxxx * CameraUp.wxzy + r12.xwyz;
    ps = r4.w;
    r0.z = dot(r8.xzy, r8.xzy);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r10.w;
    r4.w = ps;
    ps = rsqrt(abs(r0.z));
    r15.xyz = r13.xyz * r4.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r14.xyz = r8.zyx * r0.yyy;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r13.xyz = r15.zxy * r14.yzx;
    r8.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r8.yzw = r15.xzy * AxisRotationVectors[a0].yxz - r8.zyx;
    r13.xyz = r15.xzy * r14.yxz - r13.zyx;
    r0.y = dot(r13.xzy, r13.xzy);
    ps = r0.w;
    r0.z = dot(r8.ywz, r8.ywz);
    ps = r12.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r8.x = r0.w * r10.z;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r13.xyz = r13.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r8.wzy * r0.yyy;
    r8.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r4.www == 0.0) ? r8.ywz : AxisRotationVectors[a0].xzy;
    r8.yzw = (r4.www == 0.0) ? AxisRotationVectors[a0].xzy : r8.ywz;
    r8.yzw = r8.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r14.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r8.yzw = r13.yzx * ParticleUpRightResultScalars.yyy + r8.zwy;
    r8.yzw = r12.yzw * ParticleUpRightResultScalars.xxx + r8.wyz;
    r0.yzw = r11.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r10.yyy * r0.yzw;
    r8.yzw = r10.xxx * r8.yzw;
    r8 = r9.ywzx + r8.xzwy;
    r8 = r8.xywz + r0.xwyz;
    r0 = r8.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r8.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r8.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r8.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r5.xy;
    o1.xy = r5.zw;
    o4.xyz = r7.xyz;
    o5.xyz = r6.xyz * LightPositionAndInvRadius.www;
    o5.w = 0.0;
    o6.xyz = r4.xyz;
    o2 = r1.ywxz;
    o3 = r3;
    o7 = r2;

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
