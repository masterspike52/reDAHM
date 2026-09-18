// vs_52b4994e2cce1eb9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 315 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004EC 0061000F 00000000 00000000 00006CE7 00000001 00000008 00000007 00000290 0010000A 0000600B 0000700C 0000300D 0001A00E 0000500F 00015010 00225011 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001065 00001062 00001066 00001063 00001067 00001064 00001061
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> COLOR1
//   vertex element: instruction 15 -> TEXCOORD0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 r15 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r7 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r6 = In.color1;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.yx;
    r1.xy = In.texcoord2.xy;
    r12.xyz = r0.zyw * 0.007843138 - 1.0;
    r9.xyz = r2.xzy * 0.007843138 - 1.0;
    r3.xyz = r3.zyx * 0.007843138 - 1.0;
    r0 = r7.wwww * LocalToWorld[3];
    r0 = r7.zzzz * LocalToWorld[2] + r0;
    r0 = r7.yyyy * LocalToWorld[1] + r0;
    r2 = r7.xxxx * LocalToWorld[0] + r0;
    r10.xyz = -r2.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = -r2.xyz + CameraPosition.xyz;
    r0.xyw = r2.xyz - SecondDensityFunctionParameters.xyz;
    r8 = r2.wwww * ViewProjectionMatrix[3];
    r14 = r2.zzzz * ViewProjectionMatrix[2] + r8;
    r0.z = dot(r0.wxy, r0.wxy);
    r0.w = dot(r4.zxy, r0.wxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.x = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    r4.w = r0.z - r1.z;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r11.xyz = r2.zyx - CameraPosition.zyx;
    r1.w = dot(r11.xzy, r11.xzy);
    r4.xyz = r10.xxx * WorldToLocal[2].xyz;
    r0.y = float((0.001 >= abs(r11.x)));
    r0.y = (-abs(r0.y) >= 0.0) ? r11.x : 0.001;
    r4.xyz = r10.yyy * WorldToLocal[1].xyz + r4.xyz;
    ps = sqrt(abs(r1.w));
    r11.xz = r0.xx * float2(4.0, 0.33333334);
    r1.w = ps;
    r14 = r2.yyyy * ViewProjectionMatrix[1].xzwy + r14.xzwy;
    r2 = r2.xxxx * ViewProjectionMatrix[0] + r14.xwyz;
    r14 = r1.wwww - FogStartDistance.wzyx;
    r10.xyz = r10.zzz * WorldToLocal[0].xzy + r4.xzy;
    ps = 1.0 / r0.y;
    r3.x = dot(r3.xzy, r10.yxz);
    r0.y = ps;
    r13 = saturate(r13.wzyx * r0.yyyy);
    r8 = saturate(r8.wzyx * r0.yyyy);
    r14 = max(r14, 0.0);
    r3.yzw = r14.xyz * FogDistanceScale.wzy;
    r13 = r13.wzyx - r8.wzyx;
    ps = 0.0001 + r0.x;
    r3.yzw = r3.yzw * abs(r13.xyz);
    r1.w = ps;
    ps = pow(2.0, r3.w);
    r0.y = abs(r13.w) * FogDistanceScale.x;
    r8.y = ps;
    ps = pow(2.0, r3.z);
    r13 = abs(r13) * r14;
    r8.z = ps;
    ps = pow(2.0, r3.y);
    r0.y = r0.y * r14.w;
    r8.w = ps;
    ps = pow(2.0, r0.y);
    r13 = float4((FogExtinctionDistance.wzyx > r13));
    r8.x = ps;
    ps = r0.w + r0.w;
    r8 = r13.wzyx * r8;
    r4.x = ps;
    ps = r8.y * r8.x;
    r3.y = dot(r9.yxz, r10.yxz);
    r3.z = ps;
    ps = r8.w;
    r9 = r8.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r13.xyz = r9.yyy * FogInScattering[2].xyz;
    r4.y = ps;
    ps = r8.z;
    r15.xyz = r9.www * FogInScattering[0].xyz;
    ps = r3.z * ps;
    r14.xyz = r9.zzz * FogInScattering[1].xyz;
    r4.z = ps;
    r14.xyz = r8.yyy * r15.xyz + r14.xyz;
    r8.xyz = r8.zzz * r14.xyz + r13.xyz;
    ps = 1.0 / r1.w;
    r3.zw = r4.xy * r4.xz;
    r1.w = ps;
    r0.y = -r11.x * r4.w + r3.z;
    ps = sqrt(abs(r0.y));
    r1.w = r1.w * 0.5;
    r4.w = ps;
    ps = r4.x;
    r3.z = dot(r12.zyx, r10.yxz);
    ps = r4.w + ps;
    r10.y = r4.x - r4.w;
    r10.x = ps;
    r10.xy = saturate(r1.ww * -r10.xy);
    r10.zw = r10.yx * r10.yx;
    r11.xy = r10.zw * r10.yx;
    ps = 1.0 / r1.z;
    r9.yz = r11.zz * r11.yx;
    r1.z = ps;
    r11.y = dot(r10.zy, r0.wz) + r9.z;
    r11.x = dot(r10.wx, r0.wz) + r9.y;
    r0.zw = -r11.yx * r1.zz + r10.yx;
    r0.zw = r0.zw * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.x));
    r0.z = r0.z - r0.w;
    r0.x = ps;
    r0.x = r0.z * r0.x;
    r0.x = (r0.y >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r0.y = r8.w * r4.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r4.w = r0.y * r0.x;
    r0.x = ps;
    ps = r3.w;
    r0.zw = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r0.yz = r0.zw * r0.yy;
    r0.x = ps;
    r0.xyz = r9.xxx * FogInScattering[3].xzy + r0.xyz;
    r4.xyz = r8.www * r8.xyz + r0.xzy;
    r0 = r7.wwww * LocalToWorld[3].xwzy;
    r0 = r7.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r7.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r7.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o3.xyz = r3.xyz;
    o5 = r6;
    o0 = r5;
    o2 = r2;
    o4 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color2 = o6;
    return Out;
}
