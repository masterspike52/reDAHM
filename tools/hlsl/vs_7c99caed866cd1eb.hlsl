// vs_7c99caed866cd1eb.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 462 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000738 0051000F 00000000 00000000 000054C6 00000001 00000006 00000006 00000290 0010000E 0000300F 00006010 00005011 00001012 00215013 00003050 0001F151 0002F256 00037357 0004F4A0 0005F5A1 00001095 00001098 00001094 00001093 00001097 00001096
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> NORMAL0
//   vertex element: instruction 16 -> TANGENT0
//   vertex element: instruction 17 -> TEXCOORD0
//   vertex element: instruction 18 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r8 = In.position0;
    r7 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r3 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r1.xw = (r0.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r2.x = r0.y * 0.15915494 + 0.5;
    r5 = r8.wwww * LocalToWorld[3].xwzy;
    ps = frac(r2.x);
    r4.xyz = r7.www * LocalToWorld[3].xzy;
    r2.x = ps;
    r4.xyz = r7.zzz * LocalToWorld[2].xyz + r4.xzy;
    r5 = r8.zzzz * LocalToWorld[2].xwzy + r5;
    r2.y = r2.x * 6.2831855 - 3.1415927;
    r5 = r8.yyyy * LocalToWorld[1].xzyw + r5.xzwy;
    r4.xyz = r7.yyy * LocalToWorld[1].xzy + r4.xzy;
    r4.xyz = r7.xxx * LocalToWorld[0].xyz + r4.xzy;
    r14 = r8.xxxx * LocalToWorld[0].xywz + r5.xzwy;
    ps = cos(r2.y);
    r12.yz = r0.zw - 0.5;
    r2.x = ps;
    r5.xyz = r2.xxx * CameraRight.zyx;
    r6.xyz = -r14.wyx + CameraWorldPosition.zyx;
    ps = sin(r2.y);
    r4.xyz = r14.wyx - r4.zyx;
    r2.z = ps;
    r13.xyz = r2.zzz * CameraUp.zxy + r5.xzy;
    r9.x = dot(r6.xzy, r6.xzy);
    ps = (-1.0) * r2.x;
    r9.y = dot(r4.xzy, r4.xzy);
    r2.y = ps;
    ps = r2.w;
    r5.xyz = r2.yyy * CameraUp.zyx;
    ps = r2.x * ps;
    r9.zw = r2.zx * CameraRight.ww;
    r5.w = ps;
    r5 = r2.zzzz * CameraRight.zxyx + r5.xzyw;
    r2.zw = r2.yz * CameraUp.ww + r9.zw;
    r2.xy = max(r9.xy, 0.01);
    ps = rsqrt(abs(r2.x));
    r12.xw = r2.zw * ParticleUpRightResultScalars.xx;
    r2.z = ps;
    ps = rsqrt(abs(r2.y));
    r10.xyz = r6.xyz * r2.zzz;
    r2.x = ps;
    r11.xyz = r4.zyx * r2.xxx;
    r2.xyz = r10.xzy * r11.yzx;
    r9.xyz = -r11.xyz * ParticleUpRightResultScalars.yyy;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r4 = r12 * r1.yyzz;
    r6.xyz = r10.xzy * AxisRotationVectors[a0].yzx;
    r9.xyz = r13.yxz * ParticleUpRightResultScalars.xxx + r9.xzy;
    r2.yzw = r10.zxy * r11.yxz - r2.zyx;
    r10.xyz = r10.zxy * AxisRotationVectors[a0].yxz - r6.zyx;
    r6.x = dot(r10.xzy, r10.xzy);
    r6.y = dot(r2.ywz, r2.ywz);
    r6.xw = max(r6.xy, 0.01);
    ps = rsqrt(abs(r6.x));
    r9.w = r4.x * r12.y;
    r2.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r10.zyx * r2.xxx;
    r2.x = ps;
    r2.xyz = r2.wyz * r2.xxx;
    r2.xyz = r2.xzy * ParticleUpRightResultScalars.yyy;
    r6.xyz = r6.xyz * AxisRotationVectors[a0].www;
    r5 = r5.yxzw * ParticleUpRightResultScalars.xxxx + r2.xzyx;
    r2 = (-abs(r1.xxxw) >= 0.0) ? AxisRotationVectors[a0].xyzz : r6.xyzz;
    r10.xyz = (r0.xxx == 0.0) ? r6.xyz : AxisRotationVectors[a0].xyz;
    r1.xw = (-abs(r1.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r6.yx;
    r6.yw = r1.xw * ParticleUpRightResultScalars.zz + r9.zx;
    r11.xyz = r10.zyx * ParticleUpRightResultScalars.zzz + r9.yzx;
    r2 = r2 * ParticleUpRightResultScalars.zzzz;
    r6.z = r9.y + r2.w;
    r10.xzw = r5.xyz + r2.xzy;
    r5.xyz = r10.xwz * 0.5 + 0.5;
    ps = r5.w;
    r9.yz = r4.yy * r10.wz;
    ps = r2.x + ps;
    r15.xyz = r10.zxw * r11.yxz;
    r0.x = ps;
    ps = r4.y;
    r2.xyz = r4.zzz * r6.wyz;
    ps = r0.x * ps;
    r13.xyz = r10.zxw * r6.yzw;
    r9.x = ps;
    r4.xyz = r10.xzw * r11.yzx - r15.zyx;
    r9 = r14.xywz + r9;
    ps = r4.w;
    r1.x = dot(r4.xzy, r4.xzy);
    r13.xyz = r10.xzw * r6.ywz - r13.zyx;
    ps = r12.z * ps;
    r0.x = dot(r13.xzy, r13.xzy);
    r2.w = ps;
    ps = rsqrt(abs(r1.x));
    r2 = r9 + r2;
    r1.x = ps;
    r4.xyz = r4.xyz * r1.xxx;
    r12.xyz = -r2.zyx * CameraPosition.www + CameraPosition.zyx;
    r6.x = dot(r10.zxw, r12.xzy);
    r6.y = dot(r6.zwy, r12.xzy);
    ps = rsqrt(abs(r0.x));
    r9.xyz = r4.yzz * r11.xxy;
    r0.x = ps;
    r13.xyz = r13.xyz * r0.xxx;
    ps = -r10.w;
    r6.z = dot(r13.xzy, r12.xzy);
    r10.y = ps;
    r9.xyz = r4.xxy * r11.yzz - r9.xyz;
    r4.w = dot(r10.xyz, r9.xyz);
    r4 = r4.zyxw * 0.5 + 0.5;
    r0.x = r0.y * 0.15915494 + 0.5;
    r9.xyw = r7.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.z;
    r10 = r8.wwww * LocalToWorld[3];
    r9.z = ps;
    r11.xyz = r7.zzz * LocalToWorld[2].xzy + r9.xwy;
    r10 = r8.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r9.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r10 = r8.yyyy * LocalToWorld[1].xzwy + r10.xzwy;
    r7.yzw = r7.yyy * LocalToWorld[1].xyz + r11.xzy;
    r7.xyz = r7.xxx * LocalToWorld[0].xzy + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0].xwyz + r10.xzwy;
    ps = cos(r0.y);
    r9.xy = r9.zw * r1.yz;
    r0.x = ps;
    r12.xyz = -r8.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r7.xyz = r8.wzx - r7.yzx;
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
    r1.y = dot(r7.xzy, r7.xzy);
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
    r13.xyz = r7.xyz * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r7.xyz = r12.zxy * r13.yxz;
    r1.yzw = r12.zxy * AxisRotationVectors[a0].yzx;
    r1.yzw = r12.xzy * AxisRotationVectors[a0].yxz - r1.wzy;
    r12.xyz = r12.xzy * r13.yzx - r7.zyx;
    r7.x = dot(r12.xzy, r12.xzy);
    ps = r0.y;
    r7.y = dot(r1.ywz, r1.ywz);
    ps = r11.x * ps;
    r7.yz = max(r7.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r7.y));
    r7.x = r0.y * r9.z;
    r0.y = ps;
    ps = rsqrt(abs(r7.z));
    r12.xyz = r12.xzy * r0.yyy;
    r0.y = ps;
    r1.yzw = r1.yzw * r0.yyy;
    r7.yzw = r1.wzy * AxisRotationVectors[a0].www;
    r1.yzw = (r0.xxx == 0.0) ? r7.ywz : AxisRotationVectors[a0].xzy;
    r7.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r7.ywz;
    r7.yzw = r7.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = r1.yzw * ParticleUpRightResultScalars.zzz;
    r1.yzw = -r13.xzy * ParticleUpRightResultScalars.yyy + r1.zyw;
    r7.yzw = r12.xzy * ParticleUpRightResultScalars.yyy + r7.zwy;
    r7.yzw = r11.yzw * ParticleUpRightResultScalars.xxx + r7.wyz;
    r1.yzw = r10.ywz * ParticleUpRightResultScalars.xxx + r1.zwy;
    r1.yzw = r9.yyy * r1.yzw;
    r7.yzw = r9.xxx * r7.yzw;
    r7 = r8.ywzx + r7.xzwy;
    r7 = r7.xywz + r1.xwyz;
    r1 = r7.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r7.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r7.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    r1 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r1 = r2.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    o3.xyz = r6.xyz;
    o2 = r2.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    o0.xy = r0.zw;
    o5.xyz = r5.xyz;
    o5.w = 0.0;
    o4 = r4;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    return Out;
}
