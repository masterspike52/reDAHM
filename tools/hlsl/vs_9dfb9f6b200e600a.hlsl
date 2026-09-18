// vs_9dfb9f6b200e600a.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 579 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000090C 00610012 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 00100011 00003012 00006013 00005014 00001015 00015016 00025017 00235018 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 000010B9 000010BA 000010BC 000010BD 000010BE 000010BB 000010BF
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> NORMAL0
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> TEXCOORD0
//   vertex element: instruction 21 -> BLENDWEIGHT0
//   vertex element: instruction 22 -> TEXCOORD1
//   vertex element: instruction 23 -> TEXCOORD2
//   vertex element: instruction 24 -> TEXCOORD3
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
    r0.zw = In.tangent0.xy;
    r9.xy = In.texcoord0.xy;
    r4.z = In.blendweight0.x;
    r4.xy = In.texcoord1.xy;
    r1 = In.texcoord2.xzwy;
    r3 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r4.w = ps;
    r13.xy = (r4.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r4.z * 0.15915494 + 0.5;
    r5.xyz = r7.www * LocalToWorld[3].xyz;
    r2 = r8.wwww * LocalToWorld[3];
    r5.xyz = r7.zzz * LocalToWorld[2].xzy + r5.xzy;
    r2 = r8.zzzz * LocalToWorld[2] + r2;
    ps = frac(r0.x);
    r11.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r2 = r8.yyyy * LocalToWorld[1] + r2;
    r5.xyz = r7.yyy * LocalToWorld[1].xyz + r5.xzy;
    r5.xyz = r7.xxx * LocalToWorld[0].xzy + r5.xzy;
    r2 = r8.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r9.zw = r1.yz - 0.5;
    r0.y = ps;
    ps = (-1.0) * r0.y;
    r11.xyz = r2.yxz - r5.xzy;
    r12.z = ps;
    ps = sin(r0.x);
    r6 = r0.yyyy * CameraRight.wzyx;
    r12.x = ps;
    ps = r2.z;
    r5 = r12.xxxx * CameraRight.zywx;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r13.z = dot(r11.zxy, r11.zxy);
    r12.y = ps;
    r14 = r12.zzzz * CameraUp.wyzx + r5.zyxw;
    r6 = r12.xxxx * CameraUp.wyzx + r6.xzyw;
    ps = CameraWorldPosition.y - r2.x;
    r6 = r6.wyzx * ParticleUpRightResultScalars.xxxx;
    r12.z = ps;
    ps = CameraWorldPosition.x - r2.y;
    r14 = r14.xywz * ParticleUpRightResultScalars.xxxx;
    r12.w = ps;
    ps = r6.w;
    r13.w = dot(r12.ywz, r12.ywz);
    ps = r0.w * ps;
    r5.xy = max(r13.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r5.y));
    r12.x = r0.x * r9.w;
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r15.xyz = r12.wzy * r0.xxx;
    r0.x = ps;
    r12.yzw = r11.zyx * r0.xxx;
    r5.xyz = -r12.wzy * ParticleUpRightResultScalars.yyy + r6.xyz;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r6.xyz = r15.zxy * r12.zyw;
    r11.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r11.xyz = r15.xzy * AxisRotationVectors[a0].yxz - r11.zyx;
    r12.yzw = r15.xzy * r12.zwy - r6.zyx;
    r6.x = dot(r12.ywz, r12.ywz);
    ps = r14.x;
    r6.y = dot(r11.xzy, r11.xzy);
    ps = r0.z * ps;
    r6.xy = max(r6.yx, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r6.y));
    r14.x = r0.x * r9.z;
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r6.yzw = r12.ywz * r0.xxx;
    r0.x = ps;
    r11 = r11 * r0.xxxy;
    r6.x = r11.w + r5.w;
    r11.xyz = r11.zyx * AxisRotationVectors[a0].www;
    r12.yzw = (r4.www == 0.0) ? r11.xzy : AxisRotationVectors[a0].xzy;
    r15 = (-abs(r13.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r11.xzyz;
    r0.xy = (-abs(r13.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r11.yx;
    r11.xy = r0.yx * ParticleUpRightResultScalars.zz + r5.xy;
    r11.z = r15.w * ParticleUpRightResultScalars.z + r5.z;
    r5.xyz = r12.wyz * ParticleUpRightResultScalars.zzz + r5.yxz;
    r6 = r6.zwyx * ParticleUpRightResultScalars.yyyx;
    ps = r6.w + r6.x;
    r0.xy = r9.zw * r0.zw;
    r6.w = ps;
    ps = r0.y;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = r5.y * ps;
    r6.xyz = r14.ywz + r6.yzx;
    r12.y = ps;
    r17 = r15.yxzx * ParticleUpRightResultScalars.zzzz + r6.yzxw;
    ps = r0.y;
    r14.yzw = r0.xxx * r17.wzx;
    ps = r5.z * ps;
    r6.xyz = r17.xyz * r11.yzx;
    r12.z = ps;
    r6.yzw = r17.yxz * r11.yxz - r6.zyx;
    ps = r0.y;
    r5.z = dot(r6.ywz, r6.ywz);
    ps = r5.x * ps;
    r2 = r2.wzxy + r14.xwzy;
    r12.w = ps;
    ps = CameraPosition.z;
    r18 = r2 + r12.xzwy;
    ps = -FirstDensityFunctionParameters.y + ps;
    r15.xyz = -r18.wzy + FogVolumeBoxMax.xyz;
    r9.z = ps;
    r12.xyz = -r18.yzw * CameraPosition.www + CameraPosition.zyx;
    ps = r18.y;
    r16.xyz = -r18.wzy + FogVolumeBoxMin.xyz;
    r0.x = ps;
    ps = -FirstDensityFunctionParameters.y - -r0.x;
    r5.xyw = r18.wzy - CameraPosition.xyz;
    r9.w = ps;
    ps = r18.y;
    r14.yzw = -r18.yzw + CameraPosition.zyx;
    r0.x = ps;
    ps = 0.0001 - r0.x;
    r2 = r18.xxxx * ViewProjectionMatrix[3];
    r0.x = ps;
    ps = 1.0 / r14.w;
    r11.w = r0.x + CameraPosition.z;
    r14.x = ps;
    r2 = r18.yyyy * ViewProjectionMatrix[2] + r2;
    ps = 1.0 / r14.y;
    r0.y = dot(r14.ywz, r14.ywz);
    r14.y = ps;
    ps = 1.0 / r14.z;
    r4.w = dot(r5.wxy, r5.wxy);
    r14.z = ps;
    ps = sqrt(abs(r4.w));
    r0.x = float((0.001 >= abs(r5.w)));
    r4.w = ps;
    r0.x = (r0.x == 0.0) ? r5.w : 0.001;
    ps = sqrt(abs(r0.y));
    r5.yw = float2((-r9.wz > 0.0));
    r0.y = ps;
    r2 = r18.zzzz * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r18.wwww * ViewProjectionMatrix[0] + r2.xwyz;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r5.x = dot(r17.xyz, r12.xzy);
    r6.x = ps;
    ps = 1.0 / r11.w;
    r17.xyz = r16.xzy * r14.xyz;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r15.xyz = r15.xzy * r14.xyz;
    r0.x = ps;
    ps = -r9.w;
    r14 = r4.wwww - FogStartDistance.wzyx;
    ps = r0.y * ps;
    r16 = saturate(r13.wzyx * r0.xxxx);
    r0.y = ps;
    ps = 1.0 - r0.y;
    r13 = saturate(r10.wzyx * r0.xxxx);
    r0.x = ps;
    ps = -r0.y;
    r10.xyw = min(r17.yzx, r15.yzx);
    ps = r5.y * ps;
    r15.xyz = max(r17.xyz, r15.xyz);
    r9.w = ps;
    ps = min(r15.z, r15.y);
    r14 = max(r14, 0.0);
    r5.y = ps;
    ps = max(r10.y, r10.x);
    r15.yzw = r14.xyz * FogDistanceScale.wzy;
    r4.w = ps;
    ps = r0.x;
    r13 = r16.wzyx - r13.wzyx;
    ps = r5.w * ps;
    r0.x = abs(r13.w) * FogDistanceScale.x;
    r9.z = ps;
    ps = r4.w;
    r5.y = saturate(min(r5.y, r15.x));
    r15.x = ps;
    ps = r10.w;
    r10.xyz = r15.ywz * abs(r13.xzy);
    r15.y = ps;
    ps = max(r15.x, r15.y);
    r13 = abs(r13) * r14;
    r5.w = saturate(ps);
    ps = pow(2.0, r10.y);
    r4.w = r0.x * r14.w;
    r10.y = ps;
    ps = pow(2.0, r10.z);
    r0.xy = r0.yy + r9.zw;
    r10.z = ps;
    ps = pow(2.0, r10.x);
    r0.y = max(r5.w, r0.y);
    r10.w = ps;
    ps = pow(2.0, r4.w);
    r0.x = min(r5.y, r0.x);
    r10.x = ps;
    ps = -r0.y;
    r13 = float4((FogExtinctionDistance.wzyx > r13));
    ps = r0.x + ps;
    r10 = r13.wzyx * r10;
    r0.x = saturate(ps);
    ps = r10.y * r10.x;
    r5.y = dot(r11.zxy, r12.xzy);
    r4.w = ps;
    ps = rsqrt(abs(r5.z));
    r11 = r10.wzyx - 1.0;
    r0.y = ps;
    ps = r10.w;
    r6 = r6 * r0.xyyy;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r5.z = dot(r6.ywz, r12.xzy);
    r0.x = ps;
    ps = pow(2.0, -r6.x);
    r12.w = r10.z * r4.w;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r4.w = r0.x * r12.w;
    r0.x = ps;
    r6.x = r4.w * r0.x;
    ps = ApproxFogColor.z * r0.x;
    r12.xyz = r11.www * FogInScattering[0].xyz;
    r6.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r13 = r10.yyyw * r12;
    r6.z = ps;
    ps = r13.w;
    r12.xyz = r11.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r6.yz = r6.zy * r13.ww;
    r6.w = ps;
    r13.xyz = r11.zzz * FogInScattering[1].xyz + r13.xyz;
    r10.xyz = r10.zzz * r13.xzy + r12.xzy;
    r6.xyz = r11.xxx * FogInScattering[3].xyz + r6.xyz;
    r6.xyz = r10.www * r10.xzy + r6.xyz;
    r0.x = r4.z * 0.15915494 + 0.5;
    r10.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.y;
    r11 = r8.wwww * LocalToWorld[3];
    r9.z = ps;
    r10.xyz = r7.zzz * LocalToWorld[2].xyz + r10.xzy;
    r11 = r8.zzzz * LocalToWorld[2] + r11;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r9.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r11 = r8.yyyy * LocalToWorld[1] + r11;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r10.xzy;
    r10.xyz = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0] + r11;
    ps = cos(r0.y);
    r4.zw = r9.zw * r0.zw;
    r0.x = ps;
    r7.xyz = -r8.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r12.xyz = r8.xyz - r10.xyz;
    r5.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r11 = r5.wwww * CameraRight.wzyx;
    r7.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.w;
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
    r0.w = r0.z * r9.w;
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
    r7.w = r0.z * r9.z;
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
    r0.xyz = r4.www * r0.xyz;
    r7.xyz = r4.zzz * r7.xyz;
    r7 = r8.xzyw + r7.xzyw;
    r7 = r7.xzyw + r0;
    r0 = r7.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r7.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r9.xy;
    o1.xy = r4.xy;
    o5.xyz = r5.xyz;
    o2 = r1.xwyz;
    o3 = r3;
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
