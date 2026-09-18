// vs_8832120d101e26e6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 546 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000888 00410011 00000000 00000000 000044A5 00000001 00000006 00000005 00000290 00100010 00003011 00006012 00005013 00001014 00215015 00003050 0001F151 0002F255 00037356 0004F457 000010B0 000010B2 000010B3 000010B1 000010B4
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

    r7 = In.position0;
    r6 = In.normal0;
    r1.yz = In.tangent0.xy;
    r2.yz = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r8 = In.texcoord1;
    r13.w = CameraUp.x * (-1.0);
    r11 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r5.x = ps;
    r10.xy = (r5.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r0.w * 0.15915494 + 0.5;
    r3.xyz = r6.www * LocalToWorld[3].xyz;
    r4.xyz = r6.zzz * LocalToWorld[2].xzy + r3.xzy;
    ps = frac(r0.x);
    r3 = r7.wwww * LocalToWorld[3];
    r0.x = ps;
    r3 = r7.zzzz * LocalToWorld[2] + r3;
    r3 = r7.yyyy * LocalToWorld[1] + r3;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r4.xyz = r6.yyy * LocalToWorld[1].xyz + r4.xzy;
    r9.xyz = r6.xxx * LocalToWorld[0].xzy + r4.xzy;
    ps = sin(r0.x);
    r1.xw = r2.yz - 0.5;
    r5.z = ps;
    r3 = r7.xxxx * LocalToWorld[0].yxzw + r3.yxzw;
    ps = cos(r0.x);
    r2.xw = r1.xw * r1.yz;
    r0.y = ps;
    ps = r3.z;
    r12 = r5.zzzz * CameraRight.xzyw;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r4 = r0.yyyy * CameraRight.wzyx;
    r15.x = ps;
    ps = CameraWorldPosition.y - r3.x;
    r13.xyz = r3.yxz - r9.xzy;
    r15.y = ps;
    ps = CameraWorldPosition.x - r3.y;
    r0.x = dot(r13.zxy, r13.zxy);
    r15.z = ps;
    ps = (-1.0) * r0.y;
    r0.z = dot(r15.xzy, r15.xzy);
    r5.y = ps;
    r4 = r5.zzzz * CameraUp.wyzx + r4.xzyw;
    r9 = r5.yyyy * CameraUp.wyzx + r12.wzyx;
    r9 = r9.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r9.x;
    r4 = r4.xwyz * ParticleUpRightResultScalars.xxxx;
    ps = r1.y * ps;
    r0.xz = max(r0.xz, 0.01);
    r5.y = ps;
    ps = rsqrt(abs(r0.z));
    r9.x = r5.y * r1.x;
    r5.y = ps;
    ps = rsqrt(abs(r0.x));
    r17.xyz = r15.zyx * r5.yyy;
    r0.x = ps;
    a0 = xe_mova(r5.x);
    ps = r5.x;
    r15 = r13.zyxw * r0.xxxy;
    r5.yzw = r17.zxy * AxisRotationVectors[a0].yzx;
    r0.xyz = -r15.zyx * ParticleUpRightResultScalars.yyy + r4.yzw;
    r16.xyz = r17.zxy * r15.yxz;
    r13.xyz = r17.xzy * AxisRotationVectors[a0].yxz - r5.wzy;
    r5.z = dot(r13.xzy, r13.xzy);
    r12.yzw = r17.xzy * r15.yzx - r16.zyx;
    r5.y = dot(r12.ywz, r12.ywz);
    r4.yz = max(r5.yz, 0.01);
    ps = rsqrt(abs(r4.y));
    r12.x = r15.w + r12.x;
    r5.y = ps;
    ps = rsqrt(abs(r4.z));
    r12.yzw = r12.ywz * r5.yyy;
    r5.y = ps;
    r5.yzw = r13.xyz * r5.yyy;
    r4.yzw = r5.wzy * AxisRotationVectors[a0].www;
    r5.xyz = (r5.xxx == 0.0) ? r4.ywz : AxisRotationVectors[a0].xzy;
    r13 = r12.xzwy * ParticleUpRightResultScalars.xyyy;
    r12 = (-abs(r10.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r4.ywzw;
    r10.xy = (-abs(r10.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r4.zy;
    r4.yz = r10.yx * ParticleUpRightResultScalars.zz + r0.xy;
    r4.w = r12.w * ParticleUpRightResultScalars.z + r0.z;
    r10.xyz = r9.ywz + r13.zwy;
    r0.xyz = r5.yzx * ParticleUpRightResultScalars.zzz + r0.zyx;
    ps = r13.x + r13.y;
    r5.yzw = r2.www * r0.zxy;
    r10.w = ps;
    r17 = r12.yxzx * ParticleUpRightResultScalars.zzzz + r10.yzxw;
    ps = r4.x;
    r9.yzw = r2.xxx * r17.wzx;
    ps = r1.z * ps;
    r10.xyz = r17.xyz * r4.zwy;
    r0.x = ps;
    r10.yzw = r17.yxz * r4.zyw - r10.zyx;
    ps = r0.x;
    r0.z = dot(r10.ywz, r10.ywz);
    ps = r1.w * ps;
    r3 = r3.wzxy + r9.xwzy;
    r5.x = ps;
    r3 = r3.yxzw + r5.zxwy;
    ps = r3.w;
    r12.xyz = -r3.wzx + FogVolumeBoxMax.xyz;
    r0.y = ps;
    ps = FogVolumeBoxMin.x - r0.y;
    r16.xyz = r3.wzx - CameraPosition.xyz;
    r13.x = ps;
    ps = FogVolumeBoxMin.y - r3.z;
    r9.yzw = -r3.xzw + CameraPosition.zyx;
    r13.y = ps;
    ps = FogVolumeBoxMin.z - r3.x;
    r15 = r3.yyyy * ViewProjectionMatrix[3];
    r13.z = ps;
    r5.xyz = -r3.xzw * CameraPosition.www + CameraPosition.zyx;
    ps = 1.0 / r9.w;
    r4.x = dot(r17.xyz, r5.xzy);
    r9.x = ps;
    r15 = r3.xxxx * ViewProjectionMatrix[2] + r15;
    ps = 1.0 / r9.y;
    r0.y = dot(r9.ywz, r9.ywz);
    r9.y = ps;
    ps = 1.0 / r9.z;
    r0.x = float((0.001 >= abs(r16.z)));
    r9.z = ps;
    r0.x = (r0.x == 0.0) ? r16.z : 0.001;
    ps = sqrt(abs(r0.y));
    r1.x = dot(r16.zxy, r16.zxy);
    r0.y = ps;
    r15 = r3.zzzz * ViewProjectionMatrix[1].xzwy + r15.xzwy;
    r3 = r3.wwww * ViewProjectionMatrix[0] + r15.xwyz;
    r13.xyz = r13.xzy * r9.xyz;
    ps = sqrt(abs(r1.x));
    r12.xyz = r12.xzy * r9.xyz;
    r1.x = ps;
    ps = 1.0 / r0.x;
    r9 = r1.xxxx - FogStartDistance.wzyx;
    r0.x = ps;
    r15 = saturate(r14.wzyx * r0.xxxx);
    r11 = saturate(r11.wzyx * r0.xxxx);
    r14.xyz = min(r13.yzx, r12.yzx);
    r13.xyz = max(r13.yzx, r12.yzx);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r12 = max(r9, 0.0);
    r10.x = ps;
    ps = min(r13.y, r13.x);
    r9.xyz = r12.xyz * FogDistanceScale.wzy;
    r0.x = ps;
    ps = max(r14.y, r14.x);
    r11 = r15.wzyx - r11.wzyx;
    r0.y = ps;
    ps = abs(r11.w);
    r1.x = saturate(max(r0.y, r14.z));
    ps = FogDistanceScale.x * ps;
    r0.y = saturate(min(r0.x, r13.z));
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r9.xyz = r9.xzy * abs(r11.xzy);
    r0.z = ps;
    ps = pow(2.0, r9.y);
    r11 = abs(r11) * r12;
    r9.y = ps;
    ps = pow(2.0, r9.z);
    r0.x = r0.x * r12.w;
    r9.z = ps;
    ps = pow(2.0, r9.x);
    r0.y = saturate(-r1.x + r0.y);
    r9.w = ps;
    ps = pow(2.0, r0.x);
    r10 = r10 * r0.yzzz;
    r9.x = ps;
    ps = pow(2.0, -r10.x);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r0.z = ps;
    ps = 1.0 - r0.z;
    r9 = r11.wzyx * r9;
    r0.x = ps;
    ps = r9.y * r9.x;
    r4.y = dot(r4.wyz, r5.xzy);
    r1.x = ps;
    ps = r9.w;
    r4.z = dot(r10.ywz, r5.xzy);
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r11 = r9.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.z * r0.x;
    r5.w = r9.z * r1.x;
    r1.x = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.y = r0.y * r5.w;
    r1.w = ps;
    ps = r0.y;
    r5.xyz = r11.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r12 = r9.yyyw * r5;
    r10.x = ps;
    ps = r12.w;
    r5.xyz = r11.yyy * FogInScattering[2].xyz;
    ps = r0.z * ps;
    r10.yz = r1.wx * r12.ww;
    r5.w = ps;
    r0.xyz = r11.zzz * FogInScattering[1].xyz + r12.xyz;
    r5.xyz = r9.zzz * r0.xzy + r5.xzy;
    r0.xyz = r11.xxx * FogInScattering[3].xyz + r10.xyz;
    r5.xyz = r9.www * r5.xzy + r0.xyz;
    r0.y = r0.w * 0.15915494 + 0.5;
    r0.xzw = r6.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r2.y;
    r9 = r7.wwww * LocalToWorld[3];
    r12.x = ps;
    r0.xzw = r6.zzz * LocalToWorld[2].xyz + r0.xwz;
    r9 = r7.zzzz * LocalToWorld[2] + r9;
    ps = (-0.5) + r2.z;
    r0.y = frac(r0.y);
    r12.y = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r9 = r7.yyyy * LocalToWorld[1] + r9;
    r0.xzw = r6.yyy * LocalToWorld[1].xzy + r0.xwz;
    r7.yzw = r6.xxx * LocalToWorld[0].xyz + r0.xwz;
    r6 = r7.xxxx * LocalToWorld[0] + r9;
    ps = cos(r0.y);
    r2.xw = r12.xy * r1.yz;
    r0.x = ps;
    r11.xyz = -r6.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.y);
    r10.xyz = r6.xyz - r7.yzw;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r9 = r0.wwww * CameraRight.wzyx;
    r0.z = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r7 = r0.xxxx * CameraRight.wzyx;
    r1.x = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    r7 = r0.wwww * CameraUp.wxzy + r7.xwyz;
    r9 = r0.xxxx * CameraUp.wxzy + r9.xwyz;
    ps = r1.x;
    r0.w = dot(r10.zxy, r10.zxy);
    ps = r7.x * ps;
    r0.xy = max(r0.yw, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = r0.w * r12.y;
    r1.x = ps;
    ps = rsqrt(abs(r0.y));
    r13.xyz = r11.xyz * r1.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.xyz = r10.zyx * r0.xxx;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r10.xyz = r13.zxy * r11.yxz;
    r1.xyz = r13.zxy * AxisRotationVectors[a0].yzx;
    r10.xyz = r13.xzy * r11.yzx - r10.zyx;
    r1.xyz = r13.xzy * AxisRotationVectors[a0].yxz - r1.zyx;
    r0.x = dot(r1.xzy, r1.xzy);
    ps = r0.z;
    r0.y = dot(r10.xzy, r10.xzy);
    ps = r9.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r1.w = r0.z * r12.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r10.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r1.zyx * r0.xxx;
    r1.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r4.www == 0.0) ? r1.xyz : AxisRotationVectors[a0].xyz;
    r1.xyz = (r4.www == 0.0) ? AxisRotationVectors[a0].xyz : r1.xyz;
    r1.xyz = r1.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r11.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r1.xyz = r10.zxy * ParticleUpRightResultScalars.yyy + r1.yxz;
    r1.xyz = r9.ywz * ParticleUpRightResultScalars.xxx + r1.yzx;
    r0.xyz = r7.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r2.www * r0.xyz;
    r1.xyz = r2.xxx * r1.xyz;
    r1 = r6.xzyw + r1.xzyw;
    r1 = r1.xzyw + r0;
    r0 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r1.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r2.yz;
    o3.xyz = r4.xyz;
    o1 = r8;
    o2 = r3;
    o4 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
