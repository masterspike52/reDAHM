// vs_ed8682e4421f7600.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 324 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000510 00410010 00000000 00000000 000044A5 00000001 00000005 00000005 00000290 0010000A 0000300B 0000500C 0000100D 0021500E 00003050 0001F151 0002F255 00037356 0004F457 00001066 00001068 00001069 00001067 0000106A
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> TEXCOORD0
//   vertex element: instruction 13 -> BLENDWEIGHT0
//   vertex element: instruction 14 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c23); // float3
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
float4 FogVolumeBoxMax : register(c25); // float3
float4 FogVolumeBoxMin : register(c24); // float3
float4 LocalToWorld[4] : register(c19); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c18); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r4 = In.position0;
    r2 = In.normal0;
    r3.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r5 = In.texcoord1;
    r8.z = CameraUp.x * (-1.0);
    r14 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r7 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = r0.y * 0.15915494 + 0.5;
    r0.yzw = r2.www * LocalToWorld[3].xyz;
    r0.yzw = r2.zzz * LocalToWorld[2].xzy + r0.ywz;
    ps = frac(r0.x);
    r1 = r4.wwww * LocalToWorld[3];
    r0.x = ps;
    r1 = r4.zzzz * LocalToWorld[2] + r1;
    r1 = r4.yyyy * LocalToWorld[1] + r1;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r0.yzw = r2.yyy * LocalToWorld[1].xyz + r0.ywz;
    r2.xyz = r2.xxx * LocalToWorld[0].xzy + r0.ywz;
    ps = cos(r0.x);
    r3.z = float((ScreenAlignment.x > 1.5));
    r0.w = ps;
    r1 = r4.xxxx * LocalToWorld[0].yzxw + r1.yzxw;
    r6.xyz = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    ps = r1.z;
    r9.xyz = r0.www * CameraRight.zyx;
    r0.y = ps;
    ps = FogVolumeBoxMax.x - r0.y;
    r13.xyz = -r1.zxy + FogVolumeBoxMin.xyz;
    r15.x = ps;
    ps = FogVolumeBoxMax.y - r1.x;
    r11.xyz = -r1.zxy + CameraWorldPosition.xyz;
    r15.y = ps;
    ps = r1.z;
    r8.xyw = r1.xyz - CameraPosition.yzx;
    r0.y = ps;
    ps = CameraPosition.x - r0.y;
    r10.xyz = r1.zxy - r2.xzy;
    r16.x = ps;
    ps = sin(r0.x);
    r2 = r1.wwww * ViewProjectionMatrix[3];
    r3.w = ps;
    r12.xyz = r3.www * CameraUp.zyx + r9.xyz;
    ps = CameraPosition.y - r1.x;
    r0.x = dot(r8.ywx, r8.ywx);
    r16.y = ps;
    ps = CameraPosition.z - r1.y;
    r8.x = dot(r10.zxy, r10.zxy);
    r16.z = ps;
    r2 = r1.yyyy * ViewProjectionMatrix[2] + r2;
    ps = 1.0 / r16.x;
    r0.y = dot(r16.zxy, r16.zxy);
    r9.x = ps;
    ps = 1.0 / r16.z;
    r0.z = float((0.001 >= abs(r8.y)));
    r9.y = ps;
    r0.z = (-abs(r0.z) >= 0.0) ? r8.y : 0.001;
    ps = sqrt(abs(r0.y));
    r8.y = dot(r11.zxy, r11.zxy);
    r0.y = ps;
    r2 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r1.zzzz * ViewProjectionMatrix[0] + r2.xwyz;
    ps = 1.0 / r16.y;
    r8.xy = max(r8.xy, 0.01);
    r9.z = ps;
    ps = FogVolumeBoxMax.z - r1.y;
    r13.xyz = r13.xzy * r9.xyz;
    r15.z = ps;
    ps = 1.0 / r0.z;
    r9.xyz = r15.xzy * r9.xyz;
    r0.z = ps;
    r7 = saturate(r7.wzyx * r0.zzzz);
    r1 = saturate(r14.wzyx * r0.zzzz);
    r14.xyz = min(r13.yzx, r9.yzx);
    ps = rsqrt(abs(r8.x));
    r9.xyw = max(r13.yzx, r9.yzx);
    r0.z = ps;
    r10.xyz = r10.zyx * r0.zzz;
    ps = sqrt(abs(r0.x));
    r7 = r7.wzyx - r1.wzyx;
    r0.x = ps;
    r12.xyz = (-abs(r3.zzz) >= 0.0) ? r12.zyx : r10.zyx;
    ps = rsqrt(abs(r8.y));
    r0.z = abs(r7.w) * FogDistanceScale.x;
    r1.w = ps;
    ps = (-1.0) * r0.w;
    r13 = r0.xxxx - FogStartDistance.wzyx;
    r0.x = ps;
    ps = CameraUp.z * r0.x;
    r13 = max(r13, 0.0);
    r8.x = ps;
    ps = CameraUp.y * r0.x;
    r1.xyz = r13.xyz * FogDistanceScale.wzy;
    r8.y = ps;
    ps = max(r14.y, r14.x);
    r11.xyz = r11.zyx * r1.www;
    r0.x = ps;
    ps = min(r9.y, r9.x);
    r1.w = saturate(max(r0.x, r14.z));
    r0.x = ps;
    ps = r0.x;
    r9.xyz = r11.xzy * r10.yxz;
    r14.x = ps;
    ps = r9.w;
    r1.xyz = r1.xzy * abs(r7.xzy);
    r14.y = ps;
    ps = min(r14.x, r14.y);
    r7 = abs(r7) * r13;
    r0.x = saturate(ps);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r0.x = saturate(-r1.w + r0.x);
    r8.w = ps;
    ps = pow(2.0, r1.y);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.z = r0.z * r13.w;
    r1.z = ps;
    r9.xyz = r11.zxy * r10.yzx - r9.zyx;
    ps = pow(2.0, r1.x);
    r0.y = dot(r9.xzy, r9.xzy);
    r1.w = ps;
    ps = pow(2.0, r0.z);
    r0.y = max(r0.y, 0.01);
    r1.x = ps;
    ps = rsqrt(abs(r0.y));
    r7 = r7.wzyx * r1;
    r0.y = ps;
    ps = r7.y * r7.x;
    r1.y = dot(r6.xzy, r12.zxy);
    r1.x = ps;
    ps = r7.w;
    r8.zw = r8.zw * r0.wx;
    r0.z = ps;
    ps = pow(2.0, -r8.w);
    r10.xyz = r9.zyx * r0.yyy;
    r0.y = ps;
    r13.xyz = r3.www * CameraRight.zyx + r8.xyz;
    ps = ApproxFogColor.x * r0.z;
    r8 = r7.yxzw - 1.0;
    r1.z = ps;
    ps = 1.0 - r0.y;
    r11.xyz = r8.zzz * FogInScattering[2].xyz;
    r0.x = ps;
    ps = ApproxFogColor.z * r0.x;
    r9.xyz = r8.yyy * FogInScattering[0].xyz;
    r0.z = ps;
    r13.xyz = (-abs(r3.zzz) >= 0.0) ? r13.zyx : r10.xyz;
    ps = ApproxFogColor.y * r0.x;
    r9.w = r7.z * r1.x;
    r0.w = ps;
    ps = r1.z;
    r1.x = dot(r6.xzy, r13.zxy);
    ps = r9.w * ps;
    r10.xyz = r13.yxz * r12.xzy;
    r1.z = ps;
    r10.xyz = r13.xzy * r12.yxz - r10.xyz;
    ps = r1.z;
    r9 = r7.yyyw * r9;
    ps = r0.x * ps;
    r1.z = dot(r10.xzy, r10.xzy);
    r0.x = ps;
    r12.xyz = r8.xxx * FogInScattering[1].xyz + r9.xyz;
    r8.xyz = r7.zzz * r12.xzy + r11.xzy;
    ps = rsqrt(abs(r1.z));
    r0.zw = r0.wz * r9.ww;
    r1.z = ps;
    ps = r9.w;
    r7.xyz = r10.xyz * r1.zzz;
    r0.xzw = r8.www * FogInScattering[3].xyz + r0.xzw;
    r0.xzw = r7.www * r8.xzy + r0.xzw;
    ps = r0.y * ps;
    r1.z = dot(-r7.xzy, r6.xzy);
    r0.y = ps;
    r6 = r4.wwww * LocalToWorld[3].xwzy;
    r6 = r4.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r4.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r4.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r4 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r4 = r6.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r6.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    o0.xy = r3.xy;
    o3.xyz = r1.xyz;
    o1 = r5;
    o2 = r2;
    o4 = r0.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
