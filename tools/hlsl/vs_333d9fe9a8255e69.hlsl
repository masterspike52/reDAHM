// vs_333d9fe9a8255e69.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 441 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006E4 0051000E 00000000 00000000 000050C6 00000001 00000006 00000006 00000290 0010000D 0000300E 0000600F 00005010 00001011 00215012 00003050 0001F151 00027254 0003F355 00047456 0005F557 0000108C 00001090 0000108D 0000108E 0000108F 00001091
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r1.x = In.blendweight0.x;
    r4 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r3.w = CameraUp.x * (-1.0);
    r1.w = ps;
    r5.zw = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r2.xyz = r6.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.z;
    r8 = r7.wwww * LocalToWorld[3];
    r11.z = ps;
    r2.xyz = r6.zzz * LocalToWorld[2].xzy + r2.xzy;
    r8 = r7.zzzz * LocalToWorld[2] + r8;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r11.w = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r8 = r7.yyyy * LocalToWorld[1] + r8;
    r2.xyz = r6.yyy * LocalToWorld[1].xyz + r2.xzy;
    r2.xyz = r6.xxx * LocalToWorld[0].xzy + r2.xzy;
    r9 = r7.xxxx * LocalToWorld[0] + r8;
    ps = cos(r0.x);
    r5.xy = r11.zw * r1.yz;
    r0.y = ps;
    r12.xyz = -r9.zyx + CameraWorldPosition.zyx;
    r3.xyz = r9.xyz - r2.xzy;
    ps = sin(r0.x);
    r2 = r0.yyyy * CameraRight.wzyx;
    r0.x = ps;
    r10 = r0.xxxx * CameraRight.xzyw;
    ps = (-1.0) * r0.y;
    r11.x = dot(r12.xzy, r12.xzy);
    r8.x = ps;
    r8 = r8.xxxx * CameraUp.wyzx + r10.wzyx;
    r2 = r0.xxxx * CameraUp.wyzx + r2.xzyw;
    r2 = r2.xwyz * ParticleUpRightResultScalars.xxxx;
    r8 = r8.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r2.x;
    r11.y = dot(r3.zxy, r3.zxy);
    ps = r1.z * ps;
    r10.yz = max(r11.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r10.y));
    r2.x = r0.x * r11.w;
    r0.x = ps;
    ps = rsqrt(abs(r10.z));
    r13.xyz = r12.zyx * r0.xxx;
    r0.x = ps;
    r14.xyz = r3.zyx * r0.xxx;
    r2.yzw = -r14.zyx * ParticleUpRightResultScalars.yyy + r2.yzw;
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
    r11 = (-abs(r5.zzzw) >= 0.0) ? AxisRotationVectors[a0].xzyz : r3.xzyz;
    r0.xy = (-abs(r5.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r3.yx;
    r3.yz = r0.yx * ParticleUpRightResultScalars.zz + r2.yz;
    r3.w = r11.w * ParticleUpRightResultScalars.z + r2.w;
    r2.yzw = r12.yzx * ParticleUpRightResultScalars.zzz + r2.wzy;
    r12 = r10.xzwy * ParticleUpRightResultScalars.xyyy;
    r2.yzw = r5.yyy * r2.wyz;
    ps = r12.x + r12.y;
    r10.xyz = r8.ywz + r12.zwy;
    r10.w = ps;
    r11 = r11.yxzx * ParticleUpRightResultScalars.zzzz + r10.yzxw;
    r8.yzw = r5.xxx * r11.wzx;
    r5.xyz = r11.xyz * r3.zwy;
    r5.xyz = r11.yxz * r3.zyw - r5.zyx;
    r8 = r9.wyzx + r8.xzwy;
    r0.x = dot(r5.xzy, r5.xzy);
    ps = rsqrt(abs(r0.x));
    r2 = r8.yzxw + r2.wzxy;
    r0.x = ps;
    r10.xyz = r5.xyz * r0.xxx;
    ps = r2.w;
    r9 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r0.y = ps;
    r12.xyz = -r2.yxw * CameraPosition.www + CameraPosition.zyx;
    ps = LightPositionAndInvRadius.x - r0.y;
    r8.x = dot(r11.xyz, r12.xzy);
    r5.x = ps;
    ps = LightPositionAndInvRadius.y - r2.x;
    r8.y = dot(r3.wyz, r12.xzy);
    r5.y = ps;
    ps = LightPositionAndInvRadius.z - r2.y;
    r8.z = dot(r10.xzy, r12.xzy);
    r5.z = ps;
    r3.x = dot(r11.xyz, r5.zxy);
    r3.y = dot(r3.wyz, r5.zxy);
    r3.z = dot(r10.xzy, r5.zxy);
    r9 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r9;
    r9 = r2.xxxx * ViewProjectionMatrix[1].xzyw + r9.xzwy;
    r2 = r2.wwww * ViewProjectionMatrix[0] + r9.xzyw;
    r0.x = r1.x * 0.15915494 + 0.5;
    r9.xyw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r10 = r7.wwww * LocalToWorld[3];
    r9.z = ps;
    r11.xyz = r6.zzz * LocalToWorld[2].xyz + r9.xwy;
    r10 = r7.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r9.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r10 = r7.yyyy * LocalToWorld[1].xzwy + r10.xzwy;
    r6.yzw = r6.yyy * LocalToWorld[1].xzy + r11.xzy;
    r6.xyz = r6.xxx * LocalToWorld[0].xyz + r6.ywz;
    r7 = r7.xxxx * LocalToWorld[0].xwyz + r10.xzwy;
    ps = cos(r0.y);
    r9.xy = r9.zw * r1.yz;
    r0.x = ps;
    r12.xyz = -r7.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r6.xyz = r7.wzx - r6.zyx;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r11 = r1.wwww * CameraRight.wzyx;
    r0.y = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r12.zxy, r12.zxy);
    r0.x = ps;
    r10 = r1.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r1.z;
    r1.y = dot(r6.xzy, r6.xzy);
    ps = r10.x * ps;
    r1.yz = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r1.x = r0.x * r9.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r12.xyz = r12.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r6.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r6.xyz = r12.zxy * r13.yzx;
    r1.yzw = r12.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r12.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r12.xyz = r12.xzy * r13.yxz - r6.zyx;
    r6.x = dot(r12.xzy, r12.xzy);
    ps = r0.y;
    r6.y = dot(r1.ywz, r1.ywz);
    ps = r11.x * ps;
    r6.yz = max(r6.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r0.y * r9.z;
    r0.y = ps;
    ps = rsqrt(abs(r6.z));
    r12.xyz = r12.zxy * r0.yyy;
    r0.y = ps;
    r1.yzw = r1.wzy * r0.yyy;
    r6.yzw = r1.yzw * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r6.ywz : AxisRotationVectors[a0].xzy;
    r6.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r6.ywz;
    r6.yzw = r6.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r13.zxy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r6.yzw = r12.yzx * ParticleUpRightResultScalars.yyy + r6.zwy;
    r6.yzw = r11.yzw * ParticleUpRightResultScalars.xxx + r6.wyz;
    r1.yzw = r10.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r9.yyy * r1.yzw;
    r6.yzw = r9.xxx * r6.yzw;
    r6 = r7.ywzx + r6.xzwy;
    r6 = r6.xywz + r1.xwyz;
    r1 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r6.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r6.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r0.zw;
    o2.xyz = r3.xyz;
    o3.xyz = r5.xyz * LightPositionAndInvRadius.www;
    o3.w = 0.0;
    o4.xyz = r8.xyz;
    o1 = r4;
    o5 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    return Out;
}
