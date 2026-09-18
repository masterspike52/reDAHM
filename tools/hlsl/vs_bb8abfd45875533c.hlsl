// vs_bb8abfd45875533c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 351 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000057C 00410011 00000000 00000000 000044A5 00000001 00000005 00000005 00000290 0010000B 0000300C 0000500D 0000100E 0021500F 00003050 0001F151 0002F255 00037356 0004F457 0000106F 00001071 00001072 00001070 00001073
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> BLENDWEIGHT0
//   vertex element: instruction 15 -> TEXCOORD1
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
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r4 = In.position0;
    r5 = In.normal0;
    r3.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r1 = In.texcoord1;
    r8.z = CameraUp.x * (-1.0);
    r0.z = r0.y * 0.15915494 + 0.5;
    r0.xyw = r5.www * LocalToWorld[3].xyz;
    r0.xyw = r5.zzz * LocalToWorld[2].xzy + r0.xwy;
    ps = frac(r0.z);
    r2 = r4.wwww * LocalToWorld[3];
    r0.z = ps;
    r2 = r4.zzzz * LocalToWorld[2].xywz + r2.xywz;
    r2 = r4.yyyy * LocalToWorld[1] + r2.xywz;
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r0.xyw = r5.yyy * LocalToWorld[1].xyz + r0.xwy;
    r13.xyz = r5.xxx * LocalToWorld[0].xzy + r0.xwy;
    ps = cos(r0.z);
    r5.w = CameraPosition.z - FirstDensityFunctionParameters.y;
    r0.w = ps;
    r17 = r4.xxxx * LocalToWorld[0] + r2;
    r6.xyz = -r17.zyx * CameraPosition.www + CameraPosition.zyx;
    ps = (-1.0) * r0.w;
    r5.z = r17.z - FirstDensityFunctionParameters.y;
    r0.y = ps;
    ps = r17.z;
    r2.xyz = r0.www * CameraRight.zyx;
    r0.x = ps;
    ps = 0.0001 - r0.x;
    r9.xyz = -r17.xyz + FogVolumeBoxMax.xyz;
    r0.x = ps;
    ps = sin(r0.z);
    r10.xyz = -r17.xyz + CameraPosition.xyz;
    r3.w = ps;
    r12.xyz = r3.www * CameraUp.zyx + r2.xyz;
    ps = 1.0 / r10.x;
    r2 = r17.wwww * ViewProjectionMatrix[3];
    r7.x = ps;
    ps = 1.0 / r10.z;
    r8.xy = r0.yy * CameraUp.zy;
    r7.y = ps;
    r2 = r17.zzzz * ViewProjectionMatrix[2] + r2;
    ps = CameraPosition.z + r0.x;
    r11.xyz = r17.zyx - CameraPosition.zyx;
    r0.x = ps;
    ps = 1.0 / r10.y;
    r0.y = float((0.001 >= abs(r11.x)));
    r7.z = ps;
    r0.z = (-abs(r0.y) >= 0.0) ? r11.x : 0.001;
    ps = 1.0 / r0.x;
    r0.y = dot(r10.zxy, r10.zxy);
    r0.x = ps;
    ps = sqrt(abs(r0.y));
    r5.xy = float2((-r5.zw > 0.0));
    r0.y = ps;
    r2 = r17.yyyy * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r17.xxxx * ViewProjectionMatrix[0] + r2.xwyz;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r10.xyz = -r17.xyz + FogVolumeBoxMin.xyz;
    r8.w = ps;
    ps = -r5.z;
    r0.y = dot(r11.xzy, r11.xzy);
    ps = r0.x * ps;
    r15.xyz = r10.zyx * r7.yzx;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r11.xyz = r9.xzy * r7.xyz;
    r3.z = ps;
    ps = sqrt(abs(r0.y));
    r7.xyz = max(r15.xyz, r11.yzx);
    r0.y = ps;
    ps = 1.0 / r0.z;
    r10.x = r3.z * r5.y;
    r6.w = ps;
    ps = -r0.x;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = r5.x * ps;
    r16 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r10.y = ps;
    ps = r15.x;
    r3.z = float((ScreenAlignment.x > 1.5));
    r5.x = ps;
    ps = r11.y;
    r14.xyz = -r17.xyz + CameraWorldPosition.xyz;
    r5.y = ps;
    ps = min(r5.x, r5.y);
    r13.xyz = r17.xyz - r13.xzy;
    r15.x = ps;
    ps = r15.y;
    r5.z = dot(r13.zxy, r13.zxy);
    r5.x = ps;
    ps = r11.z;
    r5.w = dot(r14.zxy, r14.zxy);
    r5.y = ps;
    ps = min(r5.x, r5.y);
    r10.zw = max(r5.zw, 0.01);
    r15.y = ps;
    ps = r15.z;
    r5 = r0.yyyy - FogStartDistance.wzyx;
    r0.y = ps;
    ps = r11.x;
    r16 = saturate(r16.wzyx * r6.wwww);
    r0.z = ps;
    ps = min(r0.y, r0.z);
    r9 = saturate(r9.wzyx * r6.wwww);
    r15.z = ps;
    ps = max(r15.y, r15.x);
    r11 = max(r5, 0.0);
    r0.z = ps;
    ps = rsqrt(abs(r10.z));
    r5.xyz = r11.xyz * FogDistanceScale.wzy;
    r0.y = ps;
    ps = min(r7.y, r7.x);
    r13.xyz = r13.zyx * r0.yyy;
    r0.y = ps;
    ps = rsqrt(abs(r10.w));
    r9 = r16.wzyx - r9.wzyx;
    r5.w = ps;
    r12.xyz = (-abs(r3.zzz) >= 0.0) ? r12.zyx : r13.zyx;
    ps = abs(r9.w);
    r14.xyz = r14.zyx * r5.www;
    ps = FogDistanceScale.x * ps;
    r5.w = saturate(min(r0.y, r7.z));
    r0.y = ps;
    ps = r0.z;
    r7.xyz = r5.xzy * abs(r9.xzy);
    r10.z = ps;
    ps = r15.z;
    r5.xyz = r14.xzy * r13.yxz;
    r10.w = ps;
    ps = max(r10.z, r10.w);
    r9 = abs(r9) * r11;
    r6.w = saturate(ps);
    r5.xyz = r14.zxy * r13.yzx - r5.zyx;
    ps = pow(2.0, r7.y);
    r0.z = r0.y * r11.w;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r0.xy = r0.xx + r10.xy;
    r7.z = ps;
    ps = pow(2.0, r7.x);
    r0.y = max(r6.w, r0.y);
    r7.w = ps;
    ps = pow(2.0, r0.z);
    r0.x = min(r5.w, r0.x);
    r7.x = ps;
    ps = -r0.y;
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    ps = r0.x + ps;
    r7 = r9.wzyx * r7;
    r0.x = saturate(ps);
    ps = r7.y * r7.x;
    r0.y = dot(r5.xzy, r5.xzy);
    r5.w = ps;
    ps = r7.w;
    r0.z = max(r0.y, 0.01);
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r8.zw = r8.zw * r0.wx;
    r0.x = ps;
    ps = pow(2.0, -r8.w);
    r5.w = r7.z * r5.w;
    r0.y = ps;
    r8.xyz = r3.www * CameraRight.zyx + r8.xyz;
    ps = rsqrt(abs(r0.z));
    r0.w = r0.x * r5.w;
    r0.x = ps;
    r0.z = dot(r6.xzy, r12.zxy);
    r5.xyz = r5.zyx * r0.xxx;
    r10 = r7.yxzw - 1.0;
    ps = 1.0 - r0.y;
    r13.xyz = r10.zzz * FogInScattering[2].xyz;
    r0.x = ps;
    r8.xyz = (-abs(r3.zzz) >= 0.0) ? r8.zyx : r5.xyz;
    ps = ApproxFogColor.z * r0.x;
    r5.xyz = r10.yyy * FogInScattering[0].xyz;
    r3.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r5 = r7.yyyw * r5;
    r3.w = ps;
    r9.yz = r3.wz * r5.ww;
    ps = r0.w;
    r11.xyz = r8.yxz * r12.xzy;
    r14.xyz = r10.xxx * FogInScattering[1].xyz + r5.xyz;
    r10.xyz = r7.zzz * r14.xzy + r13.xzy;
    r7.xyz = r8.xzy * r12.yxz - r11.xyz;
    ps = r0.x * ps;
    r0.w = dot(r7.xzy, r7.xzy);
    r9.x = ps;
    r9.xyz = r10.www * FogInScattering[3].xyz + r9.xyz;
    r5.xyz = r7.www * r10.xzy + r9.xyz;
    ps = rsqrt(abs(r0.w));
    r0.x = dot(r6.xzy, r8.zxy);
    r0.w = ps;
    ps = r5.w;
    r7.xyz = r7.xyz * r0.www;
    ps = r0.y * ps;
    r0.w = dot(-r7.xzy, r6.xzy);
    r5.w = ps;
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
    o3.xyz = r0.xzw;
    o1 = r1;
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
