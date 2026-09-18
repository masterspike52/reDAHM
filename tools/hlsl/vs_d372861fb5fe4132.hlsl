// vs_d372861fb5fe4132.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 630 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000009D8 00610013 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 00100012 00003013 00006014 00005015 00001016 00015017 00025018 00235019 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 000010CA 000010CB 000010CD 000010CE 000010CF 000010CC 000010D0
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
float4 FogVolumeBoxMax : register(c29); // float3
float4 FogVolumeBoxMin : register(c28); // float3
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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
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

    r10 = In.position0;
    r9 = In.normal0;
    r0.zw = In.tangent0.xy;
    r7.zw = In.texcoord0.xy;
    r8.x = In.blendweight0.x;
    r7.xy = In.texcoord1.xy;
    r3 = In.texcoord2.zxwy;
    r4 = In.texcoord3;
    r1 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r2.w = ps;
    r5.xy = (r2.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r8.x * 0.15915494 + 0.5;
    r6 = r10.wwww * LocalToWorld[3];
    ps = frac(r0.x);
    r2.xyz = r9.www * LocalToWorld[3].xyz;
    r0.x = ps;
    r2.xyz = r9.zzz * LocalToWorld[2].xzy + r2.xzy;
    r6 = r10.zzzz * LocalToWorld[2] + r6;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r12 = r10.yyyy * LocalToWorld[1] + r6;
    r2.xyz = r9.yyy * LocalToWorld[1].xyz + r2.xzy;
    r6.xzw = r9.xxx * LocalToWorld[0].xzy + r2.xzy;
    r14 = r10.xxxx * LocalToWorld[0] + r12;
    ps = sin(r0.y);
    r1.x = dot(SecondDensityFunctionParameters.zxyw, r1);
    r0.x = ps;
    ps = cos(r0.y);
    r6.y = float((-r1.x > 0.0));
    r0.y = ps;
    r1.w = r0.x * CameraRight.x;
    ps = (-1.0) * r0.y;
    r5.zw = r3.zx - 0.5;
    r1.x = ps;
    ps = CameraRight.z * r0.x;
    r2.xyz = -r14.zyx + CameraWorldPosition.zyx;
    r8.y = ps;
    ps = CameraRight.y * r0.x;
    r6.xzw = r14.xyz - r6.xwz;
    r8.z = ps;
    ps = CameraRight.w * r0.x;
    r12 = r0.yyyy * CameraRight.zyxw;
    r8.w = ps;
    r17.yzw = r1.xxx * CameraUp.wzy + r8.wyz;
    r16.x = r1.x * CameraUp.x + r1.w;
    r1.x = dot(r2.xzy, r2.xzy);
    r1.y = dot(r6.wxz, r6.wxz);
    r12 = r0.xxxx * CameraUp.wyzx + r12.wyxz;
    r13 = r12.wyzx * ParticleUpRightResultScalars.xxxx;
    r1.xy = max(r1.xy, 0.01);
    ps = rsqrt(abs(r1.x));
    r0.x = r13.w * r0.w;
    r1.z = ps;
    ps = rsqrt(abs(r1.y));
    r2.xyz = r2.zyx * r1.zzz;
    r1.x = ps;
    r12.xyz = r6.wzx * r1.xxx;
    r1.xyz = -r12.zyx * ParticleUpRightResultScalars.yyy + r13.xyz;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r8.yzw = r2.zxy * r12.yxz;
    r6.xzw = r2.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r2.xzy * r12.yzx - r8.wzy;
    r2.xyz = r2.xzy * AxisRotationVectors[a0].yxz - r6.wzx;
    r6.x = dot(r2.xzy, r2.xzy);
    ps = CameraUp.x;
    r6.z = dot(r12.xzy, r12.xzy);
    ps = (-1.0) * ps;
    r6.xz = max(r6.xz, 0.01);
    r12.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.x = r0.x * r5.z;
    r0.x = ps;
    ps = rsqrt(abs(r6.z));
    r2.xyz = r2.xyz * r0.xxx;
    r0.x = ps;
    r15 = r12.xywz * r0.xxyx;
    r6.xzw = r2.zyx * AxisRotationVectors[a0].www;
    r17.x = r15.z + r1.w;
    r16.yzw = (-abs(r5.xxx) >= 0.0) ? AxisRotationVectors[a0].zyx : r6.wzx;
    r2.xyz = (r2.www == 0.0) ? r6.xwz : AxisRotationVectors[a0].xzy;
    r6.xzw = (-abs(r5.yyy) >= 0.0) ? AxisRotationVectors[a0].zyx : r6.wzx;
    r12.xyz = r6.xzw * ParticleUpRightResultScalars.zzz + r1.zyx;
    r6.xzw = r2.yzx * ParticleUpRightResultScalars.zzz + r1.zyx;
    r15.z = dot(r16.wx, ParticleUpRightResultScalars.zx) + 0.0;
    r1 = r17.wzyx * ParticleUpRightResultScalars.xxxx;
    r0.y = r1.z * r0.z;
    ps = r15.w;
    r17 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = ps;
    ps = ParticleUpRightResultScalars.y * r0.x;
    r2.xy = r5.wz * r0.zw;
    r1.z = ps;
    r1.xy = r15.xy * ParticleUpRightResultScalars.yy + r1.yx;
    ps = r1.w;
    r15.xyw = r16.zyw * ParticleUpRightResultScalars.zzz;
    ps = r1.z + ps;
    r13.yzw = r2.yyy * r6.wxz;
    r0.x = ps;
    ps = r0.x;
    r6.xw = r1.yx + r15.xy;
    ps = r15.w + ps;
    r2.yzw = r1.xyz + r15.yxz;
    r6.z = ps;
    r1.yzw = r2.xxx * r6.xzw;
    ps = r0.y;
    r6.xzw = r2.ywz * r12.yxz;
    r5.xyz = r2.wyz * r12.yzx - r6.wzx;
    ps = r5.w * ps;
    r0.x = dot(r5.xzy, r5.xzy);
    r1.x = ps;
    r1 = r14.xwyz + r1.zxyw;
    r1 = r1.zyxw + r13.wxyz;
    r18.xyz = -r1.wxz + FogVolumeBoxMax.zyx;
    ps = rsqrt(abs(r0.x));
    r16.xyz = -r1.wxz + FogVolumeBoxMin.zyx;
    r0.x = ps;
    r14.xyz = r5.xyz * r0.xxx;
    r19 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.wzxx : 1.0;
    ps = r1.w;
    r8.yzw = r1.zwx - CameraPosition.xzy;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r5 = r1.yyyy * ViewProjectionMatrix[3];
    r2.x = ps;
    r13.xyz = -r1.wxz * CameraPosition.www + CameraPosition.zyx;
    ps = CameraPosition.y - r1.x;
    r6.x = dot(r2.ywz, r13.xzy);
    r2.y = ps;
    ps = CameraPosition.x - r1.z;
    r2.w = dot(r8.zyw, r8.zyw);
    r2.z = ps;
    r5 = r1.wwww * ViewProjectionMatrix[2] + r5;
    ps = 1.0 / r2.x;
    r1.y = dot(r2.xzy, r2.xzy);
    r15.x = ps;
    ps = 1.0 / r2.z;
    r6.w = dot(r2.xzy, SecondDensityFunctionParameters.zxy);
    r15.y = ps;
    ps = 1.0 / r2.y;
    r8.y = dot(SecondDensityFunctionParameters.zxyw, r19);
    r15.z = ps;
    ps = (-r8.y > 0.0) ? 1.0 : 0.0;
    r0.x = float((0.001 >= abs(r8.z)));
    r2.x = ps;
    r0.y = (r0.x == 0.0) ? r8.z : 0.001;
    ps = sqrt(abs(r1.y));
    r0.x = r6.w + 0.0001;
    r1.y = ps;
    r5 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r5.xzwy;
    r5 = r1.zzzz * ViewProjectionMatrix[0] + r5.xwyz;
    ps = sqrt(abs(r2.w));
    r16.xyz = r16.xzy * r15.xyz;
    r1.x = ps;
    ps = 1.0 / r0.y;
    r2.yzw = r18.zxy * r15.yxz;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r15 = r1.xxxx - FogStartDistance.wzyx;
    r0.x = ps;
    ps = -r8.y;
    r17 = saturate(r17.wzyx * r0.yyyy);
    ps = r0.x * ps;
    r1.xzw = min(r16.xzy, r2.zwy);
    r0.x = ps;
    ps = max(r1.z, r1.x);
    r16.xyz = max(r16.xzy, r2.zwy);
    r2.w = ps;
    ps = min(r16.y, r16.x);
    r11 = saturate(r11.wzyx * r0.yyyy);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r15 = max(r15, 0.0);
    r2.y = ps;
    ps = -r0.x;
    r11 = r17.wzyx - r11.wzyx;
    ps = r2.x * ps;
    r6.y = r2.y * r6.y;
    r6.z = ps;
    ps = abs(r11.w);
    r2.xyz = r15.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.y, r16.z));
    r0.y = ps;
    ps = r2.w;
    r2.xyz = r2.xzy * abs(r11.xzy);
    r1.x = ps;
    ps = r1.w;
    r11 = abs(r11) * r15;
    r1.w = ps;
    ps = max(r1.x, r1.w);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r1.w = saturate(ps);
    ps = pow(2.0, r2.y);
    r1.x = r0.y * r15.w;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r0.xy = r0.xx + r6.zy;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.x = max(r1.w, r0.x);
    r2.w = ps;
    ps = pow(2.0, r1.x);
    r0.y = min(r1.z, r0.y);
    r2.x = ps;
    r11 = r11.wzyx * r2;
    ps = ApproxFogColor.x * r11.w;
    r1.x = float((r0.x >= r0.y));
    r8.z = ps;
    r1.xz = (r1.xx == 0.0) ? r0.xy : 0.0;
    ps = r11.y * r11.x;
    r6.y = dot(r12.xzy, r13.xzy);
    r0.x = ps;
    ps = r11.z;
    r2 = r11.zwyx - 1.0;
    ps = r0.x * ps;
    r12.zw = r1.xz * 0.5;
    r1.w = ps;
    ps = r2.x;
    r6.z = dot(r14.xzy, r13.xzy);
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r14.xyz = r2.www * FogInScattering[0].xyz;
    r12.x = ps;
    ps = FogInScattering[2].y * r2.x;
    r13.xyz = r2.zzz * FogInScattering[1].xyz;
    r12.y = ps;
    ps = FogInScattering[2].z * r2.x;
    r0.xy = r12.zw * r1.xz;
    r12.z = ps;
    r13.xyz = r11.yyy * r14.xyz + r13.xyz;
    r11.xyz = r11.zzz * r13.xyz + r12.xyz;
    r8.yzw = r8.yyz * r1.zxw;
    r0.xy = r0.yx * r6.ww + r8.yz;
    ps = FirstDensityFunctionParameters.x * r1.y;
    r0.x = r0.x - r0.y;
    r0.y = ps;
    r0.x = r0.y * -r0.x;
    ps = 0.0001 * r0.x;
    r0.x = ps;
    ps = pow(2.0, -r0.x);
    r0.y = r11.w * r1.w;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r1.w = r0.y * r0.x;
    r0.x = ps;
    ps = r8.w;
    r1.xy = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r1.yz = r1.yx * r0.yy;
    r1.x = ps;
    r1.xyz = r2.yyy * FogInScattering[3].xyz + r1.xyz;
    r1.xyz = r11.www * r11.xyz + r1.xyz;
    r0.x = r8.x * 0.15915494 + 0.5;
    r8.xyz = r9.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r3.x;
    r2 = r10.wwww * LocalToWorld[3];
    r14.x = ps;
    r8.xyz = r9.zzz * LocalToWorld[2].xyz + r8.xzy;
    r2 = r10.zzzz * LocalToWorld[2] + r2;
    ps = (-0.5) + r3.z;
    r0.x = frac(r0.x);
    r14.y = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r2 = r10.yyyy * LocalToWorld[1] + r2;
    r8.xyz = r9.yyy * LocalToWorld[1].xzy + r8.xzy;
    r10.yzw = r9.xxx * LocalToWorld[0].xyz + r8.xzy;
    r8 = r10.xxxx * LocalToWorld[0] + r2;
    ps = cos(r0.y);
    r9.xy = r14.xy * r0.zw;
    r0.x = ps;
    r2.xyz = -r8.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r12.xyz = r8.xyz - r10.yzw;
    r6.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r11 = r6.wwww * CameraRight.wzyx;
    r2.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.w;
    r10 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    r10 = r6.wwww * CameraUp.wxzy + r10.xwyz;
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
    r2.xyz = r2.xyz * r0.zzz;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r12.zyx * r0.xxx;
    r6.w = ps;
    a0 = xe_mova(r6.w);
    ps = r6.w;
    r12.xyz = r2.zxy * r13.yxz;
    r0.xyz = r2.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r2.xzy * r13.yzx - r12.zyx;
    r2.xyz = r2.xzy * AxisRotationVectors[a0].yxz - r0.zyx;
    r0.x = dot(r2.xzy, r2.xzy);
    ps = r2.w;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r11.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r2.w = r0.z * r14.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r12.xyz = r12.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r2.zyx * r0.xxx;
    r2.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r6.www == 0.0) ? r2.xyz : AxisRotationVectors[a0].xyz;
    r2.xyz = (r6.www == 0.0) ? AxisRotationVectors[a0].xyz : r2.xyz;
    r2.xyz = r2.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r13.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r2.xyz = r12.zxy * ParticleUpRightResultScalars.yyy + r2.yxz;
    r2.xyz = r11.ywz * ParticleUpRightResultScalars.xxx + r2.yzx;
    r0.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r9.yyy * r0.xyz;
    r2.xyz = r9.xxx * r2.xyz;
    r2 = r8.xzyw + r2.xzyw;
    r2 = r2.xzyw + r0;
    r0 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r2.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r7.zw;
    o1.xy = r7.xy;
    o5.xyz = r6.xyz;
    o2 = r3.ywxz;
    o3 = r4;
    o4 = r5;
    o6 = r1;

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
