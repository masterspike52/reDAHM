// vs_92a18c022d642be2.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003A8 0051000B 00000000 00000000 00005CC6 00000001 00000004 00000006 00000290 00100008 00006009 0000700A 0020300B 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A2 0000104A 00001048 0000104B 00001049 0000104C 00001047
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 BoneToDecal[4] : register(c21); // float4x4 (matrix_columns)
float4 CameraPosition : register(c4); // float4
float4 DecalLocation : register(c25); // float3
float4 DecalOffset : register(c26); // float2
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c14); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c18); // float3x3 (matrix_columns)

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
    r5 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r6 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r8.xyz = r2.yxz * 0.007843138 - 1.0;
    r3.yzw = r1.xzy * 0.007843138 - 1.0;
    r9.xyz = r0.wzy * 0.007843138 - 1.0;
    r0.yzw = r4.yxz - DecalLocation.yxz;
    r0.x = r4.w;
    r1 = r4.wwww * LocalToWorld[3].xzyw;
    r0.x = (-1.0) - -r0.x;
    r2.xy = r0.xx * BoneToDecal[3].xy;
    r1 = r4.zzzz * LocalToWorld[2].xzyw + r1;
    r1 = r4.yyyy * LocalToWorld[1].xzyw + r1;
    r2.xy = r0.ww * BoneToDecal[2].xy + r2.xy;
    r0.xy = r0.yy * BoneToDecal[1].xy + r2.xy;
    r10 = r4.xxxx * LocalToWorld[0].xzyw + r1;
    r1.xzw = -r10.zyx * CameraPosition.www + CameraPosition.yzx;
    r7.xyw = r10.zxy - CameraPosition.yxz;
    r0.xz = r0.zz * BoneToDecal[0].xy + r0.xy;
    r2 = r10.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r10.yyyy * ViewProjectionMatrix[2].xwzy + r2;
    r0.y = dot(r7.wyx, r7.wyx);
    r7.xyz = r1.zzz * WorldToLocal[2].xyz;
    r11.x = 0.5 - r0.x;
    ps = 0.5 - r0.z;
    r0.w = float((0.001 >= abs(r7.w)));
    r11.y = ps;
    r1.z = (-abs(r0.w) >= 0.0) ? r7.w : 0.001;
    r7.xyz = r1.xxx * WorldToLocal[1].xyz + r7.xyz;
    ps = sqrt(abs(r0.y));
    r1.xy = r11.xy + DecalOffset.xy;
    r0.x = ps;
    r2 = r10.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r10.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r7.xyz = r1.www * WorldToLocal[0].xzy + r7.xzy;
    r3.x = dot(r9.xzy, r7.yxz);
    r3.y = dot(r3.zyw, r7.yxz);
    ps = 1.0 / r1.z;
    r3.z = dot(r8.zyx, r7.yxz);
    r1.z = ps;
    r7 = saturate(r6.wzyx * r1.zzzz);
    r5 = saturate(r5.wzyx * r1.zzzz);
    r6 = max(r0, 0.0);
    r0.xyz = r6.xyz * FogDistanceScale.wzy;
    r5 = r7.wzyx - r5.wzyx;
    r0.xyw = r0.yzx * abs(r5.yzx);
    ps = pow(2.0, r0.y);
    r1.z = abs(r5.w) * FogDistanceScale.x;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r5 = abs(r5) * r6;
    r0.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = r1.z * r6.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r5 = float4((FogExtinctionDistance.wzyx > r5));
    r0.x = ps;
    r6 = r5.wzyx * r0;
    ps = r6.y * r6.x;
    r0 = r6.zwyx - 1.0;
    r8.w = ps;
    ps = r0.x;
    r5.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r8.xyz = r0.www * FogInScattering[0].xyz;
    r7.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r8 = r6.yyyz * r8;
    r7.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r0.y = r6.w * r8.w;
    r7.z = ps;
    r0.xzw = r0.zzz * FogInScattering[1].xyz + r8.xyz;
    r0.xzw = r6.zzz * r0.xzw + r7.xyz;
    r0.xzw = r6.www * r0.xzw + r5.xyz;
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
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o3.xyz = r3.xyz;
    o0 = r1.xyyx;
    o2 = r2;
    o4 = r0.xzwy;

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
