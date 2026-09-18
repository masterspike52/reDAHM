// vs_b767310187ed479b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 315 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004EC 00510011 00000000 00000000 00005CC6 00000001 00000006 00000006 00000290 0010000A 0000600B 0000700C 0000300D 0001A00E 0020500F 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001065 00001066 00001063 00001067 00001064 00001062
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> COLOR1
//   vertex element: instruction 15 -> TEXCOORD0
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
float4 FogVolumeBoxMax : register(c25); // float3
float4 FogVolumeBoxMin : register(c24); // float3
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r6 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r5 = In.color1;
    r2.xy = In.texcoord0.xy;
    r2.z = 0.0;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r7 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r11.xyz = r0.zyw * 0.007843138 - 1.0;
    r4.yzw = r1.xzy * 0.007843138 - 1.0;
    r14.xyz = r3.zyx * 0.007843138 - 1.0;
    r1 = r6.wwww * LocalToWorld[3].xzyw;
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r7);
    r1 = r6.zzzz * LocalToWorld[2].xzyw + r1;
    r1 = r6.yyyy * LocalToWorld[1].xzyw + r1;
    r1 = r6.xxxx * LocalToWorld[0].zxyw + r1.yxzw;
    r9.xyz = -r1.xzy + FogVolumeBoxMax.zyx;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.xyzz : 1.0;
    r10.xyw = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = r1.x;
    r12.xyz = -r1.xzy + FogVolumeBoxMin.zyx;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r15.xyz = r1.yzx - CameraPosition.xyz;
    r0.y = ps;
    ps = CameraPosition.y - r1.z;
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0.x = ps;
    ps = CameraPosition.x - r1.y;
    r4.x = dot(r15.zxy, r15.zxy);
    r0.z = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    r9.w = dot(r0.yzx, r0.yzx);
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r2.w = dot(r0.yzx, SecondDensityFunctionParameters.zxy);
    r7.x = ps;
    ps = 1.0 / r0.y;
    r16.xyz = r10.xxx * WorldToLocal[2].xzy;
    r7.y = ps;
    ps = 1.0 / r0.z;
    r11.w = float((0.001 >= abs(r15.z)));
    r7.z = ps;
    ps = 1.0 / r0.x;
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r17);
    r7.w = ps;
    r10.xyz = r10.yyy * WorldToLocal[1].xzy + r16.xyz;
    r0.z = (r11.w == 0.0) ? r15.z : 0.001;
    ps = sqrt(abs(r9.w));
    r0.x = r2.w + 0.0001;
    r0.y = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r12.xyz = r12.xzy * r7.yzw;
    r1.z = ps;
    ps = sqrt(abs(r4.x));
    r7.yzw = r9.zxy * r7.zyw;
    r1.x = ps;
    ps = 1.0 / r0.z;
    r9 = r1.xxxx - FogStartDistance.wzyx;
    r0.z = ps;
    r10.xyz = r10.www * WorldToLocal[0].xyz + r10.xzy;
    ps = 1.0 / r0.x;
    r4.x = dot(r14.xzy, r10.zxy);
    r0.x = ps;
    ps = -r0.w;
    r13 = saturate(r13.wzyx * r0.zzzz);
    ps = r0.x * ps;
    r1.xyw = min(r12.xzy, r7.zwy);
    r0.x = ps;
    ps = max(r1.y, r1.x);
    r12.xyz = max(r12.xzy, r7.zwy);
    r7.w = ps;
    ps = min(r12.y, r12.x);
    r8 = saturate(r8.wzyx * r0.zzzz);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r9 = max(r9, 0.0);
    r7.y = ps;
    ps = -r0.x;
    r8 = r13.wzyx - r8.wzyx;
    ps = r1.z * ps;
    r1.x = r7.y * r7.x;
    r1.y = ps;
    ps = abs(r8.w);
    r7.xyz = r9.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.z, r12.z));
    r0.z = ps;
    ps = r7.w;
    r7.xyz = r7.xzy * abs(r8.xzy);
    r12.x = ps;
    ps = r1.w;
    r8 = abs(r8) * r9;
    r12.y = ps;
    ps = max(r12.x, r12.y);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r1.w = saturate(ps);
    ps = pow(2.0, r7.y);
    r0.z = r0.z * r9.w;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r1.xy = r0.xx + r1.yx;
    r7.z = ps;
    ps = pow(2.0, r7.x);
    r1.x = max(r1.w, r1.x);
    r7.w = ps;
    ps = pow(2.0, r0.z);
    r1.y = min(r1.z, r1.y);
    r7.x = ps;
    r8 = r8.wzyx * r7;
    ps = ApproxFogColor.x * r8.w;
    r0.z = float((r1.x >= r1.y));
    r0.x = ps;
    r7.xy = (r0.zz == 0.0) ? r1.xy : 0.0;
    ps = r8.y * r8.x;
    r4.y = dot(r4.zyw, r10.zxy);
    r0.z = ps;
    ps = r8.z;
    r1 = r8.zwyx - 1.0;
    ps = r0.z * ps;
    r9.zw = r7.xy * 0.5;
    r7.z = ps;
    ps = r1.x;
    r4.z = dot(r11.zyx, r10.zxy);
    r0.z = ps;
    ps = FogInScattering[2].x * r0.z;
    r12.xyz = r1.www * FogInScattering[0].xyz;
    r9.x = ps;
    ps = FogInScattering[2].y * r1.x;
    r11.xyz = r1.zzz * FogInScattering[1].xyz;
    r9.y = ps;
    ps = FogInScattering[2].z * r1.x;
    r10.xy = r9.zw * r7.xy;
    r9.z = ps;
    r11.xyz = r8.yyy * r12.xyz + r11.xyz;
    r8.xyz = r8.zzz * r11.xyz + r9.xyz;
    r9.xyz = r0.wwx * r7.yxz;
    r0.xz = r10.yx * r2.ww + r9.xy;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r0.x = r0.x - r0.z;
    r0.y = ps;
    r0.x = r0.y * -r0.x;
    ps = 0.0001 * r0.x;
    r0.x = ps;
    ps = pow(2.0, -r0.x);
    r0.y = r8.w * r7.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r1.x = r0.y * r0.x;
    r0.z = ps;
    ps = r9.z;
    r0.xw = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r0.xw * r0.yy;
    r0.z = ps;
    r0.xyz = r1.yyy * FogInScattering[3].yzx + r0.yxz;
    r1.yzw = r8.www * r8.xyz + r0.zxy;
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
    o5.x = ps;
    o5.yzw = 0.0;
    o2.xyz = r4.xyz;
    o4 = r5;
    o0 = r2.xyzz;
    o1 = r3;
    o3 = r1.yzwx;

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
