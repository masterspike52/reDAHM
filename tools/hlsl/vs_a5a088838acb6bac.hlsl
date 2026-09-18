// vs_a5a088838acb6bac.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 348 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000570 0020000D 00000000 00000000 00002C63 00000001 00000010 00000003 00000290 00000011 00115012 00025013 00035014 00245015 00106016 00007017 00203018 00125019 0003501A 0024501B 00000062 00115063 00025064 00035065 00245066 0000F055 00017156 0002F257 00001071 00001070 00001072
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
//   vertex element: instruction 98 -> POSITION0
//   vertex element: instruction 99 -> TEXCOORD1
//   vertex element: instruction 100 -> TEXCOORD2
//   vertex element: instruction 101 -> TEXCOORD3
//   vertex element: instruction 102 -> TEXCOORD4
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r0.y = r0.x + 0.5;
    ps = InvNumVerticesPerInstance.x * r0.y;
    r5 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.z = ps;
    ps = trunc(r0.z);
    r4 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.y = ps;
    ps = NumVerticesPerInstance.x * r0.y;
    r0.y = ps;
    ps = trunc(-r0.y);
    r0.y = ps;
    r0.y = r0.y + r0.x;
    r1 = In.position0;
    r3.xyz = In.texcoord1.xyz;
    r11.xyz = In.texcoord2.xyz;
    r12.xyz = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r6.yzw = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r7.xyz = In.normal0.xyz;
    r10.yzw = In.texcoord2.xyz;
    r8.yzw = In.texcoord3.xyz;
    r9.yzw = In.texcoord4.xyz;
    r7.xyz = r7.yxz * 0.007843138 - 1.0;
    r2.yzw = r2.xzy * 0.007843138 - 1.0;
    r0.yzw = r3.xzy * r1.www;
    r3 = r1.wwww * ViewProjectionMatrix[3];
    r0.yzw = r13.xyz * r1.zzz + r0.ywz;
    r0.yzw = r12.xzy * r1.yyy + r0.ywz;
    r0.yzw = r11.zxy * r1.xxx + r0.zyw;
    r1 = r0.yyyy * ViewProjectionMatrix[2] + r3;
    r11.xyz = -r0.ywz * CameraPosition.www + CameraPosition.zyx;
    r3.xyw = r0.zwy - CameraPosition.xyz;
    ps = CameraPosition.x - r0.z;
    r2.x = dot(r3.wxy, r3.wxy);
    r10.x = ps;
    ps = CameraPosition.y - r0.w;
    r8.x = dot(r11.xzy, r10.wyz);
    r10.y = ps;
    ps = -SecondDensityFunctionParameters.x - -r0.z;
    r8.y = dot(r11.xzy, r8.wyz);
    r9.x = ps;
    ps = -SecondDensityFunctionParameters.y - -r0.w;
    r8.z = dot(r11.xzy, r9.wyz);
    r9.y = ps;
    ps = -SecondDensityFunctionParameters.z - -r0.y;
    r3.z = float((0.001 >= abs(r3.w)));
    r9.z = ps;
    ps = CameraPosition.z - r0.y;
    r3.x = dot(r9.zxy, r9.zxy);
    r10.z = ps;
    r0.y = dot(r10.zxy, r10.zxy);
    r3.y = dot(r10.zxy, r9.zxy);
    r1 = r0.wwww * ViewProjectionMatrix[1].xzwy + r1.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[0] + r1.xwyz;
    r0.z = (r3.z == 0.0) ? r3.w : 0.001;
    r2.y = dot(r2.zyw, r8.zxy);
    ps = sqrt(abs(r2.x));
    r2.z = dot(r7.zyx, r8.zxy);
    r0.w = ps;
    ps = 1.0 / r0.z;
    r9 = r0.wwww - FogStartDistance.wzyx;
    r0.z = ps;
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r7 = saturate(r5.wzyx * r0.zzzz);
    r0.w = ps;
    ps = r3.y + r3.y;
    r5 = saturate(r4.wzyx * r0.zzzz);
    r4.y = ps;
    ps = 0.0001 + r0.y;
    r9 = max(r9, 0.0);
    r0.z = ps;
    ps = r3.x;
    r4.xzw = r9.xyz * FogDistanceScale.wzy;
    ps = -r0.w + ps;
    r7 = r7.wzyx - r5.wzyx;
    r3.z = ps;
    ps = 4.0 * r0.y;
    r4.xzw = r4.xzw * abs(r7.xyz);
    r3.w = ps;
    ps = pow(2.0, r4.w);
    r2.x = abs(r7.w) * FogDistanceScale.x;
    r5.y = ps;
    ps = pow(2.0, r4.z);
    r7 = abs(r7) * r9;
    r5.z = ps;
    ps = pow(2.0, r4.x);
    r2.x = r2.x * r9.w;
    r5.w = ps;
    ps = pow(2.0, r2.x);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r5.x = ps;
    ps = 1.0 / r0.z;
    r5 = r7.wzyx * r5;
    r6.x = ps;
    ps = r5.y * r5.x;
    r7 = r6 * float4(0.5, 0.007843138, 0.007843138, 0.007843138);
    r2.x = ps;
    ps = r5.w;
    r6 = r5.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r9.xyz = r6.yyy * FogInScattering[2].xyz;
    r4.x = ps;
    ps = r5.z;
    r11.xyz = r6.www * FogInScattering[0].xyz;
    ps = r2.x * ps;
    r10.xyz = r6.zzz * FogInScattering[1].xyz;
    r4.z = ps;
    r10.xyz = r5.yyy * r11.xyz + r10.xyz;
    r5.xyz = r5.zzz * r10.xyz + r9.xyz;
    ps = 0.33333334 * r0.y;
    r2.xw = r4.yx * r4.yz;
    r4.w = ps;
    r0.z = -r3.w * r3.z + r2.x;
    ps = sqrt(abs(r0.z));
    r9.xyz = r7.wzy - 1.0;
    r3.z = ps;
    ps = r4.y;
    r2.x = dot(r9.xzy, r8.zxy);
    ps = r3.z + ps;
    r3.w = r4.y - r3.z;
    r3.z = ps;
    r7.xy = saturate(r7.xx * -r3.zw);
    r7.zw = r7.yx * r7.yx;
    r3.zw = r7.zw * r7.yx;
    ps = 1.0 / r0.w;
    r3.zw = r4.ww * r3.wz;
    r0.w = ps;
    r3.w = dot(r7.zy, r3.yx) + r3.w;
    r3.z = dot(r7.wx, r3.yx) + r3.z;
    r3.xy = -r3.wz * r0.ww + r7.yx;
    r3.xy = r3.xy * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.y));
    r0.w = r3.x - r3.y;
    r0.y = ps;
    r0.y = r0.w * r0.y;
    r0.y = (r0.z >= 0.0) ? r0.y : 0.0;
    ps = pow(2.0, -r0.y);
    r0.z = r5.w * r4.z;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r3.w = r0.z * r0.y;
    r0.y = ps;
    ps = r2.w;
    r3.xy = r0.yy * ApproxFogColor.zy;
    ps = r0.y * ps;
    r0.zw = r3.yx * r0.zz;
    r0.y = ps;
    r0.yzw = r6.xxx * FogInScattering[3].xyz + r0.yzw;
    r3.xyz = r5.www * r5.xyz + r0.yzw;
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
    o0 = r1;
    o2 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord5 = o0;
    Out.texcoord6 = o1;
    Out.texcoord7 = o2;
    return Out;
}
