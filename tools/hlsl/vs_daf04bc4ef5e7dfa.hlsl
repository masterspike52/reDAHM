// vs_daf04bc4ef5e7dfa.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 297 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004A4 00610010 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 0010000A 0000600B 0000700C 0000300D 0000500E 0021500F 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 0000105F 00001060 0000105D 00001061 0000105E 0000105C 0000105B
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> TEXCOORD0
//   vertex element: instruction 15 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    r1.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r5.xyz = In.normal0.xyz;
    r2.xy = In.texcoord0.xy;
    r2.zw = In.texcoord1.yx;
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    ps = CameraPosition.z;
    r15 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = -FirstDensityFunctionParameters.y + ps;
    r3.xyz = r5.xyz * 0.003921569;
    r0.w = ps;
    r11.yzw = r5.yxz * 0.007843138 - 1.0;
    r10.yzw = r4.xzy * 0.007843138 - 1.0;
    r8.xzw = r1.xzy * 0.007843138 - 1.0;
    ps = -r8.w;
    r4 = r6.wwww * LocalToWorld[3].xzyw;
    r8.y = ps;
    r4 = r6.zzzz * LocalToWorld[2].zxyw + r4.yxzw;
    r4 = r6.yyyy * LocalToWorld[1].xzyw + r4.yxzw;
    r13 = r6.xxxx * LocalToWorld[0].xzyw + r4;
    ps = r13.y;
    r5.xyz = r1.xyz * 0.003921569;
    r0.x = ps;
    ps = -FirstDensityFunctionParameters.y - -r0.x;
    r16.xyz = -r13.yxz + FogVolumeBoxMax.zxy;
    r0.z = ps;
    r1.xzw = -r13.yzx * CameraPosition.www + CameraPosition.zyx;
    ps = r13.y;
    r14.xyz = r13.xzy - CameraPosition.xyz;
    r0.x = ps;
    ps = 0.0001 - r0.x;
    r12.xyz = -r13.xzy + CameraPosition.xyz;
    r0.x = ps;
    ps = CameraPosition.z + r0.x;
    r4 = r13.wwww * ViewProjectionMatrix[3].xwzy;
    r0.x = ps;
    r4 = r13.yyyy * ViewProjectionMatrix[2].xwzy + r4;
    ps = 1.0 / r12.x;
    r0.y = dot(r12.zxy, r12.zxy);
    r12.x = ps;
    ps = 1.0 / r12.y;
    r9.xyz = r1.xxx * WorldToLocal[2].xyz;
    r12.y = ps;
    ps = 1.0 / r12.z;
    r3.w = dot(r14.zxy, r14.zxy);
    r12.z = ps;
    ps = sqrt(abs(r3.w));
    r1.y = float((0.001 >= abs(r14.z)));
    r1.x = ps;
    r1.y = (r1.y == 0.0) ? r14.z : 0.001;
    r9.xyz = r1.zzz * WorldToLocal[1].xyz + r9.xyz;
    ps = sqrt(abs(r0.y));
    r14.xy = float2((-r0.zw > 0.0));
    r0.y = ps;
    r4 = r13.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    r4 = r13.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r13.xyz = -r13.yxz + FogVolumeBoxMin.zxy;
    r10.x = ps;
    r9.xyz = r1.www * WorldToLocal[0].xzy + r9.xzy;
    ps = 1.0 / r0.x;
    r13.xyz = r13.xzy * r12.zyx;
    r0.x = ps;
    ps = 1.0 / r1.y;
    r12.xyz = r16.yzx * r12.xyz;
    r0.y = ps;
    ps = -r0.z;
    r1 = r1.xxxx - FogStartDistance.wzyx;
    ps = r0.x * ps;
    r15 = saturate(r15.wzyx * r0.yyyy);
    r0.x = ps;
    ps = 1.0 - r0.x;
    r7 = saturate(r7.wzyx * r0.yyyy);
    r5.w = ps;
    ps = -r0.x;
    r0.yzw = min(r13.xzy, r12.zxy);
    ps = r14.x * ps;
    r12.xzw = max(r13.xzy, r12.zxy);
    r12.y = ps;
    ps = min(r12.w, r12.x);
    r13 = max(r1, 0.0);
    r3.w = ps;
    ps = max(r0.w, r0.y);
    r1.xyz = r13.xyz * FogDistanceScale.wzy;
    r1.w = ps;
    ps = r5.w;
    r7 = r15.wzyx - r7.wzyx;
    ps = r14.y * ps;
    r0.y = abs(r7.w) * FogDistanceScale.x;
    r12.x = ps;
    ps = r1.w;
    r0.w = saturate(min(r3.w, r12.z));
    r12.z = ps;
    ps = r0.z;
    r1.xyz = r1.xzy * abs(r7.xzy);
    r12.w = ps;
    ps = max(r12.z, r12.w);
    r7 = abs(r7) * r13;
    r1.w = saturate(ps);
    ps = pow(2.0, r1.y);
    r0.z = r0.y * r13.w;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.xy = r0.xx + r12.xy;
    r1.z = ps;
    ps = pow(2.0, r1.x);
    r0.y = max(r1.w, r0.y);
    r1.w = ps;
    ps = pow(2.0, r0.z);
    r0.x = min(r0.w, r0.x);
    r1.x = ps;
    ps = -r0.y;
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    ps = r0.x + ps;
    r7 = r7.wzyx * r1;
    r11.x = saturate(ps);
    ps = r7.y * r7.x;
    r1.x = dot(r8.zxw, r9.yxz);
    r0.x = ps;
    ps = r7.w;
    r1.y = dot(r10.zyw, r9.yxz);
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r12 = r10.xzzw * r11.xyzz;
    r0.y = ps;
    r10.xyz = r10.wyy * r11.wwy - r12.yzw;
    ps = pow(2.0, -r12.x);
    r10.w = r7.z * r0.x;
    r0.z = ps;
    ps = 1.0 - r0.z;
    r1.z = dot(r11.wzy, r9.yxz);
    r0.x = ps;
    ps = r0.y;
    r9 = r7.wzyx - 1.0;
    ps = r10.w * ps;
    r0.w = dot(r8.xyz, r10.xyz);
    r0.y = ps;
    r3.w = r0.w * 0.5 + 0.5;
    r8.x = r0.y * r0.x;
    ps = ApproxFogColor.z * r0.x;
    r10.xyz = r9.www * FogInScattering[0].xyz;
    r0.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r11 = r7.yyyw * r10;
    r0.w = ps;
    ps = r11.w;
    r10.xyz = r9.yyy * FogInScattering[2].xyz;
    ps = r0.z * ps;
    r8.yz = r0.yw * r11.ww;
    r0.w = ps;
    r0.xyz = r9.zzz * FogInScattering[1].xyz + r11.xyz;
    r7.xyz = r7.zzz * r0.xzy + r10.xzy;
    r0.xyz = r9.xxx * FogInScattering[3].xyz + r8.xzy;
    r0.xyz = r7.www * r7.xzy + r0.xyz;
    r7 = r6.wwww * LocalToWorld[3].xwzy;
    r7 = r6.zzzz * LocalToWorld[2].xwzy + r7;
    r7 = r6.yyyy * LocalToWorld[1].xzyw + r7.xzwy;
    r7 = r6.xxxx * LocalToWorld[0].xywz + r7.xzwy;
    r6 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r6 = r7.wwww * ViewProjectionMatrix[2].xwzy + r6;
    r6 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r7.xxxx * ViewProjectionMatrix[0] + r6.xzyw;
    oPos = r6;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o5.xyz = r5.xyz;
    o5.w = 0.0;
    o2.xyz = r1.xyz;
    o4 = r3;
    o0 = r2;
    o1 = r4;
    o3 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    Out.color2 = o6;
    return Out;
}
