// vs_5830c460dbef8f23.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 282 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000468 0041000D 00000000 00000000 000044A5 00000001 00000005 00000005 00000290 00100009 0000300A 0000500B 0000100C 0021500D 00003050 0001F151 0002F255 00037356 0004F457 00001058 0000105A 0000105B 00001059 0000105C
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> BLENDWEIGHT0
//   vertex element: instruction 13 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c15); // float4
float4 CameraUp : register(c16); // float4
float4 CameraWorldPosition : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c18); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c17); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r3 = In.normal0;
    r4.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.z = r0.y * 0.15915494 + 0.5;
    r0.xyw = r3.www * LocalToWorld[3].xyz;
    r0.xyw = r3.zzz * LocalToWorld[2].xzy + r0.xwy;
    ps = frac(r0.z);
    r1 = r5.wwww * LocalToWorld[3];
    r0.z = ps;
    r1 = r5.zzzz * LocalToWorld[2] + r1;
    r1 = r5.yyyy * LocalToWorld[1] + r1;
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r0.xyw = r3.yyy * LocalToWorld[1].xyz + r0.xwy;
    r3.xyz = r3.xxx * LocalToWorld[0].xzy + r0.xwy;
    ps = cos(r0.z);
    r0.y = CameraUp.x * (-1.0);
    r0.x = ps;
    r1 = r5.xxxx * LocalToWorld[0].yzxw + r1.yzxw;
    r7.xyz = -r1.yxz * CameraPosition.www + CameraPosition.zyx;
    r8.z = r0.y * r0.x;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r12 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4.z = float((ScreenAlignment.x > 1.5));
    ps = r1.z;
    r10.xyz = r0.xxx * CameraRight.zyx;
    r0.y = ps;
    ps = CameraWorldPosition.x - r0.y;
    r8.xyw = r1.xzy - CameraPosition.yxz;
    r11.x = ps;
    ps = CameraWorldPosition.y - r1.x;
    r6.xyz = r1.zxy - r3.xzy;
    r11.y = ps;
    ps = sin(r0.z);
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r0.y = ps;
    r10.xyz = r0.yyy * CameraUp.zyx + r10.xyz;
    ps = CameraWorldPosition.z - r1.y;
    r0.w = dot(r8.wyx, r8.wyx);
    r11.z = ps;
    ps = (-1.0) * r0.x;
    r13.x = dot(r11.zxy, r11.zxy);
    r0.x = ps;
    ps = CameraUp.z * r0.x;
    r13.y = dot(r6.zxy, r6.zxy);
    r8.x = ps;
    r3 = r1.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    ps = CameraUp.y * r0.x;
    r0.z = float((0.001 >= abs(r8.w)));
    r8.y = ps;
    r0.z = (-abs(r0.z) >= 0.0) ? r8.w : 0.001;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.zzzz * ViewProjectionMatrix[0] + r3.xzyw;
    r8.xyz = r0.yyy * CameraRight.zyx + r8.xyz;
    ps = sqrt(abs(r0.w));
    r0.xy = max(r13.xy, 0.01);
    r0.w = ps;
    ps = 1.0 / r0.z;
    r1 = r0.wwww - FogStartDistance.wzyx;
    r0.w = ps;
    r13 = saturate(r12.wzyx * r0.wwww);
    ps = rsqrt(abs(r0.x));
    r1 = max(r1.yxzw, 0.0);
    r0.z = ps;
    ps = r1.y;
    r9 = saturate(r9.wzyx * r0.wwww);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r12.xyz = r11.zyx * r0.zzz;
    r0.y = ps;
    ps = FogDistanceScale.w * r0.x;
    r11.xyz = r6.zyx * r0.yyy;
    r6.x = ps;
    ps = FogDistanceScale.z * r1.x;
    r13 = r13.wzyx - r9.wzyx;
    r6.y = ps;
    ps = FogDistanceScale.y * r1.z;
    r0.xyz = r12.xzy * r11.yxz;
    r6.z = ps;
    r6.xyz = r6.xzy * abs(r13.xzy);
    ps = abs(r13.w);
    r9 = abs(r13) * r1.yxzw;
    r10.yzw = (-abs(r4.zzz) >= 0.0) ? r10.zyx : r11.zyx;
    ps = FogDistanceScale.x * ps;
    r1.x = dot(r7.xzy, r10.wyz);
    r0.w = ps;
    ps = pow(2.0, r6.y);
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r1.y = r0.w * r1.w;
    r6.z = ps;
    r0.yzw = r12.zxy * r11.yzx - r0.zyx;
    ps = pow(2.0, r6.x);
    r0.x = dot(r0.ywz, r0.ywz);
    r6.w = ps;
    ps = pow(2.0, r1.y);
    r0.x = max(r0.x, 0.01);
    r6.x = ps;
    ps = rsqrt(abs(r0.x));
    r9 = r9.wzyx * r6;
    r0.x = ps;
    r1.yzw = r0.wzy * r0.xxx;
    r0 = r9.zwyx - 1.0;
    r6.xyz = r0.yyy * FogInScattering[3].xyz;
    ps = r9.y * r9.x;
    r11.xyz = r0.www * FogInScattering[0].xyz;
    r11.w = ps;
    r12.xyz = (-abs(r4.zzz) >= 0.0) ? r8.zyx : r1.yzw;
    ps = r0.x;
    r1.y = dot(r7.xzy, r12.zxy);
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r8.xyz = r12.yxz * r10.ywz;
    r10.x = ps;
    r8.xyz = r12.xzy * r10.zyw - r8.xyz;
    ps = FogInScattering[2].y * r0.x;
    r11 = r9.yyyz * r11;
    r10.y = ps;
    r11.xyz = r0.zzz * FogInScattering[1].xyz + r11.xyz;
    ps = FogInScattering[2].z * r0.x;
    r1.z = dot(r8.xzy, r8.xzy);
    r10.z = ps;
    ps = rsqrt(abs(r1.z));
    r6.w = r9.w * r11.w;
    r0.x = ps;
    r0.yzw = r9.zzz * r11.xyz + r10.xyz;
    r6.xyz = r9.www * r0.yzw + r6.xyz;
    r0.xyz = r8.xyz * r0.xxx;
    r1.z = dot(-r0.xzy, r7.xzy);
    r0 = r5.wwww * LocalToWorld[3].xwzy;
    r0 = r5.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r5.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r5 = r5.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r5.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r5.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r5.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r4.xy;
    o3.xyz = r1.yxz;
    o1 = r2;
    o2 = r3;
    o4 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
