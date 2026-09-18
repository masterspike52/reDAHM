// vs_489ddde0bb5c1fee.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 360 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000005A0 0020000E 00000000 00000000 00002C63 00000001 00000010 00000003 00000290 00000011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 00000066 00115067 00025068 00035069 0024506A 0000F055 00017156 0002F257 00001075 00001074 00001076
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> TEXCOORD1
//   vertex element: instruction 19 -> TEXCOORD2
//   vertex element: instruction 20 -> TEXCOORD3
//   vertex element: instruction 21 -> TEXCOORD4
//   vertex element: instruction 22 -> TANGENT0
//   vertex element: instruction 23 -> BINORMAL0
//   vertex element: instruction 24 -> NORMAL0
//   vertex element: instruction 25 -> TEXCOORD2
//   vertex element: instruction 26 -> TEXCOORD3
//   vertex element: instruction 27 -> TEXCOORD4
//   vertex element: instruction 102 -> POSITION0
//   vertex element: instruction 103 -> TEXCOORD1
//   vertex element: instruction 104 -> TEXCOORD2
//   vertex element: instruction 105 -> TEXCOORD3
//   vertex element: instruction 106 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c18); // float3
float4 CameraPosition : register(c4); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c20); // float3
float4 FogVolumeBoxMin : register(c19); // float3
float4 InvNumVerticesPerInstance : register(c16); // float
float4 NumVerticesPerInstance : register(c17); // float
float4 SecondDensityFunctionParameters : register(c15); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.z = ps;
    ps = trunc(r0.z);
    r5 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r0.y = r0.y + r0.x;
    r2 = In.position0;
    r6.xyz = In.texcoord1.xyz;
    r1.xyz = In.texcoord2.xyz;
    r3.xyw = In.texcoord3.xyz;
    r4.xyz = In.texcoord4.xyz;
    r8.yzw = In.tangent0.xyz;
    r12.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r14.xyz = In.texcoord2.xyz;
    r7.yzw = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r10 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r12.xyz = r12.xzy * 0.007843138 - 1.0;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r3.z = dot(SecondDensityFunctionParameters.zxyw, r10);
    r1.w = ps;
    ps = (-r3.z > 0.0) ? 1.0 : 0.0;
    r0.yzw = r6.xzy * r2.www;
    r3.z = ps;
    r0.yzw = r4.xyz * r2.zzz + r0.ywz;
    r0.yzw = r3.xwy * r2.yyy + r0.ywz;
    r1.xyz = r1.zxy * r2.xxx + r0.zyw;
    ps = FogVolumeBoxMax.z - r1.x;
    r2 = r2.wwww * ViewProjectionMatrix[3];
    r6.x = ps;
    r4 = r1.xxxx * ViewProjectionMatrix[2] + r2;
    r2.xzw = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = CameraPosition.z - r1.x;
    r10.xyz = -r1.xzy + FogVolumeBoxMin.zyx;
    r0.y = ps;
    ps = CameraPosition.y - r1.z;
    r3.xyw = r1.yxz - CameraPosition.xzy;
    r0.z = ps;
    ps = CameraPosition.x - r1.y;
    r3.w = dot(r3.yxw, r3.yxw);
    r0.w = ps;
    ps = FogVolumeBoxMax.y - r1.z;
    r6.w = dot(r0.ywz, r0.ywz);
    r6.y = ps;
    ps = FogVolumeBoxMax.x - r1.y;
    r7.x = dot(r2.xwz, r14.zxy);
    r6.z = ps;
    ps = 1.0 / r0.y;
    r7.y = dot(r2.xwz, r7.wyz);
    r2.y = ps;
    ps = 1.0 / r0.w;
    r7.z = dot(r2.xwz, r13.zxy);
    r2.z = ps;
    ps = 1.0 / r0.z;
    r3.x = dot(SecondDensityFunctionParameters.zxyw, r1);
    r2.w = ps;
    r4 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r4.xzwy;
    r4 = r1.yyyy * ViewProjectionMatrix[0] + r4.xwyz;
    ps = (-r3.x > 0.0) ? 1.0 : 0.0;
    r0.y = dot(r0.ywz, SecondDensityFunctionParameters.zxy);
    r2.x = ps;
    ps = 0.0001 + r0.y;
    r0.z = float((0.001 >= abs(r3.y)));
    r1.x = ps;
    r0.w = (r0.z == 0.0) ? r3.y : 0.001;
    ps = sqrt(abs(r6.w));
    r3.y = dot(r12.yxz, r7.zxy);
    r0.z = ps;
    ps = sqrt(abs(r3.w));
    r10.xyz = r10.xzy * r2.yzw;
    r1.y = ps;
    ps = 1.0 / r0.w;
    r2.yzw = r6.zxy * r2.zyw;
    r0.w = ps;
    ps = 1.0 / r1.x;
    r6 = r1.yyyy - FogStartDistance.wzyx;
    r1.x = ps;
    ps = -r3.x;
    r11 = saturate(r11.wzyx * r0.wwww);
    ps = r1.x * ps;
    r1.yzw = min(r10.xzy, r2.zwy);
    r1.x = ps;
    ps = max(r1.z, r1.y);
    r10.xyz = max(r10.xzy, r2.zwy);
    r2.w = ps;
    ps = min(r10.y, r10.x);
    r5 = saturate(r5.wzyx * r0.wwww);
    r0.w = ps;
    ps = 1.0 - r1.x;
    r6 = max(r6, 0.0);
    r2.y = ps;
    ps = -r1.x;
    r5 = r11.wzyx - r5.wzyx;
    ps = r2.x * ps;
    r3.z = r2.y * r3.z;
    r3.w = ps;
    ps = abs(r5.w);
    r2.xyz = r6.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r1.z = saturate(min(r0.w, r10.z));
    r0.w = ps;
    ps = r2.w;
    r2.xyz = r2.xzy * abs(r5.xzy);
    r1.y = ps;
    ps = r1.w;
    r5 = abs(r5) * r6;
    r1.w = ps;
    ps = max(r1.y, r1.w);
    r5 = float4((FogExtinctionDistance.wzyx > r5));
    r1.w = saturate(ps);
    ps = pow(2.0, r2.y);
    r0.w = r0.w * r6.w;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r1.xy = r1.xx + r3.wz;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r1.x = max(r1.w, r1.x);
    r2.w = ps;
    ps = pow(2.0, r0.w);
    r1.y = min(r1.z, r1.y);
    r2.x = ps;
    r5 = r5.wzyx * r2;
    r1.z = float((r1.x >= r1.y));
    ps = r5.y * r5.x;
    r3.w = r5.w * ApproxFogColor.x;
    r0.w = ps;
    r1.yz = (r1.zz == 0.0) ? r1.xy : 0.0;
    ps = 0.5 * r1.y;
    r2 = r5.zwyx - 1.0;
    r6.z = ps;
    ps = 0.5 * r1.z;
    r1.x = r5.z * r0.w;
    r6.w = ps;
    ps = r2.x;
    r3.z = dot(r9.zyx, r7.zxy);
    r0.w = ps;
    ps = FogInScattering[2].x * r0.w;
    r11.xyz = r2.www * FogInScattering[0].xyz;
    r6.x = ps;
    ps = FogInScattering[2].y * r2.x;
    r10.xyz = r2.zzz * FogInScattering[1].xyz;
    r6.y = ps;
    ps = FogInScattering[2].z * r2.x;
    r9.xy = r6.zw * r1.yz;
    r6.z = ps;
    r10.xyz = r5.yyy * r11.xyz + r10.xyz;
    r5.xyz = r5.zzz * r10.xyz + r6.xyz;
    r6.xyz = r3.xxw * r1.yzx;
    r0.yw = r9.yx * r0.yy + r6.yx;
    ps = FirstDensityFunctionParameters.x * r0.z;
    r0.y = r0.y - r0.w;
    r0.z = ps;
    ps = r5.w;
    r8.x = r0.z * -r0.y;
    ps = r1.x * ps;
    r8 = r8 * float4(0.0001, 0.007843138, 0.007843138, 0.007843138);
    r0.y = ps;
    ps = pow(2.0, -r8.x);
    r1.xyz = r8.wzy - 1.0;
    r0.z = ps;
    ps = r0.y;
    r3.x = dot(r1.xzy, r7.zxy);
    ps = r0.z * ps;
    r0.w = -r0.z + 1.0;
    r1.w = ps;
    ps = r6.z;
    r1.xy = r0.ww * ApproxFogColor.zy;
    ps = r0.w * ps;
    r0.yz = r1.yx * r0.yy;
    r0.w = ps;
    r0.yzw = r2.yyy * FogInScattering[3].yzx + r0.yzw;
    r1.xyz = r5.www * r5.xyz + r0.wyz;
    r0.y = r0.x + 0.5;
    r0.w = r0.y * InvNumVerticesPerInstance.x;
    r0.y = trunc(r0.w);
    r0.y = r0.y * NumVerticesPerInstance.x;
    r0.y = trunc(-r0.y);
    r0.x = r0.y + r0.x;
    r2 = In.position0.yzwx;
    r0.xyz = In.texcoord1.xyz;
    r5.xyz = In.texcoord2.xyz;
    r7.xyz = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r6.xyz = r0.xyz * r2.zzz;
    r0 = r2.zzzz * ViewProjectionMatrix[3].xwzy;
    r6.xyz = r8.xzy * r2.yyy + r6.xzy;
    r2.xyz = r7.xyz * r2.xxx + r6.xzy;
    r2.xyz = r5.xzy * r2.www + r2.xzy;
    r0 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r2.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o1.xyz = r3.xyz;
    o0 = r4;
    o2 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
