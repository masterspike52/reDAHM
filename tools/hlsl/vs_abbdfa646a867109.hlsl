// vs_abbdfa646a867109.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 255 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003FC 0041000E 00000000 00000000 00004CA5 00000001 00000005 00000005 00000290 00100008 00006009 0000700A 0000300B 0021A00C 0000F055 00017156 0002F257 0003F3A0 0004F4A2 00001052 00001050 00001053 00001051 0000104F
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> COLOR1
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c22); // float3
float4 CameraPosition : register(c4); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c24); // float3
float4 FogVolumeBoxMin : register(c23); // float3
float4 LocalToWorld[4] : register(c15); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c19); // float3x3 (matrix_columns)

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
    float4 r14 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r4 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r2 = In.color1;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r10 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r7.xyz = r3.yxz * 0.007843138 - 1.0;
    r8.xyz = r1.xzy * 0.007843138 - 1.0;
    r11.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1] + r0;
    r1 = r4.xxxx * LocalToWorld[0].yzxw + r0.yzxw;
    ps = r1.z;
    r5.yzw = -r1.zxy + FogVolumeBoxMax.xyz;
    r0.y = ps;
    ps = FogVolumeBoxMin.x - r0.y;
    r14.xyz = r1.zxy - CameraPosition.xyz;
    r13.x = ps;
    r12.xyz = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    ps = FogVolumeBoxMin.y - r1.x;
    r0.xzw = -r1.zyx + CameraPosition.xzy;
    r13.y = ps;
    ps = FogVolumeBoxMin.z - r1.y;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r13.z = ps;
    r3 = r1.yyyy * ViewProjectionMatrix[2] + r3;
    ps = 1.0 / r0.x;
    r0.y = dot(r0.zxw, r0.zxw);
    r0.x = ps;
    ps = 1.0 / r0.z;
    r6.xyz = r12.xxx * WorldToLocal[2].xyz;
    r0.z = ps;
    ps = 1.0 / r0.w;
    r5.x = float((0.001 >= abs(r14.z)));
    r0.w = ps;
    r6.w = (r5.x == 0.0) ? r14.z : 0.001;
    r6.xyz = r12.yyy * WorldToLocal[1].xyz + r6.xyz;
    ps = sqrt(abs(r0.y));
    r5.x = dot(r14.zxy, r14.zxy);
    r0.y = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.zzzz * ViewProjectionMatrix[0] + r3.xwyz;
    r1.yzw = r13.xzy * r0.xzw;
    ps = sqrt(abs(r5.x));
    r0.xzw = r5.ywz * r0.xzw;
    r1.x = ps;
    r5 = r1.xxxx - FogStartDistance.wzyx;
    r6.xyz = r12.zzz * WorldToLocal[0].xzy + r6.xzy;
    ps = 1.0 / r6.w;
    r1.x = dot(r11.xzy, r6.yxz);
    r6.w = ps;
    r11 = saturate(r10.wzyx * r6.wwww);
    r9 = saturate(r9.wzyx * r6.wwww);
    r10.xyz = min(r1.zyw, r0.zxw);
    r1.yzw = max(r1.ywz, r0.xwz);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r5 = max(r5.wxyz, 0.0);
    r0.z = ps;
    ps = min(r1.z, r1.w);
    r9 = r11.wzyx - r9.wzyx;
    r6.w = ps;
    ps = max(r10.z, r10.x);
    r1.w = abs(r9.w) * FogDistanceScale.x;
    r7.w = ps;
    ps = r7.w;
    r0.xyw = r5.yzw * FogDistanceScale.wzy;
    r10.x = ps;
    ps = r10.y;
    r1.y = saturate(min(r6.w, r1.y));
    r10.y = ps;
    ps = max(r10.x, r10.y);
    r0.xyw = r0.ywx * abs(r9.yzx);
    r1.z = saturate(ps);
    ps = pow(2.0, r0.y);
    r9 = abs(r9) * r5.yzwx;
    r5.y = ps;
    ps = pow(2.0, r0.x);
    r0.y = r1.w * r5.x;
    r5.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = saturate(-r1.z + r1.y);
    r5.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r5.x = ps;
    ps = pow(2.0, -r0.x);
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r5 = r9.wzyx * r5;
    r0.x = ps;
    ps = r5.y * r5.x;
    r1.y = dot(r8.yxz, r6.yxz);
    r0.w = ps;
    ps = ApproxFogColor.z * r0.x;
    r1.z = dot(r7.zyx, r6.yxz);
    r6.y = ps;
    ps = r5.w;
    r7 = r5.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r8.w = r5.z * r0.w;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.z = r0.z * r8.w;
    r6.z = ps;
    ps = r0.z;
    r8.xyz = r7.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r9 = r5.yyyw * r8;
    r6.x = ps;
    ps = r9.w;
    r8.xyz = r7.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r6.yz = r6.zy * r9.ww;
    r0.w = ps;
    r0.xyz = r7.zzz * FogInScattering[1].xyz + r9.xyz;
    r5.xyz = r5.zzz * r0.xzy + r8.xzy;
    r0.xyz = r7.xxx * FogInScattering[3].xyz + r6.xyz;
    r0.xyz = r5.www * r5.xzy + r0.xyz;
    r5 = r4.wwww * LocalToWorld[3];
    r5 = r4.zzzz * LocalToWorld[2] + r5;
    r5 = r4.yyyy * LocalToWorld[1].xzwy + r5.xzwy;
    r5 = r4.xxxx * LocalToWorld[0].xwyz + r5.xzwy;
    r4 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r5.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r5.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    oPos = r4;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o1.xyz = r1.xyz;
    o3 = r2;
    o0 = r3;
    o2 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
