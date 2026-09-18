// vs_c768c0bdb5557055.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000420 0051000F 00000000 00000000 00005CC6 00000001 00000007 00000006 00000290 00100008 00006009 0000700A 0000300B 0001A00C 0000500D 0021500E 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001054 00001055 00001052 00001056 00001053 00001051
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> COLOR1
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 r15 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r4 = In.color1;
    r2.xy = In.texcoord0.xy;
    r2.zw = In.texcoord1.yx;
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r8.xyz = r3.yxz * 0.007843138 - 1.0;
    r9.xyz = r1.xzy * 0.007843138 - 1.0;
    r12.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r5.wwww * LocalToWorld[3].xzyw;
    r0 = r5.zzzz * LocalToWorld[2].xzyw + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0;
    r1 = r5.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    ps = r1.x;
    r6.yzw = -r1.xyz + FogVolumeBoxMax.zxy;
    r0.x = ps;
    ps = FogVolumeBoxMin.z - r0.x;
    r15.xyz = r1.yzx - CameraPosition.xyz;
    r14.x = ps;
    r13.xyz = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = FogVolumeBoxMin.x - r1.y;
    r0.xzw = -r1.yzx + CameraPosition.xyz;
    r14.y = ps;
    ps = FogVolumeBoxMin.y - r1.z;
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r14.z = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    ps = 1.0 / r0.x;
    r0.y = dot(r0.wxz, r0.wxz);
    r0.x = ps;
    ps = 1.0 / r0.z;
    r7.xyz = r13.xxx * WorldToLocal[2].xyz;
    r0.z = ps;
    ps = 1.0 / r0.w;
    r6.x = float((0.001 >= abs(r15.z)));
    r0.w = ps;
    r7.w = (r6.x == 0.0) ? r15.z : 0.001;
    r7.xyz = r13.yyy * WorldToLocal[1].xyz + r7.xyz;
    ps = sqrt(abs(r0.y));
    r6.x = dot(r15.zxy, r15.zxy);
    r0.y = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    r1.yzw = r14.xzy * r0.wzx;
    ps = sqrt(abs(r6.x));
    r0.xzw = r6.zwy * r0.xzw;
    r1.x = ps;
    r6 = r1.xxxx - FogStartDistance.wzyx;
    r7.xyz = r13.zzz * WorldToLocal[0].xzy + r7.xzy;
    ps = 1.0 / r7.w;
    r1.x = dot(r12.xzy, r7.yxz);
    r7.w = ps;
    r12 = saturate(r11.wzyx * r7.wwww);
    r10 = saturate(r10.wzyx * r7.wwww);
    r11.xyz = min(r1.ywz, r0.wxz);
    r1.yzw = max(r1.wzy, r0.xzw);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r6 = max(r6.wxyz, 0.0);
    r0.z = ps;
    ps = min(r1.z, r1.w);
    r10 = r12.wzyx - r10.wzyx;
    r7.w = ps;
    ps = max(r11.z, r11.x);
    r1.w = abs(r10.w) * FogDistanceScale.x;
    r8.w = ps;
    ps = r8.w;
    r0.xyw = r6.yzw * FogDistanceScale.wzy;
    r11.x = ps;
    ps = r11.y;
    r1.y = saturate(min(r7.w, r1.y));
    r11.y = ps;
    ps = max(r11.x, r11.y);
    r0.xyw = r0.ywx * abs(r10.yzx);
    r1.z = saturate(ps);
    ps = pow(2.0, r0.y);
    r10 = abs(r10) * r6.yzwx;
    r6.y = ps;
    ps = pow(2.0, r0.x);
    r0.y = r1.w * r6.x;
    r6.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = saturate(-r1.z + r1.y);
    r6.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r6.x = ps;
    ps = pow(2.0, -r0.x);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r6 = r10.wzyx * r6;
    r0.x = ps;
    ps = r6.y * r6.x;
    r1.y = dot(r9.yxz, r7.yxz);
    r0.w = ps;
    ps = ApproxFogColor.z * r0.x;
    r1.z = dot(r8.zyx, r7.yxz);
    r7.y = ps;
    ps = r6.w;
    r8 = r6.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r9.w = r6.z * r0.w;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.z = r0.z * r9.w;
    r7.z = ps;
    ps = r0.z;
    r9.xyz = r8.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r10 = r6.yyyw * r9;
    r7.x = ps;
    ps = r10.w;
    r9.xyz = r8.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r7.yz = r7.yz * r10.ww;
    r0.w = ps;
    r0.xyz = r8.zzz * FogInScattering[1].xyz + r10.xyz;
    r6.xyz = r6.zzz * r0.xzy + r9.xzy;
    r0.xyz = r8.xxx * FogInScattering[3].xyz + r7.xzy;
    r0.xyz = r6.www * r6.xzy + r0.xyz;
    r6 = r5.wwww * LocalToWorld[3].xwzy;
    r6 = r5.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r5.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r5.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r5 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r6.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r6.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.x = ps;
    o5.yzw = 0.0;
    o2.xyz = r1.xyz;
    o4 = r4;
    o0 = r2;
    o1 = r3;
    o3 = r0;

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
