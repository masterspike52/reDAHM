// vs_51bd1ba1671b6923.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 273 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000444 00610010 00000000 00000000 00006CE7 00000001 00000008 00000007 00000290 00100009 0000600A 0000700B 0000300C 0001A00D 0000500E 0001500F 00225010 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001057 00001054 00001058 00001055 00001059 00001056 00001053
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> BINORMAL0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> COLOR1
//   vertex element: instruction 14 -> TEXCOORD0
//   vertex element: instruction 15 -> TEXCOORD1
//   vertex element: instruction 16 -> TEXCOORD2
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
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r5 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    r2.xy = In.texcoord2.xy;
    r11 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r12 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r9.xyz = r3.yxz * 0.007843138 - 1.0;
    r10.xyz = r1.xzy * 0.007843138 - 1.0;
    r13.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r6.wwww * LocalToWorld[3];
    r0 = r6.zzzz * LocalToWorld[2] + r0;
    r0 = r6.yyyy * LocalToWorld[1] + r0;
    r1 = r6.xxxx * LocalToWorld[0].yzxw + r0.yzxw;
    ps = r1.z;
    r8.xyz = -r1.zxy + FogVolumeBoxMax.xyz;
    r0.y = ps;
    ps = FogVolumeBoxMin.x - r0.y;
    r15.xyz = r1.zxy - CameraPosition.xyz;
    r14.x = ps;
    r7.xyw = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    ps = FogVolumeBoxMin.y - r1.x;
    r0.xzw = -r1.zyx + CameraPosition.xzy;
    r14.y = ps;
    ps = FogVolumeBoxMin.z - r1.y;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r14.z = ps;
    r3 = r1.yyyy * ViewProjectionMatrix[2] + r3;
    ps = 1.0 / r0.x;
    r0.y = dot(r0.zxw, r0.zxw);
    r0.x = ps;
    ps = 1.0 / r0.z;
    r16.xyz = r7.xxx * WorldToLocal[2].xyz;
    r0.z = ps;
    ps = 1.0 / r0.w;
    r2.z = float((0.001 >= abs(r15.z)));
    r0.w = ps;
    r2.z = (r2.z == 0.0) ? r15.z : 0.001;
    r7.xyz = r7.yyy * WorldToLocal[1].xyz + r16.xyz;
    ps = sqrt(abs(r0.y));
    r2.w = dot(r15.zxy, r15.zxy);
    r0.y = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.zzzz * ViewProjectionMatrix[0] + r3.xwyz;
    r1.yzw = r14.xzy * r0.xzw;
    ps = sqrt(abs(r2.w));
    r0.xzw = r8.xzy * r0.xzw;
    r1.x = ps;
    r8 = r1.xxxx - FogStartDistance.wzyx;
    r7.xyz = r7.www * WorldToLocal[0].xzy + r7.xzy;
    ps = 1.0 / r2.z;
    r1.x = dot(r13.xzy, r7.yxz);
    r2.z = ps;
    r13 = saturate(r12.wzyx * r2.zzzz);
    r11 = saturate(r11.wzyx * r2.zzzz);
    r12.xyz = min(r1.zwy, r0.zwx);
    r1.yzw = max(r1.ywz, r0.xwz);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r8 = max(r8.wxyz, 0.0);
    r0.z = ps;
    ps = min(r1.z, r1.w);
    r11 = r13.wzyx - r11.wzyx;
    r2.w = ps;
    ps = max(r12.y, r12.x);
    r1.w = abs(r11.w) * FogDistanceScale.x;
    r2.z = ps;
    ps = r2.z;
    r0.xyw = r8.yzw * FogDistanceScale.wzy;
    r2.z = ps;
    ps = r12.z;
    r1.y = saturate(min(r2.w, r1.y));
    r2.w = ps;
    ps = max(r2.z, r2.w);
    r0.xyw = r0.ywx * abs(r11.yzx);
    r1.z = saturate(ps);
    ps = pow(2.0, r0.y);
    r11 = abs(r11) * r8.yzwx;
    r8.y = ps;
    ps = pow(2.0, r0.x);
    r0.y = r1.w * r8.x;
    r8.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = saturate(-r1.z + r1.y);
    r8.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r8.x = ps;
    ps = pow(2.0, -r0.x);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r8 = r11.wzyx * r8;
    r0.x = ps;
    ps = r8.y * r8.x;
    r1.y = dot(r10.yxz, r7.yxz);
    r0.w = ps;
    ps = ApproxFogColor.z * r0.x;
    r1.z = dot(r9.zyx, r7.yxz);
    r2.z = ps;
    ps = r8.w;
    r9 = r8.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r7.w = r8.z * r0.w;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.z = r0.z * r7.w;
    r2.w = ps;
    ps = r0.z;
    r7.xyz = r9.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r10 = r8.yyyw * r7;
    r0.w = ps;
    ps = r10.w;
    r7.xyz = r9.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r0.xz = r2.zw * r10.ww;
    r7.w = ps;
    r10.xyz = r9.zzz * FogInScattering[1].xyz + r10.xyz;
    r7.xyz = r8.zzz * r10.xzy + r7.xzy;
    r0.xyz = r9.xxx * FogInScattering[3].zyx + r0.xzw;
    r7.xyz = r8.www * r7.xzy + r0.zyx;
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
    o1.xy = r2.xy;
    o1.zw = 0.0;
    o3.xyz = r1.xyz;
    o5 = r5;
    o0 = r4;
    o2 = r3;
    o4 = r7;

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
