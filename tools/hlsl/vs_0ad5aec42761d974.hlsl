// vs_0ad5aec42761d974.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 309 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004D4 00410011 00000000 00000000 00004CA5 00000001 00000005 00000005 00000290 0010000A 0000600B 0000700C 0000300D 0021A00E 0000F055 00017156 0002F257 0003F3A0 0004F4A2 00001064 00001062 00001065 00001063 00001061
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> COLOR1
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c23); // float3
float4 CameraPosition : register(c4); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c25); // float3
float4 FogVolumeBoxMin : register(c24); // float3
float4 LocalToWorld[4] : register(c16); // float4x4 (matrix_columns)
float4 SecondDensityFunctionParameters : register(c15); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c20); // float3x3 (matrix_columns)

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
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r2 = In.color1;
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r12 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r10.xyz = r0.zyw * 0.007843138 - 1.0;
    r8.xyz = r1.xzy * 0.007843138 - 1.0;
    r14.xyz = r3.zyx * 0.007843138 - 1.0;
    r1 = r5.wwww * LocalToWorld[3];
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r4);
    r1 = r5.zzzz * LocalToWorld[2] + r1;
    r1 = r5.yyyy * LocalToWorld[1] + r1;
    r1 = r5.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    r15.xyz = -r1.zxy + FogVolumeBoxMax.zyx;
    r17 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.zyxx : 1.0;
    r6.xyw = -r1.zxy * CameraPosition.www + CameraPosition.zyx;
    ps = r1.z;
    r13.xyz = -r1.zxy + FogVolumeBoxMin.zyx;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r9.xyw = r1.yxz - CameraPosition.xyz;
    r0.y = ps;
    ps = CameraPosition.y - r1.x;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r0.x = ps;
    ps = CameraPosition.x - r1.y;
    r4.x = dot(r9.wxy, r9.wxy);
    r0.z = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[2] + r3;
    r4.y = dot(r0.yzx, r0.yzx);
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r4.w = dot(r0.yzx, SecondDensityFunctionParameters.zxy);
    r4.z = ps;
    ps = 1.0 / r0.y;
    r16.xyz = r6.xxx * WorldToLocal[2].xyz;
    r11.x = ps;
    ps = 1.0 / r0.z;
    r6.z = float((0.001 >= abs(r9.w)));
    r11.y = ps;
    ps = 1.0 / r0.x;
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r17);
    r11.z = ps;
    r9.xyz = r6.yyy * WorldToLocal[1].xyz + r16.xyz;
    r0.z = (r6.z == 0.0) ? r9.w : 0.001;
    ps = sqrt(abs(r4.y));
    r0.x = r4.w + 0.0001;
    r0.y = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r13.xyz = r13.xzy * r11.xyz;
    r1.z = ps;
    ps = sqrt(abs(r4.x));
    r6.xyz = r15.zxy * r11.yxz;
    r1.x = ps;
    ps = 1.0 / r0.z;
    r11 = r1.xxxx - FogStartDistance.wzyx;
    r0.z = ps;
    r9.xyz = r6.www * WorldToLocal[0].xzy + r9.xzy;
    ps = 1.0 / r0.x;
    r4.x = dot(r14.xzy, r9.yxz);
    r0.x = ps;
    ps = -r0.w;
    r12 = saturate(r12.wzyx * r0.zzzz);
    ps = r0.x * ps;
    r1.xyw = min(r13.xzy, r6.yzx);
    r0.x = ps;
    ps = max(r1.y, r1.x);
    r6.xyw = max(r13.xzy, r6.yzx);
    r4.y = ps;
    ps = min(r6.y, r6.x);
    r7 = saturate(r7.wzyx * r0.zzzz);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r11 = max(r11, 0.0);
    r6.z = ps;
    ps = -r0.x;
    r7 = r12.wzyx - r7.wzyx;
    ps = r1.z * ps;
    r1.x = r6.z * r4.z;
    r1.y = ps;
    ps = abs(r7.w);
    r6.xyz = r11.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.z, r6.w));
    r0.z = ps;
    ps = r4.y;
    r6.xyz = r6.xzy * abs(r7.xzy);
    r4.y = ps;
    ps = r1.w;
    r7 = abs(r7) * r11;
    r4.z = ps;
    ps = max(r4.y, r4.z);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r1.w = saturate(ps);
    ps = pow(2.0, r6.y);
    r0.z = r0.z * r11.w;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r1.xy = r0.xx + r1.yx;
    r6.z = ps;
    ps = pow(2.0, r6.x);
    r1.x = max(r1.w, r1.x);
    r6.w = ps;
    ps = pow(2.0, r0.z);
    r1.y = min(r1.z, r1.y);
    r6.x = ps;
    r7 = r7.wzyx * r6;
    ps = ApproxFogColor.x * r7.w;
    r0.z = float((r1.x >= r1.y));
    r0.x = ps;
    r6.xy = (r0.zz == 0.0) ? r1.xy : 0.0;
    ps = r7.y * r7.x;
    r4.y = dot(r8.yxz, r9.yxz);
    r0.z = ps;
    ps = r7.z;
    r1 = r7.zwyx - 1.0;
    ps = r0.z * ps;
    r8.zw = r6.xy * 0.5;
    r6.z = ps;
    ps = r1.x;
    r4.z = dot(r10.zyx, r9.yxz);
    r0.z = ps;
    ps = FogInScattering[2].x * r0.z;
    r11.xyz = r1.www * FogInScattering[0].xyz;
    r8.x = ps;
    ps = FogInScattering[2].y * r1.x;
    r10.xyz = r1.zzz * FogInScattering[1].xyz;
    r8.y = ps;
    ps = FogInScattering[2].z * r1.x;
    r9.xy = r8.zw * r6.xy;
    r8.z = ps;
    r10.xyz = r7.yyy * r11.xyz + r10.xyz;
    r7.xyz = r7.zzz * r10.xyz + r8.xyz;
    r8.xyz = r0.wwx * r6.yxz;
    r0.xz = r9.yx * r4.ww + r8.xy;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r0.x = r0.x - r0.z;
    r0.y = ps;
    r0.x = r0.y * -r0.x;
    ps = 0.0001 * r0.x;
    r0.x = ps;
    ps = pow(2.0, -r0.x);
    r0.y = r7.w * r6.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r1.x = r0.y * r0.x;
    r0.z = ps;
    ps = r8.z;
    r0.xw = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r0.wx * r0.yy;
    r0.z = ps;
    r0.xyz = r1.yyy * FogInScattering[3].yzx + r0.xyz;
    r1.yzw = r7.www * r7.xyz + r0.zxy;
    r0 = r5.wwww * LocalToWorld[3];
    r0 = r5.zzzz * LocalToWorld[2] + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r0 = r5.yyyy * ViewProjectionMatrix[3].xwzy;
    r0 = r5.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r5.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o1.xyz = r4.xyz;
    o3 = r2;
    o0 = r3;
    o2 = r1.yzwx;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
