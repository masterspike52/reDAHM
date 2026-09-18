// vs_503b2387a423ef7f.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 474 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000768 00710010 00000000 00000000 00006D08 00000001 00000008 00000008 00000290 0010000E 0000300F 00006010 00005011 00001012 00015013 00025014 00235015 00003050 00013151 0002F252 0003F353 0004F456 00057557 0006F6A0 0007F7A1 00001097 00001098 0000109B 0000109C 00001096 00001095 0000109A 00001099
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
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
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
    r4.zw = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r4.xy = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r3 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r11.xw = (r0.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r2.x = r0.w * 0.15915494 + 0.5;
    r6 = r9.wwww * LocalToWorld[3].xwzy;
    ps = frac(r2.x);
    r5.xyz = r8.www * LocalToWorld[3].xzy;
    r2.x = ps;
    r5.xyz = r8.zzz * LocalToWorld[2].xyz + r5.xzy;
    r6 = r9.zzzz * LocalToWorld[2].xwzy + r6;
    r2.y = r2.x * 6.2831855 - 3.1415927;
    r6 = r9.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r5.xyz = r8.yyy * LocalToWorld[1].xzy + r5.xzy;
    r5.xyz = r8.xxx * LocalToWorld[0].xyz + r5.xzy;
    r15 = r9.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    ps = cos(r2.y);
    r13.yz = r1.xz - 0.5;
    r2.x = ps;
    r6.xyz = r2.xxx * CameraRight.zyx;
    r7.xyz = -r15.wyx + CameraWorldPosition.zyx;
    ps = sin(r2.y);
    r5.xyz = r15.wyx - r5.zyx;
    r2.z = ps;
    r16.xyz = r2.zzz * CameraUp.zxy + r6.xzy;
    r10.x = dot(r7.xzy, r7.xzy);
    ps = (-1.0) * r2.x;
    r10.y = dot(r5.xzy, r5.xzy);
    r2.y = ps;
    ps = r2.w;
    r6.xyz = r2.yyy * CameraUp.zyx;
    ps = r2.x * ps;
    r10.zw = r2.zx * CameraRight.ww;
    r6.w = ps;
    r6 = r2.zzzz * CameraRight.zxyx + r6.xzyw;
    r2.zw = r2.yz * CameraUp.ww + r10.zw;
    r2.xy = max(r10.xy, 0.01);
    ps = rsqrt(abs(r2.x));
    r13.xw = r2.zw * ParticleUpRightResultScalars.xx;
    r2.z = ps;
    ps = rsqrt(abs(r2.y));
    r12.xyz = r7.xyz * r2.zzz;
    r2.x = ps;
    r14.xyz = r5.zyx * r2.xxx;
    r2.xyz = r12.xzy * r14.yzx;
    r10.xyz = -r14.xyz * ParticleUpRightResultScalars.yyy;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7 = r13 * r0.yyzz;
    r5.xyz = r12.xzy * AxisRotationVectors[a0].yzx;
    r10.xyz = r16.yxz * ParticleUpRightResultScalars.xxx + r10.xzy;
    r2.yzw = r12.zxy * r14.yxz - r2.zyx;
    r12.xyz = r12.zxy * AxisRotationVectors[a0].yxz - r5.zyx;
    r5.x = dot(r12.xzy, r12.xzy);
    r5.y = dot(r2.ywz, r2.ywz);
    r5.xw = max(r5.xy, 0.01);
    ps = rsqrt(abs(r5.x));
    r10.w = r7.x * r13.y;
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r12.zyx * r2.xxx;
    r2.x = ps;
    r2.xyz = r2.wyz * r2.xxx;
    r2.xyz = r2.xzy * ParticleUpRightResultScalars.yyy;
    r5.xyz = r5.xyz * AxisRotationVectors[a0].www;
    r6 = r6.yxzw * ParticleUpRightResultScalars.xxxx + r2.xzyx;
    r2 = (-abs(r11.xxxw) >= 0.0) ? AxisRotationVectors[a0].xyzz : r5.xyzz;
    r11.xyz = (r0.xxx == 0.0) ? r5.xyz : AxisRotationVectors[a0].xyz;
    r5.xy = (-abs(r11.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r5.yx;
    r5.yw = r5.xy * ParticleUpRightResultScalars.zz + r10.zx;
    r12.xyz = r11.zyx * ParticleUpRightResultScalars.zzz + r10.yzx;
    r2 = r2 * ParticleUpRightResultScalars.zzzz;
    r5.z = r10.y + r2.w;
    r11.xzw = r6.xyz + r2.xzy;
    r6.xyz = r11.xwz * 0.5 + 0.5;
    ps = r6.w;
    r10.yz = r7.yy * r11.wz;
    ps = r2.x + ps;
    r16.xyz = r11.zxw * r12.yxz;
    r0.x = ps;
    ps = r7.y;
    r2.xyz = r7.zzz * r5.wyz;
    ps = r0.x * ps;
    r14.xyz = r11.zxw * r5.yzw;
    r10.x = ps;
    r7.xyz = r11.xzw * r12.yzx - r16.zyx;
    r10 = r15.xywz + r10;
    ps = r7.w;
    r5.x = dot(r7.xzy, r7.xzy);
    r14.xyz = r11.xzw * r5.ywz - r14.zyx;
    ps = r13.z * ps;
    r0.x = dot(r14.xzy, r14.xzy);
    r2.w = ps;
    ps = rsqrt(abs(r5.x));
    r2 = r10 + r2;
    r5.x = ps;
    r7.xyz = r7.xyz * r5.xxx;
    r13.xyz = -r2.zyx * CameraPosition.www + CameraPosition.zyx;
    r5.x = dot(r11.zxw, r13.xzy);
    r5.y = dot(r5.zwy, r13.xzy);
    ps = rsqrt(abs(r0.x));
    r10.xyz = r7.yzz * r12.xxy;
    r0.x = ps;
    r14.xyz = r14.xyz * r0.xxx;
    ps = -r11.w;
    r5.z = dot(r14.xzy, r13.xzy);
    r11.y = ps;
    r10.xyz = r7.xxy * r12.yzz - r10.xyz;
    r7.w = dot(r11.xyz, r10.xyz);
    r7 = r7.zyxw * 0.5 + 0.5;
    r0.x = r0.w * 0.15915494 + 0.5;
    r10.xyw = r8.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r1.x;
    r11 = r9.wwww * LocalToWorld[3];
    r10.z = ps;
    r12.xyz = r8.zzz * LocalToWorld[2].xzy + r10.xwy;
    r11 = r9.zzzz * LocalToWorld[2] + r11;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r10.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r11 = r9.yyyy * LocalToWorld[1].xzwy + r11.xzwy;
    r8.yzw = r8.yyy * LocalToWorld[1].xyz + r12.xzy;
    r8.xyz = r8.xxx * LocalToWorld[0].xzy + r8.ywz;
    r9 = r9.xxxx * LocalToWorld[0].xwyz + r11.xzwy;
    ps = cos(r0.w);
    r10.xy = r10.zw * r0.yz;
    r0.x = ps;
    r13.xyz = -r9.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r8.xyz = r9.wzx - r8.yzx;
    r6.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r12 = r6.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r11 = r0.xxxx * CameraRight.wzyx;
    r5.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r13.zxy, r13.zxy);
    r0.x = ps;
    r11 = r6.wwww * CameraUp.wxzy + r11.xwyz;
    r12 = r0.xxxx * CameraUp.wxzy + r12.xwyz;
    ps = r5.w;
    r0.z = dot(r8.xzy, r8.xzy);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r10.w;
    r5.w = ps;
    ps = rsqrt(abs(r0.z));
    r15.xyz = r13.xyz * r5.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r14.xyz = r8.xyz * r0.yyy;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r13.xyz = r15.zxy * r14.yxz;
    r8.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r8.yzw = r15.xzy * AxisRotationVectors[a0].yxz - r8.zyx;
    r13.xyz = r15.xzy * r14.yzx - r13.zyx;
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
    r13.xyz = r13.xzy * r0.www;
    r0.y = ps;
    r0.yzw = r8.yzw * r0.yyy;
    r8.yzw = r0.wzy * AxisRotationVectors[a0].www;
    r0.yzw = (r5.www == 0.0) ? r8.ywz : AxisRotationVectors[a0].xzy;
    r8.yzw = (r5.www == 0.0) ? AxisRotationVectors[a0].xzy : r8.ywz;
    r8.yzw = r8.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r14.xzy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r8.yzw = r13.xzy * ParticleUpRightResultScalars.yyy + r8.zwy;
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
    r0 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r2.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    o5.xyz = r5.xyz;
    o4 = r2.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    o0.xy = r4.zw;
    o1.xy = r4.xy;
    o7.xyz = r6.xyz;
    o7.w = 0.0;
    o6 = r7;
    o2 = r1.ywxz;
    o3 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
