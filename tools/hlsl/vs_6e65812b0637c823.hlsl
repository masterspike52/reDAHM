// vs_6e65812b0637c823.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 558 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008B8 00610012 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 00100010 00003011 00006012 00005013 00001014 00015015 00025016 00235017 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 000010B2 000010B3 000010B5 000010B6 000010B7 000010B4 000010B8
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> NORMAL0
//   vertex element: instruction 18 -> TANGENT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> BLENDWEIGHT0
//   vertex element: instruction 21 -> TEXCOORD1
//   vertex element: instruction 22 -> TEXCOORD2
//   vertex element: instruction 23 -> TEXCOORD3
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

float4 ApproxFogColor : register(c26); // float3
float4 AxisRotationVectorSourceIndex : register(c22); // float
float4 AxisRotationVectors[2] : register(c23); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c16); // float4
float4 CameraUp : register(c17); // float4
float4 CameraWorldPosition : register(c15); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c28); // float3
float4 FogVolumeBoxMin : register(c27); // float3
float4 LocalToWorld[4] : register(c18); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c25); // float3
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

    r8 = In.position0;
    r7 = In.normal0;
    r1.yz = In.tangent0.xy;
    r1.xw = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r9.xy = In.texcoord1.xy;
    r3 = In.texcoord2.xzwy;
    r4 = In.texcoord3;
    r14.w = CameraUp.x * (-1.0);
    r12 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r15 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r10.y = ps;
    r6.zw = (r10.yy == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r0.w * 0.15915494 + 0.5;
    r2.xyz = r7.www * LocalToWorld[3].xyz;
    r5.xyz = r7.zzz * LocalToWorld[2].xzy + r2.xzy;
    ps = frac(r0.x);
    r2 = r8.wwww * LocalToWorld[3];
    r0.x = ps;
    r2 = r8.zzzz * LocalToWorld[2] + r2;
    r2 = r8.yyyy * LocalToWorld[1] + r2;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r5.xyz = r7.yyy * LocalToWorld[1].xyz + r5.xzy;
    r11.xyz = r7.xxx * LocalToWorld[0].xzy + r5.xzy;
    ps = sin(r0.x);
    r6.xy = r3.zy - 0.5;
    r10.z = ps;
    r2 = r8.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r9.zw = r6.yx * r1.yz;
    r0.y = ps;
    ps = r2.z;
    r13 = r10.zzzz * CameraRight.xzyw;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r5 = r0.yyyy * CameraRight.wzyx;
    r16.x = ps;
    ps = CameraWorldPosition.y - r2.x;
    r14.xyz = r2.yxz - r11.xzy;
    r16.y = ps;
    ps = CameraWorldPosition.x - r2.y;
    r0.x = dot(r14.zxy, r14.zxy);
    r16.z = ps;
    ps = (-1.0) * r0.y;
    r0.z = dot(r16.xzy, r16.xzy);
    r10.x = ps;
    r5 = r10.zzzz * CameraUp.wyzx + r5.xzyw;
    r11 = r10.xxxx * CameraUp.wyzx + r13.wzyx;
    r11 = r11.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r11.w;
    r5 = r5.xwyz * ParticleUpRightResultScalars.xxxx;
    ps = r1.y * ps;
    r0.xz = max(r0.xz, 0.01);
    r10.x = ps;
    ps = rsqrt(abs(r0.z));
    r10.x = r10.x * r6.y;
    r10.z = ps;
    ps = rsqrt(abs(r0.x));
    r18.xyz = r16.zyx * r10.zzz;
    r0.x = ps;
    a0 = xe_mova(r10.y);
    ps = r10.y;
    r16 = r14.zyxw * r0.xxxy;
    r14.xyz = r18.zxy * AxisRotationVectors[a0].yzx;
    r0.xyz = -r16.zyx * ParticleUpRightResultScalars.yyy + r5.yzw;
    r17.xyz = r18.zxy * r16.yxz;
    r14.xyz = r18.xzy * AxisRotationVectors[a0].yxz - r14.zyx;
    r10.w = dot(r14.xzy, r14.xzy);
    r13.yzw = r18.xzy * r16.yzx - r17.zyx;
    r10.z = dot(r13.ywz, r13.ywz);
    r5.yz = max(r10.zw, 0.01);
    ps = rsqrt(abs(r5.y));
    r13.x = r16.w + r13.x;
    r10.z = ps;
    ps = rsqrt(abs(r5.z));
    r13.yzw = r13.ywz * r10.zzz;
    r10.z = ps;
    r14.xyz = r14.xyz * r10.zzz;
    r5.yzw = r14.zyx * AxisRotationVectors[a0].www;
    r10.yzw = (r10.yyy == 0.0) ? r5.ywz : AxisRotationVectors[a0].xzy;
    r14 = r13.xzwy * ParticleUpRightResultScalars.xyyy;
    r13 = (-abs(r6.zzzw) >= 0.0) ? AxisRotationVectors[a0].xzyz : r5.ywzw;
    r6.zw = (-abs(r6.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r5.zy;
    r5.yz = r6.wz * ParticleUpRightResultScalars.zz + r0.xy;
    r5.w = r13.w * ParticleUpRightResultScalars.z + r0.z;
    r11.xyz = r11.xzy + r14.zwy;
    r0.xyz = r10.zwy * ParticleUpRightResultScalars.zzz + r0.zyx;
    ps = r14.x + r14.y;
    r6.yzw = r9.www * r0.zxy;
    r11.w = ps;
    r18 = r13.yxzx * ParticleUpRightResultScalars.zzzz + r11.yzxw;
    ps = r5.x;
    r10.yzw = r9.zzz * r18.wzx;
    ps = r1.z * ps;
    r11.xyz = r18.xyz * r5.zwy;
    r0.x = ps;
    r11.yzw = r18.yxz * r5.zyw - r11.zyx;
    ps = r0.x;
    r0.z = dot(r11.ywz, r11.ywz);
    ps = r6.x * ps;
    r2 = r2.wzxy + r10.xwzy;
    r6.x = ps;
    r2 = r2.yxzw + r6.zxwy;
    ps = r2.w;
    r13.xyz = -r2.wzx + FogVolumeBoxMax.xyz;
    r0.y = ps;
    ps = FogVolumeBoxMin.x - r0.y;
    r17.xyz = r2.wzx - CameraPosition.xyz;
    r14.x = ps;
    ps = FogVolumeBoxMin.y - r2.z;
    r10.yzw = -r2.xzw + CameraPosition.zyx;
    r14.y = ps;
    ps = FogVolumeBoxMin.z - r2.x;
    r16 = r2.yyyy * ViewProjectionMatrix[3];
    r14.z = ps;
    r6.xyz = -r2.xzw * CameraPosition.www + CameraPosition.zyx;
    ps = 1.0 / r10.w;
    r5.x = dot(r18.xyz, r6.xzy);
    r10.x = ps;
    r16 = r2.xxxx * ViewProjectionMatrix[2] + r16;
    ps = 1.0 / r10.y;
    r0.y = dot(r10.ywz, r10.ywz);
    r10.y = ps;
    ps = 1.0 / r10.z;
    r0.x = float((0.001 >= abs(r17.z)));
    r10.z = ps;
    r0.x = (r0.x == 0.0) ? r17.z : 0.001;
    ps = sqrt(abs(r0.y));
    r6.w = dot(r17.zxy, r17.zxy);
    r0.y = ps;
    r16 = r2.zzzz * ViewProjectionMatrix[1].xzwy + r16.xzwy;
    r2 = r2.wwww * ViewProjectionMatrix[0] + r16.xwyz;
    r14.xyz = r14.xzy * r10.xyz;
    ps = sqrt(abs(r6.w));
    r13.xyz = r13.xzy * r10.xyz;
    r6.w = ps;
    ps = 1.0 / r0.x;
    r10 = r6.wwww - FogStartDistance.wzyx;
    r0.x = ps;
    r16 = saturate(r15.wzyx * r0.xxxx);
    r12 = saturate(r12.wzyx * r0.xxxx);
    r15.xyz = min(r14.yzx, r13.yzx);
    r14.xyz = max(r14.yzx, r13.yzx);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r13 = max(r10, 0.0);
    r11.x = ps;
    ps = min(r14.y, r14.x);
    r10.xyz = r13.xyz * FogDistanceScale.wzy;
    r0.x = ps;
    ps = max(r15.y, r15.x);
    r12 = r16.wzyx - r12.wzyx;
    r0.y = ps;
    ps = abs(r12.w);
    r6.w = saturate(max(r0.y, r15.z));
    ps = FogDistanceScale.x * ps;
    r0.y = saturate(min(r0.x, r14.z));
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r10.xzy * abs(r12.xzy);
    r0.z = ps;
    ps = pow(2.0, r10.y);
    r12 = abs(r12) * r13;
    r10.y = ps;
    ps = pow(2.0, r10.z);
    r0.x = r0.x * r13.w;
    r10.z = ps;
    ps = pow(2.0, r10.x);
    r0.y = saturate(-r6.w + r0.y);
    r10.w = ps;
    ps = pow(2.0, r0.x);
    r11 = r11 * r0.yzzz;
    r10.x = ps;
    ps = pow(2.0, -r11.x);
    r12 = float4((FogExtinctionDistance.wzyx > r12));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r10 = r12.wzyx * r10;
    r0.x = ps;
    ps = r10.y * r10.x;
    r5.y = dot(r5.wyz, r6.xzy);
    r5.w = ps;
    ps = r10.w;
    r5.z = dot(r11.ywz, r6.xzy);
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r12 = r10.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.z * r0.x;
    r6.w = r10.z * r5.w;
    r9.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.z = r0.z * r6.w;
    r9.w = ps;
    ps = r0.z;
    r6.xyz = r12.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r13 = r10.yyyw * r6;
    r11.x = ps;
    ps = r13.w;
    r6.xyz = r12.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r11.yz = r9.wz * r13.ww;
    r6.w = ps;
    r0.xyz = r12.zzz * FogInScattering[1].xyz + r13.xyz;
    r6.xyz = r10.zzz * r0.xzy + r6.xzy;
    r0.xyz = r12.xxx * FogInScattering[3].xyz + r11.xyz;
    r6.xyz = r10.www * r6.xzy + r0.xyz;
    r0.y = r0.w * 0.15915494 + 0.5;
    r0.xzw = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r3.y;
    r10 = r8.wwww * LocalToWorld[3];
    r14.x = ps;
    r0.xzw = r7.zzz * LocalToWorld[2].xyz + r0.xwz;
    r10 = r8.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r3.z;
    r0.y = frac(r0.y);
    r14.y = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r10 = r8.yyyy * LocalToWorld[1] + r10;
    r0.xzw = r7.yyy * LocalToWorld[1].xzy + r0.xwz;
    r7.xyz = r7.xxx * LocalToWorld[0].xyz + r0.xwz;
    r8 = r8.xxxx * LocalToWorld[0] + r10;
    ps = cos(r0.y);
    r9.zw = r14.xy * r1.yz;
    r0.x = ps;
    r12.xyz = -r8.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r7.xyz = r8.xyz - r7.xyz;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r11 = r0.wwww * CameraRight.wzyx;
    r0.z = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r1.y = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r12.zxy, r12.zxy);
    r0.x = ps;
    r10 = r0.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r1.y;
    r0.w = dot(r7.zxy, r7.zxy);
    ps = r10.x * ps;
    r0.xy = max(r0.yw, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = r0.w * r14.y;
    r1.y = ps;
    ps = rsqrt(abs(r0.y));
    r15.xyz = r12.xyz * r1.yyy;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r7.zyx * r0.xxx;
    r1.y = ps;
    a0 = xe_mova(r1.y);
    ps = r1.y;
    r12.xyz = r15.zxy * r13.yxz;
    r7.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r15.xzy * r13.yzx - r12.zyx;
    r7.xyz = r15.xzy * AxisRotationVectors[a0].yxz - r7.zyx;
    r0.x = dot(r7.xzy, r7.xzy);
    ps = r0.z;
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
    r0.xyz = (r1.yyy == 0.0) ? r7.xyz : AxisRotationVectors[a0].xyz;
    r7.xyz = (r1.yyy == 0.0) ? AxisRotationVectors[a0].xyz : r7.xyz;
    r7.xyz = r7.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r13.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r7.xyz = r12.zxy * ParticleUpRightResultScalars.yyy + r7.yxz;
    r7.xyz = r11.ywz * ParticleUpRightResultScalars.xxx + r7.yzx;
    r0.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r9.www * r0.xyz;
    r7.xyz = r9.zzz * r7.xyz;
    r7 = r8.xzyw + r7.xzyw;
    r7 = r7.xzyw + r0;
    r0 = r7.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r7.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r1.xw;
    o1.xy = r9.xy;
    o5.xyz = r5.xyz;
    o2 = r3.xwyz;
    o3 = r4;
    o4 = r2;
    o6 = r6;

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
