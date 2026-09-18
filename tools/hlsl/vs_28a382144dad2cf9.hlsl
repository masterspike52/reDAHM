// vs_28a382144dad2cf9.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1263 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 000013BC 00610012 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 00100030 00006031 00007032 00003033 00005034 00215035 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 000011A1 000011A2 0000119E 000011A3 0000119F 0000119D 000011A0
//   vertex element: instruction 48 -> POSITION0
//   vertex element: instruction 49 -> TANGENT0
//   vertex element: instruction 50 -> BINORMAL0
//   vertex element: instruction 51 -> NORMAL0
//   vertex element: instruction 52 -> TEXCOORD0
//   vertex element: instruction 53 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 19
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 53
// NOTE: unhandled control flow cjmp at cf 55
// NOTE: unhandled control flow cjmp at cf 58
// NOTE: unhandled control flow cjmp at cf 67
// NOTE: unhandled control flow cjmp at cf 69
// NOTE: unhandled control flow cjmp at cf 73
// NOTE: unhandled control flow cjmp at cf 77
// NOTE: unhandled control flow cjmp at cf 85

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c30); // float3
float4 BBox_Center : register(c19); // float3
float4 BBox_Size : register(c18); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c22); // float
float4 CylDemMask_Shallowness : register(c21); // float
float4 Demolition_Center : register(c20); // float3
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c32); // float3
float4 FogVolumeBoxMin : register(c31); // float3
float4 LocalToWorld[4] : register(c23); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c17); // float
float4 SP_Demolition_Style : register(c16); // float
float4 SecondDensityFunctionParameters : register(c15); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c27); // float3x3 (matrix_columns)

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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
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

    r7 = In.position0;
    r1.xyw = In.tangent0.zyx;
    r9.xyz = In.binormal0.xzy;
    r8.xyz = In.normal0.yxz;
    r14.xy = In.texcoord0.xy;
    r14.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r4 = float4((-abs(r0.xxxx) > 0.0));
    r2 = r7.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r11.xyz = r8.yxz * 0.003921569;
    r10.x = ps;
    r0.y = -r1.y * 0.007843138 + 1.0;
    r0.xz = r1.wx * 0.007843138 - 1.0;
    r2 = r7.zzzz * LocalToWorld[2].xwzy + r2;
    r6.xyz = r9.yxz * 0.007843138 - 1.0;
    r5.xyz = r8.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r3.xyz = r6.xxz * r5.xzz;
    r10.y = ps;
    r2 = r7.yyyy * LocalToWorld[1].xzyw + r2.xzwy;
    r2 = r7.xxxx * LocalToWorld[0].zxyw + r2.yxzw;
    r3.xyz = r6.zyy * r5.yyx - r3.xyz;
    ps = 0.003921569 * r1.x;
    r0.x = dot(r0.xyz, r3.xyz);
    r10.z = ps;
    r11.w = r0.x * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r2.y = ps;
    ps = 1.0 / BBox_Size.y;
    r3.y = BBox_Size.z * 0.0026041667;
    r2.z = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xzw = -r0.zwy + r7.xyz;
    r0.x = ps;
    ps = r3.w;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r4.xz = saturate(r3.xz * r2.yz);
    r4.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = r4.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r2.xw = -r0.zw + Demolition_Center.xy;
    ps = -r2.w * -r2.w;
    r2.yz = -r2.xw + BBox_Size.xy;
    r5.x = ps;
    r3.xw = r4.zx * BBox_Size.yx - r2.wx;
    r2.w = dot(r3.wx, r3.wx) + 0.0;
    ps = -r2.x * -r2.x;
    r5.zw = r2.yz * r2.yz;
    r5.y = ps;
    ps = 1.0 / r1.z;
    r5 = r5.zyyz + r5.wxwx;
    r2.z = ps;
    ps = sqrt(abs(r5.w));
    r2.x = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.x = ps;
    ps = sqrt(abs(r5.y));
    r2.y = r2.x * SP_DemolitionSpread.x;
    r1.z = ps;
    ps = sqrt(abs(r5.z));
    r3.x = max(r1.z, r3.x);
    r1.z = ps;
    ps = sqrt(abs(r5.x));
    r1.z = max(r3.x, r1.z);
    r3.x = ps;
    ps = sqrt(abs(r2.w));
    r1.z = max(r1.z, r3.x);
    r2.w = ps;
    ps = 1.0 / r1.z;
    r2.z = r2.z * r2.w;
    r1.z = ps;
    r1.z = -r2.z * r1.z + r2.x;
    ps = 1.0 / r2.x;
    r1.z = max(r1.z, 0.0);
    r2.x = ps;
    r1.z = saturate(r1.z * r2.x);
    r2.x = -r1.z * 2.0 + 3.0;
    ps = r1.z * r1.z;
    r1.z = ps;
    r1.z = r2.y * r1.z;
    r2.x = saturate(r1.z * r2.x);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.z = SP_Demolition_Style.x + 0.5;
    r2.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r1.z = float((SP_Demolition_Style.x > 0.5));
    r5.y = ps;
    ps = Demolition_Center.z - r0.y;
    r5.x = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r2.y = r3.w * r0.y;
            r2.w = ps;
            r0.z = r2.y + r2.w;
            ps = BBox_Size.z * r2.y;
            r0.y = float((r4.y >= r2.y));
            r2.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r6.y = r0.z * BBox_Size.z;
            r5.y = ps;
        }
    }
    if (!p0)
    {
        ps = r3.z;
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r6.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r5.z = ps;
    ps = BBox_Size.z * r2.x;
    r0.z = float((1.0 > SP_Demolition_Style.x));
    r4.w = ps;
    ps = r2.x;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r5.y * ps;
    r0.w = r0.y * r0.z;
    r3.x = ps;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yz = r2.yx + r2.wx;
    // UNHANDLED control flow: cjmp
    r0.w = saturate(r0.z * r5.y);
    r0.z = float((r4.y > r0.y));
    ps = sqrt(abs(r4.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r2.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = r0.w * r2.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r2.x = float((0.3 >= r4.z));
    ps = 0.00013333333 * r0.y;
    r2.x = r0.z * r2.x;
    r0.y = saturate(ps);
    r0.y = r0.w * r0.y;
    p0 = (0.0 == 0.0 && r2.x != 0.0);
    r0.w = (0.0 == 0.0 && r2.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r4.z;
        r5.z = ps;
        r6.xw = r0.yy * float2(-1e+03, 8e+02) + r7.zy;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        r2.x = float((r4.z > 0.7));
        r0.z = r2.x * r0.z;
    }
    p0 = (r0.w == 0.0 && r0.z != 0.0);
    r0.w = (r0.w == 0.0 && r0.z != 0.0) ? 0.0 : r0.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r4.z;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r5.z = ps;
        r6.xw = r0.yy * float2(-1e+03, -8e+02) + r7.zy;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        r6.xw = r7.zy;
    }
    ps = r7.x;
    r6.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r2.x = float((0.3 >= r4.x));
    ps = 0.00013333333 * r0.y;
    r2.x = r0.z * r2.x;
    r0.y = saturate(ps);
    r0.y = r0.w * r0.y;
    p0 = (0.0 == 0.0 && r2.x != 0.0);
    r0.w = (0.0 == 0.0 && r2.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r4.x;
        r5.z = ps;
        r6.xz = r0.yy * float2(-1e+03, 8e+02) + r7.zx;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        r2.x = float((r4.x > 0.7));
        r0.z = r2.x * r0.z;
    }
    p0 = (r0.w == 0.0 && r0.z != 0.0);
    r0.w = (r0.w == 0.0 && r0.z != 0.0) ? 0.0 : r0.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r4.x;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r5.z = ps;
        r6.xz = r0.yy * float2(-1e+03, -8e+02) + r7.zx;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        r6.xz = r7.zx;
    }
    ps = r7.y;
    r6.w = ps;
    // UNHANDLED control flow: cjmp
    r6.xzw = r7.zxy;
    r0.w = float((r7.z >= r6.y));
    r2.x = -r4.w * r5.y + r6.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r6.xy + r2.zz;
    r5.y = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.xy = float2((r6.yx >= r2.xz));
    r0.yz = r4.yy * r3.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r6.xy;
    r0.y = (r10.y == 0.0) ? r6.x : r0.y;
    r0.y = (r0.w == 0.0) ? r0.y : r0.z;
    r0.w = (r10.x == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r3.w + r2.w;
            ps = r2.w + r2.w;
            r3.z = r0.x * r0.w;
            r1.z = ps;
            ps = r3.z;
            r2.xz = r3.wz - r2.yy;
            r5.y = ps;
            ps = r2.y;
            r0.y = r2.x + r2.w;
            r5.w = ps;
            ps = max(r5.y, r5.w);
            r2.x = float((r2.z > r0.y));
            r0.y = ps;
            r0.y = (r2.x == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.z;
            r0.y = r3.z - r0.y;
            r0.z = ps;
            r0.y = r0.y * r0.z;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.y = ps;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.z = float((0.5 > SP_Demolition_Style.x));
    r3.z = ps;
    ps = r3.y;
    r0.y = float((SP_DemolitionSpread.x >= 0.25));
    r2.x = ps;
    ps = 1e+01;
    r2.yz = -r5.xy + 1.0;
    r2.w = ps;
    ps = min(r2.x, r2.w);
    r3.w = r3.x * r2.y;
    r2.x = ps;
    r2.xy = r3.zw * r2.xz;
    ps = 25.0 * r0.y;
    r2.z = frac(r2.x);
    r0.y = ps;
    ps = r2.y;
    r2.x = r2.z - 0.5;
    r2.x = -abs(r2.x) * 2.0 + 1.0;
    ps = r5.y + ps;
    r0.y = r0.y * r2.x;
    r4.w = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.y * r0.x;
    r0.x = -r0.x * r0.w + r0.w;
    // UNHANDLED control flow: cjmp
    r0.yw = r4.yw * float2(6.2831, 4e+02);
    r0.z = r0.y * r0.z;
    r0.z = r0.z * 0.15915494 + 0.5;
    ps = frac(r0.z);
    r0.z = ps;
    r1.z = r0.z * 6.2831855 - 3.1415927;
    ps = sin(r1.z);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r1.z = ps;
    r0.y = r0.w * r1.z;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r5.z;
    if (p0)
    {
        r6.z = r0.y + r6.z;
    }
    if (!p0)
    {
        r6.w = r0.y + r6.w;
    }
    r2 = r7.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.w;
    r11.xyz = r8.yxz * 0.003921569;
    r10.x = ps;
    r0.z = -r1.y * 0.007843138 + 1.0;
    r0.yw = r1.wx * 0.007843138 - 1.0;
    r2 = r0.xxxx * LocalToWorld[2].xzyw + r2;
    r10.yzw = r9.yxz * 0.007843138 - 1.0;
    r5.xyz = r8.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r3.xyz = r10.yyw * r5.xzz;
    r10.y = ps;
    r2 = r6.wwww * LocalToWorld[1].xzyw + r2;
    r2 = r6.zzzz * LocalToWorld[0].zxyw + r2.yxzw;
    r3.xyz = r10.wzz * r5.yyx - r3.xyz;
    ps = 0.003921569 * r1.x;
    r0.x = dot(r0.yzw, r3.xyz);
    r10.z = ps;
    r11.w = r0.x * 0.5 + 0.5;
    r6 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r16 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r3 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? CameraPosition.zxyy : 1.0;
    r5.xyz = -r2.xzy + FogVolumeBoxMax.zyx;
    r15 = (float4(0.0, 0.0, 0.0, 1.0) == 0.0) ? r2.xyzz : 1.0;
    ps = CameraPosition.z - r2.x;
    r13.yzw = -r2.xzy + FogVolumeBoxMin.zyx;
    r12.z = ps;
    ps = CameraPosition.y - r2.z;
    r0.xyz = r2.yxz - CameraPosition.xzy;
    r12.y = ps;
    ps = CameraPosition.x - r2.y;
    r1.z = dot(SecondDensityFunctionParameters.zxyw, r3);
    r12.x = ps;
    ps = (-r1.z > 0.0) ? 1.0 : 0.0;
    r0.w = dot(r0.yxz, r0.yxz);
    r3.w = ps;
    ps = 1.0 / r12.z;
    r0.z = dot(r12.zxy, SecondDensityFunctionParameters.zxy);
    r3.x = ps;
    ps = 1.0 / r12.x;
    r0.x = float((0.001 >= abs(r0.y)));
    r3.y = ps;
    ps = 1.0 / r12.y;
    r13.x = dot(SecondDensityFunctionParameters.zxyw, r15);
    r3.z = ps;
    r0.y = (r0.x == 0.0) ? r0.y : 0.001;
    ps = 0.0001 + r0.z;
    r13.yzw = r13.ywz * r3.xyz;
    r0.x = ps;
    ps = sqrt(abs(r0.w));
    r5.xyw = r5.zxy * r3.yxz;
    r0.w = ps;
    ps = 1.0 / r0.x;
    r15 = r0.wwww - FogStartDistance.wzyx;
    r0.x = ps;
    ps = (-r13.x > 0.0) ? 1.0 : 0.0;
    r0.x = -r13.x * r0.x;
    r5.z = ps;
    ps = 1.0 / r0.y;
    r3.xyz = min(r13.zyw, r5.xyw);
    r0.y = ps;
    ps = max(r3.z, r3.y);
    r5.xyw = max(r13.yzw, r5.yxw);
    r1.z = ps;
    ps = min(r5.w, r5.x);
    r16 = saturate(r16.wzyx * r0.yyyy);
    r0.w = ps;
    ps = 1.0 - r0.x;
    r6 = saturate(r6.wzyx * r0.yyyy);
    r0.y = ps;
    ps = -r0.x;
    r15 = max(r15, 0.0);
    ps = r5.z * ps;
    r13.yzw = r15.xyz * FogDistanceScale.wzy;
    r5.w = ps;
    ps = r0.y;
    r6 = r16.wzyx - r6.wzyx;
    ps = r3.w * ps;
    r0.y = abs(r6.w) * FogDistanceScale.x;
    r5.x = ps;
    ps = r1.z;
    r0.w = saturate(min(r0.w, r5.y));
    r5.y = ps;
    ps = r3.x;
    r3.yzw = r13.yzw * abs(r6.xyz);
    r5.z = ps;
    ps = max(r5.y, r5.z);
    r6 = abs(r6) * r15;
    r3.x = saturate(ps);
    ps = pow(2.0, r3.w);
    r6 = float4((FogExtinctionDistance.wzyx > r6));
    r5.y = ps;
    ps = pow(2.0, r3.z);
    r1.z = r0.y * r15.w;
    r5.z = ps;
    ps = pow(2.0, r3.y);
    r0.xy = r0.xx + r5.xw;
    r5.w = ps;
    ps = pow(2.0, r1.z);
    r3.x = max(r3.x, r0.y);
    r5.x = ps;
    r15 = r6.wzyx * r5;
    ps = r15.y * r15.x;
    r3.y = min(r0.w, r0.x);
    r0.x = ps;
    ps = r15.w;
    r5 = r15.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r3.z = r15.z * r0.x;
    r13.y = ps;
    ps = r5.x;
    r0.x = float((r3.x >= r3.y));
    r0.y = ps;
    ps = FogInScattering[3].x * r0.y;
    r16.xyz = r5.yyy * FogInScattering[2].xyz;
    r6.x = ps;
    ps = FogInScattering[3].y * r5.x;
    r18.xyz = r5.www * FogInScattering[0].xyz;
    r6.y = ps;
    ps = FogInScattering[3].z * r5.x;
    r17.xyz = r5.zzz * FogInScattering[1].xyz;
    r6.z = ps;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = r15.w * r3.z;
    r5.xyz = r15.yyy * r18.xyz + r17.xyz;
    r5.xyz = r15.zzz * r5.xyz + r16.xyz;
    r6.xyz = r15.www * r5.yzx + r6.yzx;
    if (p0)
    {
        r3.xy = float2((-abs(r0.xx) > 0.0));
    }
    r15 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r8.xyz * 0.007843138 - 1.0;
    r9.xyz = r9.xyz * 0.007843138 - 1.0;
    r5.xzw = r1.xyw * 0.007843138 - 1.0;
    r1.xyz = r13.xxy * r3.yxz;
    r16 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r15;
    ps = 0.5 * r3.x;
    r0.x = dot(r12.zxy, r12.zxy);
    r15.x = ps;
    r12.xyz = -r2.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = 0.5 * r3.y;
    r13.xyz = r12.xxx * WorldToLocal[2].xzy;
    r15.y = ps;
    ps = sqrt(abs(r0.x));
    r15.xy = r15.xy * r3.xy;
    r0.y = ps;
    r3 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r16.xzwy;
    r3 = r2.yyyy * ViewProjectionMatrix[0] + r3.xzyw;
    r0.xz = r15.yx * r0.zz + r1.xy;
    r2.xyz = r12.yyy * WorldToLocal[1].xzy + r13.xyz;
    r2.xyz = r12.zzz * WorldToLocal[0].xyz + r2.xzy;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r0.x = r0.x - r0.z;
    r0.y = ps;
    r0.x = r0.y * -r0.x;
    ps = 0.0001 * r0.x;
    r5.y = dot(r9.yxz, r2.zxy);
    r0.x = ps;
    ps = pow(2.0, -r0.x);
    r5.x = dot(r5.xwz, r2.zxy);
    r0.x = ps;
    r6.w = r0.w * r0.x;
    ps = 1.0 - r0.x;
    r5.z = dot(r8.zyx, r2.zxy);
    r0.z = ps;
    ps = r1.z;
    r0.xy = r0.zz * ApproxFogColor.zy;
    ps = r0.z * ps;
    r0.xy = r0.xy * r0.ww;
    r0.z = ps;
    r6.xyz = r6.zxy + r0.zyx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r7.wwww * LocalToWorld[3].xwzy;
    r0 = r7.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r7.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r8.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r2.w = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r2.xyz = -r1.yzx + r7.xyz;
    r0.w = ps;
    ps = r2.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r2.xy * r0.xz);
    r10.w = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r10.w * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r2.xy = -r1.yz + Demolition_Center.xy;
    ps = -r2.y * -r2.y;
    r8.yz = -r2.xy + BBox_Size.xy;
    r8.x = ps;
    r9.xy = r0.zx * BBox_Size.yx - r2.yx;
    r2.y = dot(r9.yx, r9.yx) + 0.0;
    ps = -r2.x * -r2.x;
    r8.zw = r8.yz * r8.yz;
    r8.y = ps;
    ps = 1.0 / r0.y;
    r8 = r8.yzyz + r8.xwwx;
    r2.z = ps;
    ps = sqrt(abs(r8.x));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r9.x = ps;
    ps = sqrt(abs(r8.w));
    r2.x = r0.y * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r8.z));
    r9.x = max(r9.x, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r8.y));
    r8.x = max(r9.x, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r2.y));
    r1.w = max(r8.x, r1.w);
    r2.y = ps;
    ps = 1.0 / r1.w;
    r2.y = r2.z * r2.y;
    r1.w = ps;
    r1.w = -r2.y * r1.w + r0.y;
    ps = 1.0 / r0.y;
    r1.w = max(r1.w, 0.0);
    r0.y = ps;
    r1.w = saturate(r1.w * r0.y);
    r0.y = -r1.w * 2.0 + 3.0;
    r1.w = r1.w * r1.w;
    r1.w = r2.x * r1.w;
    r8.y = saturate(r1.w * r0.y);
    ps = Demolition_Center.z - r1.x;
    r1.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r2.z = float((SP_Demolition_Style.x > 0.5));
    r1.x = ps;
    ps = 1.0;
    r8.x = saturate(floor(r1.y));
    r1.y = ps;
    p0 = (r2.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.z = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r1.x = r8.z * r0.y;
            r1.z = ps;
            r1.y = r1.x + r1.z;
            ps = BBox_Size.z * r1.x;
            r0.y = float((r10.w >= r1.x));
            r9.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r9.y = r1.y * BBox_Size.z;
            r1.y = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = r1.x;
            r1.z = ps;
            ps = r1.x;
            r9.y = r5.w;
            r9.w = ps;
        }
    }
    r1.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.y;
    r2.x = float((Collapse_Endcaps.x > 0.5));
    r9.z = ps;
    ps = r8.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.y * ps;
    r0.y = r2.x * r0.y;
    r8.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xy = r1.xy + r1.zy;
    // UNHANDLED control flow: cjmp
    r1.y = float((r10.w > r2.x));
    r2.y = saturate(r2.y * r8.y);
    ps = sqrt(abs(r10.w));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r2.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.x = r2.y * r2.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r2.y = r1.y * r0.x;
    r0.x = saturate(ps);
    r0.x = r2.x * r0.x;
    p0 = (0.0 == 0.0 && r2.y != 0.0);
    r0.y = (0.0 == 0.0 && r2.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.xx * float2(8e+02, -1e+03);
        r7.y = r1.y + r7.y;
        ps = 3.3333333 * r0.z;
        r9.x = r1.w + r7.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r2.x = float((r0.z > 0.7));
        r1.y = r2.x * r1.y;
    }
    p0 = (r0.y == 0.0 && r1.y != 0.0);
    r0.y = (r0.y == 0.0 && r1.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r1.yw = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r7.y = r1.y + r7.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r9.x = r1.w + r7.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r7.z;
        r9.x = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.y * r0.z;
    r0.y = saturate(ps);
    r0.y = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.yy * float2(8e+02, -1e+03);
        r7.x = r1.y + r7.x;
        ps = 3.3333333 * r0.x;
        r9.x = r1.w + r7.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r2.x = float((r0.x > 0.7));
        r1.y = r2.x * r1.y;
    }
    p0 = (r0.z == 0.0 && r1.y != 0.0);
    r0.z = (r0.z == 0.0 && r1.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r1.yw = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r7.x = r1.y + r7.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r9.x = r1.w + r7.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r7.z;
        r9.x = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r7.z;
    r9.x = ps;
    r0.z = float((r7.z >= r9.y));
    r9.z = -r9.z * r8.y + r9.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r9.xy + r9.ww;
    r8.y = ps;
    p0 = (r2.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.xy = float2((r9.yx >= r9.zw));
    r0.xy = r10.ww * r5.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r9.xy;
    r0.x = (r2.y == 0.0) ? r9.x : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r2.x == 0.0) ? r9.z : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r8.z + r1.z;
            ps = r1.z + r1.z;
            r8.y = r0.w * r0.y;
            r1.y = ps;
            ps = r8.y;
            r9.xy = r8.zy - r1.xx;
            r2.x = ps;
            ps = r1.x;
            r0.z = r9.x + r1.z;
            r2.y = ps;
            ps = max(r2.x, r2.y);
            r1.x = float((r9.y > r0.z));
            r0.z = ps;
            r0.x = (r1.x == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.z = r8.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r8.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.x = float((0.5 > SP_Demolition_Style.x));
    r1.y = ps;
    ps = r2.w;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r2.x = ps;
    ps = 1e+01;
    r2.yz = -r8.xy + 1.0;
    r2.w = ps;
    ps = min(r2.x, r2.w);
    r1.z = r8.w * r2.y;
    r2.x = ps;
    r1.yz = r1.yz * r2.xz;
    ps = 25.0 * r0.x;
    r2.x = frac(r1.y);
    r1.y = ps;
    ps = r1.z;
    r0.x = r2.x - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r8.y + ps;
    r1.y = r1.y * r0.x;
    r0.x = ps;
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = r1.y * r0.w;
    r0.y = -r0.w * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.w = r10.w * 6.2831;
    r0.z = r0.w * r0.z;
    r0.z = r0.z * 0.15915494 + 0.5;
    r0.z = frac(r0.z);
    r0.w = r0.z * 6.2831855 - 3.1415927;
    ps = sin(r0.w);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.w = ps;
    r0.w = r0.w * 4e+02;
    r0.x = r0.w * r0.x;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r1.w;
    if (p0)
    {
        r7.x = r0.x + r7.x;
    }
    if (!p0)
    {
        r7.y = r0.x + r7.y;
    }
    r1 = r7.wwww * LocalToWorld[3].xwzy;
    r0 = r0.yyyy * LocalToWorld[2].xwzy + r1;
    r0 = r7.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    o5.xyz = r10.xyz;
    o5.w = 0.0;
    o2.xyz = r5.xyz;
    o4 = r11;
    o6 = r4.xzyw;
    o0 = r14;
    o1 = r3;
    o3 = r6;

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
