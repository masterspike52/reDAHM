// vs_c669f797ec6a18a9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 318 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004F8 0051000D 00000000 00000000 00005CC6 00000001 00000004 00000006 00000290 0010000A 0000600B 0000700C 0030300D 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A2 00001066 00001064 00001067 00001065 00001068 00001063
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c29); // float3
float4 BoneToDecal[4] : register(c23); // float4x4 (matrix_columns)
float4 CameraPosition : register(c4); // float4
float4 DecalLocation : register(c27); // float3
float4 DecalOffset : register(c28); // float2
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r2.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.xyz = In.normal0.xyz;
    r11.xyz = r0.yxz * 0.007843138 - 1.0;
    r4.xyz = r1.xzy * 0.007843138 - 1.0;
    r3.xyz = r2.zyx * 0.007843138 - 1.0;
    ps = r5.w;
    r0.xzw = r5.yxz - DecalLocation.yxz;
    r0.y = ps;
    ps = (-1.0) - -r0.y;
    r1 = r5.wwww * LocalToWorld[3].xzyw;
    r0.y = ps;
    r1 = r5.zzzz * LocalToWorld[2].xzyw + r1;
    r2.xy = r0.yy * BoneToDecal[3].xy;
    r2.xy = r0.ww * BoneToDecal[2].xy + r2.xy;
    r1 = r5.yyyy * LocalToWorld[1].xzyw + r1;
    r1 = r5.xxxx * LocalToWorld[0].xzyw + r1;
    r0.xy = r0.xx * BoneToDecal[1].xy + r2.xy;
    r8.yz = r0.zz * BoneToDecal[0].xy + r0.xy;
    r9.xyw = -r1.yzx * CameraPosition.www + CameraPosition.zyx;
    r6.xyz = -r1.xzy + CameraPosition.xyz;
    r0.xyw = r1.xzy - SecondDensityFunctionParameters.xyz;
    r2 = r1.wwww * ViewProjectionMatrix[3];
    r2 = r1.yyyy * ViewProjectionMatrix[2] + r2;
    r0.z = dot(r0.wxy, r0.wxy);
    r0.w = dot(r6.zxy, r0.wxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.x = dot(r6.zxy, r6.zxy);
    r1.w = ps;
    r3.w = r0.z - r1.w;
    r6 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r7 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r10.xyw = r1.zxy - CameraPosition.yxz;
    r4.w = dot(r10.wyx, r10.wyx);
    r10.xyz = r9.xxx * WorldToLocal[2].xyz;
    r0.y = float((0.001 >= abs(r10.w)));
    r0.y = (-abs(r0.y) >= 0.0) ? r10.w : 0.001;
    r9.xyz = r9.yyy * WorldToLocal[1].xyz + r10.xyz;
    ps = sqrt(abs(r4.w));
    r10.xy = r0.xx * float2(4.0, 0.33333334);
    r4.w = ps;
    r2 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r1.xxxx * ViewProjectionMatrix[0] + r2.xwyz;
    r12 = r4.wwww - FogStartDistance.wzyx;
    r9.xyz = r9.www * WorldToLocal[0].xzy + r9.xzy;
    ps = 1.0 / r0.y;
    r1.x = dot(r3.xzy, r9.yxz);
    r0.y = ps;
    r7 = saturate(r7.wzyx * r0.yyyy);
    r6 = saturate(r6.wzyx * r0.yyyy);
    r12 = max(r12, 0.0);
    r3.xyz = r12.xyz * FogDistanceScale.wzy;
    r7 = r7.wzyx - r6.wzyx;
    ps = 0.0001 + r0.x;
    r3.xyz = r3.xyz * abs(r7.xyz);
    r1.z = ps;
    ps = pow(2.0, r3.z);
    r0.y = abs(r7.w) * FogDistanceScale.x;
    r6.y = ps;
    ps = pow(2.0, r3.y);
    r7 = abs(r7) * r12;
    r6.z = ps;
    ps = pow(2.0, r3.x);
    r0.y = r0.y * r12.w;
    r6.w = ps;
    ps = pow(2.0, r0.y);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r6.x = ps;
    ps = r0.w + r0.w;
    r6 = r7.wzyx * r6;
    r3.x = ps;
    ps = r6.y * r6.x;
    r1.y = dot(r4.yxz, r9.yxz);
    r3.z = ps;
    ps = r6.w;
    r7 = r6.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r4.xyz = r7.yyy * FogInScattering[2].xyz;
    r3.y = ps;
    ps = r6.z;
    r13.xyz = r7.www * FogInScattering[0].xyz;
    ps = r3.z * ps;
    r12.xyz = r7.zzz * FogInScattering[1].xyz;
    r3.z = ps;
    r12.xyz = r6.yyy * r13.xyz + r12.xyz;
    r4.xyz = r6.zzz * r12.xyz + r4.xyz;
    ps = 1.0 / r1.z;
    r7.yz = r3.xy * r3.xz;
    r1.z = ps;
    r0.y = -r10.x * r3.w + r7.y;
    ps = sqrt(abs(r0.y));
    r3.w = r1.z * 0.5;
    r4.w = ps;
    ps = r3.x;
    r1.z = dot(r11.zyx, r9.yxz);
    ps = r4.w + ps;
    r8.w = r3.x - r4.w;
    r8.x = ps;
    r9.xy = saturate(r3.ww * -r8.xw);
    r9.zw = r9.yx * r9.yx;
    r8.xw = r9.zw * r9.yx;
    ps = 1.0 / r1.w;
    r6.xy = r10.yy * r8.wx;
    r1.w = ps;
    r8.w = dot(r9.zy, r0.wz) + r6.y;
    r8.x = dot(r9.wx, r0.wz) + r6.x;
    r0.zw = -r8.wx * r1.ww + r9.yx;
    r0.zw = r0.zw * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r0.z = r0.z - r0.w;
    r0.x = ps;
    r0.x = r0.z * r0.x;
    r0.x = (r0.y >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.y = r6.w * r3.z;
    r8.x = ps;
    ps = r0.y;
    r0.xzw = -r8.yxz + float3(0.5, 1.0, 0.5);
    ps = r8.x * ps;
    r3.xy = r0.xw + DecalOffset.xy;
    r4.w = ps;
    ps = r7.z;
    r3.zw = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r3.wz * r0.yy;
    r0.z = ps;
    r0.xyz = r7.xxx * FogInScattering[3].yzx + r0.xyz;
    r4.xyz = r6.www * r4.xyz + r0.zxy;
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
    o5.x = ps;
    o5.yzw = 0.0;
    o1.xy = r3.xy;
    o1.zw = 0.0;
    o3.xyz = r1.xyz;
    o0 = r3.xyyx;
    o2 = r2;
    o4 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color2 = o5;
    return Out;
}
