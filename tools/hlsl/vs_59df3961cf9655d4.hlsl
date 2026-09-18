// vs_59df3961cf9655d4.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 390 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000618 00410010 00000000 00000000 000044A5 00000001 00000005 00000005 00000290 0010000C 0000300D 0000500E 0000100F 00215010 00003050 0001F151 0002F255 00037356 0004F457 0000107C 0000107E 0000107F 0000107D 00001080
//   vertex element: instruction 12 -> POSITION0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> TEXCOORD0
//   vertex element: instruction 15 -> BLENDWEIGHT0
//   vertex element: instruction 16 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c24); // float3
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
float4 FogVolumeBoxMax : register(c26); // float3
float4 FogVolumeBoxMin : register(c25); // float3
float4 LocalToWorld[4] : register(c20); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c19); // float4
float4 SecondDensityFunctionParameters : register(c15); // float4
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

    r6 = In.position0;
    r1 = In.normal0;
    r5.xy = In.texcoord0.xy;
    r7.w = In.blendweight0.x;
    r2 = In.texcoord1;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r0.xyz = r1.www * LocalToWorld[3].xyz;
    r3 = r6.wwww * LocalToWorld[3];
    r5.z = dot(SecondDensityFunctionParameters.zxyw, r4);
    r0.xyz = r1.zzz * LocalToWorld[2].xzy + r0.xzy;
    r3 = r6.zzzz * LocalToWorld[2] + r3;
    r3 = r6.yyyy * LocalToWorld[1] + r3;
    r0.xyz = r1.yyy * LocalToWorld[1].xyz + r0.xzy;
    r0.yzw = r1.xxx * LocalToWorld[0].xzy + r0.xzy;
    r1 = r6.xxxx * LocalToWorld[0].zxyw + r3.zxyw;
    r8.xyz = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    r15.xyz = -r1.xzy + FogVolumeBoxMax.zyx;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.xyzz : 1.0;
    r3.xyz = -r1.yzx + CameraPosition.xyz;
    ps = r1.x;
    r7.xyz = r1.zyx - CameraPosition.yxz;
    r0.x = ps;
    ps = r1.y;
    r12.xyz = -r0.ywz + r1.yzx;
    r0.y = ps;
    ps = CameraWorldPosition.x - r0.y;
    r4 = r1.wwww * ViewProjectionMatrix[3];
    r11.y = ps;
    ps = CameraWorldPosition.y - r1.z;
    r3.w = dot(r7.zyx, r7.zyx);
    r11.z = ps;
    ps = CameraWorldPosition.z - r1.x;
    r7.x = dot(r12.zxy, r12.zxy);
    r11.w = ps;
    ps = FogVolumeBoxMin.z - r0.x;
    r7.y = dot(r11.wyz, r11.wyz);
    r14.x = ps;
    r4 = r1.xxxx * ViewProjectionMatrix[2] + r4;
    ps = FogVolumeBoxMin.y - r1.z;
    r0.y = dot(r3.zxy, r3.zxy);
    r14.y = ps;
    ps = FogVolumeBoxMin.x - r1.y;
    r0.w = dot(r3.zxy, SecondDensityFunctionParameters.zxy);
    r14.z = ps;
    ps = 1.0 / r3.z;
    r0.x = float((0.001 >= abs(r7.z)));
    r10.x = ps;
    ps = 1.0 / r3.x;
    r3.z = dot(SecondDensityFunctionParameters.zxyw, r16);
    r10.y = ps;
    r0.z = (-abs(r0.x) >= 0.0) ? r7.z : 0.001;
    ps = sqrt(abs(r0.y));
    r0.x = r0.w + 0.0001;
    r0.y = ps;
    r4 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r4.xzwy;
    r4 = r1.yyyy * ViewProjectionMatrix[0] + r4.xwyz;
    ps = 1.0 / r3.y;
    r7.xy = max(r7.xy, 0.01);
    r10.z = ps;
    ps = (-r5.z > 0.0) ? 1.0 : 0.0;
    r14.xyz = r14.xzy * r10.xyz;
    r5.z = ps;
    ps = sqrt(abs(r3.w));
    r10.xyz = r15.zxy * r10.yxz;
    r1.x = ps;
    ps = 1.0 / r0.x;
    r1 = r1.xxxx - FogStartDistance.wzyx;
    r0.x = ps;
    ps = (-r3.z > 0.0) ? 1.0 : 0.0;
    r0.x = -r3.z * r0.x;
    r5.w = ps;
    ps = 1.0 / r0.z;
    r3.xyw = min(r14.xzy, r10.yzx);
    r0.z = ps;
    ps = max(r3.y, r3.x);
    r10.xyz = max(r14.xzy, r10.yzx);
    r8.w = ps;
    ps = min(r10.y, r10.x);
    r13 = saturate(r13.wzyx * r0.zzzz);
    r10.w = ps;
    ps = 1.0 - r0.x;
    r1 = max(r1.yxzw, 0.0);
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r5.w = -r0.x * r5.w;
    r11.x = ps;
    ps = r1.y;
    r9 = saturate(r9.wzyx * r0.zzzz);
    r0.z = ps;
    ps = rsqrt(abs(r7.x));
    r11.xyz = r11.wzy * r11.xxx;
    r7.x = ps;
    ps = FogDistanceScale.w * r0.z;
    r12.xyz = r12.zyx * r7.xxx;
    r7.x = ps;
    ps = FogDistanceScale.z * r1.x;
    r9 = r13.wzyx - r9.wzyx;
    r7.y = ps;
    ps = FogDistanceScale.y * r1.z;
    r5.z = r7.z * r5.z;
    r7.z = ps;
    ps = abs(r9.w);
    r3.x = saturate(min(r10.w, r10.z));
    ps = FogDistanceScale.x * ps;
    r7.xyz = r7.xyz * abs(r9.xyz);
    r0.z = ps;
    ps = r8.w;
    r10.xyz = r11.xzy * r12.yxz;
    r3.y = ps;
    ps = r3.w;
    r9 = abs(r9) * r1.yxzw;
    r3.w = ps;
    r11.xyz = r11.zxy * r12.yzx - r10.zyx;
    ps = max(r3.y, r3.w);
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    r3.y = saturate(ps);
    ps = pow(2.0, r7.z);
    r1.x = r0.z * r1.w;
    r1.y = ps;
    ps = pow(2.0, r7.y);
    r0.xz = r0.xx + r5.wz;
    r1.z = ps;
    ps = pow(2.0, r7.x);
    r0.x = max(r3.y, r0.x);
    r1.w = ps;
    ps = pow(2.0, r1.x);
    r0.z = min(r3.x, r0.z);
    r1.x = ps;
    r9 = r9.wzyx * r1;
    r1.x = float((r0.x >= r0.z));
    r7.xy = (r1.xx == 0.0) ? r0.xz : 0.0;
    ps = r9.y * r9.x;
    r3.y = CameraUp.x * (-1.0);
    r0.x = ps;
    r7.z = r9.z * r0.x;
    r1.w = r9.w * r7.z;
    r5.z = float((ScreenAlignment.x > 1.5));
    r10 = r9.zyxw - 1.0;
    r1.xyz = r10.xxx * FogInScattering[2].xyz;
    r14.xyz = r10.zzz * FogInScattering[0].xyz;
    ps = r9.w;
    r13.xyz = r10.yyy * FogInScattering[1].xyz;
    r0.z = ps;
    r13.xyz = r9.yyy * r14.xyz + r13.xyz;
    r10.xyz = r9.zzz * r13.xyz + r1.xyz;
    ps = ApproxFogColor.x * r0.z;
    r1.xyz = r7.wxy * float3(0.15915494, 0.5, 0.5);
    r3.x = ps;
    r3.xzw = r3.xzz * r7.zxy;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r7.xy = r1.yz * r7.xy;
    r0.z = ps;
    r0.xy = r7.yx * r0.ww + r3.wz;
    ps = 0.5 + r1.x;
    r0.y = r0.x - r0.y;
    r0.x = ps;
    ps = frac(r0.x);
    r0.y = r0.z * -r0.y;
    r0.x = ps;
    r0.xz = r0.yx * float2(0.0001, 6.2831855);
    ps = pow(2.0, -r0.x);
    r0.z = r0.z - 3.1415927;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r1.x = dot(r11.xzy, r11.xzy);
    r0.w = ps;
    ps = cos(r0.z);
    r3.w = r1.w * r0.x;
    r0.y = ps;
    ps = (-1.0) * r0.y;
    r1.x = max(r1.x, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.x));
    r3.x = r3.x * r0.w;
    r1.x = ps;
    ps = r3.y;
    r9.xyz = r11.zyx * r1.xxx;
    ps = r0.y * ps;
    r3.yz = r0.ww * ApproxFogColor.zy;
    r11.z = ps;
    ps = CameraUp.z * r0.x;
    r1.xyz = r0.yyy * CameraRight.zyx;
    r11.x = ps;
    ps = sin(r0.z);
    r3.yz = r3.zy * r1.ww;
    r0.y = ps;
    r1.xyz = r0.yyy * CameraUp.zyx + r1.xyz;
    r7.xyz = (-abs(r5.zzz) >= 0.0) ? r1.zyx : r12.zyx;
    ps = CameraUp.y * r0.x;
    r1.y = dot(r8.xzy, r7.zxy);
    r11.y = ps;
    r0.xyz = r0.yyy * CameraRight.zyx + r11.xyz;
    r1.xzw = r10.www * FogInScattering[3].xyz + r3.xyz;
    r3.xyz = r9.www * r10.xyz + r1.xzw;
    r1.xzw = (-abs(r5.zzz) >= 0.0) ? r0.zyx : r9.xyz;
    r0.xyz = r1.zxw * r7.xzy;
    r0.yzw = r1.xwz * r7.yxz - r0.xyz;
    r0.x = dot(r0.ywz, r0.ywz);
    ps = rsqrt(abs(r0.x));
    r1.x = dot(r8.xzy, r1.wxz);
    r0.x = ps;
    r0.xyz = r0.yzw * r0.xxx;
    r1.z = dot(-r0.xzy, r8.xzy);
    r0 = r6.wwww * LocalToWorld[3].xwzy;
    r0 = r6.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r6 = r6.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r6.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r5.xy;
    o3.xyz = r1.xyz;
    o1 = r2;
    o2 = r4;
    o4 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
