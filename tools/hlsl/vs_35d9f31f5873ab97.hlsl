// vs_35d9f31f5873ab97.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 276 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000450 00610010 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 00100009 0000600A 0000700B 0000300C 0000500D 0021500E 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 00001058 00001059 00001056 0000105A 00001057 00001055 00001054
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> BINORMAL0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 color1 : COLOR1;
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
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r6 = In.position0;
    r2.xzw = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xzw = In.normal0.xyz;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    r12 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r11.yzw = r1.zxw * 0.007843138 - 1.0;
    r10.yzw = r0.ywz * 0.007843138 - 1.0;
    r0 = r6.wwww * LocalToWorld[3].xzyw;
    r7.xzw = r2.xwz * 0.007843138 - 1.0;
    r0 = r6.zzzz * LocalToWorld[2].xzyw + r0;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0;
    r3 = r6.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    ps = r3.x;
    r8.xyz = -r3.xyz + FogVolumeBoxMax.zxy;
    r0.x = ps;
    ps = FogVolumeBoxMin.z - r0.x;
    r15.xyz = r3.yzx - CameraPosition.xyz;
    r14.x = ps;
    r9.xyw = -r3.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = FogVolumeBoxMin.x - r3.y;
    r0.xzw = -r3.yzx + CameraPosition.xyz;
    r14.y = ps;
    ps = FogVolumeBoxMin.y - r3.z;
    r5 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r14.z = ps;
    r5 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r5;
    ps = 1.0 / r0.x;
    r0.y = dot(r0.wxz, r0.wxz);
    r0.x = ps;
    ps = 1.0 / r0.z;
    r16.xyz = r9.xxx * WorldToLocal[2].xyz;
    r0.z = ps;
    ps = 1.0 / r0.w;
    r1.y = float((0.001 >= abs(r15.z)));
    r0.w = ps;
    r2.y = (r1.y == 0.0) ? r15.z : 0.001;
    r9.xyz = r9.yyy * WorldToLocal[1].xyz + r16.xyz;
    ps = sqrt(abs(r0.y));
    r1.y = dot(r15.zxy, r15.zxy);
    r0.y = ps;
    r5 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r3.yyyy * ViewProjectionMatrix[0] + r5.xzyw;
    ps = 0.003921569 * r1.x;
    r15.xyz = r14.xzy * r0.wzx;
    r1.x = ps;
    ps = sqrt(abs(r1.y));
    r0.xzw = r8.yzx * r0.xzw;
    r1.y = ps;
    ps = 0.003921569 * r1.z;
    r8 = r1.yyyy - FogStartDistance.wzyx;
    r1.y = ps;
    r9.xyz = r9.www * WorldToLocal[0].xzy + r9.xzy;
    ps = 0.003921569 * r1.w;
    r3.x = dot(r7.zxw, r9.yxz);
    r1.z = ps;
    ps = 1.0 / r2.y;
    r3.y = dot(r10.zyw, r9.yxz);
    r1.w = ps;
    ps = 0.003921569 * r2.x;
    r14 = saturate(r13.wzyx * r1.wwww);
    r2.x = ps;
    ps = 0.003921569 * r2.z;
    r12 = saturate(r12.wzyx * r1.wwww);
    r2.y = ps;
    ps = 0.003921569 * r2.w;
    r13.xyz = min(r15.xzy, r0.wxz);
    r2.z = ps;
    ps = -r7.w;
    r0.xzw = max(r15.xyz, r0.wzx);
    r7.y = ps;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r8 = max(r8.wxyz, 0.0);
    r10.x = ps;
    ps = min(r0.z, r0.x);
    r12 = r14.wzyx - r12.wzyx;
    r2.w = ps;
    ps = max(r13.z, r13.x);
    r1.w = abs(r12.w) * FogDistanceScale.x;
    r3.z = ps;
    ps = r3.z;
    r0.xyz = r8.yzw * FogDistanceScale.wzy;
    r3.z = ps;
    ps = r13.y;
    r0.w = saturate(min(r2.w, r0.w));
    r3.w = ps;
    ps = max(r3.z, r3.w);
    r0.xyz = r0.xyz * abs(r12.xyz);
    r2.w = saturate(ps);
    ps = pow(2.0, r0.z);
    r12 = abs(r12) * r8.yzwx;
    r8.y = ps;
    ps = pow(2.0, r0.y);
    r1.w = r1.w * r8.x;
    r8.z = ps;
    ps = pow(2.0, r0.x);
    r11.x = saturate(-r2.w + r0.w);
    r8.w = ps;
    ps = pow(2.0, r1.w);
    r0 = r10.xzzw * r11.xyzz;
    r8.x = ps;
    r10.xyz = r10.wyy * r11.wwy - r0.yzw;
    ps = pow(2.0, -r0.x);
    r12 = float4((FogExtinctionDistance.wzyx > r12));
    r0.w = ps;
    ps = 1.0 - r0.w;
    r8 = r12.wzyx * r8;
    r0.x = ps;
    ps = r8.y * r8.x;
    r3.z = dot(r11.wzy, r9.yxz);
    r2.w = ps;
    ps = r8.w;
    r9 = r8.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r1.w = dot(r7.xyz, r10.xyz);
    r0.z = ps;
    r1.w = r1.w * 0.5 + 0.5;
    ps = ApproxFogColor.z * r0.x;
    r7.w = r8.z * r2.w;
    r0.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r2.w = r0.z * r7.w;
    r0.z = ps;
    ps = r2.w;
    r7.xyz = r9.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r10 = r8.yyyw * r7;
    r0.x = ps;
    ps = r10.w;
    r7.xyz = r9.yyy * FogInScattering[2].xyz;
    ps = r0.w * ps;
    r0.yz = r0.yz * r10.ww;
    r7.w = ps;
    r10.xyz = r9.zzz * FogInScattering[1].xyz + r10.xyz;
    r7.xyz = r8.zzz * r10.xzy + r7.xzy;
    r0.xyz = r9.xxx * FogInScattering[3].xyz + r0.xzy;
    r7.xyz = r8.www * r7.xzy + r0.xyz;
    r0 = r6.wwww * LocalToWorld[3].xwzy;
    r0 = r6.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r6 = r6.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r6.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o5.xyz = r2.xyz;
    o5.w = 0.0;
    o2.xyz = r3.xyz;
    o4 = r1;
    o0 = r4;
    o1 = r5;
    o3 = r7;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    Out.color2 = o6;
    return Out;
}
