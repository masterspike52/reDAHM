// vs_25db56fa6507dd5e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 357 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000594 00610010 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 0010000B 0000600C 0000700D 0000300E 0000500F 00215010 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 00001073 00001074 00001071 00001075 00001072 00001070 0000106F
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> TANGENT0
//   vertex element: instruction 13 -> BINORMAL0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TEXCOORD0
//   vertex element: instruction 16 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r9 = In.position0;
    r1.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r2.xyz = In.normal0.xyz;
    r10.xy = In.texcoord0.xy;
    r10.zw = In.texcoord1.yx;
    r4 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    ps = 0.007843138 * r0.y;
    r3.zw = r2.xy * 0.007843138;
    r3.x = ps;
    r1.w = r0.z * 0.007843138 - 1.0;
    r5.w = r2.z * 0.007843138 - 1.0;
    r6.xyz = r1.xyz * 0.007843138 - 1.0;
    ps = 0.007843138 * r0.w;
    r0.x = dot(SecondDensityFunctionParameters.zxyw, r4);
    r3.y = ps;
    ps = (-r0.x > 0.0) ? 1.0 : 0.0;
    r11 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r8.w = ps;
    ps = r1.w;
    r0 = r9.wwww * LocalToWorld[3].xzyw;
    r0 = r9.zzzz * LocalToWorld[2].xzyw + r0;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0;
    ps = r5.w * ps;
    r4 = r3 - 1.0;
    r15.x = ps;
    ps = r4.x * r4.w;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r15.z = ps;
    ps = r4.x;
    r7.xyz = r2.xyz * 0.003921569;
    ps = r5.w * ps;
    r2.z = r1.w * r4.z;
    r15.y = ps;
    ps = r4.y * r4.w;
    r8.xyz = r1.xyz * 0.003921569;
    r2.x = ps;
    r3 = r9.xxxx * LocalToWorld[0].yxzw + r0.zxyw;
    ps = r4.y * r4.z;
    r13.xyz = -r3.zxy + FogVolumeBoxMax.zyx;
    r2.y = ps;
    r16 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r3.zyxx : 1.0;
    ps = r3.z;
    r12.xyz = -r3.zxy + FogVolumeBoxMin.zyx;
    r0.x = ps;
    ps = CameraPosition.z - r0.x;
    r0.yzw = r3.yzx - CameraPosition.xzy;
    r5.z = ps;
    ps = CameraPosition.y - r3.x;
    r1.x = dot(r0.zyw, r0.zyw);
    r5.y = ps;
    ps = CameraPosition.x - r3.y;
    r15.xyz = r15.xyz - r2.xyz;
    r5.x = ps;
    ps = -r6.y;
    r0.x = dot(r5.zxy, SecondDensityFunctionParameters.zxy);
    r6.w = ps;
    ps = 1.0 / r5.z;
    r0.y = float((0.001 >= abs(r0.z)));
    r2.x = ps;
    ps = 1.0 / r5.x;
    r0.w = dot(SecondDensityFunctionParameters.zxyw, r16);
    r2.y = ps;
    r0.y = (r0.y == 0.0) ? r0.z : 0.001;
    ps = 1.0 / r5.y;
    r0.z = dot(r6.xwz, r15.xyz);
    r2.z = ps;
    r7.w = r0.z * 0.5 + 0.5;
    ps = 0.0001 + r0.x;
    r12.xyz = r12.xzy * r2.xyz;
    r0.z = ps;
    ps = sqrt(abs(r1.x));
    r2.xyz = r13.zxy * r2.yxz;
    r1.x = ps;
    ps = 1.0 / r0.z;
    r13 = r1.xxxx - FogStartDistance.wzyx;
    r0.z = ps;
    ps = (-r0.w > 0.0) ? 1.0 : 0.0;
    r0.z = -r0.w * r0.z;
    r12.w = ps;
    ps = 1.0 / r0.y;
    r1.xyz = min(r12.xzy, r2.yzx);
    r0.y = ps;
    ps = max(r1.y, r1.x);
    r12.xyz = max(r12.xzy, r2.yzx);
    r2.w = ps;
    ps = min(r12.y, r12.x);
    r14 = saturate(r14.wzyx * r0.yyyy);
    r6.w = ps;
    ps = 1.0 - r0.z;
    r11 = saturate(r11.wzyx * r0.yyyy);
    r0.y = ps;
    ps = -r0.z;
    r13 = max(r13, 0.0);
    ps = r12.w * ps;
    r2.xyz = r13.xyz * FogDistanceScale.wzy;
    r12.y = ps;
    ps = r0.y;
    r11 = r14.wzyx - r11.wzyx;
    ps = r8.w * ps;
    r0.y = abs(r11.w) * FogDistanceScale.x;
    r12.x = ps;
    ps = r2.w;
    r1.y = saturate(min(r6.w, r12.z));
    r1.x = ps;
    ps = r1.z;
    r2.xyz = r2.xzy * abs(r11.xzy);
    r1.z = ps;
    ps = max(r1.x, r1.z);
    r11 = abs(r11) * r13;
    r1.x = saturate(ps);
    ps = pow(2.0, r2.y);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r1.z = r0.y * r13.w;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.yz = r0.zz + r12.xy;
    r2.w = ps;
    ps = pow(2.0, r1.z);
    r1.x = max(r1.x, r0.z);
    r2.x = ps;
    r12 = r11.wzyx * r2;
    ps = r12.y * r12.x;
    r1.y = min(r1.y, r0.y);
    r0.z = ps;
    ps = r12.w;
    r2 = r12.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r1.z = r12.z * r0.z;
    r0.z = ps;
    ps = r2.x;
    r8.w = float((r1.x >= r1.y));
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r13.xyz = r2.yyy * FogInScattering[2].xyz;
    r11.x = ps;
    ps = FogInScattering[3].y * r2.x;
    r15.xyz = r2.www * FogInScattering[0].xyz;
    r11.y = ps;
    ps = FogInScattering[3].z * r2.x;
    r14.xyz = r2.zzz * FogInScattering[1].xyz;
    r11.z = ps;
    p0 = (r8.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r12.w * r1.z;
    r2.xyz = r12.yyy * r15.xyz + r14.xyz;
    r2.xyz = r12.zzz * r2.xyz + r13.xyz;
    r2.xyz = r12.www * r2.yzx + r11.yzx;
    if (p0)
    {
        r1.xy = float2((-abs(r0.xx) > 0.0));
    }
    r13 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r12.xyz = (float3(0.0, 0.0, 1.0) == 0.0) ? r4.yxx : r1.www;
    r11.xyz = r0.wwz * r1.yxz;
    r14 = r3.zzzz * ViewProjectionMatrix[2].xwzy + r13;
    ps = 0.5 * r1.x;
    r0.y = dot(r5.zxy, r5.zxy);
    r0.z = ps;
    r5.xyz = -r3.zxy * CameraPosition.www + CameraPosition.zyx;
    ps = 0.5 * r1.y;
    r13.xyz = r5.xxx * WorldToLocal[2].xzy;
    r0.w = ps;
    ps = sqrt(abs(r0.y));
    r0.zw = r0.zw * r1.xy;
    r0.y = ps;
    r1 = r3.xxxx * ViewProjectionMatrix[1].xzyw + r14.xzwy;
    r1 = r3.yyyy * ViewProjectionMatrix[0] + r1.xzyw;
    r0.xz = r0.wz * r0.xx + r11.xy;
    r3.xyz = r5.yyy * WorldToLocal[1].xzy + r13.xyz;
    r3.xyz = r5.zzz * WorldToLocal[0].xyz + r3.xzy;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r0.x = r0.x - r0.z;
    r0.y = ps;
    r0.x = r0.y * -r0.x;
    r0.yz = r4.zw * r3.xy;
    ps = 0.0001 * r0.x;
    r0.y = r0.y + r0.z;
    r0.x = ps;
    r0.w = r5.w * r3.z + r0.y;
    ps = pow(2.0, -r0.x);
    r0.x = ps;
    r2.w = r6.w * r0.x;
    r0.y = dot(r6.zxy, r3.zxy);
    ps = 1.0 - r0.x;
    r0.z = dot(r12.xyz, r3.zxy);
    r0.x = ps;
    ps = r11.z;
    r3.xy = r0.xx * ApproxFogColor.zy;
    ps = r0.x * ps;
    r3.xy = r3.xy * r6.ww;
    r3.z = ps;
    r2.xyz = r2.zxy + r3.zyx;
    r3 = r9.wwww * LocalToWorld[3].xwzy;
    r3 = r9.zzzz * LocalToWorld[2].xwzy + r3;
    r3 = r9.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r4 = r9.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    r3 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r3 = r4.wwww * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r4.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o5.xyz = r8.xyz;
    o5.w = 0.0;
    o2.xyz = r0.yzw;
    o4 = r7;
    o0 = r10;
    o1 = r1;
    o3 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.texcoord7 = o3;
    Out.color0 = o4;
    Out.color1 = o5;
    Out.color2 = o6;
    return Out;
}
