// vs_cc1c525802d4e1b8.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000036C 0051000A 00000000 00000000 00005CC6 00000001 00000006 00000006 00000290 00100007 00006008 00007009 0000300A 0001A00B 0020500C 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A2 00001045 00001046 00001043 00001047 00001044 00001042
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   vertex element: instruction 12 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
    r2.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r4 = In.color1;
    r1.xy = In.texcoord0.xy;
    r1.z = 0.0;
    r6 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r9.xyz = r3.yxz * 0.007843138 - 1.0;
    r3.yzw = r2.xzy * 0.007843138 - 1.0;
    r10.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r5.wwww * LocalToWorld[3].xzyw;
    r0 = r5.zzzz * LocalToWorld[2].xzyw + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r5.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r8.xyw = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    r7.xyw = r0.yzx - CameraPosition.xyz;
    r2 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r2;
    r3.x = dot(r7.wxy, r7.wxy);
    r7.xyz = r8.xxx * WorldToLocal[2].xzy;
    r1.w = float((0.001 >= abs(r7.w)));
    r1.w = (r1.w == 0.0) ? r7.w : 0.001;
    r8.xyz = r8.yyy * WorldToLocal[1].xzy + r7.xyz;
    r7 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = sqrt(abs(r3.x));
    r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r0.yyyy * ViewProjectionMatrix[0] + r2.xzyw;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r8.xyz = r8.www * WorldToLocal[0].xyz + r8.xzy;
    r3.x = dot(r10.xzy, r8.zxy);
    r3.y = dot(r3.zyw, r8.zxy);
    r3.z = dot(r9.zyx, r8.zxy);
    r1.w = 1.0 / r1.w;
    r8 = saturate(r7.wzyx * r1.wwww);
    r6 = saturate(r6.wzyx * r1.wwww);
    r7 = max(r0, 0.0);
    r0.xyz = r7.xyz * FogDistanceScale.wzy;
    r6 = r8.wzyx - r6.wzyx;
    r0.xyw = r0.yzx * abs(r6.yzx);
    r1.w = abs(r6.w) * FogDistanceScale.x;
    r0.y = pow(2.0, r0.y);
    r6 = abs(r6) * r7;
    r0.z = pow(2.0, r0.x);
    ps = pow(2.0, r0.w);
    r0.x = r1.w * r7.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r6 = float4((FogExtinctionDistance.wzyx > r6));
    r0.x = ps;
    r7 = r6.wzyx * r0;
    ps = r7.y * r7.x;
    r0 = r7.zwyx - 1.0;
    r9.w = ps;
    ps = r0.x;
    r6.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r9.xyz = r0.www * FogInScattering[0].xyz;
    r8.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r9 = r7.yyyz * r9;
    r8.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r6.w = r7.w * r9.w;
    r8.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r9.xyz;
    r0.xyz = r7.zzz * r0.xyz + r8.xyz;
    r6.xyz = r7.www * r0.xyz + r6.xyz;
    r0 = r5.wwww * LocalToWorld[3].xwzy;
    r0 = r5.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r5.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o5.x = ps;
    o5.yzw = 0.0;
    o2.xyz = r3.xyz;
    o4 = r4;
    o0 = r1.xyzz;
    o1 = r2;
    o3 = r6;

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
