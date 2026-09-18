// vs_c3de17d07bf40fac.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 564 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008D0 00410011 00000000 00000000 000044A5 00000001 00000006 00000005 00000290 00100010 00003011 00006012 00005013 00001014 00215015 00003050 0001F151 0002F255 00037356 0004F457 000010B6 000010B8 000010B9 000010B7 000010BA
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r5 = In.position0;
    r4 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.zw = In.texcoord0.xy;
    r1.x = In.blendweight0.x;
    r7 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r1.w = ps;
    r14.xy = (r1.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r1.x * 0.15915494 + 0.5;
    r3.xyz = r4.www * LocalToWorld[3].xyz;
    r2 = r5.wwww * LocalToWorld[3];
    r3.xyz = r4.zzz * LocalToWorld[2].xzy + r3.xzy;
    r2 = r5.zzzz * LocalToWorld[2] + r2;
    ps = frac(r0.x);
    r9.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r2 = r5.yyyy * LocalToWorld[1] + r2;
    r3.xyz = r4.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r4.xxx * LocalToWorld[0].xzy + r3.xzy;
    r2 = r5.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r10.yz = r0.zw - 0.5;
    r0.y = ps;
    ps = (-1.0) * r0.y;
    r9.xyz = r2.yxz - r3.xzy;
    r11.y = ps;
    ps = sin(r0.x);
    r6 = r0.yyyy * CameraRight.wzyx;
    r10.w = ps;
    ps = r2.z;
    r3 = r10.wwww * CameraRight.zywx;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r10.x = dot(r9.zxy, r9.zxy);
    r11.x = ps;
    r12 = r11.yyyy * CameraUp.wyzx + r3.zyxw;
    r6 = r10.wwww * CameraUp.wyzx + r6.xzyw;
    ps = CameraWorldPosition.y - r2.x;
    r6 = r6.wyzx * ParticleUpRightResultScalars.xxxx;
    r11.y = ps;
    ps = CameraWorldPosition.x - r2.y;
    r12 = r12.xywz * ParticleUpRightResultScalars.xxxx;
    r11.z = ps;
    ps = r6.w;
    r10.w = dot(r11.xzy, r11.xzy);
    ps = r1.z * ps;
    r3.xy = max(r10.xw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r3.y));
    r10.x = r0.x * r10.z;
    r0.x = ps;
    ps = rsqrt(abs(r3.x));
    r13.xyz = r11.zyx * r0.xxx;
    r0.x = ps;
    r11.xyz = r9.zyx * r0.xxx;
    r3.xyz = -r11.zyx * ParticleUpRightResultScalars.yyy + r6.xyz;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r6.xyz = r13.zxy * r11.yxz;
    r9.xyz = r13.zxy * AxisRotationVectors[a0].yzx;
    r9.xyz = r13.xzy * AxisRotationVectors[a0].yxz - r9.zyx;
    r11.xyz = r13.xzy * r11.yzx - r6.zyx;
    r6.x = dot(r11.xzy, r11.xzy);
    ps = r12.x;
    r6.y = dot(r9.xzy, r9.xzy);
    ps = r1.y * ps;
    r6.xy = max(r6.yx, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r6.y));
    r12.x = r0.x * r10.y;
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r6.yzw = r11.xzy * r0.xxx;
    r0.x = ps;
    r9 = r9 * r0.xxxy;
    r6.x = r9.w + r3.w;
    r9.xyz = r9.zyx * AxisRotationVectors[a0].www;
    r11.xyz = (r1.www == 0.0) ? r9.xzy : AxisRotationVectors[a0].xzy;
    r13 = (-abs(r14.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r9.xzyz;
    r0.xy = (-abs(r14.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r9.yx;
    r9.xy = r0.yx * ParticleUpRightResultScalars.zz + r3.xy;
    r9.z = r13.w * ParticleUpRightResultScalars.z + r3.z;
    r3.xyz = r11.zxy * ParticleUpRightResultScalars.zzz + r3.yxz;
    r6 = r6.zwyx * ParticleUpRightResultScalars.yyyx;
    ps = r6.w + r6.x;
    r0.xy = r10.yz * r1.yz;
    r6.w = ps;
    ps = r0.y;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = r3.y * ps;
    r6.xyz = r12.ywz + r6.yzx;
    r10.y = ps;
    r16 = r13.yxzx * ParticleUpRightResultScalars.zzzz + r6.yzxw;
    ps = r0.y;
    r12.yzw = r0.xxx * r16.wzx;
    ps = r3.z * ps;
    r6.xyz = r16.xyz * r9.yzx;
    r10.z = ps;
    r6.yzw = r16.yxz * r9.yxz - r6.zyx;
    ps = r0.y;
    r3.z = dot(r6.ywz, r6.ywz);
    ps = r3.x * ps;
    r2 = r2.wzxy + r12.xwzy;
    r10.w = ps;
    ps = CameraPosition.z;
    r17 = r2 + r10.xzwy;
    ps = -FirstDensityFunctionParameters.y + ps;
    r13.xyz = -r17.wzy + FogVolumeBoxMax.xyz;
    r15.x = ps;
    r10.xyz = -r17.yzw * CameraPosition.www + CameraPosition.zyx;
    ps = r17.y;
    r14.xyz = -r17.wzy + FogVolumeBoxMin.xyz;
    r0.x = ps;
    ps = -FirstDensityFunctionParameters.y - -r0.x;
    r3.xyw = r17.wzy - CameraPosition.xyz;
    r15.y = ps;
    ps = r17.y;
    r12.yzw = -r17.yzw + CameraPosition.zyx;
    r0.x = ps;
    ps = 0.0001 - r0.x;
    r2 = r17.xxxx * ViewProjectionMatrix[3];
    r0.x = ps;
    ps = 1.0 / r12.w;
    r9.w = r0.x + CameraPosition.z;
    r12.x = ps;
    r2 = r17.yyyy * ViewProjectionMatrix[2] + r2;
    ps = 1.0 / r12.y;
    r0.y = dot(r12.ywz, r12.ywz);
    r12.y = ps;
    ps = 1.0 / r12.z;
    r1.w = dot(r3.wxy, r3.wxy);
    r12.z = ps;
    ps = sqrt(abs(r1.w));
    r0.x = float((0.001 >= abs(r3.w)));
    r1.w = ps;
    r0.x = (r0.x == 0.0) ? r3.w : 0.001;
    ps = sqrt(abs(r0.y));
    r3.yw = float2((-r15.yx > 0.0));
    r0.y = ps;
    r2 = r17.zzzz * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r17.wwww * ViewProjectionMatrix[0] + r2.xwyz;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r3.x = dot(r16.xyz, r10.xzy);
    r6.x = ps;
    ps = 1.0 / r9.w;
    r14.xyz = r14.xzy * r12.xyz;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r12.xyz = r13.xzy * r12.xyz;
    r0.x = ps;
    ps = -r15.y;
    r13 = r1.wwww - FogStartDistance.wzyx;
    ps = r0.y * ps;
    r15 = saturate(r11.wzyx * r0.xxxx);
    r0.y = ps;
    ps = 1.0 - r0.y;
    r11 = saturate(r8.wzyx * r0.xxxx);
    r0.x = ps;
    ps = -r0.y;
    r8.xyw = min(r14.yzx, r12.yzx);
    ps = r3.y * ps;
    r12.xzw = max(r14.yxz, r12.yxz);
    r12.y = ps;
    ps = min(r12.w, r12.x);
    r13 = max(r13, 0.0);
    r3.y = ps;
    ps = max(r8.y, r8.x);
    r14.xyz = r13.xyz * FogDistanceScale.wzy;
    r1.w = ps;
    ps = r0.x;
    r11 = r15.wzyx - r11.wzyx;
    ps = r3.w * ps;
    r0.x = abs(r11.w) * FogDistanceScale.x;
    r12.x = ps;
    ps = r1.w;
    r3.y = saturate(min(r3.y, r12.z));
    r12.z = ps;
    ps = r8.w;
    r8.xyz = r14.xzy * abs(r11.xzy);
    r12.w = ps;
    ps = max(r12.z, r12.w);
    r11 = abs(r11) * r13;
    r3.w = saturate(ps);
    ps = pow(2.0, r8.y);
    r1.w = r0.x * r13.w;
    r8.y = ps;
    ps = pow(2.0, r8.z);
    r0.xy = r0.yy + r12.xy;
    r8.z = ps;
    ps = pow(2.0, r8.x);
    r0.y = max(r3.w, r0.y);
    r8.w = ps;
    ps = pow(2.0, r1.w);
    r0.x = min(r3.y, r0.x);
    r8.x = ps;
    ps = -r0.y;
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    ps = r0.x + ps;
    r8 = r11.wzyx * r8;
    r0.x = saturate(ps);
    ps = r8.y * r8.x;
    r3.y = dot(r9.zxy, r10.xzy);
    r1.w = ps;
    ps = rsqrt(abs(r3.z));
    r9 = r8.wzyx - 1.0;
    r0.y = ps;
    ps = r8.w;
    r6 = r6 * r0.xyyy;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r3.z = dot(r6.ywz, r10.xzy);
    r0.x = ps;
    ps = pow(2.0, -r6.x);
    r10.w = r8.z * r1.w;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r1.w = r0.x * r10.w;
    r0.x = ps;
    r6.x = r1.w * r0.x;
    ps = ApproxFogColor.z * r0.x;
    r10.xyz = r9.www * FogInScattering[0].xyz;
    r6.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r11 = r8.yyyw * r10;
    r6.z = ps;
    ps = r11.w;
    r10.xyz = r9.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r6.yz = r6.zy * r11.ww;
    r6.w = ps;
    r11.xyz = r9.zzz * FogInScattering[1].xyz + r11.xyz;
    r8.xyz = r8.zzz * r11.xzy + r10.xzy;
    r6.xyz = r9.xxx * FogInScattering[3].xyz + r6.xyz;
    r6.xyz = r8.www * r8.xzy + r6.xyz;
    r0.x = r1.x * 0.15915494 + 0.5;
    r8.xyw = r4.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.z;
    r10 = r5.wwww * LocalToWorld[3];
    r8.z = ps;
    r9.xyz = r4.zzz * LocalToWorld[2].xyz + r8.xwy;
    r10 = r5.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r0.w;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r10 = r5.yyyy * LocalToWorld[1] + r10;
    r4.yzw = r4.yyy * LocalToWorld[1].xzy + r9.xzy;
    r9.xyz = r4.xxx * LocalToWorld[0].xyz + r4.ywz;
    r5 = r5.xxxx * LocalToWorld[0] + r10;
    ps = cos(r0.y);
    r8.xy = r8.zw * r1.yz;
    r0.x = ps;
    r4.xyz = -r5.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r11.xyz = r5.xyz - r9.xyz;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r10 = r1.wwww * CameraRight.wzyx;
    r0.y = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r9 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    r9 = r1.wwww * CameraUp.wxzy + r9.xwyz;
    r10 = r0.xxxx * CameraUp.wxzy + r10.xwyz;
    ps = r1.z;
    r1.y = dot(r11.zxy, r11.zxy);
    ps = r9.x * ps;
    r1.xy = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.x));
    r1.w = r0.x * r8.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r4.xyz = r4.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r11.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r11.xyz = r4.zxy * r12.yxz;
    r1.xyz = r4.zxy * AxisRotationVectors[a0].yzx;
    r11.xyz = r4.xzy * r12.yzx - r11.zyx;
    r1.xyz = r4.xzy * AxisRotationVectors[a0].yxz - r1.zyx;
    r4.x = dot(r1.xzy, r1.xzy);
    ps = r0.y;
    r4.y = dot(r11.xzy, r11.xzy);
    ps = r10.x * ps;
    r4.xy = max(r4.xy, 0.01);
    r0.y = ps;
    ps = rsqrt(abs(r4.y));
    r4.w = r0.y * r8.z;
    r0.y = ps;
    ps = rsqrt(abs(r4.x));
    r11.xyz = r11.zyx * r0.yyy;
    r0.y = ps;
    r1.xyz = r1.zyx * r0.yyy;
    r4.xyz = r1.xyz * AxisRotationVectors[a0].www;
    r1.xyz = (r0.xxx == 0.0) ? r4.xyz : AxisRotationVectors[a0].xyz;
    r4.xyz = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xyz : r4.xyz;
    r4.xyz = r4.xzy * ParticleUpRightResultScalars.zzz;
    r1.xyz = r1.xzy * ParticleUpRightResultScalars.zzz;
    r1.xyz = -r12.xzy * ParticleUpRightResultScalars.yyy + r1.yxz;
    r4.xyz = r11.zxy * ParticleUpRightResultScalars.yyy + r4.yxz;
    r4.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r4.yzx;
    r1.xyz = r9.ywz * ParticleUpRightResultScalars.xxx + r1.yzx;
    r1.xyz = r8.yyy * r1.xyz;
    r4.xyz = r8.xxx * r4.xyz;
    r4 = r5.xzyw + r4.xzyw;
    r4 = r4.xzyw + r1;
    r1 = r4.wwww * ViewProjectionMatrix[3].xwzy;
    r1 = r4.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r4.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r0.zw;
    o3.xyz = r3.xyz;
    o1 = r7;
    o2 = r2;
    o4 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
