// vs_ea1d58cdb272c7f1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 297 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004A4 0041000D 00000000 00000000 00004CA5 00000001 00000005 00000005 00000290 00100009 0000600A 0000700B 0000300C 0021A00D 0000F055 00017156 0002F257 0003F3A0 0004F4A2 00001060 0000105E 00001061 0000105F 0000105D
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> BINORMAL0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> COLOR1
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r1 = In.color1;
    r10.xyz = r0.zyw * 0.007843138 - 1.0;
    r7.xyz = r2.xzy * 0.007843138 - 1.0;
    r4.xyz = r3.zyx * 0.007843138 - 1.0;
    r0 = r5.wwww * LocalToWorld[3];
    r0 = r5.zzzz * LocalToWorld[2] + r0;
    r0 = r5.yyyy * LocalToWorld[1] + r0;
    r2 = r5.xxxx * LocalToWorld[0].wxyz + r0.wxyz;
    r8.xyw = -r2.wzy * CameraPosition.www + CameraPosition.zyx;
    r6.xyz = -r2.yzw + CameraPosition.xyz;
    r0.xyw = r2.yzw - SecondDensityFunctionParameters.xyz;
    r3 = r2.xxxx * ViewProjectionMatrix[3];
    r3 = r2.wwww * ViewProjectionMatrix[2] + r3;
    r0.z = dot(r0.wxy, r0.wxy);
    r0.w = dot(r6.zxy, r0.wxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.x = dot(r6.zxy, r6.zxy);
    r2.x = ps;
    r4.w = r0.z - r2.x;
    r6 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r9.xyw = r2.yzw - CameraPosition.xyz;
    r7.w = dot(r9.wxy, r9.wxy);
    r9.xyz = r8.xxx * WorldToLocal[2].xyz;
    r0.y = float((0.001 >= abs(r9.w)));
    r0.y = (r0.y == 0.0) ? r9.w : 0.001;
    r8.xyz = r8.yyy * WorldToLocal[1].xyz + r9.xyz;
    ps = sqrt(abs(r7.w));
    r9.xz = r0.xx * float2(4.0, 0.33333334);
    r7.w = ps;
    r3 = r2.zzzz * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r2.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    r12 = r7.wwww - FogStartDistance.wzyx;
    r8.yzw = r8.www * WorldToLocal[0].xzy + r8.xzy;
    ps = 1.0 / r0.y;
    r2.y = dot(r4.xzy, r8.zyw);
    r0.y = ps;
    r11 = saturate(r11.wzyx * r0.yyyy);
    r6 = saturate(r6.wzyx * r0.yyyy);
    r12 = max(r12, 0.0);
    r4.xyz = r12.xyz * FogDistanceScale.wzy;
    r11 = r11.wzyx - r6.wzyx;
    ps = 0.0001 + r0.x;
    r4.xyz = r4.xyz * abs(r11.xyz);
    r2.w = ps;
    ps = pow(2.0, r4.z);
    r0.y = abs(r11.w) * FogDistanceScale.x;
    r6.y = ps;
    ps = pow(2.0, r4.y);
    r11 = abs(r11) * r12;
    r6.z = ps;
    ps = pow(2.0, r4.x);
    r0.y = r0.y * r12.w;
    r6.w = ps;
    ps = pow(2.0, r0.y);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r6.x = ps;
    ps = r0.w + r0.w;
    r6 = r11.wzyx * r6;
    r4.x = ps;
    ps = r6.y * r6.x;
    r2.z = dot(r7.yxz, r8.zyw);
    r4.z = ps;
    ps = r6.w;
    r7 = r6.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r11.xyz = r7.yyy * FogInScattering[2].xyz;
    r4.y = ps;
    ps = r6.z;
    r13.xyz = r7.www * FogInScattering[0].xyz;
    ps = r4.z * ps;
    r12.xyz = r7.zzz * FogInScattering[1].xyz;
    r4.z = ps;
    r12.xyz = r6.yyy * r13.xyz + r12.xyz;
    r6.xyz = r6.zzz * r12.xyz + r11.xyz;
    ps = 1.0 / r2.w;
    r7.yz = r4.xy * r4.xz;
    r2.w = ps;
    r0.y = -r9.x * r4.w + r7.y;
    ps = sqrt(abs(r0.y));
    r4.w = r2.w * 0.5;
    r8.x = ps;
    ps = r4.x;
    r2.w = dot(r10.zyx, r8.zyw);
    ps = r8.x + ps;
    r8.y = r4.x - r8.x;
    r8.x = ps;
    r8.xy = saturate(r4.ww * -r8.xy);
    r8.zw = r8.yx * r8.yx;
    r9.xy = r8.zw * r8.yx;
    ps = 1.0 / r2.x;
    r7.yw = r9.zz * r9.yx;
    r2.x = ps;
    r9.y = dot(r8.zy, r0.wz) + r7.w;
    r9.x = dot(r8.wx, r0.wz) + r7.y;
    r0.zw = -r9.yx * r2.xx + r8.yx;
    r0.zw = r0.zw * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r0.z = r0.z - r0.w;
    r0.x = ps;
    r0.x = r0.z * r0.x;
    r0.x = (r0.y >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.y = r6.w * r4.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r4.w = r0.y * r0.x;
    r0.z = ps;
    ps = r7.z;
    r0.xw = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r0.wx * r0.yy;
    r0.z = ps;
    r0.xyz = r7.xxx * FogInScattering[3].yzx + r0.xyz;
    r4.xyz = r6.www * r6.xyz + r0.zxy;
    r0 = r5.wwww * LocalToWorld[3];
    r0 = r5.zzzz * LocalToWorld[2] + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r0 = r5.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o1.xyz = r2.yzw;
    o3 = r1;
    o0 = r3;
    o2 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
