// vs_f0995703631f31cd.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 561 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008C4 00610011 00000000 00000000 000064E7 00000001 00000006 00000007 00000290 00100010 00003011 00006012 00005013 00001014 00215015 00003050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A1 000010B3 000010B7 000010B8 000010B5 000010B9 000010B6 000010B4
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> NORMAL0
//   vertex element: instruction 18 -> TANGENT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> BLENDWEIGHT0
//   vertex element: instruction 21 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c21); // float
float4 AxisRotationVectors[2] : register(c22); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c15); // float4
float4 CameraUp : register(c16); // float4
float4 CameraWorldPosition : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c17); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c24); // float3
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
    float4 texcoord5 : TEXCOORD5;
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
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r9 = In.position0;
    r8 = In.normal0;
    r10.xy = In.tangent0.xy;
    r0.yw = In.texcoord0.xy;
    r5.w = In.blendweight0.x;
    r2 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r1.w = CameraUp.x * (-1.0);
    r4.w = ps;
    r0.xz = (r4.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r1.x = r5.w * 0.15915494 + 0.5;
    r3 = r9.wwww * LocalToWorld[3].xwzy;
    ps = frac(r1.x);
    r4.xyz = r8.www * LocalToWorld[3].xzy;
    r1.x = ps;
    r4.xyz = r8.zzz * LocalToWorld[2].xyz + r4.xzy;
    r3 = r9.zzzz * LocalToWorld[2].xwzy + r3;
    r1.y = r1.x * 6.2831855 - 3.1415927;
    r3 = r9.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r4.xyz = r8.yyy * LocalToWorld[1].xzy + r4.xzy;
    r4.xyz = r8.xxx * LocalToWorld[0].xyz + r4.xzy;
    r16 = r9.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    ps = cos(r1.y);
    r12.z = r0.w - 0.5;
    r1.x = ps;
    r3.xyz = r1.xxx * CameraRight.zyx;
    r6.xyz = -r16.wyx + CameraWorldPosition.zyx;
    ps = sin(r1.y);
    r4.xyz = r16.wyx - r4.zyx;
    r1.z = ps;
    r13.xyz = r1.zzz * CameraUp.zxy + r3.xzy;
    r5.x = dot(r6.xzy, r6.xzy);
    ps = (-1.0) * r1.x;
    r5.y = dot(r4.xzy, r4.xzy);
    r1.y = ps;
    ps = r1.w;
    r3.xyz = r1.yyy * CameraUp.zyx;
    ps = r1.x * ps;
    r7.xy = r1.zx * CameraRight.ww;
    r3.w = ps;
    r3 = r1.zzzz * CameraRight.zxyx + r3.xzyw;
    r1.xy = r1.zy * CameraUp.ww + r7.yx;
    r1.zw = max(r5.xy, 0.01);
    ps = rsqrt(abs(r1.z));
    r5.z = r1.y * ParticleUpRightResultScalars.x;
    r5.x = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r6.xyz * r5.xxx;
    r1.z = ps;
    r12.xyw = r4.zyx * r1.zzz;
    r11.xyz = r7.xzy * r12.ywx;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r4.xyz = -r12.xyw * ParticleUpRightResultScalars.yyy;
    r6.xyz = r7.xzy * AxisRotationVectors[a0].yzx;
    r4.xyz = r13.yxz * ParticleUpRightResultScalars.xxx + r4.xzy;
    r1.yzw = r7.zxy * r12.yxw - r11.zyx;
    r6.xyz = r7.zxy * AxisRotationVectors[a0].yxz - r6.zyx;
    r5.x = dot(r6.xzy, r6.xzy);
    r5.y = dot(r1.ywz, r1.ywz);
    r5.xy = max(r5.xy, 0.01);
    ps = rsqrt(abs(r5.x));
    r12.w = r1.x * ParticleUpRightResultScalars.x;
    r1.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r6.zyx * r1.xxx;
    r1.x = ps;
    r1.xyz = r1.wyz * r1.xxx;
    r1.xyz = r1.xzy * ParticleUpRightResultScalars.yyy;
    r6.xyz = r6.xyz * AxisRotationVectors[a0].www;
    r1 = r3.yxzw * ParticleUpRightResultScalars.xxxx + r1.xzyx;
    r3 = (-abs(r0.xxxz) >= 0.0) ? AxisRotationVectors[a0].xyzz : r6.xyzz;
    r0.xz = (-abs(r0.zz) >= 0.0) ? AxisRotationVectors[a0].yx : r6.yx;
    r6.xyz = (r4.www == 0.0) ? r6.xyz : AxisRotationVectors[a0].xyz;
    r15.xyz = r6.yzx * ParticleUpRightResultScalars.zzz + r4.zyx;
    r12.xy = r0.xz * ParticleUpRightResultScalars.zz + r4.zx;
    r3 = r3 * ParticleUpRightResultScalars.zzzz;
    r15.w = r4.y + r3.w;
    r14.xzw = r1.xyz + r3.xzy;
    r6.xyz = r14.xwz * 0.5 + 0.5;
    r13.yzw = (float3(0.0, 1.0, 1.0) == 0.0) ? r15.www : r12.yyx;
    r4.xy = r12.zw * r10.yy;
    r4.z = r4.x * r15.w;
    ps = (-0.5) + r0.y;
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r5.y = ps;
    ps = r1.w;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = r3.x + ps;
    r1 = r14.xzzw * r12.xyxy;
    r5.x = ps;
    r1.z = r14.w * r15.w - r1.z;
    r0.xz = r5.yz * r10.xx;
    r3 = r14.zxwx * r15;
    ps = r1.x - r1.w;
    r1.y = r1.y - r3.w;
    r1.x = ps;
    ps = r0.x;
    r4.xyw = r4.xxy * r12.yxz;
    ps = r14.w * ps;
    r12.xw = r0.xz * r5.xy;
    r12.y = ps;
    r3.xyz = r14.xzw * r15.xzy - r3.zyx;
    ps = r0.x;
    r0.z = dot(r3.xzy, r3.xzy);
    ps = r14.z * ps;
    r0.x = dot(r1.xzy, r1.xzy);
    r12.z = ps;
    r12 = r16.xywz + r12;
    ps = rsqrt(abs(r0.z));
    r4 = r12 + r4;
    r0.z = ps;
    r3.xyz = r3.xyz * r0.zzz;
    ps = rsqrt(abs(r0.x));
    r12.xyz = r4.zyx - CameraPosition.zyx;
    r0.x = ps;
    ps = r3.y;
    r17.xyz = r1.xyz * r0.xxx;
    ps = r15.y * ps;
    r1 = r4.wwww * ViewProjectionMatrix[3].xwzy;
    r13.x = ps;
    r16.xyz = -r4.zyx * CameraPosition.www + CameraPosition.zyx;
    ps = r3.z;
    r5.x = dot(r14.zxw, r16.xzy);
    ps = r15.y * ps;
    r5.y = dot(r13.zwy, r16.zyx);
    r13.y = ps;
    ps = r3.z;
    r5.z = dot(r17.xzy, r16.xzy);
    r1 = r4.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    ps = r15.x * ps;
    r0.x = float((0.001 >= abs(r12.x)));
    r13.z = ps;
    r13.xyz = r3.xxy * r15.xzz - r13.xyz;
    ps = -r14.w;
    r0.z = dot(r12.xzy, r12.xzy);
    r14.y = ps;
    ps = sqrt(abs(r0.z));
    r3.w = dot(r14.xyz, r13.xyz);
    r0.z = ps;
    r0.x = (-abs(r0.x) >= 0.0) ? r12.x : 0.001;
    r1 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r4 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    ps = 1.0 / r0.x;
    r1 = r0.zzzz - FogStartDistance.wzyx;
    r0.x = ps;
    r3 = r3.zyxw * 0.5 + 0.5;
    r12 = saturate(r11.wzyx * r0.xxxx);
    r7 = saturate(r7.wzyx * r0.xxxx);
    r11 = max(r1, 0.0);
    r1.xyz = r11.xyz * FogDistanceScale.wzy;
    r7 = r12.wzyx - r7.wzyx;
    r1.xyz = r1.xzy * abs(r7.xzy);
    ps = pow(2.0, r1.y);
    r0.x = abs(r7.w) * FogDistanceScale.x;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r7 = abs(r7) * r11;
    r1.z = ps;
    ps = pow(2.0, r1.x);
    r0.x = r0.x * r11.w;
    r1.w = ps;
    ps = pow(2.0, r0.x);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r1.x = ps;
    r11 = r7.wzyx * r1;
    ps = r11.y * r11.x;
    r1 = r11.zwyx - 1.0;
    r13.w = ps;
    ps = r1.x;
    r7.xyz = r1.yyy * FogInScattering[3].xyz;
    r0.z = ps;
    ps = FogInScattering[2].x * r0.z;
    r13.xyz = r1.www * FogInScattering[0].xyz;
    r12.x = ps;
    ps = FogInScattering[2].y * r1.x;
    r13 = r11.yyyz * r13;
    r12.y = ps;
    ps = FogInScattering[2].z * r1.x;
    r7.w = r11.w * r13.w;
    r12.z = ps;
    r1.xyz = r1.zzz * FogInScattering[1].xyz + r13.xyz;
    r1.xyz = r11.zzz * r1.xyz + r12.xyz;
    r7.xyz = r11.www * r1.xyz + r7.xyz;
    r0.x = r5.w * 0.15915494 + 0.5;
    r1.xyz = r8.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.y;
    r12 = r9.wwww * LocalToWorld[3];
    r11.y = ps;
    r1.xyz = r8.zzz * LocalToWorld[2].xzy + r1.xzy;
    r12 = r9.zzzz * LocalToWorld[2] + r12;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r11.z = ps;
    r0.z = r0.x * 6.2831855 - 3.1415927;
    r12 = r9.yyyy * LocalToWorld[1].xzwy + r12.xzwy;
    r1.xyz = r8.yyy * LocalToWorld[1].xyz + r1.xzy;
    r1.xyz = r8.xxx * LocalToWorld[0].xzy + r1.xzy;
    r9 = r9.xxxx * LocalToWorld[0].xwyz + r12.xzwy;
    ps = cos(r0.z);
    r10.zw = r11.yz * r10.xy;
    r0.x = ps;
    r13.xyz = -r9.xzw + CameraWorldPosition.xyz;
    r12.xyz = r9.wzx - r1.yzx;
    ps = sin(r0.z);
    r1 = r0.xxxx * CameraRight.wzyx;
    r0.z = ps;
    r8 = r0.zzzz * CameraRight.wzyx;
    ps = (-1.0) * r0.x;
    r11.x = dot(r13.zxy, r13.zxy);
    r0.x = ps;
    r8 = r0.xxxx * CameraUp.wxzy + r8.xwyz;
    r1 = r0.zzzz * CameraUp.wxzy + r1.xwyz;
    r1 = r1.xywz * ParticleUpRightResultScalars.xxxx;
    r8 = r8.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r1.x;
    r11.w = dot(r12.xzy, r12.xzy);
    ps = r10.y * ps;
    r0.xz = max(r11.xw, 0.01);
    r5.w = ps;
    ps = rsqrt(abs(r0.x));
    r1.x = r5.w * r11.z;
    r5.w = ps;
    ps = rsqrt(abs(r0.z));
    r14.xyz = r13.xyz * r5.www;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r15.xyz = r12.xyz * r0.xxx;
    r0.x = ps;
    r1.yzw = -r15.zyx * ParticleUpRightResultScalars.yyy + r1.yzw;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r12.xyz = r14.zxy * r15.yxz;
    r13.xyz = r14.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r14.xzy * r15.yzx - r12.zyx;
    r13.xyz = r14.xzy * AxisRotationVectors[a0].yxz - r13.zyx;
    r11.x = dot(r13.xzy, r13.xzy);
    ps = r8.x;
    r11.w = dot(r12.xzy, r12.xzy);
    ps = r10.x * ps;
    r11.xw = max(r11.xw, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r11.x));
    r8.x = r0.z * r11.y;
    r0.z = ps;
    ps = rsqrt(abs(r11.w));
    r11.xyz = r13.xyz * r0.zzz;
    r0.z = ps;
    r12.xyz = r12.xzy * r0.zzz;
    r8.yzw = r12.yxz * ParticleUpRightResultScalars.yyy + r8.ywz;
    r12.xyz = r11.zyx * AxisRotationVectors[a0].www;
    r11.xyz = (r0.xxx == 0.0) ? r12.xzy : AxisRotationVectors[a0].xzy;
    r12.xyz = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r12.xzy;
    r8.yzw = r12.yzx * ParticleUpRightResultScalars.zzz + r8.zwy;
    r1.yzw = r11.yzx * ParticleUpRightResultScalars.zzz + r1.wzy;
    r1.yzw = r10.www * r1.wyz;
    r8.yzw = r10.zzz * r8.wyz;
    r8 = r9.ywzx + r8.xzwy;
    r8 = r8.xywz + r1.xzyw;
    r1 = r8.xxxx * ViewProjectionMatrix[3].xwzy;
    r1 = r8.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r8.wwww * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r8.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r0.yw;
    o6.xyz = r6.xyz;
    o6.w = 0.0;
    o3.xyz = r5.xyz;
    o5 = r3;
    o1 = r2;
    o2 = r4;
    o4 = r7;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
