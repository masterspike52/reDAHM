// vs_84b172d2bcf3d325.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000039C 0061000B 00000000 00000000 00006CE7 00000001 00000008 00000007 00000290 00100008 00006009 0000700A 0000300B 0001A00C 0000500D 0001500E 0022500F 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001049 00001046 0000104A 00001047 0000104B 00001048 00001045
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> COLOR1
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> TEXCOORD1
//   vertex element: instruction 15 -> TEXCOORD2
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

float4 CameraPosition : register(c4); // float4
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
    r2.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r5 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    r1.xy = In.texcoord2.xy;
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r10.xyz = r3.yxz * 0.007843138 - 1.0;
    r3.yzw = r2.xzy * 0.007843138 - 1.0;
    r11.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r6.wwww * LocalToWorld[3];
    r0 = r6.zzzz * LocalToWorld[2] + r0;
    r0 = r6.yyyy * LocalToWorld[1] + r0;
    r0 = r6.xxxx * LocalToWorld[0].zxyw + r0.zxyw;
    r9.xyw = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    r8.xyw = r0.zyx - CameraPosition.yxz;
    r2 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r2;
    r1.w = dot(r8.wyx, r8.wyx);
    r8.xyz = r9.xxx * WorldToLocal[2].xyz;
    r1.z = float((0.001 >= abs(r8.w)));
    r1.z = (-abs(r1.z) >= 0.0) ? r8.w : 0.001;
    r9.xyz = r9.yyy * WorldToLocal[1].xyz + r8.xyz;
    r8 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = sqrt(abs(r1.w));
    r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r0.yyyy * ViewProjectionMatrix[0] + r2.xzyw;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r9.xyz = r9.www * WorldToLocal[0].xzy + r9.xzy;
    r3.x = dot(r11.xzy, r9.yxz);
    r3.y = dot(r3.zyw, r9.yxz);
    r3.z = dot(r10.zyx, r9.yxz);
    r1.z = 1.0 / r1.z;
    r9 = saturate(r8.wzyx * r1.zzzz);
    r7 = saturate(r7.wzyx * r1.zzzz);
    r8 = max(r0, 0.0);
    r0.xyz = r8.xyz * FogDistanceScale.wzy;
    r7 = r9.wzyx - r7.wzyx;
    r0.xyw = r0.yzx * abs(r7.yzx);
    r1.z = abs(r7.w) * FogDistanceScale.x;
    r0.y = pow(2.0, r0.y);
    r7 = abs(r7) * r8;
    r0.z = pow(2.0, r0.x);
    ps = pow(2.0, r0.w);
    r0.x = r1.z * r8.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r0.x = ps;
    r8 = r7.wzyx * r0;
    ps = r8.y * r8.x;
    r0 = r8.zwyx - 1.0;
    r10.w = ps;
    ps = r0.x;
    r7.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r10.xyz = r0.www * FogInScattering[0].xyz;
    r9.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r10 = r8.yyyz * r10;
    r9.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r7.w = r8.w * r10.w;
    r9.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r10.xyz;
    r0.xyz = r8.zzz * r0.xyz + r9.xyz;
    r7.xyz = r8.www * r0.xyz + r7.xyz;
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
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o3.xyz = r3.xyz;
    o5 = r5;
    o0 = r4;
    o2 = r2;
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
