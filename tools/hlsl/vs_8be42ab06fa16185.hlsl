// vs_8be42ab06fa16185.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 276 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000450 0051000E 00000000 00000000 00005CC6 00000001 00000004 00000006 00000290 00100009 0000600A 0000700B 0020300C 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A2 00001058 00001056 00001059 00001057 0000105A 00001055
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> BINORMAL0
//   vertex element: instruction 12 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c28); // float3
float4 BoneToDecal[4] : register(c22); // float4x4 (matrix_columns)
float4 CameraPosition : register(c4); // float4
float4 DecalLocation : register(c26); // float3
float4 DecalOffset : register(c27); // float2
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c30); // float3
float4 FogVolumeBoxMin : register(c29); // float3
float4 LocalToWorld[4] : register(c15); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c19); // float3x3 (matrix_columns)

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
    float4 r14 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r3 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r2.xyz = In.normal0.xyz;
    r5 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r12.xyz = r2.yxz * 0.007843138 - 1.0;
    r13.xyz = r1.xzy * 0.007843138 - 1.0;
    r14.xyz = r0.wzy * 0.007843138 - 1.0;
    ps = r3.w;
    r0.yzw = r3.yxz - DecalLocation.yxz;
    r0.x = ps;
    ps = (-1.0) - -r0.x;
    r1 = r3.wwww * LocalToWorld[3].xzyw;
    r0.x = ps;
    r1 = r3.zzzz * LocalToWorld[2].xzyw + r1;
    r2.xy = r0.xx * BoneToDecal[3].xy;
    r2.xy = r0.ww * BoneToDecal[2].xy + r2.xy;
    r1 = r3.yyyy * LocalToWorld[1].xzyw + r1;
    r1 = r3.xxxx * LocalToWorld[0].zxyw + r1.yxzw;
    r0.xy = r0.yy * BoneToDecal[1].xy + r2.xy;
    r9.xy = r0.zz * BoneToDecal[0].xy + r0.xy;
    ps = r1.y;
    r10 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.y = ps;
    r0.xzw = -r1.zyx * CameraPosition.www + CameraPosition.yxz;
    ps = FogVolumeBoxMin.x - r0.y;
    r7.xyz = -r1.xzy + CameraPosition.zyx;
    r6.x = ps;
    ps = FogVolumeBoxMin.y - r1.z;
    r8.xyw = r1.yzx - CameraPosition.xyz;
    r6.y = ps;
    ps = FogVolumeBoxMin.z - r1.x;
    r2 = r1.wwww * ViewProjectionMatrix[3];
    r6.z = ps;
    r2 = r1.xxxx * ViewProjectionMatrix[2] + r2;
    ps = 1.0 / r7.z;
    r4.w = dot(r8.wxy, r8.wxy);
    r4.x = ps;
    ps = 1.0 / r7.x;
    r8.xyz = r0.www * WorldToLocal[2].xyz;
    r4.y = ps;
    ps = 1.0 / r7.y;
    r0.y = float((0.001 >= abs(r8.w)));
    r4.z = ps;
    r0.w = (r0.y == 0.0) ? r8.w : 0.001;
    r11.xyz = r0.xxx * WorldToLocal[1].xyz + r8.xyz;
    ps = sqrt(abs(r4.w));
    r0.y = dot(r7.xzy, r7.xzy);
    r4.w = ps;
    ps = sqrt(abs(r0.y));
    r8.xyz = -r1.yzx + FogVolumeBoxMax.xyz;
    r0.y = ps;
    r2 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r2.xzwy;
    r2 = r1.yyyy * ViewProjectionMatrix[0] + r2.xwyz;
    ps = r8.x;
    r7.xyz = r6.xzy * r4.xyz;
    ps = r4.x * ps;
    r6 = r4.wwww - FogStartDistance.wzyx;
    r0.x = ps;
    r11.xyz = r0.zzz * WorldToLocal[0].xzy + r11.xzy;
    ps = r8.z;
    r1.x = dot(r14.xzy, r11.yxz);
    ps = r4.y * ps;
    r1.y = dot(r13.yxz, r11.yxz);
    r0.z = ps;
    ps = 1.0 / r0.w;
    r1.z = dot(r12.zyx, r11.yxz);
    r0.w = ps;
    ps = r8.y;
    r10 = saturate(r10.wzyx * r0.wwww);
    ps = r4.z * ps;
    r5 = saturate(r5.wzyx * r0.wwww);
    r0.w = ps;
    r4.xyw = max(r7.yzx, r0.zwx);
    r8.xyz = min(r7.yzx, r0.zwx);
    r6 = max(r6, 0.0);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r7.xyz = r6.xyz * FogDistanceScale.wzy;
    r0.z = ps;
    ps = max(r8.y, r8.x);
    r5 = r10.wzyx - r5.wzyx;
    r0.y = ps;
    ps = min(r4.y, r4.x);
    r4.z = abs(r5.w) * FogDistanceScale.x;
    r0.x = ps;
    ps = r0.x;
    r4.x = saturate(max(r0.y, r8.z));
    r4.y = ps;
    ps = r4.w;
    r0.xyw = r7.yzx * abs(r5.yzx);
    r4.w = ps;
    ps = min(r4.y, r4.w);
    r5 = abs(r5) * r6;
    r1.w = saturate(ps);
    ps = pow(2.0, r0.y);
    r5 = float4((FogExtinctionDistance.wzyx > r5));
    r4.y = ps;
    ps = pow(2.0, r0.x);
    r0.y = r4.z * r6.w;
    r4.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = saturate(-r4.x + r1.w);
    r4.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r4.x = ps;
    ps = pow(2.0, -r0.x);
    r5 = r5.wzyx * r4;
    r9.z = ps;
    ps = r5.y * r5.x;
    r0.xzw = -r9.zxy + float3(1.0, 0.5, 0.5);
    r1.w = ps;
    ps = r5.w;
    r6 = r5.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r0.zw = r0.zw + DecalOffset.xy;
    r0.y = ps;
    ps = ApproxFogColor.z * r0.x;
    r7.w = r5.z * r1.w;
    r4.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.y = r0.y * r7.w;
    r4.z = ps;
    ps = r0.y;
    r7.xyz = r6.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r8 = r5.yyyw * r7;
    r4.x = ps;
    ps = r8.w;
    r7.xyz = r6.yyy * FogInScattering[2].xyz;
    ps = r9.z * ps;
    r4.yz = r4.zy * r8.ww;
    r4.w = ps;
    r8.xyz = r6.zzz * FogInScattering[1].xyz + r8.xyz;
    r5.xyz = r5.zzz * r8.xzy + r7.xzy;
    r4.xyz = r6.xxx * FogInScattering[3].xyz + r4.xyz;
    r4.xyz = r5.www * r5.xzy + r4.xyz;
    r5 = r3.wwww * LocalToWorld[3];
    r5 = r3.zzzz * LocalToWorld[2] + r5;
    r5 = r3.yyyy * LocalToWorld[1].xzwy + r5.xzwy;
    r5 = r3.xxxx * LocalToWorld[0].xwyz + r5.xzwy;
    r3 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r3 = r5.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r5.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.x = ps;
    o5.yzw = 0.0;
    o1.xy = r0.zw;
    o1.zw = 0.0;
    o3.xyz = r1.xyz;
    o0 = r0.zwwz;
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
