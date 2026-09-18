// vs_36fa4a4c740c103e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 303 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004BC 0051000E 00000000 00000000 00005CC6 00000001 00000006 00000006 00000290 00100009 0000600A 0000700B 0000300C 0001A00D 0020500E 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001061 00001062 0000105F 00001063 00001060 0000105E
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> BINORMAL0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> COLOR1
//   vertex element: instruction 14 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c23); // float3
float4 CameraPosition : register(c4); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c16); // float4x4 (matrix_columns)
float4 SecondDensityFunctionParameters : register(c15); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c20); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color2 : COLOR2;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r4 = In.color1;
    r2.xy = In.texcoord0.xy;
    r2.z = 0.0;
    r11.xyz = r0.zyw * 0.007843138 - 1.0;
    r9.xyz = r1.xzy * 0.007843138 - 1.0;
    r3.xzw = r3.zyx * 0.007843138 - 1.0;
    r0 = r5.wwww * LocalToWorld[3].xzyw;
    r0 = r5.zzzz * LocalToWorld[2].xzyw + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r5.xxxx * LocalToWorld[0].wxzy + r0.wxyz;
    r7.xyw = -r0.zwy * CameraPosition.www + CameraPosition.zyx;
    r1 = r0.xxxx * ViewProjectionMatrix[3].xwzy;
    r13.xyz = -r0.zwy + CameraPosition.zyx;
    r10.xyz = r0.ywz - SecondDensityFunctionParameters.xyz;
    r6 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r1.y = dot(r10.zxy, r10.zxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.x = dot(r13.xzy, r13.xzy);
    r1.x = ps;
    r3.y = r1.y - r1.x;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r12 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r14.xyw = r0.ywz - CameraPosition.xyz;
    r1.w = dot(r14.wxy, r14.wxy);
    r13.w = dot(r13.xzy, r10.zxy);
    r14.xyz = r7.xxx * WorldToLocal[2].xzy;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r1.z = float((0.001 >= abs(r14.w)));
    r10.w = ps;
    r1.z = (r1.z == 0.0) ? r14.w : 0.001;
    r7.xyz = r7.yyy * WorldToLocal[1].xzy + r14.xyz;
    r6 = r0.wwww * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r0.yyyy * ViewProjectionMatrix[0] + r6.xzyw;
    ps = sqrt(abs(r1.w));
    r0.z = dot(r13.xzyw, r10.zxyw);
    r0.y = ps;
    r10.xyz = r7.www * WorldToLocal[0].xyz + r7.xzy;
    ps = 1.0 / r1.z;
    r7 = r0.yyyy - FogStartDistance.wzyx;
    r0.y = ps;
    r13 = saturate(r12.wzyx * r0.yyyy);
    r8 = saturate(r8.wzyx * r0.yyyy);
    r12 = max(r7, 0.0);
    r7.xyz = r12.xyz * FogDistanceScale.wzy;
    r8 = r13.wzyx - r8.wzyx;
    r7.xyz = r7.xzy * abs(r8.xzy);
    ps = pow(2.0, r7.y);
    r0.y = abs(r8.w) * FogDistanceScale.x;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r8 = abs(r8) * r12;
    r7.z = ps;
    ps = pow(2.0, r7.x);
    r0.y = r0.y * r12.w;
    r7.w = ps;
    ps = pow(2.0, r0.y);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r7.x = ps;
    r7 = r8.wzyx * r7;
    ps = r7.y * r7.x;
    r3.x = dot(r3.xwz, r10.zxy);
    r0.w = ps;
    ps = r7.w;
    r8 = r7.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r12.xyz = r8.yyy * FogInScattering[2].xyz;
    r0.y = ps;
    ps = r7.z;
    r14.xyz = r8.www * FogInScattering[0].xyz;
    ps = r0.w * ps;
    r13.xyz = r8.zzz * FogInScattering[1].xyz;
    r0.w = ps;
    r13.xyz = r7.yyy * r14.xyz + r13.xyz;
    r7.xyz = r7.zzz * r13.xyz + r12.xyz;
    ps = 0.0001 + r0.x;
    r1.zw = r0.yz * r0.wz;
    r2.w = ps;
    ps = 1.0 / r2.w;
    r8.yzw = r0.xxz * float3(4.0, 0.33333334, 0.5);
    r2.w = ps;
    r0.y = -r8.y * r3.y + r1.w;
    ps = sqrt(abs(r0.y));
    r2.w = r2.w * 0.5;
    r3.z = ps;
    ps = r0.z;
    r3.y = dot(r9.yxz, r10.zxy);
    ps = r3.z + ps;
    r3.w = r0.z - r3.z;
    r3.z = ps;
    r9.zw = saturate(r2.ww * -r3.zw);
    ps = r9.w * r9.w;
    r3.z = dot(r11.zyx, r10.zxy);
    r9.x = ps;
    ps = r9.z * r9.z;
    r1.yw = r9.zw * r1.yy;
    r9.y = ps;
    ps = 1.0 / r1.x;
    r10 = r9.yxzw * r9.zwzw;
    r1.x = ps;
    r10.y = dot(r8.zw, r10.yw) + r1.w;
    r10.x = dot(r8.zw, r10.xz) + r1.y;
    r1.xy = -r10.yx * r1.xx + r9.wz;
    r1.xy = r1.xy * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r1.x = r1.x - r1.y;
    r0.x = ps;
    r0.x = r1.x * r0.x;
    r0.x = (r0.y >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.z = r7.w * r0.w;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r1.w = r0.z * r0.y;
    r0.w = ps;
    ps = r1.z;
    r0.xy = r0.ww * ApproxFogColor.zy;
    ps = r0.w * ps;
    r0.xy = r0.xy * r0.zz;
    r0.z = ps;
    r0.xyz = r8.xxx * FogInScattering[3].yzx + r0.yxz;
    r1.xyz = r7.www * r7.xyz + r0.zxy;
    r0 = r5.wwww * LocalToWorld[3].xwzy;
    r0 = r5.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r5.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.x = ps;
    o5.yzw = 0.0;
    o2.xyz = r3.xyz;
    o4 = r4;
    o0 = r2.xyzz;
    o1 = r6;
    o3 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color2 = o5;
    return Out;
}
