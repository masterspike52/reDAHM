// vs_19b8296b6724a5e0.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000354 00410009 00000000 00000000 00004CA5 00000001 00000005 00000005 00000290 00100007 00006008 00007009 0000300A 0021A00B 0000F055 00017156 0002F257 0003F3A0 0004F4A2 00001044 00001042 00001045 00001043 00001041
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> TANGENT0
//   vertex element: instruction 9 -> BINORMAL0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> COLOR1
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r4 = In.position0;
    r0.yzw = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r3.xyz = In.normal0.xyz;
    r1 = In.color1;
    r5 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r8.xyz = r3.yxz * 0.007843138 - 1.0;
    r9.xyz = r2.xzy * 0.007843138 - 1.0;
    r3.xyz = r0.wzy * 0.007843138 - 1.0;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1] + r0;
    r0 = r4.xxxx * LocalToWorld[0].zxyw + r0.zxyw;
    r7.xyw = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    r6.xyw = r0.yzx - CameraPosition.xyz;
    r2 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r2 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r2;
    r8.w = dot(r6.wxy, r6.wxy);
    r6.xyz = r7.xxx * WorldToLocal[2].xyz;
    r3.w = float((0.001 >= abs(r6.w)));
    r3.w = (r3.w == 0.0) ? r6.w : 0.001;
    r7.xyz = r7.yyy * WorldToLocal[1].xyz + r6.xyz;
    r6 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = sqrt(abs(r8.w));
    r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r0.yyyy * ViewProjectionMatrix[0] + r2.xzyw;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r7.xyz = r7.www * WorldToLocal[0].xzy + r7.xzy;
    r3.x = dot(r3.xzy, r7.yxz);
    r3.y = dot(r9.yxz, r7.yxz);
    ps = 1.0 / r3.w;
    r3.z = dot(r8.zyx, r7.yxz);
    r3.w = ps;
    r7 = saturate(r6.wzyx * r3.wwww);
    r5 = saturate(r5.wzyx * r3.wwww);
    r6 = max(r0, 0.0);
    r0.xyz = r6.xyz * FogDistanceScale.wzy;
    r5 = r7.wzyx - r5.wzyx;
    r0.xyw = r0.yzx * abs(r5.yzx);
    ps = pow(2.0, r0.y);
    r3.w = abs(r5.w) * FogDistanceScale.x;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r5 = abs(r5) * r6;
    r0.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = r3.w * r6.w;
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
    r5.w = r6.w * r8.w;
    r7.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r8.xyz;
    r0.xyz = r6.zzz * r0.xyz + r7.xyz;
    r5.xyz = r6.www * r0.xyz + r5.xyz;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r4 = r4.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0 = r4.yyyy * ViewProjectionMatrix[3].xwzy;
    r0 = r4.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o1.xyz = r3.xyz;
    o3 = r1;
    o0 = r2;
    o2 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
