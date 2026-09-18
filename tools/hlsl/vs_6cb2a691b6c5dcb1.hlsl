// vs_6cb2a691b6c5dcb1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003B4 0061000C 00000000 00000000 00006CE7 00000001 00000005 00000007 00000290 00100008 00006009 0000700A 0000300B 0020500C 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 0000104B 0000104C 00001049 0000104D 0000104A 00001048 00001047
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> BINORMAL0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> TEXCOORD0
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

float4 CameraPosition : register(c4); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c14); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c18); // float3x3 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r6 = In.position0;
    r12.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xzw = In.normal0.xyz;
    r2.xy = In.texcoord0.xy;
    r2.z = 0.0;
    r7 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r8 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r4.yzw = r0.ywz * 0.007843138 - 1.0;
    r10.xyz = r1.zxw * 0.007843138 - 1.0;
    r0 = r6.wwww * LocalToWorld[3].xzyw;
    r11.xzw = r12.xzy * 0.007843138 - 1.0;
    r0 = r6.zzzz * LocalToWorld[2].xzyw + r0;
    r3.xyz = r4.zzw * r10.xyy;
    r11.y = -r11.w;
    r3.xyz = r4.wyy * r10.zzx - r3.xyz;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r6.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r1.y = dot(r11.xyz, r3.xyz);
    r1.y = r1.y * 0.5 + 0.5;
    r5.xyw = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    r9.xyw = r0.yzx - CameraPosition.xyz;
    r3 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r3 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    r4.x = dot(r9.wxy, r9.wxy);
    r9.xyz = r5.xxx * WorldToLocal[2].xzy;
    r2.w = float((0.001 >= abs(r9.w)));
    r2.w = (r2.w == 0.0) ? r9.w : 0.001;
    r9.xyz = r5.yyy * WorldToLocal[1].xzy + r9.xyz;
    r5.xyz = r12.xyz * 0.003921569;
    r0.x = sqrt(abs(r4.x));
    r3 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r0.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r9.xyz = r5.www * WorldToLocal[0].xyz + r9.xzy;
    r4.x = dot(r11.zxw, r9.zxy);
    r4.y = dot(r4.zyw, r9.zxy);
    r4.z = dot(r10.zyx, r9.zxy);
    r2.w = 1.0 / r2.w;
    r9 = saturate(r8.wzyx * r2.wwww);
    r7 = saturate(r7.wzyx * r2.wwww);
    r8 = max(r0, 0.0);
    r0.xyz = r8.xyz * FogDistanceScale.wzy;
    r7 = r9.wzyx - r7.wzyx;
    r1.x = 0.003921569 * r1.x;
    r0.xyw = r0.yzx * abs(r7.yzx);
    r1.z = 0.003921569 * r1.z;
    r2.w = abs(r7.w) * FogDistanceScale.x;
    r0.y = pow(2.0, r0.y);
    r7 = abs(r7) * r8;
    r0.z = pow(2.0, r0.x);
    ps = pow(2.0, r0.w);
    r0.x = r2.w * r8.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r7 = float4((FogExtinctionDistance.wzyx > r7));
    r0.x = ps;
    ps = 0.003921569 * r1.w;
    r8 = r7.wzyx * r0;
    r1.w = ps;
    ps = r8.y * r8.x;
    r0 = r8.zwyx - 1.0;
    r10.w = ps;
    ps = r0.x;
    r7.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r10.xyz = r0.www * FogInScattering[0].xyz;
    r9.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r10 = r8.yyyz * r10;
    r9.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r7.w = r8.w * r10.w;
    r9.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r10.xyz;
    r0.xyz = r8.zzz * r0.xyz + r9.xyz;
    r7.xyz = r8.www * r0.xyz + r7.xyz;
    r0 = r6.wwww * LocalToWorld[3].xwzy;
    r0 = r6.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r6.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r6 = r6.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r6.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r6.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o5.xyz = r5.xyz;
    o5.w = 0.0;
    o2.xyz = r4.xyz;
    o4 = r1.xzwy;
    o0 = r2.xyzz;
    o1 = r3;
    o3 = r7;

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
