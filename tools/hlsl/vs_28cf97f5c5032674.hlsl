// vs_28cf97f5c5032674.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 585 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000924 00410011 00000000 00000000 000044A5 00000001 00000006 00000005 00000290 00100011 00003012 00006013 00005014 00001015 00215016 00003050 0001F151 0002F255 00037356 0004F457 000010BD 000010BF 000010C0 000010BE 000010C1
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> NORMAL0
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> TEXCOORD0
//   vertex element: instruction 21 -> BLENDWEIGHT0
//   vertex element: instruction 22 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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

    r8 = In.position0;
    r7 = In.normal0;
    r0.yz = In.tangent0.xy;
    r1.zw = In.texcoord0.xy;
    r6.z = In.blendweight0.x;
    r4 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r3.xyz = r7.www * LocalToWorld[3].xyz;
    r5.w = ps;
    r6.xy = (r5.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r6.z * 0.15915494 + 0.5;
    ps = (-0.5) - -r1.z;
    r2 = r8.wwww * LocalToWorld[3];
    r10.w = ps;
    r3.xyz = r7.zzz * LocalToWorld[2].xzy + r3.xzy;
    r2 = r8.zzzz * LocalToWorld[2] + r2;
    ps = (-0.5) - -r1.w;
    r0.x = frac(r0.x);
    r9.x = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r2 = r8.yyyy * LocalToWorld[1] + r2;
    r3.xyz = r7.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r7.xxx * LocalToWorld[0].xzy + r3.xzy;
    r2 = r8.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r11.y = r9.x * r0.z;
    r1.y = ps;
    ps = sin(r0.x);
    r11.w = r10.w * r0.y;
    r0.w = ps;
    ps = CameraRight.x * r0.w;
    r13 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r3.w = ps;
    ps = (-1.0) * r1.y;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r1.x = ps;
    ps = r2.z;
    r9.yzw = r0.www * CameraRight.zyw;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r3.xyz = r2.yxz - r3.xzy;
    r5.x = ps;
    ps = CameraWorldPosition.y - r2.x;
    r12 = r1.yyyy * CameraRight.zyxw;
    r5.y = ps;
    r15.yzw = r1.xxx * CameraUp.wzy + r9.wyz;
    r17.x = r1.x * CameraUp.x + r3.w;
    r12 = r0.wwww * CameraUp.wyzx + r12.wyxz;
    ps = CameraWorldPosition.x - r2.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    r0.w = dot(r5.xzy, r5.xzy);
    r0.xw = max(r0.xw, 0.01);
    ps = rsqrt(abs(r0.w));
    r16 = r12.wyzx * ParticleUpRightResultScalars.xxxx;
    r1.x = ps;
    ps = rsqrt(abs(r0.x));
    r5.xyz = r5.zyx * r1.xxx;
    r0.x = ps;
    r12.xyz = r3.zyx * r0.xxx;
    r3.xyz = -r12.zyx * ParticleUpRightResultScalars.yyy + r16.xyz;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r10.xyz = r5.zxy * r12.yxz;
    r9.yzw = r5.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r5.xzy * r12.yzx - r10.zyx;
    r5.xyz = r5.xzy * AxisRotationVectors[a0].yxz - r9.wzy;
    r0.x = dot(r5.xzy, r5.xzy);
    ps = CameraUp.x;
    r0.w = dot(r12.xzy, r12.xzy);
    ps = (-1.0) * ps;
    r0.xw = max(r0.xw, 0.01);
    r12.w = ps;
    ps = rsqrt(abs(r0.x));
    r11.x = r16.w * r0.z;
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyz = r5.xyz * r1.xxx;
    r1.x = ps;
    r16 = r12 * r1.xxxy;
    r9.yzw = r5.zyx * AxisRotationVectors[a0].www;
    ps = r16.z;
    r15.x = r16.w + r3.w;
    r0.x = ps;
    r17.yzw = (-abs(r6.xxx) >= 0.0) ? AxisRotationVectors[a0].zyx : r9.wzy;
    r5.xyz = (-abs(r6.yyy) >= 0.0) ? AxisRotationVectors[a0].zyx : r9.wzy;
    r6.xyw = (r5.www == 0.0) ? r9.ywz : AxisRotationVectors[a0].xzy;
    r9.yzw = r6.ywx * ParticleUpRightResultScalars.zzz + r3.zyx;
    r12.xyz = r5.xyz * ParticleUpRightResultScalars.zzz + r3.zyx;
    r5.z = dot(r17.wx, ParticleUpRightResultScalars.zx) + 0.0;
    ps = ParticleUpRightResultScalars.y * r0.x;
    r15 = r15.xwzy * ParticleUpRightResultScalars.xxxx;
    r3.z = ps;
    ps = r15.w;
    r5.xyw = r17.zyw * ParticleUpRightResultScalars.zzz;
    r3.xy = r16.xy * ParticleUpRightResultScalars.yy + r15.zy;
    ps = r0.y * ps;
    r0.x = r15.x + r3.z;
    r11.z = ps;
    ps = r0.x;
    r10.xz = r3.yx + r5.xy;
    ps = r5.w + ps;
    r3.xyw = r3.xyz + r5.yxz;
    r10.y = ps;
    r2 = r11.wzww * r10.ywxz + r2.ywxz;
    r5.xyz = r3.xwy * r12.yxz;
    r10.xyz = r3.wxy * r12.yzx - r5.zyx;
    r2 = r11.yyxy * r9.zyxw + r2.zwyx;
    ps = r2.w;
    r3.z = dot(r10.xzy, r10.xzy);
    r1.y = ps;
    ps = r2.w;
    r5.yzw = r2.wxy - SecondDensityFunctionParameters.xyz;
    r0.w = ps;
    ps = -CameraPosition.x - -r0.w;
    r9 = r2.zzzz * ViewProjectionMatrix[3];
    r6.x = ps;
    r11.xyz = -r2.yxw * CameraPosition.www + CameraPosition.zyx;
    ps = -CameraPosition.y - -r2.x;
    r3.x = dot(r3.xwy, r11.xzy);
    r6.y = ps;
    ps = -CameraPosition.z - -r2.y;
    r3.y = dot(r12.xzy, r11.xzy);
    r6.w = ps;
    r9 = r2.yyyy * ViewProjectionMatrix[2] + r9;
    ps = CameraPosition.x - r1.y;
    r0.w = float((0.001 >= abs(r6.w)));
    r12.x = ps;
    ps = CameraPosition.y - r2.x;
    r1.x = dot(r6.wxy, r6.wxy);
    r12.y = ps;
    ps = CameraPosition.z - r2.y;
    r5.x = dot(r5.wyz, r5.wyz);
    r12.z = ps;
    r5.y = dot(r12.zxy, r5.wyz);
    r0.x = dot(r12.zxy, r12.zxy);
    ps = sqrt(abs(r1.x));
    r12.xy = r0.xx * float2(4.0, 0.33333334);
    r1.x = ps;
    r0.w = (r0.w == 0.0) ? r6.w : 0.001;
    r9 = r2.xxxx * ViewProjectionMatrix[1].xzwy + r9.xzwy;
    r2 = r2.wwww * ViewProjectionMatrix[0] + r9.xwyz;
    ps = 1.0 / r0.w;
    r9 = r1.xxxx - FogStartDistance.wzyx;
    r0.w = ps;
    r15 = saturate(r14.wzyx * r0.wwww);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r13 = saturate(r13.wzyx * r0.wwww);
    r1.x = ps;
    ps = 0.0001 + r0.x;
    r14 = max(r9, 0.0);
    r1.y = ps;
    ps = r5.y + r5.y;
    r9.xyz = r14.xyz * FogDistanceScale.wzy;
    r6.y = ps;
    ps = r5.x;
    r13 = r15.wzyx - r13.wzyx;
    ps = -r1.x + ps;
    r9.xyz = r9.xzy * abs(r13.xzy);
    r5.z = ps;
    ps = pow(2.0, r9.y);
    r0.w = abs(r13.w) * FogDistanceScale.x;
    r9.y = ps;
    ps = pow(2.0, r9.z);
    r13 = abs(r13) * r14;
    r9.z = ps;
    ps = pow(2.0, r9.x);
    r0.w = r0.w * r14.w;
    r9.w = ps;
    ps = pow(2.0, r0.w);
    r13 = float4((FogExtinctionDistance.wzyx > r13));
    r9.x = ps;
    ps = rsqrt(abs(r3.z));
    r9 = r13.wzyx * r9;
    r0.w = ps;
    ps = r9.y * r9.x;
    r13.xyz = r10.xyz * r0.www;
    r3.z = ps;
    ps = r9.w;
    r10 = r9.wzyx - 1.0;
    r0.w = ps;
    ps = ApproxFogColor.x * r0.w;
    r14.xyz = r10.yyy * FogInScattering[2].xyz;
    r6.x = ps;
    ps = r9.z;
    r16.xyz = r10.www * FogInScattering[0].xyz;
    ps = r3.z * ps;
    r15.xyz = r10.zzz * FogInScattering[1].xyz;
    r6.w = ps;
    r15.xyz = r9.yyy * r16.xyz + r15.xyz;
    r9.xyz = r9.zzz * r15.xyz + r14.xyz;
    ps = 1.0 / r1.y;
    r3.zw = r6.yx * r6.yw;
    r1.y = ps;
    r0.w = -r12.x * r5.z + r3.z;
    ps = sqrt(abs(r0.w));
    r1.y = r1.y * 0.5;
    r5.z = ps;
    ps = r6.y;
    r3.z = dot(r13.xzy, r11.xzy);
    ps = r5.z + ps;
    r5.w = r6.y - r5.z;
    r5.z = ps;
    r11.xy = saturate(r1.yy * -r5.zw);
    r11.zw = r11.yx * r11.yx;
    r5.zw = r11.zw * r11.yx;
    ps = 1.0 / r1.x;
    r5.zw = r12.yy * r5.wz;
    r1.x = ps;
    r5.w = dot(r11.zy, r5.yx) + r5.w;
    r5.z = dot(r11.wx, r5.yx) + r5.z;
    r1.xy = -r5.wz * r1.xx + r11.yx;
    r1.xy = r1.xy * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r1.x = r1.x - r1.y;
    r0.x = ps;
    r0.x = r1.x * r0.x;
    r0.x = (r0.w >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.w = r9.w * r6.w;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r5.w = r0.w * r0.x;
    r0.x = ps;
    ps = r3.w;
    r1.xy = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r5.xy = r1.yx * r0.ww;
    r5.z = ps;
    r5.xyz = r10.xxx * FogInScattering[3].yzx + r5.xyz;
    r5.xyz = r9.www * r9.xyz + r5.zxy;
    r0.x = r6.z * 0.15915494 + 0.5;
    r9.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.z;
    r6 = r8.wwww * LocalToWorld[3];
    r12.x = ps;
    r9.xyz = r7.zzz * LocalToWorld[2].xyz + r9.xzy;
    r6 = r8.zzzz * LocalToWorld[2] + r6;
    ps = (-0.5) + r1.w;
    r0.x = frac(r0.x);
    r12.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r6 = r8.yyyy * LocalToWorld[1] + r6;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r9.xzy;
    r8.yzw = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r7 = r8.xxxx * LocalToWorld[0] + r6;
    ps = cos(r0.w);
    r1.xy = r12.xy * r0.yz;
    r0.x = ps;
    r6.xyz = -r7.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r10.xyz = r7.xyz - r8.yzw;
    r3.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r9 = r3.wwww * CameraRight.wzyx;
    r6.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r8 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r6.zxy, r6.zxy);
    r0.x = ps;
    r8 = r3.wwww * CameraUp.wxzy + r8.xwyz;
    r9 = r0.xxxx * CameraUp.wxzy + r9.xwyz;
    ps = r0.w;
    r0.z = dot(r10.zxy, r10.zxy);
    ps = r8.x * ps;
    r0.xy = max(r0.yz, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = r0.z * r12.y;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r6.xyz = r6.xyz * r0.zzz;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.xyz = r10.zyx * r0.xxx;
    r3.w = ps;
    a0 = xe_mova(r3.w);
    ps = r3.w;
    r10.xyz = r6.zxy * r11.yxz;
    r0.xyz = r6.zxy * AxisRotationVectors[a0].yzx;
    r10.xyz = r6.xzy * r11.yzx - r10.zyx;
    r6.xyz = r6.xzy * AxisRotationVectors[a0].yxz - r0.zyx;
    r0.x = dot(r6.xzy, r6.xzy);
    ps = r6.w;
    r0.y = dot(r10.xzy, r10.xzy);
    ps = r9.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r6.w = r0.z * r12.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r10.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r6.zyx * r0.xxx;
    r6.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r3.www == 0.0) ? r6.xyz : AxisRotationVectors[a0].xyz;
    r6.xyz = (r3.www == 0.0) ? AxisRotationVectors[a0].xyz : r6.xyz;
    r6.xyz = r6.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r11.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r6.xyz = r10.zxy * ParticleUpRightResultScalars.yyy + r6.yxz;
    r6.xyz = r9.ywz * ParticleUpRightResultScalars.xxx + r6.yzx;
    r0.xyz = r8.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r1.yyy * r0.xyz;
    r6.xyz = r1.xxx * r6.xyz;
    r6 = r7.xzyw + r6.xzyw;
    r6 = r6.xzyw + r0;
    r0 = r6.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r6.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r1.zw;
    o3.xyz = r3.xyz;
    o1 = r4;
    o2 = r2;
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
