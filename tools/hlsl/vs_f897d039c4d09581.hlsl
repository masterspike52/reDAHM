// vs_f897d039c4d09581.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 276 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000450 0020000C 00000000 00000000 00002C63 00000001 00000010 00000003 00000290 0000000F 00115010 00025011 00035012 00245013 00106014 00007015 00203016 00125017 00035018 00245019 0000004A 0011504B 0002504C 0003504D 0024504E 0000F055 00017156 0002F257 00001059 00001058 0000105A
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> TEXCOORD1
//   vertex element: instruction 17 -> TEXCOORD2
//   vertex element: instruction 18 -> TEXCOORD3
//   vertex element: instruction 19 -> TEXCOORD4
//   vertex element: instruction 20 -> TANGENT0
//   vertex element: instruction 21 -> BINORMAL0
//   vertex element: instruction 22 -> NORMAL0
//   vertex element: instruction 23 -> TEXCOORD2
//   vertex element: instruction 24 -> TEXCOORD3
//   vertex element: instruction 25 -> TEXCOORD4
//   vertex element: instruction 74 -> POSITION0
//   vertex element: instruction 75 -> TEXCOORD1
//   vertex element: instruction 76 -> TEXCOORD2
//   vertex element: instruction 77 -> TEXCOORD3
//   vertex element: instruction 78 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
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
float4 InvNumVerticesPerInstance : register(c14); // float
float4 NumVerticesPerInstance : register(c15); // float
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r1 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r2.w = ps;
    ps = trunc(r2.w);
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r3.w = r0.y + r0.x;
    r8 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r10.xyz = In.texcoord2.xyz;
    r11.xyz = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r2.xyz = In.tangent0.xyz;
    r3.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.xyz;
    r5.xyz = In.texcoord2.xyz;
    r4.yzw = In.texcoord3.xyz;
    r9.xyz = In.texcoord4.xyz;
    r6.xyz = r6.yxz * 0.007843138 - 1.0;
    r3.yzw = r3.xzy * 0.007843138 - 1.0;
    r7.xyz = r2.zyx * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r8.www;
    r2 = r8.wwww * ViewProjectionMatrix[3].xwzy;
    r0.yzw = r12.xyz * r8.zzz + r0.ywz;
    r0.yzw = r11.xzy * r8.yyy + r0.ywz;
    r8.xyz = r10.xyz * r8.xxx + r0.ywz;
    r2 = r8.zzzz * ViewProjectionMatrix[2].xwzy + r2;
    r10.xyz = -r8.zyx * CameraPosition.www + CameraPosition.zyx;
    ps = FogMaxHeight.w;
    r0.yzw = r8.xyz - CameraPosition.xyz;
    ps = -CameraPosition.z + ps;
    r0.z = dot(r0.wyz, r0.wyz);
    r4.x = ps;
    ps = FogMaxHeight.z;
    r5.x = dot(r10.xzy, r5.zxy);
    ps = -CameraPosition.z + ps;
    r5.y = dot(r10.xzy, r4.wyz);
    r4.y = ps;
    ps = FogMaxHeight.y;
    r5.z = dot(r10.xzy, r9.zxy);
    ps = -CameraPosition.z + ps;
    r0.y = float((0.001 >= abs(r0.w)));
    r4.z = ps;
    r2 = r8.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r2 = r8.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    r0.y = (r0.y == 0.0) ? r0.w : 0.001;
    ps = FogMaxHeight.x;
    r3.x = dot(r7.xzy, r5.zxy);
    ps = -CameraPosition.z + ps;
    r3.y = dot(r3.zyw, r5.zxy);
    r4.w = ps;
    ps = sqrt(abs(r0.z));
    r3.z = dot(r6.zyx, r5.zxy);
    r0.z = ps;
    ps = 1.0 / r0.y;
    r5 = r0.zzzz - FogStartDistance.wzyx;
    r0.y = ps;
    r4 = saturate(r4.wyxz * r0.yyyy);
    r1 = saturate(r1.wyxz * r0.yyyy);
    r5 = max(r5, 0.0);
    r0.yzw = r5.xyz * FogDistanceScale.wzy;
    r4 = r4.zwyx - r1.zwyx;
    r0.yzw = r0.wyz * abs(r4.yxz);
    ps = pow(2.0, r0.y);
    r1.x = abs(r4.w) * FogDistanceScale.x;
    r1.y = ps;
    ps = pow(2.0, r0.w);
    r4 = abs(r4.xwyz) * r5.xwzy;
    r1.z = ps;
    ps = pow(2.0, r0.z);
    r0.y = r1.x * r5.w;
    r1.w = ps;
    ps = pow(2.0, r0.y);
    r4 = float4((FogExtinctionDistance.wzxy > r4.xwyz));
    r1.x = ps;
    r5 = r4.zwyx * r1;
    ps = r5.y * r5.x;
    r1 = r5.zwyx - 1.0;
    r6.w = ps;
    ps = r1.x;
    r4.xyz = r1.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r6.xyz = r1.www * FogInScattering[0].xyz;
    r0.y = ps;
    ps = FogInScattering[2].y * r1.x;
    r6 = r5.yyyz * r6;
    r0.z = ps;
    ps = FogInScattering[2].z * r1.x;
    r1.y = r5.w * r6.w;
    r0.w = ps;
    r1.xzw = r1.zzz * FogInScattering[1].xyz + r6.xyz;
    r0.yzw = r5.zzz * r1.xzw + r0.yzw;
    r1.xzw = r5.www * r0.yzw + r4.xyz;
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
    o1.xyz = r3.xyz;
    o0 = r2;
    o2 = r1.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
