// vs_41c10ce282f69199.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 609 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000984 00410011 00000000 00000000 000044A5 00000001 00000006 00000005 00000290 00100011 00003012 00006013 00005014 00001015 00215016 00003050 0001F151 0002F255 00037356 0004F457 000010C5 000010C7 000010C8 000010C6 000010C9
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

    r9 = In.position0;
    r8 = In.normal0;
    r0.yz = In.tangent0.xy;
    r1.xy = In.texcoord0.xy;
    r4.w = In.blendweight0.x;
    r3 = In.texcoord1;
    r5 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2 = r9.wwww * LocalToWorld[3];
    r0.w = ps;
    r1.zw = (r0.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r4.w * 0.15915494 + 0.5;
    ps = (-0.5) - -r1.y;
    r5.y = dot(SecondDensityFunctionParameters.zxyw, r5);
    r6.x = ps;
    r5.z = r6.x * r0.z;
    r4.xyz = r8.www * LocalToWorld[3].xyz;
    r4.xyz = r8.zzz * LocalToWorld[2].xzy + r4.xzy;
    r2 = r9.zzzz * LocalToWorld[2] + r2;
    ps = (-0.5) - -r1.x;
    r0.x = frac(r0.x);
    r12.w = ps;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r2 = r9.yyyy * LocalToWorld[1] + r2;
    r4.xyz = r8.yyy * LocalToWorld[1].xyz + r4.xzy;
    r4.xyz = r8.xxx * LocalToWorld[0].xzy + r4.xzy;
    r11 = r9.xxxx * LocalToWorld[0] + r2;
    ps = cos(r0.x);
    r13.y = r12.w * r0.y;
    r6.z = ps;
    ps = sin(r0.x);
    r2.x = r6.z * (-1.0);
    r0.x = ps;
    ps = r0.x;
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = CameraRight.x * ps;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r2.w = ps;
    ps = CameraRight.z * r0.x;
    r7.xyz = -r11.zyx + CameraWorldPosition.zyx;
    r12.x = ps;
    ps = CameraRight.y * r0.x;
    r4.xyz = r11.xyz - r4.xzy;
    r12.y = ps;
    ps = CameraRight.w * r0.x;
    r15 = r6.zzzz * CameraRight.zyxw;
    r12.z = ps;
    r17.yzw = r2.xxx * CameraUp.wzy + r12.zxy;
    r16.x = r2.x * CameraUp.x + r2.w;
    r15 = r0.xxxx * CameraUp.wyzx + r15.wyxz;
    r2.x = dot(r7.xzy, r7.xzy);
    r2.y = dot(r4.zxy, r4.zxy);
    r5.xw = max(r2.xy, 0.01);
    ps = rsqrt(abs(r5.x));
    r15 = r15.wyzx * ParticleUpRightResultScalars.xxxx;
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r2.xyz = r7.zyx * r0.xxx;
    r0.x = ps;
    r13.xzw = r4.zyx * r0.xxx;
    r4.xyz = -r13.wzx * ParticleUpRightResultScalars.yyy + r15.xyz;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r7.xyz = r2.zxy * r13.zxw;
    r12.xyz = r2.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r2.xzy * AxisRotationVectors[a0].yxz - r12.zyx;
    r7.xyz = r2.xzy * r13.zwx - r7.zyx;
    r2.x = dot(r7.xzy, r7.xzy);
    ps = CameraUp.x;
    r2.y = dot(r12.xzy, r12.xzy);
    ps = (-1.0) * ps;
    r6.yw = max(r2.yx, 0.01);
    r7.w = ps;
    ps = rsqrt(abs(r6.y));
    r5.x = r15.w * r0.z;
    r0.x = ps;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r12.xyz * r0.xxx;
    r6.y = ps;
    r15 = r7.xywz * r6.yyzy;
    r6.yzw = r2.zyx * AxisRotationVectors[a0].www;
    r17.x = r15.z + r2.w;
    r16.yzw = (-abs(r1.zzz) >= 0.0) ? AxisRotationVectors[a0].zyx : r6.wzy;
    r2.xyz = (-abs(r1.www) >= 0.0) ? AxisRotationVectors[a0].zyx : r6.wzy;
    r6.yzw = (r0.www == 0.0) ? r6.ywz : AxisRotationVectors[a0].xzy;
    r6.yzw = r6.zwy * ParticleUpRightResultScalars.zzz + r4.zyx;
    r7.yzw = r2.xyz * ParticleUpRightResultScalars.zzz + r4.zyx;
    r15.z = dot(r16.wx, ParticleUpRightResultScalars.zx) + 0.0;
    ps = r15.w;
    r2 = r17.wzyx * ParticleUpRightResultScalars.xxxx;
    r0.x = ps;
    ps = ParticleUpRightResultScalars.y * r0.x;
    r13.x = r2.z * r0.y;
    r2.z = ps;
    r2.xy = r15.xy * ParticleUpRightResultScalars.yy + r2.yx;
    ps = r2.w;
    r15.xyw = r16.zyw * ParticleUpRightResultScalars.zzz;
    ps = r2.z + ps;
    r12.xz = r2.yx + r15.xy;
    r0.x = ps;
    ps = r0.x;
    r16.yzw = r2.xyz + r15.yxz;
    ps = r15.w + ps;
    r4.xyz = r16.ywz * r7.zyw;
    r12.y = ps;
    r2 = r13.yxyy * r12.ywxz + r11.xwyz;
    r2 = r5.zzxz * r6.zyxw + r2.zwyx;
    r11.xyz = r16.wyz * r7.zwy - r4.zyx;
    r5.x = dot(r11.xzy, r11.xzy);
    r13.xyz = -r2.yxw + FogVolumeBoxMax.zyx;
    r15.xyz = -r2.yxw + FogVolumeBoxMin.zyx;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.ywxx : 1.0;
    ps = r2.w;
    r4.xyz = -r2.yxw + CameraPosition.zyx;
    r0.w = ps;
    ps = -CameraPosition.x - -r0.w;
    r6 = r2.zzzz * ViewProjectionMatrix[3];
    r16.x = ps;
    r12.xyz = -r2.yxw * CameraPosition.www + CameraPosition.zyx;
    ps = -CameraPosition.y - -r2.x;
    r7.x = dot(r16.ywz, r12.xzy);
    r16.y = ps;
    ps = -CameraPosition.z - -r2.y;
    r7.y = dot(r7.ywz, r12.xzy);
    r16.z = ps;
    ps = (-r5.y > 0.0) ? 1.0 : 0.0;
    r7.w = dot(r16.zxy, r16.zxy);
    r7.z = ps;
    r6 = r2.yyyy * ViewProjectionMatrix[2] + r6;
    ps = 1.0 / r4.x;
    r1.z = dot(r4.xzy, r4.xzy);
    r5.y = ps;
    ps = 1.0 / r4.z;
    r1.w = dot(r4.xzy, SecondDensityFunctionParameters.zxy);
    r5.z = ps;
    ps = 1.0 / r4.y;
    r4.x = dot(SecondDensityFunctionParameters.zxyw, r17);
    r5.w = ps;
    ps = (-r4.x > 0.0) ? 1.0 : 0.0;
    r0.x = float((0.001 >= abs(r16.z)));
    r4.y = ps;
    r0.w = (r0.x == 0.0) ? r16.z : 0.001;
    ps = sqrt(abs(r1.z));
    r0.x = r1.w + 0.0001;
    r1.z = ps;
    r6 = r2.xxxx * ViewProjectionMatrix[1].xzwy + r6.xzwy;
    r6 = r2.wwww * ViewProjectionMatrix[0] + r6.xwyz;
    ps = sqrt(abs(r7.w));
    r15.xyz = r15.xzy * r5.yzw;
    r2.x = ps;
    ps = 1.0 / r0.w;
    r5.yzw = r13.zxy * r5.zyw;
    r0.w = ps;
    ps = 1.0 / r0.x;
    r13 = r2.xxxx - FogStartDistance.wzyx;
    r0.x = ps;
    ps = -r4.x;
    r14 = saturate(r14.wzyx * r0.wwww);
    ps = r0.x * ps;
    r2.xyz = min(r15.yxz, r5.yzw);
    r0.x = ps;
    ps = max(r2.z, r2.y);
    r5.yzw = max(r15.xzy, r5.zwy);
    r4.z = ps;
    ps = min(r5.z, r5.y);
    r10 = saturate(r10.wzyx * r0.wwww);
    r0.w = ps;
    ps = 1.0 - r0.x;
    r13 = max(r13, 0.0);
    r2.w = ps;
    ps = -r0.x;
    r10 = r14.wzyx - r10.wzyx;
    ps = r4.y * ps;
    r5.y = r2.w * r7.z;
    r5.z = ps;
    ps = abs(r10.w);
    r14.xyz = r13.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r4.y = saturate(min(r0.w, r5.w));
    r0.w = ps;
    ps = r4.z;
    r2.yzw = r14.zyx * abs(r10.zyx);
    r7.z = ps;
    ps = r2.x;
    r10 = abs(r10) * r13;
    r7.w = ps;
    ps = max(r7.z, r7.w);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r4.z = saturate(ps);
    ps = pow(2.0, r2.y);
    r2.x = r0.w * r13.w;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r0.xw = r0.xx + r5.zy;
    r2.z = ps;
    ps = pow(2.0, r2.w);
    r0.x = max(r4.z, r0.x);
    r2.w = ps;
    ps = pow(2.0, r2.x);
    r0.w = min(r4.y, r0.w);
    r2.x = ps;
    r10 = r10.wzyx * r2;
    r2.y = float((r0.x >= r0.w));
    ps = rsqrt(abs(r5.x));
    r4.y = r10.w * ApproxFogColor.x;
    r2.x = ps;
    r5.xy = (r2.yy == 0.0) ? r0.xw : 0.0;
    ps = r10.y * r10.x;
    r13.xyz = r11.xyz * r2.xxx;
    r0.x = ps;
    ps = r10.z;
    r2 = r10.zwyx - 1.0;
    ps = r0.x * ps;
    r11.zw = r5.xy * 0.5;
    r5.z = ps;
    ps = r2.x;
    r7.z = dot(r13.xzy, r12.xzy);
    r0.w = ps;
    ps = FogInScattering[2].x * r0.w;
    r13.xyz = r2.www * FogInScattering[0].xyz;
    r11.x = ps;
    ps = FogInScattering[2].y * r2.x;
    r12.xyz = r2.zzz * FogInScattering[1].xyz;
    r11.y = ps;
    ps = FogInScattering[2].z * r2.x;
    r0.xw = r11.zw * r5.xy;
    r11.z = ps;
    r12.xyz = r10.yyy * r13.xyz + r12.xyz;
    r10.xyz = r10.zzz * r12.xyz + r11.xyz;
    r4.xyz = r4.xxy * r5.yxz;
    r0.xw = r0.wx * r1.ww + r4.xy;
    ps = FirstDensityFunctionParameters.x * r1.z;
    r0.x = r0.x - r0.w;
    r0.w = ps;
    r0.x = r0.w * -r0.x;
    ps = 0.0001 * r0.x;
    r0.x = ps;
    ps = pow(2.0, -r0.x);
    r0.w = r10.w * r5.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r2.x = r0.w * r0.x;
    r0.x = ps;
    ps = r4.z;
    r1.zw = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r4.yz = r1.wz * r0.ww;
    r4.x = ps;
    r2.yzw = r2.yyy * FogInScattering[3].xyz + r4.xyz;
    r2.yzw = r10.www * r10.xyz + r2.yzw;
    r0.x = r4.w * 0.15915494 + 0.5;
    r5.xyz = r8.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r4 = r9.wwww * LocalToWorld[3];
    r12.x = ps;
    r5.xyz = r8.zzz * LocalToWorld[2].xyz + r5.xzy;
    r4 = r9.zzzz * LocalToWorld[2] + r4;
    ps = (-0.5) + r1.y;
    r0.x = frac(r0.x);
    r12.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r4 = r9.yyyy * LocalToWorld[1] + r4;
    r5.xyz = r8.yyy * LocalToWorld[1].xzy + r5.xzy;
    r8.xyz = r8.xxx * LocalToWorld[0].xyz + r5.xzy;
    r5 = r9.xxxx * LocalToWorld[0] + r4;
    ps = cos(r0.w);
    r1.zw = r12.xy * r0.yz;
    r0.x = ps;
    r4.xyz = -r5.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r10.xyz = r5.xyz - r8.xyz;
    r7.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r9 = r7.wwww * CameraRight.wzyx;
    r4.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r8 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    r8 = r7.wwww * CameraUp.wxzy + r8.xwyz;
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
    r4.xyz = r4.xyz * r0.zzz;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r11.xyz = r10.zyx * r0.xxx;
    r7.w = ps;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r10.xyz = r4.zxy * r11.yxz;
    r0.xyz = r4.zxy * AxisRotationVectors[a0].yzx;
    r10.xyz = r4.xzy * r11.yzx - r10.zyx;
    r4.xyz = r4.xzy * AxisRotationVectors[a0].yxz - r0.zyx;
    r0.x = dot(r4.xzy, r4.xzy);
    ps = r4.w;
    r0.y = dot(r10.xzy, r10.xzy);
    ps = r9.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r4.w = r0.z * r12.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r10.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r4.zyx * r0.xxx;
    r4.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r7.www == 0.0) ? r4.xyz : AxisRotationVectors[a0].xyz;
    r4.xyz = (r7.www == 0.0) ? AxisRotationVectors[a0].xyz : r4.xyz;
    r4.xyz = r4.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r11.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r4.xyz = r10.zxy * ParticleUpRightResultScalars.yyy + r4.yxz;
    r4.xyz = r9.ywz * ParticleUpRightResultScalars.xxx + r4.yzx;
    r0.xyz = r8.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r1.www * r0.xyz;
    r4.xyz = r1.zzz * r4.xyz;
    r4 = r5.xzyw + r4.xzyw;
    r4 = r4.xzyw + r0;
    r0 = r4.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r4.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r1.xy;
    o3.xyz = r7.xyz;
    o1 = r3;
    o2 = r6;
    o4 = r2.yzwx;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
