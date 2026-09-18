// vs_ce5ce895ac5a8f34.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 294 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000498 0051000E 00000000 00000000 00005CC6 00000001 00000004 00000006 00000290 00100009 0000600A 0000700B 0020300C 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A2 0000105E 0000105C 0000105F 0000105D 00001060 0000105B
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

    r4 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r2.xyz = In.normal0.xyz;
    r7.xyz = r2.yxz * 0.007843138 - 1.0;
    r13.xyz = r1.xzy * 0.007843138 - 1.0;
    r10.xyw = r0.wzy * 0.007843138 - 1.0;
    r1.xyz = r4.yzx - DecalLocation.yzx;
    r0 = r4.wwww * LocalToWorld[3].xzyw;
    ps = CameraPosition.z;
    r2.xy = r1.yy * BoneToDecal[2].xy;
    r0 = r4.zzzz * LocalToWorld[2].zxyw + r0.yxzw;
    r0 = r4.yyyy * LocalToWorld[1].xzyw + r0.yxzw;
    r1.xy = r1.xx * BoneToDecal[1].xy + r2.xy;
    r1.yz = r1.zz * BoneToDecal[0].xy + r1.xy;
    r12 = r4.xxxx * LocalToWorld[0].xzyw + r0;
    ps = -FirstDensityFunctionParameters.y + ps;
    r1.x = r12.y - FirstDensityFunctionParameters.y;
    r1.w = ps;
    r2.xzw = -r12.xyz * CameraPosition.www + CameraPosition.xzy;
    ps = r12.y;
    r14.xyz = r12.xzy - CameraPosition.xyz;
    r0.x = ps;
    ps = 0.0001 - r0.x;
    r3 = r12.wwww * ViewProjectionMatrix[3];
    r0.x = ps;
    r3 = r12.yyyy * ViewProjectionMatrix[2] + r3;
    ps = CameraPosition.z + r0.x;
    r5.xyz = -r12.yzx + CameraPosition.zyx;
    r0.x = ps;
    ps = 1.0 / r5.z;
    r6.xyz = r2.zzz * WorldToLocal[2].xyz;
    r8.x = ps;
    ps = 1.0 / r5.x;
    r0.y = float((0.001 >= abs(r14.z)));
    r8.y = ps;
    r0.w = (r0.y == 0.0) ? r14.z : 0.001;
    r6.xyz = r2.www * WorldToLocal[1].xyz + r6.xyz;
    ps = 1.0 / r0.x;
    r0.y = dot(r5.xzy, r5.xzy);
    r0.x = ps;
    ps = sqrt(abs(r0.y));
    r2.zw = float2((-r1.xw > 0.0));
    r0.y = ps;
    r3 = r12.zzzz * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r12.xxxx * ViewProjectionMatrix[0] + r3.xwyz;
    ps = 1.0 / r5.y;
    r1.x = -r1.x * r0.x;
    r8.z = ps;
    r5 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r9.xyz = -r12.xzy + FogVolumeBoxMax.xyz;
    r12.xyz = -r12.xzy + FogVolumeBoxMin.xyz;
    ps = r4.w;
    r1.w = dot(r14.zxy, r14.zxy);
    r0.x = ps;
    ps = (-1.0) - -r0.x;
    r12.xyz = r12.xzy * r8.xyz;
    r0.z = ps;
    ps = sqrt(abs(r1.w));
    r8.xyz = r9.xzy * r8.xyz;
    r0.x = ps;
    ps = BoneToDecal[3].x * r0.z;
    r9 = r0.xxxx - FogStartDistance.wzyx;
    r10.z = ps;
    r6.xyz = r2.xxx * WorldToLocal[0].xzy + r6.xzy;
    ps = BoneToDecal[3].y * r0.z;
    r2.x = dot(r10.xwy, r6.yxz);
    r10.w = ps;
    ps = 1.0 / r0.w;
    r2.y = dot(r13.yxz, r6.yxz);
    r0.x = ps;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r11 = saturate(r11.wzyx * r0.xxxx);
    r0.y = ps;
    ps = 1.0 - r1.x;
    r5 = saturate(r5.wzyx * r0.xxxx);
    r6.w = ps;
    ps = -r1.x;
    r0.xzw = min(r12.yxz, r8.yxz);
    ps = r2.z * ps;
    r8.xyw = max(r12.yzx, r8.yzx);
    r10.y = ps;
    ps = min(r8.y, r8.x);
    r9 = max(r9, 0.0);
    r2.z = ps;
    ps = max(r0.w, r0.x);
    r8.xyz = r9.xyz * FogDistanceScale.wzy;
    r1.w = ps;
    ps = r6.w;
    r5 = r11.wzyx - r5.wzyx;
    ps = r2.w * ps;
    r0.w = abs(r5.w) * FogDistanceScale.x;
    r10.x = ps;
    ps = r1.w;
    r0.x = saturate(min(r2.z, r8.w));
    r2.z = ps;
    ps = r0.z;
    r8.xyz = r8.xyz * abs(r5.xyz);
    r2.w = ps;
    ps = max(r2.z, r2.w);
    r5 = abs(r5) * r9;
    r0.z = saturate(ps);
    ps = r0.w;
    r1 = r1.xxyz + r10.yxzw;
    ps = r9.w * ps;
    r2.z = max(r0.z, r1.x);
    r1.x = ps;
    ps = pow(2.0, r8.z);
    r0.x = min(r0.x, r1.y);
    r1.y = ps;
    ps = pow(2.0, r8.y);
    r0.zw = -r1.zw + 0.5;
    r1.z = ps;
    ps = pow(2.0, r8.x);
    r0.zw = r0.zw + DecalOffset.xy;
    r1.w = ps;
    ps = pow(2.0, r1.x);
    r0.x = saturate(-r2.z + r0.x);
    r1.x = ps;
    ps = r0.y;
    r5 = float4((FogExtinctionDistance.wzyx > r5));
    ps = r0.x * ps;
    r5 = r5.wzyx * r1;
    r0.y = ps;
    ps = r5.y * r5.x;
    r2.z = dot(r7.zyx, r6.yxz);
    r0.x = ps;
    ps = pow(2.0, -r0.y);
    r1.x = r5.w * ApproxFogColor.x;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r7.w = r5.z * r0.x;
    r0.x = ps;
    ps = ApproxFogColor.z * r0.x;
    r6 = r5.wzyx - 1.0;
    r1.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r1.x = r1.x * r7.w;
    r1.z = ps;
    ps = r1.x;
    r7.xyz = r6.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r8 = r5.yyyw * r7;
    r1.x = ps;
    ps = r8.w;
    r7.xyz = r6.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r1.yz = r1.zy * r8.ww;
    r1.w = ps;
    r8.xyz = r6.zzz * FogInScattering[1].xyz + r8.xyz;
    r5.xyz = r5.zzz * r8.xzy + r7.xzy;
    r1.xyz = r6.xxx * FogInScattering[3].xyz + r1.xyz;
    r1.xyz = r5.www * r5.xzy + r1.xyz;
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
    o5.x = ps;
    o5.yzw = 0.0;
    o1.xy = r0.zw;
    o1.zw = 0.0;
    o3.xyz = r2.xyz;
    o0 = r0.zwwz;
    o2 = r3;
    o4 = r1;

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
