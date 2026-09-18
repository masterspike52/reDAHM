// vs_0790b0dc2b7232a5.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 324 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000510 00610012 00000000 00000000 00006CE7 00000001 00000008 00000007 00000290 0010000A 0000600B 0000700C 0000300D 0001A00E 0000500F 00015010 00225011 0000F050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A2 00001068 00001065 00001069 00001066 0000106A 00001067 00001064
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> TANGENT0
//   vertex element: instruction 12 -> BINORMAL0
//   vertex element: instruction 13 -> NORMAL0
//   vertex element: instruction 14 -> COLOR1
//   vertex element: instruction 15 -> TEXCOORD0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r7 = In.position0;
    r3.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.yzw = In.normal0.xyz;
    r6 = In.color1;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.yx;
    r2.xy = In.texcoord2.xy;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r13 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r8 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r12.xyz = r0.zyw * 0.007843138 - 1.0;
    r4.yzw = r1.xzy * 0.007843138 - 1.0;
    r15.xyz = r3.zyx * 0.007843138 - 1.0;
    r1 = r7.wwww * LocalToWorld[3];
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r8);
    r1 = r7.zzzz * LocalToWorld[2] + r1;
    r1 = r7.yyyy * LocalToWorld[1] + r1;
    r1 = r7.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    r10.xyz = -r1.zxy + FogVolumeBoxMax.zyx;
    r18 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r1.zyxx : 1.0;
    r11.xyw = -r1.zxy * CameraPosition.www + CameraPosition.zyx;
    ps = r1.z;
    r14.xyz = -r1.zxy + FogVolumeBoxMin.zyx;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r16.xyz = r1.zxy - CameraPosition.zyx;
    r0.y = ps;
    ps = CameraPosition.y - r1.x;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r0.x = ps;
    ps = CameraPosition.x - r1.y;
    r2.w = dot(r16.xzy, r16.xzy);
    r0.z = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[2] + r3;
    r4.x = dot(r0.yzx, r0.yzx);
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r2.z = dot(r0.yzx, SecondDensityFunctionParameters.zxy);
    r8.z = ps;
    ps = 1.0 / r0.y;
    r17.xyz = r11.xxx * WorldToLocal[2].xyz;
    r8.x = ps;
    ps = 1.0 / r0.z;
    r10.w = float((0.001 >= abs(r16.x)));
    r8.y = ps;
    ps = 1.0 / r0.x;
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r18);
    r8.w = ps;
    r11.xyz = r11.yyy * WorldToLocal[1].xyz + r17.xyz;
    r0.y = (-abs(r10.w) >= 0.0) ? r16.x : 0.001;
    ps = sqrt(abs(r4.x));
    r0.x = r2.z + 0.0001;
    r0.z = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r14.xyz = r14.xzy * r8.xyw;
    r1.z = ps;
    ps = sqrt(abs(r2.w));
    r8.xyw = r10.zxy * r8.yxw;
    r1.x = ps;
    ps = 1.0 / r0.y;
    r10 = r1.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    r11.xyz = r11.www * WorldToLocal[0].xzy + r11.xzy;
    ps = 1.0 / r0.x;
    r4.x = dot(r15.xzy, r11.yxz);
    r0.x = ps;
    ps = -r0.w;
    r13 = saturate(r13.wzyx * r0.yyyy);
    ps = r0.x * ps;
    r1.xyw = min(r14.xzy, r8.ywx);
    r0.x = ps;
    ps = max(r1.y, r1.x);
    r8.xyw = max(r14.xzy, r8.ywx);
    r2.w = ps;
    ps = min(r8.y, r8.x);
    r9 = saturate(r9.wzyx * r0.yyyy);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r10 = max(r10, 0.0);
    r11.w = ps;
    ps = -r0.x;
    r9 = r13.wzyx - r9.wzyx;
    ps = r1.z * ps;
    r1.x = r11.w * r8.z;
    r1.y = ps;
    ps = abs(r9.w);
    r8.xyz = r10.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.y, r8.w));
    r0.y = ps;
    ps = r2.w;
    r8.xyz = r8.xzy * abs(r9.xzy);
    r13.x = ps;
    ps = r1.w;
    r9 = abs(r9) * r10;
    r13.y = ps;
    ps = max(r13.x, r13.y);
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    r1.w = saturate(ps);
    ps = pow(2.0, r8.y);
    r0.y = r0.y * r10.w;
    r8.y = ps;
    ps = pow(2.0, r8.z);
    r1.xy = r0.xx + r1.yx;
    r8.z = ps;
    ps = pow(2.0, r8.x);
    r1.x = max(r1.w, r1.x);
    r8.w = ps;
    ps = pow(2.0, r0.y);
    r1.y = min(r1.z, r1.y);
    r8.x = ps;
    r9 = r9.wzyx * r8;
    ps = ApproxFogColor.x * r9.w;
    r0.y = float((r1.x >= r1.y));
    r0.x = ps;
    r8.xy = (r0.yy == 0.0) ? r1.xy : 0.0;
    ps = r9.y * r9.x;
    r4.y = dot(r4.zyw, r11.yxz);
    r0.y = ps;
    ps = r9.z;
    r1 = r9.zwyx - 1.0;
    ps = r0.y * ps;
    r10.xy = r8.xy * 0.5;
    r8.z = ps;
    ps = r1.x;
    r4.z = dot(r12.zyx, r11.yxz);
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r13.xyz = r1.www * FogInScattering[0].xyz;
    r11.x = ps;
    ps = FogInScattering[2].y * r1.x;
    r12.xyz = r1.zzz * FogInScattering[1].xyz;
    r11.y = ps;
    ps = FogInScattering[2].z * r1.x;
    r10.xy = r10.xy * r8.xy;
    r11.z = ps;
    r12.xyz = r9.yyy * r13.xyz + r12.xyz;
    r9.xyz = r9.zzz * r12.xyz + r11.xyz;
    r0.xyw = r0.wwx * r8.yxz;
    r0.xy = r10.yx * r2.zz + r0.xy;
    ps = FirstDensityFunctionParameters.x * r0.z;
    r2.z = r0.x - r0.y;
    r0.z = ps;
    r0.x = r0.z * -r2.z;
    ps = 0.0001 * r0.x;
    r2.z = ps;
    ps = pow(2.0, -r2.z);
    r0.z = r9.w * r8.z;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r0.y = r0.z * r0.x;
    r0.x = ps;
    ps = r0.w;
    r2.zw = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r0.zw = r2.zw * r0.zz;
    r0.x = ps;
    r0.xzw = r1.yyy * FogInScattering[3].xzy + r0.xzw;
    r0.xzw = r9.www * r9.xyz + r0.xwz;
    r1 = r7.wwww * LocalToWorld[3].xwzy;
    r1 = r7.zzzz * LocalToWorld[2].xwzy + r1;
    r1 = r7.yyyy * LocalToWorld[1].xzyw + r1.xzwy;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r7.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r7.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o1.xy = r2.xy;
    o1.zw = 0.0;
    o3.xyz = r4.xyz;
    o5 = r6;
    o0 = r5;
    o2 = r3;
    o4 = r0.xzwy;

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
