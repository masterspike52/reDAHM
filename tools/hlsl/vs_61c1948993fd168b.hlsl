// vs_61c1948993fd168b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 618 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000009A8 00610011 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 00100012 00003013 00006014 00005015 00001016 00015017 00025018 00235019 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 000010C6 000010C7 000010C9 000010CA 000010CB 000010C8 000010CC
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> NORMAL0
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> TEXCOORD0
//   vertex element: instruction 22 -> BLENDWEIGHT0
//   vertex element: instruction 23 -> TEXCOORD1
//   vertex element: instruction 24 -> TEXCOORD2
//   vertex element: instruction 25 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c27); // float3
float4 AxisRotationVectorSourceIndex : register(c23); // float
float4 AxisRotationVectors[2] : register(c24); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c17); // float4
float4 CameraUp : register(c18); // float4
float4 CameraWorldPosition : register(c16); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c19); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c26); // float3
float4 SecondDensityFunctionParameters : register(c15); // float4
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
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r9 = In.position0;
    r8 = In.normal0;
    r0.yz = In.tangent0.xy;
    r6.zw = In.texcoord0.xy;
    r5.w = In.blendweight0.x;
    r6.xy = In.texcoord1.xy;
    r2 = In.texcoord2.xzwy;
    r4 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r15 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r5.z = ps;
    r5.xy = (r5.zz == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r5.w * 0.15915494 + 0.5;
    r1 = r9.wwww * LocalToWorld[3];
    ps = frac(r0.x);
    r3.xyz = r8.www * LocalToWorld[3].xyz;
    r0.x = ps;
    r3.xyz = r8.zzz * LocalToWorld[2].xzy + r3.xzy;
    r1 = r9.zzzz * LocalToWorld[2] + r1;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r1 = r9.yyyy * LocalToWorld[1] + r1;
    r3.xyz = r8.yyy * LocalToWorld[1].xyz + r3.xzy;
    r7.xyz = r8.xxx * LocalToWorld[0].xzy + r3.xzy;
    r1 = r9.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    ps = sin(r0.x);
    r12.w = CameraUp.x * (-1.0);
    r3.z = ps;
    ps = cos(r0.x);
    r3.w = r3.z * CameraRight.x;
    r0.w = ps;
    ps = (-1.0) * r0.w;
    r11.xw = r2.zy - 0.5;
    r3.x = ps;
    ps = r1.z;
    r13.xyz = r3.zzz * CameraRight.zyw;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r10.yzw = r1.yxz - r7.xzy;
    r12.x = ps;
    ps = CameraWorldPosition.y - r1.x;
    r7 = r0.wwww * CameraRight.zyxw;
    r12.y = ps;
    r16.yzw = r3.xxx * CameraUp.wzy + r13.zxy;
    r17.x = r3.x * CameraUp.x + r3.w;
    ps = CameraWorldPosition.x - r1.y;
    r3.x = dot(r10.wyz, r10.wyz);
    r12.z = ps;
    r3.y = dot(r12.xzy, r12.xzy);
    r7 = r3.zzzz * CameraUp.wyzx + r7.wyxz;
    r7 = r7.wyzx * ParticleUpRightResultScalars.xxxx;
    r11.yz = max(r3.xy, 0.01);
    ps = rsqrt(abs(r11.z));
    r0.x = r7.w * r0.z;
    r3.x = ps;
    ps = rsqrt(abs(r11.y));
    r3.xyz = r12.zyx * r3.xxx;
    r10.x = ps;
    r12.xyz = r10.wzy * r10.xxx;
    r7.xyz = -r12.zyx * ParticleUpRightResultScalars.yyy + r7.xyz;
    a0 = xe_mova(r5.z);
    ps = r5.z;
    r10.xyz = r3.zxy * r12.yxz;
    r13.xyz = r3.zxy * AxisRotationVectors[a0].yzx;
    r13.xyz = r3.xzy * AxisRotationVectors[a0].yxz - r13.zyx;
    r12.xyz = r3.xzy * r12.yzx - r10.zyx;
    r3.x = dot(r12.xzy, r12.xzy);
    r3.y = dot(r13.xzy, r13.xzy);
    r10.yz = max(r3.yx, 0.01);
    ps = rsqrt(abs(r10.y));
    r10.x = r0.x * r11.x;
    r0.x = ps;
    ps = rsqrt(abs(r10.z));
    r3.xyz = r13.xyz * r0.xxx;
    r0.x = ps;
    r14 = r12 * r0.xxxw;
    r10.yzw = r3.zyx * AxisRotationVectors[a0].www;
    r16.x = r14.w + r3.w;
    r12.xy = r11.wx * r0.yz;
    r3.xyz = (r5.zzz == 0.0) ? r10.ywz : AxisRotationVectors[a0].xzy;
    r17.yzw = (-abs(r5.xxx) >= 0.0) ? AxisRotationVectors[a0].zyx : r10.wzy;
    r5.xyz = (-abs(r5.yyy) >= 0.0) ? AxisRotationVectors[a0].zyx : r10.wzy;
    r11.xyz = r5.xyz * ParticleUpRightResultScalars.zzz + r7.zyx;
    ps = r14.z;
    r13.xyw = r17.zyw * ParticleUpRightResultScalars.zzz;
    r0.x = ps;
    r5.xyz = r3.yzx * ParticleUpRightResultScalars.zzz + r7.zyx;
    r13.z = dot(r17.wx, ParticleUpRightResultScalars.zx) + 0.0;
    ps = ParticleUpRightResultScalars.y * r0.x;
    r7 = r16.xwzy * ParticleUpRightResultScalars.xxxx;
    r3.z = ps;
    r3.xy = r14.xy * ParticleUpRightResultScalars.yy + r7.zy;
    ps = r7.x;
    r10.yzw = r12.yyy * r5.zxy;
    ps = r3.z + ps;
    r0.x = r7.w * r0.y;
    r0.w = ps;
    ps = r0.w;
    r5.xz = r3.yx + r13.xy;
    ps = r13.w + ps;
    r16.xyz = r3.xyz + r13.yxz;
    r5.y = ps;
    ps = r0.x;
    r3.yzw = r12.xxx * r5.xyz;
    ps = r11.w * ps;
    r5.xyz = r16.xzy * r11.yxz;
    r3.x = ps;
    r14.xyz = r16.zxy * r11.yzx - r5.zyx;
    r1 = r1.ywxz + r3.zxyw;
    r1 = r1.zwyx + r10.wzxy;
    r12.xyz = -r1.yxw * CameraPosition.www + CameraPosition.zyx;
    ps = r1.w;
    r3.w = dot(r14.xzy, r14.xzy);
    r0.w = ps;
    ps = CameraPosition.x - r0.w;
    r10.xyz = r1.wxy - SecondDensityFunctionParameters.xyz;
    r5.x = ps;
    ps = CameraPosition.y - r1.x;
    r7 = r1.zzzz * ViewProjectionMatrix[3];
    r5.y = ps;
    r7 = r1.yyyy * ViewProjectionMatrix[2] + r7;
    ps = CameraPosition.z - r1.y;
    r3.x = dot(r10.zxy, r10.zxy);
    r5.z = ps;
    r3.y = dot(r5.zxy, r10.zxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.x = dot(r5.zxy, r5.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r3.w));
    r5.z = r3.x - r3.z;
    r0.w = ps;
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13.xyz = r1.wyx - CameraPosition.xzy;
    r14.xyz = r14.xyz * r0.www;
    r5.x = dot(r16.xzy, r12.xzy);
    r0.w = float((0.001 >= abs(r13.y)));
    r3.w = dot(r13.yxz, r13.yxz);
    ps = sqrt(abs(r3.w));
    r13.xz = r0.xx * float2(4.0, 0.33333334);
    r3.w = ps;
    r0.w = (r0.w == 0.0) ? r13.y : 0.001;
    r7 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r7.xzwy;
    r1 = r1.wwww * ViewProjectionMatrix[0] + r7.xwyz;
    ps = 1.0 / r0.w;
    r7 = r3.wwww - FogStartDistance.wzyx;
    r0.w = ps;
    r16 = saturate(r15.wzyx * r0.wwww);
    r10 = saturate(r10.wzyx * r0.wwww);
    r15 = max(r7, 0.0);
    r7.xyz = r15.xyz * FogDistanceScale.wzy;
    r10 = r16.wzyx - r10.wzyx;
    ps = 0.0001 + r0.x;
    r7.xyz = r7.xzy * abs(r10.xzy);
    r3.w = ps;
    ps = pow(2.0, r7.y);
    r0.w = abs(r10.w) * FogDistanceScale.x;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r10 = abs(r10) * r15;
    r7.z = ps;
    ps = pow(2.0, r7.x);
    r0.w = r0.w * r15.w;
    r7.w = ps;
    ps = pow(2.0, r0.w);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r7.x = ps;
    ps = r3.y + r3.y;
    r10 = r10.wzyx * r7;
    r7.x = ps;
    ps = r10.y * r10.x;
    r5.y = dot(r11.xzy, r12.xzy);
    r7.z = ps;
    ps = r10.w;
    r11 = r10.wzyx - 1.0;
    r0.w = ps;
    ps = ApproxFogColor.x * r0.w;
    r15.xyz = r11.yyy * FogInScattering[2].xyz;
    r7.y = ps;
    ps = r10.z;
    r17.xyz = r11.www * FogInScattering[0].xyz;
    ps = r7.z * ps;
    r16.xyz = r11.zzz * FogInScattering[1].xyz;
    r7.z = ps;
    r16.xyz = r10.yyy * r17.xyz + r16.xyz;
    r10.xyz = r10.zzz * r16.xyz + r15.xyz;
    ps = 1.0 / r3.w;
    r11.yz = r7.xy * r7.xz;
    r3.w = ps;
    r0.w = -r13.x * r5.z + r11.y;
    ps = sqrt(abs(r0.w));
    r3.w = r3.w * 0.5;
    r7.w = ps;
    ps = r7.x;
    r5.z = dot(r14.xzy, r12.xzy);
    ps = r7.w + ps;
    r12.y = r7.x - r7.w;
    r12.x = ps;
    r12.xy = saturate(r3.ww * -r12.xy);
    r12.zw = r12.yx * r12.yx;
    r13.xy = r12.zw * r12.yx;
    ps = 1.0 / r3.z;
    r11.yw = r13.zz * r13.yx;
    r3.z = ps;
    r13.y = dot(r12.zy, r3.yx) + r11.w;
    r13.x = dot(r12.wx, r3.yx) + r11.y;
    r3.xy = -r13.yx * r3.zz + r12.yx;
    r3.xy = r3.xy * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r3.x = r3.x - r3.y;
    r0.x = ps;
    r0.x = r3.x * r0.x;
    r0.x = (r0.w >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.w = r10.w * r7.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r3.w = r0.w * r0.x;
    r0.x = ps;
    ps = r11.z;
    r3.xy = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r3.xy = r3.yx * r0.ww;
    r3.z = ps;
    r3.xyz = r11.xxx * FogInScattering[3].yzx + r3.xyz;
    r3.xyz = r10.www * r10.xyz + r3.zxy;
    r0.x = r5.w * 0.15915494 + 0.5;
    r10.xyz = r8.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r2.y;
    r7 = r9.wwww * LocalToWorld[3];
    r14.x = ps;
    r10.xyz = r8.zzz * LocalToWorld[2].xyz + r10.xzy;
    r7 = r9.zzzz * LocalToWorld[2] + r7;
    ps = (-0.5) + r2.z;
    r0.x = frac(r0.x);
    r14.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r7 = r9.yyyy * LocalToWorld[1] + r7;
    r8.yzw = r8.yyy * LocalToWorld[1].xzy + r10.xzy;
    r10.xyz = r8.xxx * LocalToWorld[0].xyz + r8.ywz;
    r8 = r9.xxxx * LocalToWorld[0] + r7;
    ps = cos(r0.w);
    r9.xy = r14.xy * r0.yz;
    r0.x = ps;
    r7.xyz = -r8.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r12.xyz = r8.xyz - r10.xyz;
    r5.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r11 = r5.wwww * CameraRight.wzyx;
    r7.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r7.zxy, r7.zxy);
    r0.x = ps;
    r10 = r5.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r0.w;
    r0.z = dot(r12.zxy, r12.zxy);
    ps = r10.x * ps;
    r0.xy = max(r0.yz, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = r0.z * r14.y;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r7.xyz * r0.zzz;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r12.zyx * r0.xxx;
    r5.w = ps;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r12.xyz = r7.zxy * r13.yxz;
    r0.xyz = r7.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r7.xzy * r13.yzx - r12.zyx;
    r7.xyz = r7.xzy * AxisRotationVectors[a0].yxz - r0.zyx;
    r0.x = dot(r7.xzy, r7.xzy);
    ps = r7.w;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r11.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.w = r0.z * r14.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r12.xyz = r12.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r7.zyx * r0.xxx;
    r7.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r5.www == 0.0) ? r7.xyz : AxisRotationVectors[a0].xyz;
    r7.xyz = (r5.www == 0.0) ? AxisRotationVectors[a0].xyz : r7.xyz;
    r7.xyz = r7.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r13.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r7.xyz = r12.zxy * ParticleUpRightResultScalars.yyy + r7.yxz;
    r7.xyz = r11.ywz * ParticleUpRightResultScalars.xxx + r7.yzx;
    r0.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r9.yyy * r0.xyz;
    r7.xyz = r9.xxx * r7.xyz;
    r7 = r8.xzyw + r7.xzyw;
    r7 = r7.xzyw + r0;
    r0 = r7.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r7.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r6.zw;
    o1.xy = r6.xy;
    o5.xyz = r5.xyz;
    o2 = r2.xwyz;
    o3 = r4;
    o4 = r1;
    o6 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    return Out;
}
