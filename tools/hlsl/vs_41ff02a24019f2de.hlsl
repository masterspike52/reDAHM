// vs_41ff02a24019f2de.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 438 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006D8 0051000D 00000000 00000000 000050C6 00000001 00000006 00000006 00000290 0010000D 0000300E 0000600F 00005010 00001011 00215012 00003050 0001F151 00027254 0003F355 00047456 0005F557 0000108C 0000108F 0000108D 0000108B 0000108E 00001090
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
    r3 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r4.w = CameraUp.x * (-1.0);
    r1.w = ps;
    r2.xy = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r4.xyz = r6.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.z;
    r5 = r7.wwww * LocalToWorld[3];
    r12.x = ps;
    r4.xyz = r6.zzz * LocalToWorld[2].xzy + r4.xzy;
    r5 = r7.zzzz * LocalToWorld[2] + r5;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r12.y = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r5 = r7.yyyy * LocalToWorld[1] + r5;
    r4.xyz = r6.yyy * LocalToWorld[1].xyz + r4.xzy;
    r4.xyz = r6.xxx * LocalToWorld[0].xzy + r4.xzy;
    r10 = r7.xxxx * LocalToWorld[0] + r5;
    ps = cos(r0.x);
    r2.zw = r12.xy * r1.yz;
    r0.y = ps;
    r8.yzw = -r10.zyx + CameraWorldPosition.zyx;
    r4.xyz = r10.xyz - r4.xzy;
    ps = sin(r0.x);
    r11 = r0.yyyy * CameraRight.wzyx;
    r0.x = ps;
    r5 = r0.xxxx * CameraRight.zywx;
    ps = (-1.0) * r0.y;
    r12.z = dot(r8.ywz, r8.ywz);
    r8.x = ps;
    r9 = r8.xxxx * CameraUp.wyzx + r5.zyxw;
    r11 = r0.xxxx * CameraUp.wyzx + r11.xzyw;
    r11 = r11.wyzx * ParticleUpRightResultScalars.xxxx;
    r9 = r9.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r11.w;
    r12.w = dot(r4.zxy, r4.zxy);
    ps = r1.z * ps;
    r5.xy = max(r12.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r8.x = r0.x * r12.y;
    r0.x = ps;
    ps = rsqrt(abs(r5.y));
    r8.yzw = r8.wzy * r0.xxx;
    r0.x = ps;
    r13.xyz = r4.zyx * r0.xxx;
    r5.xyz = -r13.zyx * ParticleUpRightResultScalars.yyy + r11.xyz;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r11.xyz = r8.wyz * r13.yxz;
    r4.xyz = r8.wyz * AxisRotationVectors[a0].yzx;
    r11.xyz = r8.ywz * r13.yzx - r11.zyx;
    r4.xyz = r8.ywz * AxisRotationVectors[a0].yxz - r4.zyx;
    r8.y = dot(r4.xzy, r4.xzy);
    ps = r9.x;
    r8.z = dot(r11.xzy, r11.xzy);
    ps = r1.y * ps;
    r8.yz = max(r8.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r8.z));
    r9.x = r0.x * r12.x;
    r0.x = ps;
    ps = rsqrt(abs(r8.y));
    r11.yzw = r11.xzy * r0.xxx;
    r0.x = ps;
    r4 = r4 * r0.xxxy;
    r11.x = r4.w + r5.w;
    r4.xyz = r4.zyx * AxisRotationVectors[a0].www;
    r8.yzw = (r1.www == 0.0) ? r4.xzy : AxisRotationVectors[a0].xzy;
    r12 = (-abs(r2.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r4.xzyz;
    r0.xy = (-abs(r2.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r4.yx;
    r4.yz = r0.yx * ParticleUpRightResultScalars.zz + r5.xy;
    r4.w = r12.w * ParticleUpRightResultScalars.z + r5.z;
    r5.xyw = r8.zyw * ParticleUpRightResultScalars.zzz + r5.zxy;
    r13 = r11.xzwy * ParticleUpRightResultScalars.xyyy;
    ps = r13.x + r13.y;
    r11.xyz = r9.ywz + r13.zwy;
    r11.w = ps;
    ps = r2.w;
    r2.y = dot(r4.wyz, LightDirection.zxy);
    r11 = r12.yxzx * ParticleUpRightResultScalars.zzzz + r11.yzxw;
    ps = r5.y * ps;
    r2.x = dot(r11.xyz, LightDirection.zxy);
    r8.y = ps;
    ps = r2.w;
    r9.yzw = r2.zzz * r11.wzx;
    ps = r5.x * ps;
    r12.xyz = r11.xyz * r4.zwy;
    r8.z = ps;
    r5.xyz = r11.yxz * r4.zyw - r12.zyx;
    ps = r2.w;
    r9 = r10.wyzx + r9.xzwy;
    ps = r5.w * ps;
    r0.x = dot(r5.xzy, r5.xzy);
    r8.w = ps;
    ps = rsqrt(abs(r0.x));
    r8 = r9.xwyz + r8.xywz;
    r0.x = ps;
    r9.xyz = r5.xyz * r0.xxx;
    r5 = r8.xxxx * ViewProjectionMatrix[3].xwzy;
    r10.xyz = -r8.wzy * CameraPosition.www + CameraPosition.zyx;
    r4.x = dot(r11.xyz, r10.xzy);
    r4.y = dot(r4.wyz, r10.xzy);
    r4.z = dot(r9.xzy, r10.xzy);
    r2.z = dot(r9.xzy, LightDirection.zxy);
    r5 = r8.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r8.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r8.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    r0.x = r1.x * 0.15915494 + 0.5;
    r8.xyw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r9 = r7.wwww * LocalToWorld[3];
    r8.z = ps;
    r10.xyz = r6.zzz * LocalToWorld[2].xyz + r8.xwy;
    r9 = r7.zzzz * LocalToWorld[2] + r9;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r9 = r7.yyyy * LocalToWorld[1].xzwy + r9.xzwy;
    r6.yzw = r6.yyy * LocalToWorld[1].xzy + r10.xzy;
    r6.xyz = r6.xxx * LocalToWorld[0].xyz + r6.ywz;
    r7 = r7.xxxx * LocalToWorld[0].xwyz + r9.xzwy;
    ps = cos(r0.y);
    r8.xy = r8.zw * r1.yz;
    r0.x = ps;
    r11.xyz = -r7.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r6.xyz = r7.wzx - r6.zyx;
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
    r6 = r7.ywzx + r6.xzwy;
    r6 = r6.xywz + r1.xwyz;
    r1 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r6.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r6.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r0.zw;
    o2.xyz = r2.xyz;
    o4.xyz = r4.xyz;
    o1 = r3;
    o5 = r5;

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
