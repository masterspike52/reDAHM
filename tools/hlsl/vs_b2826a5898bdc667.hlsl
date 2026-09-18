// vs_b2826a5898bdc667.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 468 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000750 0051000D 00000000 00000000 000058C6 00000001 00000006 00000006 00000290 0010000E 0000300F 00006010 00005011 00001012 00215013 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 00001095 0000109A 00001097 00001096 00001098 00001099
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> NORMAL0
//   vertex element: instruction 16 -> TANGENT0
//   vertex element: instruction 17 -> TEXCOORD0
//   vertex element: instruction 18 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LightPositionAndInvRadius : register(c17); // float4[2]
float4 LightType : register(c16); // float[2]
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
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    r0.yz = In.tangent0.xy;
    r1.xy = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r5 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r0.x = float((LightType.x >= 0.9));
    r2.x = ps;
    r9.xy = (r2.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r1.z = r0.w * 0.15915494 + 0.5;
    r3 = r7.wwww * LocalToWorld[3];
    ps = frac(r1.z);
    r2.yzw = r6.www * LocalToWorld[3].xyz;
    r1.z = ps;
    r4.xyz = r6.zzz * LocalToWorld[2].xzy + r2.ywz;
    r3 = r7.zzzz * LocalToWorld[2] + r3;
    r2.y = r1.z * 6.2831855 - 3.1415927;
    r3 = r7.yyyy * LocalToWorld[1].xzwy + r3.xzwy;
    r4.xyz = r6.yyy * LocalToWorld[1].xyz + r4.xzy;
    r4.xyz = r6.xxx * LocalToWorld[0].xzy + r4.xzy;
    r12 = r7.xxxx * LocalToWorld[0].xwyz + r3.xzwy;
    r3.xyz = -r12.wzx + CameraWorldPosition.zyx;
    r8.yzw = r12.xzw - r4.xzy;
    r1.z = dot(r3.xzy, r3.xzy);
    ps = sin(r2.y);
    r1.w = dot(r8.wyz, r8.wyz);
    r11.x = ps;
    ps = cos(r2.y);
    r1.zw = max(r1.zw, 0.01);
    r11.y = ps;
    ps = rsqrt(abs(r1.z));
    r11.z = r11.y * (-1.0);
    r2.y = ps;
    ps = rsqrt(abs(r1.w));
    r10.yzw = r3.zyx * r2.yyy;
    r11.w = ps;
    ps = CameraUp.x;
    r4 = r11.yyyx * CameraRight.zyxx;
    ps = (-1.0) * ps;
    r3 = r11.xyxx * CameraRight.wwzy;
    r8.x = ps;
    a0 = xe_mova(r2.x);
    ps = r2.x;
    r13 = r8.xwzy * r11.ywww;
    r2.yzw = r10.wyz * AxisRotationVectors[a0].yzx;
    r10.x = r11.z * CameraUp.z + r3.z;
    r8.yzw = r10.ywz * AxisRotationVectors[a0].yxz - r2.wzy;
    r3.xyz = r11.zxz * CameraUp.wwy + r3.xyw;
    r3.w = r11.z * CameraUp.x + r4.w;
    ps = r13.x;
    r2.yzw = -r13.wyz * ParticleUpRightResultScalars.yyy;
    r11.yzw = r11.xxx * CameraUp.zyx + r4.xyz;
    ps = r4.w + ps;
    r4.xyz = r10.wyz * r13.zyw;
    r11.x = ps;
    r10.yzw = r10.ywz * r13.zwy - r4.zyx;
    r2.yzw = r11.wzy * ParticleUpRightResultScalars.xxx + r2.ywz;
    ps = (-0.5) + r1.x;
    r4 = r3 * ParticleUpRightResultScalars.xxxx;
    r9.z = ps;
    ps = (-0.5) + r1.y;
    r3.xw = r4.yx * r0.zy;
    r9.w = ps;
    r3.x = r3.x * r9.w;
    r1.zw = r9.zw * r0.yz;
    r3.y = dot(r8.ywz, r8.ywz);
    r3.z = dot(r10.ywz, r10.ywz);
    r3.yz = max(r3.yz, 0.01);
    ps = rsqrt(abs(r3.z));
    r8.x = r3.w * r9.z;
    r3.w = ps;
    ps = rsqrt(abs(r3.y));
    r10.yzw = r10.ywz * r3.www;
    r3.y = ps;
    r3.yzw = r8.yzw * r3.yyy;
    r8.yzw = r3.wzy * AxisRotationVectors[a0].www;
    r4.xy = (-abs(r9.xy) >= 0.0) ? AxisRotationVectors[a0].zz : r8.ww;
    r3.yzw = (r2.xxx == 0.0) ? r8.ywz : AxisRotationVectors[a0].xzy;
    r10 = r10.xzwy * ParticleUpRightResultScalars.xyyy;
    r9 = (-abs(r9.yyxx) >= 0.0) ? AxisRotationVectors[a0].yxxy : r8.zyyz;
    r9.xy = r9.xy * ParticleUpRightResultScalars.zz + r2.zy;
    r8.yz = r4.zw + r10.zy;
    r8.w = r11.x * ParticleUpRightResultScalars.x + r10.y;
    r3.yzw = r3.zyw * ParticleUpRightResultScalars.zzz + r2.wyz;
    ps = r10.x + r10.w;
    r3.yzw = r1.www * r3.zwy;
    r2.x = ps;
    r11.xyz = r9.wzz * ParticleUpRightResultScalars.zzz + r8.yzw;
    r4.xy = r4.xy * ParticleUpRightResultScalars.zz + r2.xw;
    r8.yz = r1.zz * r11.zx;
    ps = r1.z;
    r2.xy = r4.xx * r9.yx;
    ps = r4.x * ps;
    r1.zw = r11.yx * r9.xy;
    r8.w = ps;
    ps = r1.z - r1.w;
    r2.zw = r11.xy * r4.yy;
    r10.x = ps;
    ps = r2.x - r2.w;
    r8 = r12 + r8.yxzw;
    r10.y = ps;
    ps = r2.z - r2.y;
    r8 = r8.yxzw + r3;
    r10.z = ps;
    r3.xyw = -r8.zyw * r0.xxx + LightPositionAndInvRadius.yxz;
    r2.xyw = -r8.zyw * CameraPosition.www + CameraPosition.yxz;
    r0.x = dot(r10.xzy, r10.xzy);
    ps = rsqrt(abs(r0.x));
    r1.zw = r8.xx * ViewProjectionMatrix[3].zw;
    r0.x = ps;
    r1.zw = r8.ww * ViewProjectionMatrix[2].zw + r1.zw;
    r4.z = r10.x * r0.x;
    r9.z = r10.y * r0.x;
    r1.zw = r8.zz * ViewProjectionMatrix[1].zw + r1.zw;
    r1.zw = r8.yy * ViewProjectionMatrix[0].zw + r1.zw;
    ps = r10.z;
    r8.yzw = r9.zyx * r2.xyx;
    ps = r0.x * ps;
    r9.xyz = r9.yxz * r3.yxx;
    r11.w = ps;
    ps = r9.x + r9.y;
    r10.xyz = r11.yxw * r3.yxy;
    r2.z = ps;
    ps = r10.x + r10.y;
    r3.xyz = r11.yxw * r2.yxy;
    r2.x = ps;
    ps = r3.x + r3.y;
    r2.y = r10.z + r9.z;
    r8.x = ps;
    ps = r8.z + r8.w;
    r8.y = r3.z + r8.y;
    r8.z = ps;
    r3.xyz = r4.xyz * r2.www + r8.xzy;
    r2.xyz = r4.xyz * r3.www + r2.xzy;
    r0.x = r0.w * 0.15915494 + 0.5;
    r8.xyw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r9 = r7.wwww * LocalToWorld[3];
    r8.z = ps;
    r10.xyz = r6.zzz * LocalToWorld[2].xyz + r8.xwy;
    r9 = r7.zzzz * LocalToWorld[2] + r9;
    ps = (-0.5) + r1.y;
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
    r3.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r10 = r3.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r9 = r0.xxxx * CameraRight.wzyx;
    r2.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    r9 = r3.wwww * CameraUp.wxzy + r9.xwyz;
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
    r0.yzw = r8.yyy * r0.yzw;
    r6.yzw = r8.xxx * r6.yzw;
    r6 = r7.ywzx + r6.xzwy;
    r6 = r6.xywz + r0.xwyz;
    r0 = r6.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r6.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r1.xy;
    o3.zw = r1.zw;
    o3.xy = 1.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o4.xyz = r3.xyz;
    o4.w = 0.0;
    o5.xyz = r4.xyz;
    o5.w = 0.0;
    o1 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
