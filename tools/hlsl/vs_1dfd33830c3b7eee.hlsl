// vs_1dfd33830c3b7eee.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 273 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000444 00410010 00000000 00000000 00004CA5 00000001 00000005 00000005 00000290 00100009 0000600A 0000700B 0000300C 0021A00D 0000F055 00017156 0002F257 0003F3A0 0004F4A2 00001058 00001056 00001059 00001057 00001055
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
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
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = CameraPosition.z;
    r5 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r7.xyz = r3.yxz * 0.007843138 - 1.0;
    r12.xyz = r1.xzy * 0.007843138 - 1.0;
    r14.xyz = r0.wzy * 0.007843138 - 1.0;
    ps = -FirstDensityFunctionParameters.y + ps;
    r0 = r4.wwww * LocalToWorld[3];
    r11.z = ps;
    r0 = r4.zzzz * LocalToWorld[2].zxyw + r0.zxyw;
    r0 = r4.yyyy * LocalToWorld[1] + r0.yzxw;
    r1 = r4.xxxx * LocalToWorld[0].yxzw + r0.yxzw;
    ps = r1.z;
    r10.xyz = -r1.yxz + FogVolumeBoxMax.xyz;
    r0.x = ps;
    r6.xyw = -r1.zxy * CameraPosition.www + CameraPosition.zyx;
    ps = -FirstDensityFunctionParameters.y - -r0.x;
    r0.y = -r1.z + 0.0001;
    r11.w = ps;
    ps = r1.z;
    r13.xyz = -r1.yxz + FogVolumeBoxMin.xyz;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r9.xyw = r1.yxz - CameraPosition.xyz;
    r16.x = ps;
    ps = CameraPosition.y - r1.x;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r16.y = ps;
    ps = CameraPosition.x - r1.y;
    r7.w = dot(r9.wxy, r9.wxy);
    r16.z = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[2] + r3;
    ps = 1.0 / r16.z;
    r0.x = dot(r16.xzy, r16.xzy);
    r9.x = ps;
    ps = 1.0 / r16.x;
    r15.xyz = r6.xxx * WorldToLocal[2].xyz;
    r9.y = ps;
    ps = 1.0 / r16.y;
    r0.z = float((0.001 >= abs(r9.w)));
    r9.z = ps;
    r0.w = (r0.z == 0.0) ? r9.w : 0.001;
    r6.xyz = r6.yyy * WorldToLocal[1].xyz + r15.xyz;
    ps = sqrt(abs(r0.x));
    r11.xy = float2((-r11.zw > 0.0));
    r0.z = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    ps = CameraPosition.z + r0.y;
    r13.xyz = r13.xzy * r9.xyz;
    r0.x = ps;
    ps = sqrt(abs(r7.w));
    r9.xzw = r10.xzy * r9.xyz;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r10 = r0.yyyy - FogStartDistance.wzyx;
    r0.x = ps;
    ps = FirstDensityFunctionParameters.x * r0.z;
    r0.x = -r11.w * r0.x;
    r0.y = ps;
    r6.xyz = r6.www * WorldToLocal[0].xzy + r6.xzy;
    ps = 1.0 / r0.w;
    r1.x = dot(r14.xzy, r6.yxz);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r1.y = dot(r12.yxz, r6.yxz);
    r1.z = ps;
    ps = -r0.x;
    r12 = saturate(r5.wzyx * r0.zzzz);
    ps = r11.y * ps;
    r5.xyw = min(r13.yzx, r9.zwx);
    r9.y = ps;
    ps = max(r5.y, r5.x);
    r9.xzw = max(r13.yxz, r9.zxw);
    r0.w = ps;
    ps = min(r9.w, r9.x);
    r8 = saturate(r8.wzyx * r0.zzzz);
    r0.z = ps;
    ps = r1.z;
    r10 = max(r10, 0.0);
    ps = r11.x * ps;
    r8 = r12.wzyx - r8.wzyx;
    r9.x = ps;
    ps = abs(r8.w);
    r11.xyz = r10.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.z, r9.z));
    r0.z = ps;
    ps = r0.w;
    r5.xyz = r11.xzy * abs(r8.xzy);
    r9.z = ps;
    ps = r5.w;
    r8 = abs(r8) * r10;
    r9.w = ps;
    ps = max(r9.z, r9.w);
    r0.z = r0.z * r10.w;
    r1.w = saturate(ps);
    ps = pow(2.0, r5.y);
    r0.xw = r0.xx + r9.xy;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r0.w = max(r1.w, r0.w);
    r5.z = ps;
    ps = pow(2.0, r5.x);
    r0.x = min(r1.z, r0.x);
    r5.w = ps;
    ps = pow(2.0, r0.z);
    r0.x = saturate(-r0.w + r0.x);
    r5.x = ps;
    ps = r0.y;
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    ps = r0.x * ps;
    r5 = r8.wzyx * r5;
    r0.y = ps;
    ps = r5.y * r5.x;
    r1.z = dot(r7.zyx, r6.yxz);
    r0.x = ps;
    ps = pow(2.0, -r0.y);
    r0.w = r5.w * ApproxFogColor.x;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r6.w = r5.z * r0.x;
    r0.x = ps;
    ps = ApproxFogColor.z * r0.x;
    r7 = r5.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r1.w = r0.w * r6.w;
    r0.w = ps;
    ps = r1.w;
    r6.xyz = r7.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r9 = r5.yyyw * r6;
    r6.x = ps;
    ps = r9.w;
    r8.xyz = r7.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r6.yz = r0.wz * r9.ww;
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
