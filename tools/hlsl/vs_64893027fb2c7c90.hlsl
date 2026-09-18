// vs_64893027fb2c7c90.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 318 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004F8 0020000D 00000000 00000000 00002C63 00000001 00000010 00000003 00000290 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00203017 00125018 00035019 0024501A 00000058 00115059 0002505A 0003505B 0024505C 0000F055 00017156 0002F257 00001067 00001066 00001068
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> TEXCOORD1
//   vertex element: instruction 18 -> TEXCOORD2
//   vertex element: instruction 19 -> TEXCOORD3
//   vertex element: instruction 20 -> TEXCOORD4
//   vertex element: instruction 21 -> TANGENT0
//   vertex element: instruction 22 -> BINORMAL0
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> TEXCOORD2
//   vertex element: instruction 25 -> TEXCOORD3
//   vertex element: instruction 26 -> TEXCOORD4
//   vertex element: instruction 88 -> POSITION0
//   vertex element: instruction 89 -> TEXCOORD1
//   vertex element: instruction 90 -> TEXCOORD2
//   vertex element: instruction 91 -> TEXCOORD3
//   vertex element: instruction 92 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c17); // float3
float4 CameraPosition : register(c4); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c19); // float3
float4 FogVolumeBoxMin : register(c18); // float3
float4 InvNumVerticesPerInstance : register(c15); // float
float4 NumVerticesPerInstance : register(c16); // float
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r5 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r2.w = ps;
    ps = trunc(r2.w);
    r1 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r3.w = r0.y + r0.x;
    r4 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r7.xyz = In.texcoord2.xyz;
    r10.xyz = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r2.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r9.xyz = In.normal0.xyz;
    r8.xyz = In.texcoord2.xyz;
    r6.xyw = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r9.xyz = r9.yxz * 0.007843138 - 1.0;
    r11.xyz = r3.xzy * 0.007843138 - 1.0;
    r2.xyz = r2.zyx * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r4.www;
    r3 = r4.wwww * ViewProjectionMatrix[3];
    r0.yzw = r13.xyz * r4.zzz + r0.ywz;
    r0.yzw = r10.xzy * r4.yyy + r0.ywz;
    r0.yzw = r7.xyz * r4.xxx + r0.ywz;
    r3 = r0.wwww * ViewProjectionMatrix[2] + r3;
    r13.xyz = -r0.wzy * CameraPosition.www + CameraPosition.zyx;
    ps = CameraPosition.z - r0.w;
    r7.xyz = -r0.yzw + FogVolumeBoxMin.xyz;
    r10.x = ps;
    ps = CameraPosition.y - r0.z;
    r4.xyz = r0.yzw - CameraPosition.xyz;
    r10.y = ps;
    ps = CameraPosition.x - r0.y;
    r4.x = dot(r4.zxy, r4.zxy);
    r10.z = ps;
    r6.z = dot(r10.xzy, r10.xzy);
    r8.x = dot(r13.xzy, r8.zxy);
    ps = FogVolumeBoxMax.x - r0.y;
    r8.y = dot(r13.xzy, r6.wxy);
    r6.x = ps;
    ps = FogVolumeBoxMax.y - r0.z;
    r8.z = dot(r13.xzy, r12.zxy);
    r6.y = ps;
    ps = 1.0 / r10.y;
    r2.w = float((0.001 >= abs(r4.z)));
    r4.y = ps;
    r3 = r0.zzzz * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r0.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    r2.w = (r2.w == 0.0) ? r4.z : 0.001;
    ps = 1.0 / r10.x;
    r2.x = dot(r2.xzy, r8.zxy);
    r4.z = ps;
    ps = 1.0 / r10.z;
    r2.y = dot(r11.yxz, r8.zxy);
    r4.w = ps;
    ps = sqrt(abs(r6.z));
    r2.z = dot(r9.zyx, r8.zxy);
    r0.y = ps;
    ps = FogVolumeBoxMax.z - r0.w;
    r8.xyz = r7.yzx * r4.yzw;
    r6.z = ps;
    ps = sqrt(abs(r4.x));
    r6.xyz = r6.yzx * r4.yzw;
    r0.z = ps;
    ps = 1.0 / r2.w;
    r4 = r0.zzzz - FogStartDistance.wzyx;
    r0.z = ps;
    r7 = saturate(r5.wyxz * r0.zzzz);
    r5 = saturate(r1.wyxz * r0.zzzz);
    r1.xyw = min(r8.xyz, r6.xyz);
    r6.xyz = max(r8.xzy, r6.xzy);
    r4 = max(r4.xwyz, 0.0);
    ps = min(r6.x, r6.z);
    r5 = r7.zwyx - r5.zwyx;
    r0.w = ps;
    ps = max(r1.x, r1.y);
    r0.z = abs(r5.w) * FogDistanceScale.x;
    r2.w = ps;
    ps = r2.w;
    r1.xyz = r4.xzw * FogDistanceScale.wzy;
    r6.x = ps;
    ps = r1.w;
    r0.w = saturate(min(r0.w, r6.y));
    r6.y = ps;
    ps = max(r6.x, r6.y);
    r1.xyz = r1.xzy * abs(r5.xyz);
    r1.w = saturate(ps);
    ps = pow(2.0, r1.y);
    r5 = abs(r5.xwyz) * r4.xywz;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r4.x = saturate(-r1.w + r0.w);
    r1.z = ps;
    ps = pow(2.0, r1.x);
    r0.w = r0.z * r4.y;
    r0.z = ps;
    ps = pow(2.0, r0.w);
    r5 = float4((FogExtinctionDistance.zxyw > r5.wyzx));
    r1.x = ps;
    r6.yzw = r5.yzx * r1.xyz;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r5.xyz = r6.wyz - 1.0;
    r6.x = ps;
    ps = r6.z * r6.y;
    r1.xyz = r5.yyy * FogInScattering[0].xyz;
    r1.w = ps;
    ps = r5.w;
    r1 = r6.zzzw * r1;
    r4.yzw = r5.zzz * FogInScattering[1].xyz + r1.xyz;
    ps = r0.z * ps;
    r4 = r6.wwwx * r4.yzwx;
    r1.x = ps;
    r4.xyz = r5.xxx * FogInScattering[2].xzy + r4.xzy;
    ps = pow(2.0, -r4.w);
    r1.z = r1.x * r1.w;
    r0.z = ps;
    ps = 1.0 - r0.z;
    r1.y = ps;
    ps = (-1.0) - -r1.x;
    r5.yzw = r1.xyy * ApproxFogColor.xzy;
    r0.y = ps;
    ps = r1.z;
    r5.x = r5.y * r1.w;
    ps = r0.z * ps;
    r5.xyz = r5.xwz * r1.yzz;
    r1.y = ps;
    r0.yzw = r0.yyy * FogInScattering[3].xyz + r5.xyz;
    r1.xzw = r1.xxx * r4.xzy + r0.yzw;
    r0.y = r0.x + 0.5;
    r0.w = r0.y * InvNumVerticesPerInstance.x;
    r0.y = trunc(r0.w);
    r0.y = r0.y * NumVerticesPerInstance.x;
    r0.y = trunc(-r0.y);
    r0.x = r0.y + r0.x;
    r4 = In.position0.yzwx;
    r0.xyz = In.texcoord1.xyz;
    r5.xyz = In.texcoord2.xyz;
    r7.xyz = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r6.xyz = r0.xyz * r4.zzz;
    r0 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r6.xyz = r8.xzy * r4.yyy + r6.xzy;
    r4.xyz = r7.xyz * r4.xxx + r6.xzy;
    r4.xyz = r5.xzy * r4.www + r4.xzy;
    r0 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o1.xyz = r2.xyz;
    o0 = r3;
    o2 = r1.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
