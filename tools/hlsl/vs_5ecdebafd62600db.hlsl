// vs_5ecdebafd62600db.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 306 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004C8 0061000E 00000000 00000000 000064E7 00000001 00000005 00000007 00000290 0010000A 0000300B 0000500C 0000100D 0021500E 00003050 0001F151 0002F255 00037356 0004F457 0005F5A0 0006F6A1 0000105E 00001062 00001063 00001060 00001064 00001061 0000105F
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> TEXCOORD0
//   vertex element: instruction 13 -> BLENDWEIGHT0
//   vertex element: instruction 14 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
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
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r7 = In.position0;
    r3 = In.normal0;
    r5.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.x = r0.y * 0.15915494 + 0.5;
    r0.yzw = r3.www * LocalToWorld[3].xyz;
    r0.yzw = r3.zzz * LocalToWorld[2].xzy + r0.ywz;
    ps = frac(r0.x);
    r1 = r7.wwww * LocalToWorld[3];
    r0.x = ps;
    r1 = r7.zzzz * LocalToWorld[2] + r1;
    r1 = r7.yyyy * LocalToWorld[1] + r1;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r0.yzw = r3.yyy * LocalToWorld[1].xyz + r0.ywz;
    r3.xyz = r3.xxx * LocalToWorld[0].xzy + r0.ywz;
    ps = cos(r0.x);
    r10 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.w = ps;
    r1 = r7.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    r11.xyz = -r1.zxy * CameraPosition.www + CameraPosition.zyx;
    ps = sin(r0.x);
    r0.z = r0.w * (-1.0);
    r0.y = ps;
    ps = CameraRight.z * r0.w;
    r5.z = float((ScreenAlignment.x > 1.5));
    r9.x = ps;
    ps = CameraRight.y * r0.w;
    r6.xyz = r0.yyy * CameraRight.zyx;
    r9.y = ps;
    ps = CameraRight.x * r0.w;
    r13.xyz = r1.yxz - CameraPosition.xyz;
    r9.z = ps;
    ps = r1.z;
    r4.xyz = r1.yxz - r3.xzy;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r3 = r1.wwww * ViewProjectionMatrix[3].xwzy;
    r12.x = ps;
    r6.xyz = r0.zzz * CameraUp.zyx + r6.xyz;
    r9.xyz = r0.yyy * CameraUp.zyx + r9.xyz;
    ps = CameraWorldPosition.y - r1.x;
    r0.w = dot(r13.zxy, r13.zxy);
    r12.y = ps;
    ps = CameraWorldPosition.x - r1.y;
    r0.x = dot(r4.zxy, r4.zxy);
    r12.z = ps;
    r0.y = dot(r12.xzy, r12.xzy);
    r3 = r1.zzzz * ViewProjectionMatrix[2].xwzy + r3;
    r0.z = float((0.001 >= abs(r13.z)));
    r0.z = (-abs(r0.z) >= 0.0) ? r13.z : 0.001;
    r3 = r1.xxxx * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r1.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    ps = sqrt(abs(r0.w));
    r0.xy = max(r0.yx, 0.01);
    r0.w = ps;
    ps = 1.0 / r0.z;
    r1 = r0.wwww - FogStartDistance.wzyx;
    r0.w = ps;
    r10 = saturate(r10.wyxz * r0.wwww);
    ps = rsqrt(abs(r0.x));
    r1 = max(r1.yxzw, 0.0);
    r0.z = ps;
    ps = r1.y;
    r8 = saturate(r8.wyxz * r0.wwww);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r13.xyz = r12.xyz * r0.zzz;
    r0.y = ps;
    ps = FogDistanceScale.w * r0.x;
    r12.xyz = r4.zyx * r0.yyy;
    r4.x = ps;
    ps = FogDistanceScale.z * r1.x;
    r10 = r10.zwyx - r8.zwyx;
    r4.y = ps;
    ps = FogDistanceScale.y * r1.z;
    r0.xyz = r13.xzy * r12.yxz;
    r4.z = ps;
    r4.xzw = r4.xzy * abs(r10.xyz);
    ps = abs(r10.w);
    r8 = abs(r10.xwyz) * r1.ywzx;
    r10.xyz = (-abs(r5.zzz) >= 0.0) ? r9.zyx : r12.zyx;
    ps = FogDistanceScale.x * ps;
    r4.y = dot(r11.xzy, r10.zxy);
    r0.w = ps;
    ps = pow(2.0, r4.z);
    r9 = float4((FogExtinctionDistance.wzxy > r8.xwyz));
    r8.y = ps;
    ps = pow(2.0, r4.w);
    r1.x = r0.w * r1.w;
    r8.z = ps;
    r0.yzw = r13.zxy * r12.yzx - r0.zyx;
    ps = pow(2.0, r4.x);
    r0.x = dot(r0.ywz, r0.ywz);
    r8.w = ps;
    ps = pow(2.0, r1.x);
    r0.x = max(r0.x, 0.01);
    r8.x = ps;
    ps = rsqrt(abs(r0.x));
    r8 = r9.yxwz * r8.zwyx;
    r0.x = ps;
    r4.xzw = r0.wzy * r0.xxx;
    r0 = r8 - 1.0;
    r1.xyz = r0.yyy * FogInScattering[3].xyz;
    ps = r8.z * r8.w;
    r14.xyz = r0.www * FogInScattering[0].xyz;
    r14.w = ps;
    r9.xzw = (-abs(r5.zzz) >= 0.0) ? r6.zxy : r4.xwz;
    ps = r0.x;
    r4.x = dot(r11.xzy, r9.zxw);
    r0.y = ps;
    r6.xyz = r9.xwz * 0.5 + 0.5;
    ps = FogInScattering[2].x * r0.y;
    r12.xyz = r9.wxz * r10.xzy;
    r13.x = ps;
    r12.xyz = r9.xzw * r10.yxz - r12.xyz;
    ps = FogInScattering[2].y * r0.x;
    r14 = r8.zzzx * r14;
    r13.y = ps;
    r14.xyz = r0.zzz * FogInScattering[1].xyz + r14.xyz;
    ps = FogInScattering[2].z * r0.x;
    r1.w = dot(r12.xzy, r12.xzy);
    r13.z = ps;
    ps = rsqrt(abs(r1.w));
    r8.w = r8.y * r14.w;
    r0.x = ps;
    r0.yzw = r8.xxx * r14.xyz + r13.xyz;
    r8.xyz = r8.yyy * r0.yzw + r1.xyz;
    r1.xyz = r12.xyz * r0.xxx;
    r0.xyz = r12.xyz * -r0.xxx;
    r4.z = dot(-r1.xzy, r11.xzy);
    ps = -r9.w;
    r1.xyz = r0.yzz * r10.zzy;
    r9.y = ps;
    r1.xyz = r0.xxy * r10.yxx - r1.xyz;
    r0.w = dot(r9.xyz, r1.xyz);
    r1 = r0.zyxw * 0.5 + 0.5;
    r0 = r7.wwww * LocalToWorld[3].xwzy;
    r0 = r7.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r7.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r7.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r5.xy;
    o6.xyz = r6.xyz;
    o6.w = 0.0;
    o3.xyz = r4.xyz;
    o5 = r1;
    o1 = r2;
    o2 = r3;
    o4 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
