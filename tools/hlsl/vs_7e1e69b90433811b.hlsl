// vs_7e1e69b90433811b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 279 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000045C 00510011 00000000 00000000 00005CC6 00000001 00000006 00000006 00000290 00100009 0000600A 0000700B 0000300C 0001A00D 0020500E 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001059 0000105A 00001057 0000105B 00001058 00001056
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

    r5 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r4 = In.color1;
    r2.xy = In.texcoord0.xy;
    r2.z = 0.0;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = CameraPosition.z;
    r6 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r8.xyz = r3.yxz * 0.007843138 - 1.0;
    r13.xyz = r1.xzy * 0.007843138 - 1.0;
    r15.xyz = r0.wzy * 0.007843138 - 1.0;
    ps = -FirstDensityFunctionParameters.y + ps;
    r0 = r5.wwww * LocalToWorld[3].xzyw;
    r12.z = ps;
    r0 = r5.zzzz * LocalToWorld[2].zxyw + r0.yxzw;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0.yxzw;
    r1 = r5.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    ps = r1.x;
    r11.xyz = -r1.xyz + FogVolumeBoxMax.zxy;
    r0.x = ps;
    r7.xyw = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = -FirstDensityFunctionParameters.y - -r0.x;
    r0.y = -r1.x + 0.0001;
    r12.w = ps;
    ps = r1.x;
    r14.xyz = -r1.xyz + FogVolumeBoxMin.zxy;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r10.xyw = r1.yzx - CameraPosition.xyz;
    r17.x = ps;
    ps = CameraPosition.y - r1.z;
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r17.y = ps;
    ps = CameraPosition.x - r1.y;
    r2.w = dot(r10.wxy, r10.wxy);
    r17.z = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    ps = 1.0 / r17.z;
    r0.x = dot(r17.xzy, r17.xzy);
    r10.x = ps;
    ps = 1.0 / r17.y;
    r16.xyz = r7.xxx * WorldToLocal[2].xyz;
    r10.y = ps;
    ps = 1.0 / r17.x;
    r0.z = float((0.001 >= abs(r10.w)));
    r10.z = ps;
    r0.w = (r0.z == 0.0) ? r10.w : 0.001;
    r7.xyz = r7.yyy * WorldToLocal[1].xyz + r16.xyz;
    ps = sqrt(abs(r0.x));
    r12.xy = float2((-r12.zw > 0.0));
    r0.z = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    ps = CameraPosition.z + r0.y;
    r14.xyz = r14.xzy * r10.zyx;
    r0.x = ps;
    ps = sqrt(abs(r2.w));
    r10.xzw = r11.yzx * r10.xyz;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r11 = r0.yyyy - FogStartDistance.wzyx;
    r0.x = ps;
    ps = FirstDensityFunctionParameters.x * r0.z;
    r0.x = -r12.w * r0.x;
    r0.y = ps;
    r7.xyz = r7.www * WorldToLocal[0].xzy + r7.xzy;
    ps = 1.0 / r0.w;
    r1.x = dot(r15.xzy, r7.yxz);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r1.y = dot(r13.yxz, r7.yxz);
    r1.z = ps;
    ps = -r0.x;
    r13 = saturate(r6.wzyx * r0.zzzz);
    ps = r12.y * ps;
    r6.xyw = min(r14.xyz, r10.wzx);
    r10.y = ps;
    ps = max(r6.y, r6.x);
    r10.xzw = max(r14.xzy, r10.wxz);
    r0.w = ps;
    ps = min(r10.w, r10.x);
    r9 = saturate(r9.wzyx * r0.zzzz);
    r0.z = ps;
    ps = r1.z;
    r11 = max(r11, 0.0);
    ps = r12.x * ps;
    r9 = r13.wzyx - r9.wzyx;
    r10.x = ps;
    ps = abs(r9.w);
    r12.xyz = r11.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.z, r10.z));
    r0.z = ps;
    ps = r0.w;
    r6.xyz = r12.xzy * abs(r9.xzy);
    r10.z = ps;
    ps = r6.w;
    r9 = abs(r9) * r11;
    r10.w = ps;
    ps = max(r10.z, r10.w);
    r0.z = r0.z * r11.w;
    r1.w = saturate(ps);
    ps = pow(2.0, r6.y);
    r0.xw = r0.xx + r10.xy;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r0.w = max(r1.w, r0.w);
    r6.z = ps;
    ps = pow(2.0, r6.x);
    r0.x = min(r1.z, r0.x);
    r6.w = ps;
    ps = pow(2.0, r0.z);
    r0.x = saturate(-r0.w + r0.x);
    r6.x = ps;
    ps = r0.y;
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    ps = r0.x * ps;
    r6 = r9.wzyx * r6;
    r0.y = ps;
    ps = r6.y * r6.x;
    r1.z = dot(r8.zyx, r7.yxz);
    r0.x = ps;
    ps = pow(2.0, -r0.y);
    r0.w = r6.w * ApproxFogColor.x;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r7.w = r6.z * r0.x;
    r0.x = ps;
    ps = ApproxFogColor.z * r0.x;
    r8 = r6.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r1.w = r0.w * r7.w;
    r0.w = ps;
    ps = r1.w;
    r7.xyz = r8.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r10 = r6.yyyw * r7;
    r7.x = ps;
    ps = r10.w;
    r9.xyz = r8.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r7.yz = r0.zw * r10.ww;
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
    o0 = r2.xyzz;
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
