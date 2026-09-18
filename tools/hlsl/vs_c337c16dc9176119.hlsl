// vs_c337c16dc9176119.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1254 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 000000C0 00001398 0061000F 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 00100030 00006031 00007032 00003033 00005034 00215035 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 0000119E 0000119F 0000119B 000011A0 0000119C 0000119A 0000119D
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
// Definition header: 00000000 00000007 00000000 00000000
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
    r1.xzw = In.tangent0.zyx;
    r8.xyz = In.binormal0.xzy;
    r7.xyz = In.normal0.yxz;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r3 = float4((-abs(r0.xxxx) > 0.0));
    r2 = r10.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r13.xyz = r7.yxz * 0.003921569;
    r12.x = ps;
    r0.y = -r1.z * 0.007843138 + 1.0;
    r0.xz = r1.wx * 0.007843138 - 1.0;
    r2 = r10.zzzz * LocalToWorld[2].xwzy + r2;
    r9.xyz = r8.yxz * 0.007843138 - 1.0;
    r6.xyz = r7.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r9.xxz * r6.xzz;
    r12.y = ps;
    r2 = r10.yyyy * LocalToWorld[1].xzyw + r2.xzwy;
    r2 = r10.xxxx * LocalToWorld[0].zxyw + r2.yxzw;
    r4.xyz = r9.zyy * r6.yyx - r4.xyz;
    ps = 0.003921569 * r1.x;
    r0.x = dot(r0.xyz, r4.xyz);
    r12.z = ps;
    r13.w = r0.x * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r2.y = ps;
    ps = 1.0 / BBox_Size.y;
    r3.w = BBox_Size.z * 0.0026041667;
    r2.z = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r0.zwy + r10.xyz;
    r0.x = ps;
    ps = r3.z;
    r1.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r3.xz = saturate(r3.xy * r2.yz);
    r3.y = saturate(ps);
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.z = r3.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.y = max(CylDemMask_Shallowness.x, 1.0);
    r2.xw = -r0.zw + Demolition_Center.xy;
    ps = -r2.w * -r2.w;
    r2.yz = -r2.xw + BBox_Size.xy;
    r6.x = ps;
    r4.xy = r3.zx * BBox_Size.yx - r2.wx;
    r2.w = dot(r4.yx, r4.yx) + 0.0;
    ps = -r2.x * -r2.x;
    r6.zw = r2.yz * r2.yz;
    r6.y = ps;
    ps = 1.0 / r1.y;
    r6 = r6.zyyz + r6.wxwx;
    r2.z = ps;
    ps = sqrt(abs(r6.w));
    r2.x = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r4.x = ps;
    ps = sqrt(abs(r6.y));
    r2.y = r2.x * SP_DemolitionSpread.x;
    r1.y = ps;
    ps = sqrt(abs(r6.z));
    r4.x = max(r1.y, r4.x);
    r1.y = ps;
    ps = sqrt(abs(r6.x));
    r1.y = max(r4.x, r1.y);
    r4.x = ps;
    ps = sqrt(abs(r2.w));
    r1.y = max(r1.y, r4.x);
    r2.w = ps;
    ps = 1.0 / r1.y;
    r2.z = r2.z * r2.w;
    r1.y = ps;
    r1.y = -r2.z * r1.y + r2.x;
    ps = 1.0 / r2.x;
    r1.y = max(r1.y, 0.0);
    r2.x = ps;
    r1.y = saturate(r1.y * r2.x);
    r2.x = -r1.y * 2.0 + 3.0;
    ps = r1.y * r1.y;
    r1.y = ps;
    r1.y = r2.y * r1.y;
    r2.x = saturate(r1.y * r2.x);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.z = SP_Demolition_Style.x + 0.5;
    r2.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r6.z = float((SP_Demolition_Style.x > 0.5));
    r0.w = ps;
    ps = Demolition_Center.z - r0.y;
    r6.x = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r2.y = r4.w * r0.y;
            r2.w = ps;
            r0.z = r2.y + r2.w;
            ps = BBox_Size.z * r2.y;
            r0.y = float((r3.y >= r2.y));
            r2.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r9.y = r0.z * BBox_Size.z;
            r0.w = ps;
        }
    }
    if (!p0)
    {
        ps = r4.z;
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r9.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
    ps = BBox_Size.z * r2.x;
    r0.z = float((1.0 > SP_Demolition_Style.x));
    r1.y = ps;
    ps = r2.x;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r0.w * ps;
    r6.y = r0.y * r0.z;
    r4.y = ps;
    p0 = (r6.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yz = r2.yx + r2.wx;
    // UNHANDLED control flow: cjmp
    r2.x = saturate(r0.z * r0.w);
    r0.z = float((r3.y > r0.y));
    ps = sqrt(abs(r3.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r6.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.x = r2.x * r6.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r6.y = float((0.3 >= r3.z));
    ps = 0.00013333333 * r0.y;
    r6.y = r0.z * r6.y;
    r0.y = saturate(ps);
    r0.y = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r6.y != 0.0);
    r2.x = (0.0 == 0.0 && r6.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r3.z;
        r4.x = ps;
        r9.xw = r0.yy * float2(-1e+03, 8e+02) + r10.zy;
    }
    p0 = (r2.x == 1.0);
    ps = p0 ? 0.0 : ((r2.x == 0.0) ? 1.0 : r2.x);
    r2.x = ps;
    if (p0)
    {
        r6.y = float((r3.z > 0.7));
        r0.z = r6.y * r0.z;
    }
    p0 = (r2.x == 0.0 && r0.z != 0.0);
    r2.x = (r2.x == 0.0 && r0.z != 0.0) ? 0.0 : r2.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r3.z;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r4.x = ps;
        r9.xw = r0.yy * float2(-1e+03, -8e+02) + r10.zy;
    }
    p0 = (r2.x == 1.0);
    ps = p0 ? 0.0 : ((r2.x == 0.0) ? 1.0 : r2.x);
    r2.x = ps;
    if (p0)
    {
        r9.xw = r10.zy;
    }
    ps = r10.x;
    r9.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r6.y = float((0.3 >= r3.x));
    ps = 0.00013333333 * r0.y;
    r6.y = r0.z * r6.y;
    r0.y = saturate(ps);
    r0.y = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r6.y != 0.0);
    r2.x = (0.0 == 0.0 && r6.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r3.x;
        r4.x = ps;
        r9.xz = r0.yy * float2(-1e+03, 8e+02) + r10.zx;
    }
    p0 = (r2.x == 1.0);
    ps = p0 ? 0.0 : ((r2.x == 0.0) ? 1.0 : r2.x);
    r2.x = ps;
    if (p0)
    {
        r6.y = float((r3.x > 0.7));
        r0.z = r6.y * r0.z;
    }
    p0 = (r2.x == 0.0 && r0.z != 0.0);
    r2.x = (r2.x == 0.0 && r0.z != 0.0) ? 0.0 : r2.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r3.x;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r4.x = ps;
        r9.xz = r0.yy * float2(-1e+03, -8e+02) + r10.zx;
    }
    p0 = (r2.x == 1.0);
    ps = p0 ? 0.0 : ((r2.x == 0.0) ? 1.0 : r2.x);
    r2.x = ps;
    if (p0)
    {
        r9.xz = r10.zx;
    }
    ps = r10.y;
    r9.w = ps;
    // UNHANDLED control flow: cjmp
    r9.xzw = r10.zxy;
    r6.w = float((r10.z >= r9.y));
    r2.x = -r1.y * r0.w + r9.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r9.xy + r2.zz;
    r6.y = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xy = float2((r9.yx >= r2.xz));
    r0.yz = r3.yy * r4.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r9.xy;
    r0.y = (r11.y == 0.0) ? r9.x : r0.y;
    r0.y = (r6.w == 0.0) ? r0.y : r0.z;
    r0.w = (r11.x == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r4.w + r2.w;
            ps = r2.w + r2.w;
            r4.z = r0.x * r0.w;
            r1.y = ps;
            ps = r4.z;
            r2.xz = r4.wz - r2.yy;
            r6.y = ps;
            ps = r2.y;
            r0.y = r2.x + r2.w;
            r6.z = ps;
            ps = max(r6.y, r6.z);
            r2.x = float((r2.z > r0.y));
            r0.y = ps;
            r0.y = (r2.x == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.y = r4.z - r0.y;
            r0.z = ps;
            r0.y = r0.y * r0.z;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r6.y = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r4.z = ps;
    ps = r3.w;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r2.x = ps;
    ps = 1e+01;
    r2.yz = -r6.xy + 1.0;
    r2.w = ps;
    ps = min(r2.x, r2.w);
    r4.w = r4.y * r2.y;
    r2.x = ps;
    r2.xy = r4.zw * r2.xz;
    ps = 25.0 * r0.z;
    r2.z = frac(r2.x);
    r0.z = ps;
    ps = r2.y;
    r2.x = r2.z - 0.5;
    r2.x = -abs(r2.x) * 2.0 + 1.0;
    ps = r6.y + ps;
    r0.z = r0.z * r2.x;
    r3.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.z * r0.x;
    r0.x = -r0.x * r0.w + r0.w;
    // UNHANDLED control flow: cjmp
    r0.zw = r3.yw * float2(6.2831, 4e+02);
    r0.y = r0.z * r0.y;
    r0.y = r0.y * 0.15915494 + 0.5;
    ps = frac(r0.y);
    r0.y = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r0.w * r0.y;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r4.x;
    if (p0)
    {
        r9.z = r0.y + r9.z;
    }
    if (!p0)
    {
        r9.w = r0.y + r9.w;
    }
    r2 = r10.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.w;
    r13.xyz = r7.yxz * 0.003921569;
    r12.x = ps;
    r0.z = -r1.z * 0.007843138 + 1.0;
    r0.yw = r1.wx * 0.007843138 - 1.0;
    r2 = r0.xxxx * LocalToWorld[2].xzyw + r2;
    r11.xyz = r8.yxz * 0.007843138 - 1.0;
    r6.xyz = r7.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r11.xxz * r6.xzz;
    r12.y = ps;
    r2 = r9.wwww * LocalToWorld[1].xzyw + r2;
    r2 = r9.zzzz * LocalToWorld[0].zxyw + r2.yxzw;
    r4.xyz = r11.zyy * r6.yyx - r4.xyz;
    ps = 0.003921569 * r1.x;
    r0.x = dot(r0.yzw, r4.xyz);
    r12.z = ps;
    r13.w = r0.x * 0.5 + 0.5;
    r9 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = -CameraPosition.x - -r2.y;
    r15.xyz = -r2.xzy + CameraPosition.zyx;
    r4.x = ps;
    ps = -CameraPosition.y - -r2.z;
    r14.xyz = r2.yzx - SecondDensityFunctionParameters.xyz;
    r4.y = ps;
    ps = -CameraPosition.z - -r2.x;
    r15.w = dot(r15.xzy, r14.zxy);
    r4.z = ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r4.w = dot(r14.zxy, r14.zxy);
    r0.x = dot(r15.xzy, r15.xzy);
    ps = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r0.y = float((0.001 >= abs(r4.z)));
    r1.y = ps;
    r0.y = (r0.y == 0.0) ? r4.z : 0.001;
    ps = sqrt(abs(r0.w));
    r0.z = r4.w - r1.y;
    r0.w = ps;
    ps = 4.0 * r0.x;
    r6 = r0.wwww - FogStartDistance.wzyx;
    r0.w = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r0.w = r0.w * r0.z;
    r14.w = ps;
    ps = 1.0 / r0.y;
    r0.z = dot(r15.xzyw, r14.zxyw);
    r0.y = ps;
    r4.z = r0.z * r0.z - r0.w;
    r14 = saturate(r11.wzyx * r0.yyyy);
    r9 = saturate(r9.wzyx * r0.yyyy);
    r11 = max(r6, 0.0);
    r6.xyz = r11.xyz * FogDistanceScale.wzy;
    r9 = r14.wzyx - r9.wzyx;
    r6.xyz = r6.xzy * abs(r9.xzy);
    ps = pow(2.0, r6.y);
    r0.y = abs(r9.w) * FogDistanceScale.x;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r9 = abs(r9) * r11;
    r6.z = ps;
    ps = pow(2.0, r6.x);
    r0.y = r0.y * r11.w;
    r6.w = ps;
    ps = pow(2.0, r0.y);
    r9 = float4((FogExtinctionDistance.wzyx > r9));
    r6.x = ps;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r9 = r9.wzyx * r6;
    r0.w = ps;
    ps = r9.y * r9.x;
    r14 = r9.wzyx - 1.0;
    r4.y = ps;
    ps = r9.w;
    r6.xyz = r14.xxx * FogInScattering[3].xyz;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r11.xyz = r14.yyy * FogInScattering[2].xyz;
    r4.x = ps;
    ps = r9.z;
    r15.xyz = r14.www * FogInScattering[0].xyz;
    ps = r4.y * ps;
    r14.xyz = r14.zzz * FogInScattering[1].xyz;
    r4.y = ps;
    p0 = (r4.z >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r9.w * r4.y;
    r14.xyz = r9.yyy * r15.xyz + r14.xyz;
    r9.xyz = r9.zzz * r14.xyz + r11.xyz;
    r6.xyz = r9.www * r9.yzx + r6.yzx;
    if (p0)
    {
        ps = sqrt(abs(r4.z));
        r0.y = r0.x + 0.0001;
        r0.w = ps;
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r0.y;
            r9.y = r0.z - r0.w;
            r0.y = ps;
            ps = 0.5 * r0.y;
            r9.x = r0.z + r0.w;
            r0.y = ps;
            r0.yw = saturate(r0.yy * -r9.xy);
            ps = 0.33333334 * r0.x;
            r4.zw = r0.yw * r4.ww;
            r11.x = ps;
            ps = 0.5 * r0.z;
            r9.zw = r0.wy * r0.wy;
            r11.y = ps;
            ps = 1.0 / r1.y;
            r9.xy = r9.zw * r0.wy;
            r1.y = ps;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r4.w = dot(r11.xy, r9.xz) + r4.w;
            r4.z = dot(r11.xy, r9.yw) + r4.z;
            r0.yw = -r4.wz * r1.yy + r0.wy;
            r0.yw = r0.yw * FirstDensityFunctionParameters.xx;
            ps = sqrt(abs(r0.x));
            r0.y = r0.y - r0.w;
            r0.x = ps;
            r0.w = r0.y * r0.x;
        }
    }
    ps = pow(2.0, -r0.w);
    r11 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r0.x = ps;
    r7.xyz = r7.xyz * 0.007843138 - 1.0;
    r9.xyz = r8.xyz * 0.007843138 - 1.0;
    r1.xyz = r1.xzw * 0.007843138 - 1.0;
    r8 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r11;
    r11.xyz = -r2.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = r4.x;
    r1.w = -r0.x + 1.0;
    ps = r4.y * ps;
    r4.xz = r1.ww * ApproxFogColor.zy;
    r2.w = ps;
    ps = r2.w;
    r0.yzw = r11.xxx * WorldToLocal[2].xzy;
    r8 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r8.xzwy;
    r8 = r2.yyyy * ViewProjectionMatrix[0] + r8.xzyw;
    ps = r1.w * ps;
    r2.xy = r4.xz * r6.ww;
    r2.z = ps;
    r0.yzw = r11.yyy * WorldToLocal[1].xzy + r0.yzw;
    r0.yzw = r11.zzz * WorldToLocal[0].xyz + r0.ywz;
    r2.xyz = r6.zxy + r2.zyx;
    r4.x = dot(r1.xzy, r0.wyz);
    ps = r6.w;
    r4.y = dot(r9.yxz, r0.wyz);
    ps = r0.x * ps;
    r4.z = dot(r7.zyx, r0.wyz);
    r2.w = ps;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r9.x = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r7.x = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.yzw = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r6.xyz = -r1.zwy + r10.xyz;
    r1.x = ps;
    ps = r6.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r1.x * ps;
    r0.xz = saturate(r6.xy * r0.xz);
    r6.w = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = r6.w * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r6.xy = -r1.wz + Demolition_Center.yx;
    ps = -r6.x * -r6.x;
    r7.yz = -r6.yx + BBox_Size.xy;
    r9.x = ps;
    r9.yz = r0.zx * BBox_Size.yx - r6.xy;
    r6.x = dot(r9.zy, r9.zy) + 0.0;
    ps = -r6.y * -r6.y;
    r9.zw = r7.yz * r7.yz;
    r9.y = ps;
    ps = 1.0 / r0.y;
    r9 = r9.zyyz + r9.wxwx;
    r6.y = ps;
    ps = sqrt(abs(r9.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r6.z = ps;
    ps = sqrt(abs(r9.w));
    r4.w = r0.y * SP_DemolitionSpread.x;
    r0.w = ps;
    ps = sqrt(abs(r9.z));
    r6.z = max(r6.z, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r9.x));
    r6.z = max(r6.z, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r6.x));
    r0.w = max(r6.z, r0.w);
    r6.x = ps;
    ps = 1.0 / r0.w;
    r6.x = r6.y * r6.x;
    r0.w = ps;
    r0.w = -r6.x * r0.w + r0.y;
    ps = 1.0 / r0.y;
    r0.w = max(r0.w, 0.0);
    r0.y = ps;
    r0.w = saturate(r0.w * r0.y);
    r0.y = -r0.w * 2.0 + 3.0;
    r0.w = r0.w * r0.w;
    r0.w = r4.w * r0.w;
    r9.x = saturate(r0.w * r0.y);
    ps = Demolition_Center.z - r1.y;
    r0.w = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r6.z = float((SP_Demolition_Style.x > 0.5));
    r1.y = ps;
    ps = 1.0;
    r9.z = saturate(floor(r0.w));
    r1.w = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.x = saturate(r0.y * r1.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r1.x;
            r1.y = r11.x * r0.y;
            r1.z = ps;
            r0.w = r1.y + r1.z;
            ps = BBox_Size.z * r1.y;
            r0.y = float((r6.w >= r1.y));
            r9.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r7.z = r0.w * BBox_Size.z;
            r1.w = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = r1.y;
            r1.z = ps;
            ps = r1.y;
            r7.z = r7.w;
            r9.y = ps;
        }
    }
    r0.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.w;
    r4.w = float((Collapse_Endcaps.x > 0.5));
    r9.w = ps;
    ps = r9.x;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.w * ps;
    r0.y = r4.w * r0.y;
    r11.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xy = r1.yw + r1.zw;
    // UNHANDLED control flow: cjmp
    r1.w = float((r6.w > r6.x));
    r6.x = saturate(r6.y * r9.x);
    ps = sqrt(abs(r6.w));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r6.x * r4.w;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r6.x = r1.w * r0.x;
    r0.x = saturate(ps);
    r0.x = r4.w * r0.x;
    p0 = (0.0 == 0.0 && r6.x != 0.0);
    r0.y = (0.0 == 0.0 && r6.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.xw = r0.xx * float2(8e+02, -1e+03);
        r10.y = r0.x + r10.y;
        ps = 3.3333333 * r0.z;
        r7.y = r0.w + r10.z;
        r0.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r4.w = float((r0.z > 0.7));
        r1.w = r4.w * r1.w;
    }
    p0 = (r0.y == 0.0 && r1.w != 0.0);
    r0.y = (r0.y == 0.0 && r1.w != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r0.xw = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r10.y = r0.x + r10.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r7.y = r0.w + r10.z;
        r0.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r10.z;
        r7.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.w * r0.z;
    r0.y = saturate(ps);
    r0.y = r4.w * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yw = r0.yy * float2(8e+02, -1e+03);
        r10.x = r0.y + r10.x;
        ps = 3.3333333 * r0.x;
        r7.y = r0.w + r10.z;
        r0.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r4.w = float((r0.x > 0.7));
        r1.w = r4.w * r1.w;
    }
    p0 = (r0.z == 0.0 && r1.w != 0.0);
    r0.z = (r0.z == 0.0 && r1.w != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r0.yw = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r10.x = r0.y + r10.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r7.y = r0.w + r10.z;
        r0.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r10.z;
        r7.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r10.z;
    r7.y = ps;
    r0.z = float((r10.z >= r7.z));
    r9.x = -r9.w * r9.x + r7.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r7.yz + r9.yy;
    r9.w = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xy = float2((r7.zy >= r9.xy));
    r0.xy = r6.ww * r7.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r7.yz;
    r0.x = (r6.y == 0.0) ? r7.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r6.x == 0.0) ? r9.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r11.x + r1.z;
            ps = r1.z + r1.z;
            r11.y = r1.x * r0.y;
            r1.w = ps;
            ps = r11.y;
            r7.yz = r11.xy - r1.yy;
            r6.x = ps;
            ps = r1.y;
            r0.z = r7.y + r1.z;
            r6.y = ps;
            ps = max(r6.x, r6.y);
            r1.y = float((r7.z > r0.z));
            r0.z = ps;
            r0.x = (r1.y == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.w;
            r0.z = r11.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r9.w = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.z = float((0.5 > SP_Demolition_Style.x));
    r1.y = ps;
    ps = r7.x;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r7.x = ps;
    ps = 1e+01;
    r6.yz = -r9.zw + 1.0;
    r7.y = ps;
    ps = min(r7.x, r7.y);
    r1.w = r11.z * r6.y;
    r6.x = ps;
    r1.yw = r1.yw * r6.xz;
    ps = 25.0 * r0.x;
    r4.w = frac(r1.y);
    r1.y = ps;
    ps = r1.w;
    r0.x = r4.w - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r9.w + ps;
    r0.x = r1.y * r0.x;
    r1.y = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r1.x;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r6.w * 6.2831;
    r0.y = r0.y * r0.z;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.y = frac(r0.y);
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r0.y * 4e+02;
    r0.y = r0.y * r1.y;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r0.w;
    if (p0)
    {
        r10.x = r0.y + r10.x;
    }
    if (!p0)
    {
        r10.y = r0.y + r10.y;
    }
    r1 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r1;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    o5.xyz = r12.xyz;
    o5.w = 0.0;
    o2.xyz = r4.xyz;
    o4 = r13;
    o6 = r3.xzyw;
    o0 = r5;
    o1 = r8;
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
