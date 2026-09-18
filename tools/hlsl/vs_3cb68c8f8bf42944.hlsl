// vs_3cb68c8f8bf42944.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 345 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000564 0061000F 00000000 00000000 00006CE7 00000001 00000005 00000007 00000290 0010000B 0000600C 0000700D 0000300E 0020500F 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 0000106F 00001070 0000106D 00001071 0000106E 0000106C 0000106B
//   vertex element: instruction 11 -> POSITION0
//   vertex element: instruction 12 -> TANGENT0
//   vertex element: instruction 13 -> BINORMAL0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TEXCOORD0
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

    r10 = In.position0;
    r8.xyz = In.tangent0.xyz;
    r0.yzw = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r5.xy = In.texcoord0.xy;
    r5.z = 0.0;
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r3.y = ps;
    ps = 0.007843138 * r0.y;
    r2.zw = r1.xy * 0.007843138;
    r2.x = ps;
    ps = 0.007843138 * r0.w;
    r4 = r10.wwww * LocalToWorld[3].xzyw;
    r2.y = ps;
    r5.w = r0.z * 0.007843138 - 1.0;
    r3.w = r1.z * 0.007843138 - 1.0;
    r6.xyz = r8.xyz * 0.007843138 - 1.0;
    r0 = r10.zzzz * LocalToWorld[2].xzyw + r4;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0;
    ps = r5.w;
    r4 = r2 - 1.0;
    ps = r3.w * ps;
    r15.y = r4.x * r3.w;
    r15.x = ps;
    r2 = r10.xxxx * LocalToWorld[0].yzxw + r0.zyxw;
    ps = r2.z;
    r14.xyz = -r2.yxz + CameraPosition.zyx;
    r0.y = ps;
    ps = -CameraPosition.x - -r0.y;
    r13.xyz = r2.zxy - SecondDensityFunctionParameters.xyz;
    r12.x = ps;
    ps = -CameraPosition.y - -r2.x;
    r8.w = dot(r13.zxy, r13.zxy);
    r12.y = ps;
    ps = -CameraPosition.z - -r2.y;
    r0.y = dot(r14.xzy, r14.xzy);
    r12.z = ps;
    ps = r4.x * r4.w;
    r0.x = float((0.001 >= abs(r12.z)));
    r15.z = ps;
    r0.z = (r0.x == 0.0) ? r12.z : 0.001;
    ps = r5.w;
    r0.x = r8.w - r3.y;
    ps = r4.z * ps;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r7.z = ps;
    ps = r4.y * r4.w;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r7.x = ps;
    ps = r4.y * r4.z;
    r14.w = dot(r14.xzy, r13.zxy);
    r7.y = ps;
    r7.xyz = r15.xyz - r7.xyz;
    ps = -r6.y;
    r0.w = dot(r12.zxy, r12.zxy);
    r6.w = ps;
    ps = sqrt(abs(r0.w));
    r1.w = dot(r6.xwz, r7.xyz);
    r0.w = ps;
    r7.w = r1.w * 0.5 + 0.5;
    ps = 4.0 * r0.y;
    r12 = r0.wwww - FogStartDistance.wzyx;
    r0.w = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r0.w = r0.w * r0.x;
    r13.w = ps;
    ps = 1.0 / r0.z;
    r0.x = dot(r14.xzyw, r13.zxyw);
    r0.z = ps;
    r3.z = r0.x * r0.x - r0.w;
    r11 = saturate(r11.wzyx * r0.zzzz);
    r9 = saturate(r9.wzyx * r0.zzzz);
    r12 = max(r12, 0.0);
    r7.xyz = r12.xyz * FogDistanceScale.wzy;
    r11 = r11.wzyx - r9.wzyx;
    r7.xyz = r7.xyz * abs(r11.xyz);
    ps = pow(2.0, r7.z);
    r0.z = abs(r11.w) * FogDistanceScale.x;
    r9.y = ps;
    ps = pow(2.0, r7.y);
    r11 = abs(r11) * r12;
    r9.z = ps;
    ps = pow(2.0, r7.x);
    r0.z = r0.z * r12.w;
    r9.w = ps;
    ps = pow(2.0, r0.z);
    r11 = float4((FogExtinctionDistance.wzyx > r11));
    r9.x = ps;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r11 = r11.wzyx * r9;
    r0.w = ps;
    ps = r11.y * r11.x;
    r7.xyz = r1.xyz * 0.003921569;
    r3.x = ps;
    ps = r11.w;
    r1 = r11.wzyx - 1.0;
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r9.x = r11.z * r3.x;
    r3.x = ps;
    ps = r1.x;
    r9.yzw = r8.xyz * 0.003921569;
    r0.z = ps;
    ps = FogInScattering[3].x * r0.z;
    r12.xyz = r1.yyy * FogInScattering[2].xyz;
    r8.x = ps;
    ps = FogInScattering[3].y * r1.x;
    r14.xyz = r1.www * FogInScattering[0].xyz;
    r8.y = ps;
    ps = FogInScattering[3].z * r1.x;
    r13.xyz = r1.zzz * FogInScattering[1].xyz;
    r8.z = ps;
    p0 = (r3.z >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r11.w * r9.x;
    r1.xyz = r11.yyy * r14.xyz + r13.xyz;
    r1.xyz = r11.zzz * r1.xyz + r12.xyz;
    r8.xyz = r11.www * r1.yzx + r8.yzx;
    if (p0)
    {
        ps = sqrt(abs(r3.z));
        r0.z = r0.y + 0.0001;
        r0.w = ps;
        ps = 1.0 / r0.z;
        r1.y = r0.x - r0.w;
        r0.z = ps;
        ps = 0.5 * r0.z;
        r1.x = r0.x + r0.w;
        r0.z = ps;
        r0.zw = saturate(r0.zz * -r1.xy);
    }
    if (p0)
    {
        if (p0)
        {
            ps = 0.33333334 * r0.y;
            r1.yz = r0.zw * r8.ww;
            r12.x = ps;
            ps = 0.5 * r0.x;
            r11.zw = r0.wz * r0.wz;
            r12.y = ps;
            ps = 1.0 / r3.y;
            r11.xy = r11.zw * r0.wz;
            r1.x = ps;
            r1.z = dot(r12.xy, r11.xz) + r1.z;
            r1.y = dot(r12.xy, r11.yw) + r1.y;
            r0.zw = -r1.zy * r1.xx + r0.wz;
        }
    }
    if (p0)
    {
        r0.zw = r0.zw * FirstDensityFunctionParameters.xx;
        ps = sqrt(abs(r0.y));
        r0.z = r0.z - r0.w;
        r0.x = ps;
        r0.w = r0.z * r0.x;
    }
    ps = pow(2.0, -r0.w);
    r1 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r0.w = ps;
    r11.xyz = (float3(0.0, 0.0, 1.0) == 0.0) ? r4.yxx : r5.www;
    r1 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r1;
    r12.xyz = -r2.yxz * CameraPosition.www + CameraPosition.zyx;
    ps = r3.x;
    r2.w = -r0.w + 1.0;
    ps = r9.x * ps;
    r3.xy = r2.ww * ApproxFogColor.zy;
    r3.z = ps;
    ps = r3.z;
    r0.xyz = r12.xxx * WorldToLocal[2].xzy;
    r1 = r2.xxxx * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r2.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
    ps = r2.w * ps;
    r2.xy = r3.xy * r6.ww;
    r2.z = ps;
    r0.xyz = r12.yyy * WorldToLocal[1].xzy + r0.xyz;
    r0.xyz = r12.zzz * WorldToLocal[0].xzy + r0.xyz;
    r2.xyz = r8.zxy + r2.zyx;
    r3.x = dot(r6.zxy, r0.yxz);
    r3.y = dot(r11.xyz, r0.yxz);
    ps = r6.w;
    r0.xz = r4.zw * r0.xz;
    ps = r0.w * ps;
    r0.x = r0.x + r0.z;
    r2.w = ps;
    r3.z = r3.w * r0.y + r0.x;
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r4 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r0 = r4.zzzz * ViewProjectionMatrix[3].xwzy;
    r0 = r4.wwww * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r4.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r4.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o6.x = ps;
    o6.yzw = 0.0;
    o5.xyz = r9.yzw;
    o5.w = 0.0;
    o2.xyz = r3.xyz;
    o4 = r7;
    o0 = r5.xyzz;
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
