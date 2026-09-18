// vs_240521821df29847.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 369 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000005C4 00410011 00000000 00000000 000044A5 00000001 00000005 00000005 00000290 0010000B 0000300C 0000500D 0000100E 0021500F 00003050 0001F151 0002F255 00037356 0004F457 00001075 00001077 00001078 00001076 00001079
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> NORMAL0
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> BLENDWEIGHT0
//   vertex element: instruction 15 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c24); // float3
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c17); // float4
float4 CameraUp : register(c18); // float4
float4 CameraWorldPosition : register(c16); // float4
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c20); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c19); // float4
float4 SecondDensityFunctionParameters : register(c15); // float4
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
    r1 = In.normal0;
    r4.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r0.xzw = r1.www * LocalToWorld[3].xyz;
    r3 = r5.wwww * LocalToWorld[3];
    r0.xzw = r1.zzz * LocalToWorld[2].xzy + r0.xwz;
    r3 = r5.zzzz * LocalToWorld[2] + r3;
    r3 = r5.yyyy * LocalToWorld[1] + r3;
    r0.xzw = r1.yyy * LocalToWorld[1].xyz + r0.xwz;
    r7.xyz = r1.xxx * LocalToWorld[0].xzy + r0.xwz;
    r1 = r5.xxxx * LocalToWorld[0].zxyw + r3.zxyw;
    r9.xyz = -r1.xzy * CameraPosition.www + CameraPosition.zyx;
    r8.xyz = -r1.yzx + CameraPosition.xyz;
    r3.xyz = r1.yzx - SecondDensityFunctionParameters.xyz;
    r6 = r1.wwww * ViewProjectionMatrix[3];
    r6 = r1.xxxx * ViewProjectionMatrix[2] + r6;
    r0.x = dot(r3.zxy, r3.zxy);
    r0.w = dot(r8.zxy, r8.zxy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.z = dot(r8.zxy, r3.zxy);
    r3.x = ps;
    r14.z = r0.x - r3.x;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r10 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4.z = float((ScreenAlignment.x > 1.5));
    r13.xyz = -r1.yzx + CameraWorldPosition.xyz;
    r3.yzw = r1.zxy - CameraPosition.yzx;
    r12.xyz = -r7.xzy + r1.yzx;
    r4.w = dot(r3.zwy, r3.zwy);
    r3.y = dot(r13.zxy, r13.zxy);
    ps = CameraUp.x;
    r3.w = dot(r12.zxy, r12.zxy);
    ps = (-1.0) * ps;
    r7.x = float((0.001 >= abs(r3.z)));
    r1.x = ps;
    r3.z = (-abs(r7.x) >= 0.0) ? r3.z : 0.001;
    r6 = r1.zzzz * ViewProjectionMatrix[1].xzwy + r6.xzwy;
    r6 = r1.yyyy * ViewProjectionMatrix[0] + r6.xwyz;
    ps = sqrt(abs(r4.w));
    r3.yw = max(r3.yw, 0.01);
    r1.y = ps;
    ps = 1.0 / r3.z;
    r7 = r1.yyyy - FogStartDistance.wzyx;
    r1.y = ps;
    ps = r0.z + r0.z;
    r11 = saturate(r10.wzyx * r1.yyyy);
    r3.z = ps;
    ps = 4.0 * r0.w;
    r10 = saturate(r8.wzyx * r1.yyyy);
    r1.z = ps;
    ps = 0.33333334 * r0.w;
    r8 = max(r7, 0.0);
    r1.w = ps;
    ps = rsqrt(abs(r3.y));
    r7.xyz = r8.xyz * FogDistanceScale.wzy;
    r1.y = ps;
    ps = rsqrt(abs(r3.w));
    r13.xyz = r13.zyx * r1.yyy;
    r1.y = ps;
    ps = 0.15915494 * r0.y;
    r12.xyz = r12.zyx * r1.yyy;
    r1.y = ps;
    ps = 0.5 + r1.y;
    r15 = r11.wzyx - r10.wzyx;
    r3.y = ps;
    ps = frac(r3.y);
    r7.xyz = r7.xzy * abs(r15.xzy);
    r3.y = ps;
    r3.w = r3.y * 6.2831855 - 3.1415927;
    ps = 0.0001 + r0.w;
    r10.xyz = r13.xzy * r12.yxz;
    r0.y = ps;
    ps = abs(r15.w);
    r11 = abs(r15) * r8;
    ps = FogDistanceScale.x * ps;
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r3.y = ps;
    r8.xyz = r13.zxy * r12.yzx - r10.zyx;
    ps = cos(r3.w);
    r3.y = r3.y * r8.w;
    r14.y = ps;
    ps = 1.0 / r0.y;
    r13.xyz = r14.yyy * CameraRight.zyx;
    r14.x = ps;
    ps = pow(2.0, r7.y);
    r0.y = dot(r8.xzy, r8.xzy);
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r10.xw = r14.yx * float2(-1.0, 0.5);
    r7.z = ps;
    ps = pow(2.0, r7.x);
    r0.y = max(r0.y, 0.01);
    r7.w = ps;
    ps = sin(r3.w);
    r14.zw = r1.xz * r14.yz;
    r1.x = ps;
    r13.xyz = r1.xxx * CameraUp.zyx + r13.xyz;
    r13.xyz = (-abs(r4.zzz) >= 0.0) ? r13.zyx : r12.zyx;
    ps = pow(2.0, r3.y);
    r14.xy = r10.xx * CameraUp.zy;
    r7.x = ps;
    ps = rsqrt(abs(r0.y));
    r7 = r11.wzyx * r7;
    r0.y = ps;
    ps = r7.y * r7.x;
    r11.xyz = r8.zyx * r0.yyy;
    r1.y = ps;
    ps = r7.w;
    r8 = r7.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r12.xyz = r8.yyy * FogInScattering[2].xyz;
    r3.y = ps;
    ps = r7.z;
    r16.xyz = r8.www * FogInScattering[0].xyz;
    ps = r1.y * ps;
    r15.xyz = r8.zzz * FogInScattering[1].xyz;
    r3.w = ps;
    r17.xyz = r1.xxx * CameraRight.zyx + r14.xyz;
    r11.yzw = (-abs(r4.zzz) >= 0.0) ? r17.zyx : r11.xyz;
    r15.xyz = r7.yyy * r16.xyz + r15.xyz;
    r7.xyz = r7.zzz * r15.xyz + r12.xyz;
    r4.zw = r3.yz * r3.wz;
    r12.xyz = r11.zyw * r13.xzy;
    r12.xyz = r11.ywz * r13.yxz - r12.xyz;
    r0.y = r4.w - r14.w;
    ps = sqrt(abs(r0.y));
    r3.y = r7.w * r3.w;
    r10.y = ps;
    r11.x = r3.z + r10.y;
    r1.y = dot(r9.xzy, r13.zxy);
    r1.x = dot(r9.xzy, r11.wyz);
    r9.w = dot(r12.xzy, r12.xzy);
    ps = rsqrt(abs(r9.w));
    r11.y = r3.z - r10.y;
    r3.z = ps;
    r10.xyz = r12.xyz * r3.zzz;
    r11.xy = saturate(r10.ww * -r11.xy);
    r11.zw = r11.yx * r11.yx;
    r3.zw = r11.zw * r11.yx;
    ps = 1.0 / r3.x;
    r3.zw = r1.ww * r3.zw;
    r1.z = ps;
    r3.z = dot(r11.zy, r0.zx) + r3.z;
    r3.x = dot(r11.wx, r0.zx) + r3.w;
    r0.xz = -r3.zx * r1.zz + r11.yx;
    r0.xz = r0.xz * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r0.w));
    r0.z = r0.x - r0.z;
    r0.x = ps;
    r0.x = r0.z * r0.x;
    r0.x = (r0.y >= 0.0) ? r0.x : 0.0;
    ps = pow(2.0, -r0.x);
    r1.z = dot(-r10.xzy, r9.xzy);
    r0.x = ps;
    ps = 1.0 - r0.x;
    r3.w = r3.y * r0.x;
    r0.z = ps;
    ps = r4.z;
    r0.xy = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r0.yx * r3.yy;
    r0.z = ps;
    r0.xyz = r8.xxx * FogInScattering[3].yzx + r0.xyz;
    r3.xyz = r7.www * r7.xyz + r0.zxy;
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
    o3.xyz = r1.xyz;
    o1 = r2;
    o2 = r6;
    o4 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
