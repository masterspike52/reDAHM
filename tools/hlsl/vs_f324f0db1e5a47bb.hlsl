// vs_f324f0db1e5a47bb.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 333 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000534 00200010 00000000 00000000 00002C63 00000001 00000010 00000003 00000290 00000010 00115011 00025012 00035013 00245014 00106015 00007016 00303017 00125018 00035019 0024501A 0000005D 0011505E 0002505F 00035060 00245061 0000F055 00017156 0002F257 0000106C 0000106B 0000106D
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
//   vertex element: instruction 93 -> POSITION0
//   vertex element: instruction 94 -> TEXCOORD1
//   vertex element: instruction 95 -> TEXCOORD2
//   vertex element: instruction 96 -> TEXCOORD3
//   vertex element: instruction 97 -> TEXCOORD4
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r2.w = ps;
    ps = trunc(r2.w);
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r2.x = r0.y + r0.x;
    r1 = In.position0;
    r0.yzw = In.texcoord1.xyz;
    r9.xyz = In.texcoord2.xyz;
    r11.xyz = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r3.xyz = In.tangent0.xyz;
    r4.xyz = In.binormal0.xyz;
    r2.xyz = In.normal0.xyz;
    r10.xyz = In.texcoord2.xyz;
    r5.yzw = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r2.xzw = r2.yxz * 0.007843138 - 1.0;
    r4.yzw = r4.xzy * 0.007843138 - 1.0;
    r6.xyz = r3.zyx * 0.007843138 - 1.0;
    r0.yzw = r0.ywz * r1.www;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r0.yzw = r12.xyz * r1.zzz + r0.ywz;
    r0.yzw = r11.xzy * r1.yyy + r0.ywz;
    r1.xyz = r9.zxy * r1.xxx + r0.zyw;
    r9.xyz = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = CameraPosition.z;
    r12.xyz = -r1.yzx + FogVolumeBoxMax.xyz;
    ps = -FirstDensityFunctionParameters.y + ps;
    r15.xyz = -r1.yzx + FogVolumeBoxMin.xyz;
    r13.w = ps;
    r3 = r1.xxxx * ViewProjectionMatrix[2] + r3;
    ps = -FirstDensityFunctionParameters.y - -r1.x;
    r16.xyz = -r1.xzy + CameraPosition.zyx;
    r13.z = ps;
    ps = 0.0001 - r1.x;
    r11.xyw = r1.yzx - CameraPosition.xyz;
    r0.y = ps;
    ps = 1.0 / r16.y;
    r1.w = dot(r11.wxy, r11.wxy);
    r11.x = ps;
    ps = 1.0 / r16.x;
    r0.z = dot(r16.xzy, r16.xzy);
    r11.y = ps;
    ps = 1.0 / r16.z;
    r0.w = float((0.001 >= abs(r11.w)));
    r11.z = ps;
    r3 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xwyz;
    r0.w = (r0.w == 0.0) ? r11.w : 0.001;
    ps = sqrt(abs(r0.z));
    r13.xy = float2((-r13.zw > 0.0));
    r0.z = ps;
    ps = CameraPosition.z + r0.y;
    r15.xyz = r15.yzx * r11.xyz;
    r0.y = ps;
    ps = sqrt(abs(r1.w));
    r12.yzw = r12.yzx * r11.xyz;
    r1.x = ps;
    ps = 1.0 / r0.y;
    r11 = r1.xxxx - FogStartDistance.wzyx;
    r0.y = ps;
    ps = 1.0 / r0.w;
    r0.y = -r13.z * r0.y;
    r1.x = ps;
    ps = 1.0 - r0.y;
    r14 = saturate(r14.wyxz * r1.xxxx);
    r0.w = ps;
    ps = -r0.y;
    r7 = saturate(r7.wyxz * r1.xxxx);
    ps = r13.x * ps;
    r1.xyz = min(r15.xzy, r12.ywz);
    r12.x = ps;
    ps = max(r1.x, r1.z);
    r12.yzw = max(r15.xyz, r12.yzw);
    r2.y = ps;
    ps = min(r12.y, r12.z);
    r11 = max(r11.xywz, 0.0);
    r4.x = ps;
    ps = r0.w;
    r7 = r14.zwyx - r7.zwyx;
    ps = r13.y * ps;
    r0.w = abs(r7.w) * FogDistanceScale.x;
    r12.y = ps;
    ps = r4.x;
    r1.xzw = r11.xyw * FogDistanceScale.wzy;
    r12.z = ps;
    ps = r12.w;
    r1.y = saturate(max(r2.y, r1.y));
    r12.w = ps;
    ps = min(r12.z, r12.w);
    r1.xzw = r1.wzx * abs(r7.yzx);
    r2.y = saturate(ps);
    ps = r0.w;
    r7 = abs(r7.xwyz) * r11.xzwy;
    ps = r11.z * ps;
    r11.xy = r0.yy + r12.xy;
    r0.w = ps;
    ps = pow(2.0, r1.w);
    r7 = float4((FogExtinctionDistance.zxyw > r7.wyzx));
    r0.y = ps;
    ps = pow(2.0, r1.x);
    r1.w = max(r1.y, r11.x);
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r1.x = min(r2.y, r11.y);
    r1.z = ps;
    ps = pow(2.0, r0.w);
    r4.x = saturate(-r1.w + r1.x);
    r1.x = ps;
    r5.x = dot(r9.xzy, r10.zxy);
    r5.y = dot(r9.xzy, r5.wyz);
    r5.z = dot(r9.xzy, r8.zxy);
    r2.y = dot(r4.zyw, r5.zxy);
    r2.z = dot(r2.wzx, r5.zxy);
    r8.yzw = r7.yzx * r1.xyz;
    ps = FirstDensityFunctionParameters.x * r0.z;
    r7.xyz = r8.wyz - 1.0;
    r8.x = ps;
    ps = r8.z * r8.y;
    r1.xyz = r7.yyy * FogInScattering[0].xyz;
    r1.w = ps;
    ps = r7.w;
    r1 = r8.zzzw * r1;
    r4.yzw = r7.zzz * FogInScattering[1].xyz + r1.xyz;
    ps = r0.y * ps;
    r4 = r8.wwwx * r4.yzwx;
    r1.x = ps;
    r4.xyz = r7.xxx * FogInScattering[2].xzy + r4.xzy;
    ps = pow(2.0, -r4.w);
    r1.z = r1.x * r1.w;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r2.x = dot(r6.xzy, r5.zxy);
    r1.y = ps;
    ps = (-1.0) - -r1.x;
    r5.yzw = r1.xyy * ApproxFogColor.xzy;
    r0.z = ps;
    ps = r1.z;
    r5.x = r5.y * r1.w;
    ps = r0.y * ps;
    r5.xyz = r5.xwz * r1.yzz;
    r1.y = ps;
    r0.yzw = r0.zzz * FogInScattering[3].xyz + r5.xyz;
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
