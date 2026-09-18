// vs_bfa9cba23f3dee51.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1233 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00001344 00610010 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 0010002F 00006030 00007031 00003032 00005033 00215034 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 00001197 00001198 00001194 00001199 00001195 00001193 00001196
//   vertex element: instruction 47 -> POSITION0
//   vertex element: instruction 48 -> TANGENT0
//   vertex element: instruction 49 -> BINORMAL0
//   vertex element: instruction 50 -> NORMAL0
//   vertex element: instruction 51 -> TEXCOORD0
//   vertex element: instruction 52 -> TEXCOORD1
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
// NOTE: unhandled control flow cjmp at cf 52
// NOTE: unhandled control flow cjmp at cf 54
// NOTE: unhandled control flow cjmp at cf 57
// NOTE: unhandled control flow cjmp at cf 66
// NOTE: unhandled control flow cjmp at cf 68
// NOTE: unhandled control flow cjmp at cf 72
// NOTE: unhandled control flow cjmp at cf 76
// NOTE: unhandled control flow cjmp at cf 84

#include "xenos_common.hlsli"

float4 ApproxFogColor : register(c29); // float3
float4 BBox_Center : register(c18); // float3
float4 BBox_Size : register(c17); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c21); // float
float4 CylDemMask_Shallowness : register(c20); // float
float4 Demolition_Center : register(c19); // float3
float4 FirstDensityFunctionParameters : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 FogVolumeBoxMax : register(c31); // float3
float4 FogVolumeBoxMin : register(c30); // float3
float4 LocalToWorld[4] : register(c22); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c16); // float
float4 SP_Demolition_Style : register(c15); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c26); // float3x3 (matrix_columns)

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
    r1.xyw = In.tangent0.xzy;
    r10.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.yzx;
    r12.xy = In.texcoord0.xy;
    r12.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r3 = r9.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.x;
    r8.xyz = r6.zxy * 0.003921569;
    r7.x = ps;
    r0.y = -r1.w * 0.007843138 + 1.0;
    r0.xz = r1.xy * 0.007843138 - 1.0;
    r3 = r9.zzzz * LocalToWorld[2].xwzy + r3;
    r7.yzw = r10.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.w;
    r4.xyz = r7.yyw * r5.xzz;
    r7.y = ps;
    r3 = r9.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r3 = r9.xxxx * LocalToWorld[0].zyxw + r3.yzxw;
    r4.xyz = r7.wzz * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r0.x = dot(r0.xyz, r4.xyz);
    r7.z = ps;
    r8.w = r0.x * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.x = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r2.w = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.xyw = -BBox_Size.xyz * 0.5 + BBox_Center.xyz;
    ps = 1.0 / BBox_Size.z;
    r3.yzw = -r0.xyw + r9.xyz;
    r0.z = ps;
    ps = r3.w;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.z * ps;
    r2.xz = saturate(r3.yz * r2.xy);
    r2.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.z = r2.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r3.xw = -r0.xy + Demolition_Center.xy;
    ps = -r3.w * -r3.w;
    r3.yz = -r3.xw + BBox_Size.xy;
    r5.x = ps;
    r4.xy = r2.zx * BBox_Size.yx - r3.wx;
    r3.w = dot(r4.yx, r4.yx) + 0.0;
    ps = -r3.x * -r3.x;
    r5.zw = r3.yz * r3.yz;
    r5.y = ps;
    ps = 1.0 / r1.z;
    r5 = r5.zyyz + r5.wxwx;
    r3.z = ps;
    ps = sqrt(abs(r5.w));
    r3.x = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r4.x = ps;
    ps = sqrt(abs(r5.y));
    r3.y = r3.x * SP_DemolitionSpread.x;
    r1.z = ps;
    ps = sqrt(abs(r5.z));
    r4.x = max(r1.z, r4.x);
    r1.z = ps;
    ps = sqrt(abs(r5.x));
    r1.z = max(r4.x, r1.z);
    r4.x = ps;
    ps = sqrt(abs(r3.w));
    r1.z = max(r1.z, r4.x);
    r3.w = ps;
    ps = 1.0 / r1.z;
    r3.z = r3.z * r3.w;
    r1.z = ps;
    r1.z = -r3.z * r1.z + r3.x;
    ps = 1.0 / r3.x;
    r1.z = max(r1.z, 0.0);
    r3.x = ps;
    r1.z = saturate(r1.z * r3.x);
    r3.x = -r1.z * 2.0 + 3.0;
    ps = r1.z * r1.z;
    r1.z = ps;
    r1.z = r3.y * r1.z;
    r3.x = saturate(r1.z * r3.x);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.x = SP_Demolition_Style.x + 0.5;
    r3.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r1.z = float((SP_Demolition_Style.x > 0.5));
    r4.y = ps;
    ps = Demolition_Center.z - r0.w;
    r4.w = saturate(floor(r0.x));
    r0.x = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.x = saturate(r0.x * r0.z);
    if (p0)
    {
        if (p0)
        {
            r0.x = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.z;
            r3.y = r5.x * r0.x;
            r3.w = ps;
            r0.x = r3.y + r3.w;
            ps = BBox_Size.z * r3.y;
            r0.y = float((r2.y >= r3.y));
            r3.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r7.y = r0.x * BBox_Size.z;
            r4.y = ps;
        }
    }
    if (!p0)
    {
        ps = r4.z;
        r3.zw = float2((-abs(r0.xx) > 0.0));
        r7.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
    ps = BBox_Size.z * r3.x;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    r0.w = ps;
    ps = r3.x;
    r0.x = float((Collapse_Endcaps.x > 0.5));
    ps = r4.y * ps;
    r5.y = r0.x * r0.y;
    r5.z = ps;
    p0 = (r5.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xy = r3.yx + r3.wx;
    // UNHANDLED control flow: cjmp
    r3.x = saturate(r0.y * r4.y);
    r5.y = float((r2.y > r0.x));
    ps = sqrt(abs(r2.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r0.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r3.x * r0.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r3.x = float((0.3 >= r2.z));
    ps = 0.00013333333 * r0.y;
    r3.x = r5.y * r3.x;
    r0.y = saturate(ps);
    r0.y = r0.x * r0.y;
    p0 = (0.0 == 0.0 && r3.x != 0.0);
    r3.x = (0.0 == 0.0 && r3.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.z;
        r4.x = ps;
        r7.xw = r0.yy * float2(-1e+03, 8e+02) + r9.zy;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r0.x = float((r2.z > 0.7));
        r0.x = r0.x * r5.y;
    }
    p0 = (r3.x == 0.0 && r0.x != 0.0);
    r3.x = (r3.x == 0.0 && r0.x != 0.0) ? 0.0 : r3.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.z;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.x = ps;
        r7.xw = r0.yy * float2(-1e+03, -8e+02) + r9.zy;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r7.xw = r9.zy;
    }
    ps = r9.x;
    r7.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r3.x = float((0.3 >= r2.x));
    ps = 0.00013333333 * r0.y;
    r3.x = r5.y * r3.x;
    r0.y = saturate(ps);
    r0.y = r0.x * r0.y;
    p0 = (0.0 == 0.0 && r3.x != 0.0);
    r3.x = (0.0 == 0.0 && r3.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.x;
        r4.x = ps;
        r7.xz = r0.yy * float2(-1e+03, 8e+02) + r9.zx;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r0.x = float((r2.x > 0.7));
        r0.x = r0.x * r5.y;
    }
    p0 = (r3.x == 0.0 && r0.x != 0.0);
    r3.x = (r3.x == 0.0 && r0.x != 0.0) ? 0.0 : r3.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.x = ps;
        r7.xz = r0.yy * float2(-1e+03, -8e+02) + r9.zx;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r7.xz = r9.zx;
    }
    ps = r9.y;
    r7.w = ps;
    // UNHANDLED control flow: cjmp
    r7.xzw = r9.zxy;
    r6.w = float((r9.z >= r7.y));
    r3.x = -r0.w * r4.y + r7.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r7.xy + r3.zz;
    r4.y = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yw = float2((r7.yx >= r3.xz));
    r0.xy = r2.yy * r4.zz + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r7.xy;
    r0.x = (r5.w == 0.0) ? r7.x : r0.x;
    r0.x = (r6.w == 0.0) ? r0.x : r0.y;
    r0.w = (r5.y == 0.0) ? r3.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r5.x + r3.w;
            ps = r3.w + r3.w;
            r5.y = r0.z * r0.w;
            r1.z = ps;
            ps = r5.y;
            r3.xz = r5.xy - r3.yy;
            r4.y = ps;
            ps = r3.y;
            r0.y = r3.x + r3.w;
            r4.z = ps;
            ps = max(r4.y, r4.z);
            r3.x = float((r3.z > r0.y));
            r0.y = ps;
            r0.x = (r3.x == 0.0) ? r0.y : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.z;
            r0.x = r5.y - r0.x;
            r0.y = ps;
            r0.x = r0.x * r0.y;
            r0.x = saturate(-abs(r0.x) + 1.0);
            ps = r0.x * r0.x;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r4.y = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.z = float((0.5 > SP_Demolition_Style.x));
    r5.x = ps;
    ps = r2.w;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r3.x = ps;
    ps = 1e+01;
    r3.yz = -r4.wy + 1.0;
    r3.w = ps;
    ps = min(r3.x, r3.w);
    r5.y = r5.z * r3.y;
    r3.x = ps;
    r3.xy = r5.xy * r3.xz;
    ps = 25.0 * r0.x;
    r2.w = frac(r3.x);
    r0.x = ps;
    ps = r3.y;
    r2.w = r2.w - 0.5;
    r2.w = -abs(r2.w) * 2.0 + 1.0;
    ps = r4.y + ps;
    r0.x = r0.x * r2.w;
    r2.w = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.z;
    r0.x = -r0.x * r0.w + r0.w;
    // UNHANDLED control flow: cjmp
    r0.zw = r2.yw * float2(6.2831, 4e+02);
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
        r7.z = r0.y + r7.z;
    }
    if (!p0)
    {
        r7.w = r0.y + r7.w;
    }
    r3 = r9.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.x;
    r8.xyz = r6.zxy * 0.003921569;
    r7.x = ps;
    r0.z = -r1.w * 0.007843138 + 1.0;
    r0.yw = r1.xy * 0.007843138 - 1.0;
    r3 = r0.xxxx * LocalToWorld[2].xzyw + r3;
    r11.xyz = r10.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.w;
    r4.xyz = r11.xxz * r5.xzz;
    r7.y = ps;
    r3 = r7.wwww * LocalToWorld[1].xzyw + r3;
    r3 = r7.zzzz * LocalToWorld[0].zyxw + r3.yzxw;
    r4.xyz = r11.zyy * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r0.x = dot(r0.yzw, r4.xyz);
    r7.z = ps;
    r8.w = r0.x * 0.5 + 0.5;
    ps = -FirstDensityFunctionParameters.y - -r3.x;
    r14.x = CameraPosition.z - FirstDensityFunctionParameters.y;
    r14.y = ps;
    ps = CameraPosition.z;
    r0 = r3.wwww * ViewProjectionMatrix[3].xwzy;
    r4.yzw = r6.xzy * 0.007843138 - 1.0;
    r5.xyz = r10.xzy * 0.007843138 - 1.0;
    r11.xyz = r1.ywx * 0.007843138 - 1.0;
    r13 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r0;
    ps = 0.0001 + ps;
    r10.xzw = r3.zyx - CameraPosition.xyz;
    r0.x = ps;
    r16.xyw = -r3.xyz * CameraPosition.www + CameraPosition.zyx;
    ps = r0.x;
    r1.xyz = -r3.zyx + CameraPosition.xyz;
    ps = -r3.x + ps;
    r0.zw = float2((-r14.yx > 0.0));
    r0.x = ps;
    ps = 1.0 / r1.x;
    r0.y = dot(r1.zxy, r1.zxy);
    r1.x = ps;
    ps = 1.0 / r1.y;
    r6.xyz = r16.xxx * WorldToLocal[2].xyz;
    r1.y = ps;
    ps = 1.0 / r0.x;
    r1.w = float((0.001 >= abs(r10.w)));
    r0.x = ps;
    r13 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r13.xzwy;
    r13 = r3.zzzz * ViewProjectionMatrix[0] + r13.xzyw;
    r1.w = (r1.w == 0.0) ? r10.w : 0.001;
    r16.xyz = r16.yyy * WorldToLocal[1].xyz + r6.xyz;
    ps = sqrt(abs(r0.y));
    r0.x = -r14.y * r0.x;
    r0.y = ps;
    ps = 1.0 / r1.z;
    r10.y = -r0.x * r0.z;
    r1.z = ps;
    r6 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r15 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r14.xyz = -r3.xzy + FogVolumeBoxMax.zxy;
    r3.yzw = -r3.xzy + FogVolumeBoxMin.zxy;
    r3.x = dot(r10.wxz, r10.wxz);
    r10.xzw = r3.ywz * r1.zyx;
    ps = sqrt(abs(r3.x));
    r1.xyz = r14.yzx * r1.xyz;
    r3.x = ps;
    r14 = r3.xxxx - FogStartDistance.wzyx;
    r3.xyz = r16.www * WorldToLocal[0].xzy + r16.xzy;
    ps = 1.0 / r1.w;
    r11.x = dot(r11.xzy, r3.yxz);
    r1.w = ps;
    ps = FirstDensityFunctionParameters.x * r0.y;
    r15 = saturate(r15.wzyx * r1.wwww);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r6 = saturate(r6.wzyx * r1.wwww);
    r0.y = ps;
    ps = r0.y;
    r11.yzw = max(r10.xwz, r1.zxy);
    ps = r0.w * ps;
    r1.xyw = min(r10.xzw, r1.zyx);
    r10.x = ps;
    ps = max(r1.y, r1.x);
    r14 = max(r14, 0.0);
    r0.w = ps;
    ps = min(r11.w, r11.y);
    r6 = r15.wzyx - r6.wzyx;
    r0.y = ps;
    ps = abs(r6.w);
    r1.xyz = r14.xyz * FogDistanceScale.wzy;
    ps = FogDistanceScale.x * ps;
    r3.w = saturate(min(r0.y, r11.z));
    r0.y = ps;
    ps = r0.x;
    r0.w = saturate(max(r0.w, r1.w));
    ps = r10.x + ps;
    r1.xyz = r1.xzy * abs(r6.xzy);
    r1.w = ps;
    ps = r0.x;
    r6 = abs(r6) * r14;
    ps = r10.y + ps;
    r0.y = r0.y * r14.w;
    r0.x = ps;
    ps = pow(2.0, r1.y);
    r0.w = max(r0.w, r0.x);
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.x = min(r3.w, r1.w);
    r1.z = ps;
    ps = pow(2.0, r1.x);
    r0.x = saturate(-r0.w + r0.x);
    r1.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r1.x = ps;
    ps = pow(2.0, -r0.x);
    r6 = float4((FogExtinctionDistance.wzyx > r6));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r1 = r6.wzyx * r1;
    r0.x = ps;
    ps = r1.y * r1.x;
    r11.y = dot(r5.yxz, r3.yxz);
    r4.x = ps;
    ps = r1.w;
    r11.z = dot(r4.wzy, r3.yxz);
    r0.z = ps;
    ps = ApproxFogColor.x * r0.z;
    r3 = r1.wzyx - 1.0;
    r0.w = ps;
    ps = ApproxFogColor.z * r0.x;
    r4.w = r1.z * r4.x;
    r0.z = ps;
    ps = ApproxFogColor.y * r0.x;
    r5.x = r0.w * r4.w;
    r0.w = ps;
    ps = r5.x;
    r4.xyz = r3.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r5 = r1.yyyw * r4;
    r0.x = ps;
    ps = r5.w;
    r4.xyz = r3.yyy * FogInScattering[2].xyz;
    ps = r0.y * ps;
    r0.zw = r0.zw * r5.ww;
    r4.w = ps;
    r5.xyz = r3.zzz * FogInScattering[1].xyz + r5.xyz;
    r1.xyz = r1.zzz * r5.xzy + r4.xzy;
    r0.xyz = r3.xxx * FogInScattering[3].xyz + r0.xwz;
    r4.xyz = r1.www * r1.xzy + r0.xyz;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r9.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r9.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r5.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r3.w = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r1.yzx + r9.xyz;
    r0.w = ps;
    ps = r3.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r3.xy * r0.xz);
    r6.x = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.z = r6.x * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r3.xy = -r1.yz + Demolition_Center.xy;
    ps = -r3.y * -r3.y;
    r5.xy = -r3.xy + BBox_Size.xy;
    r10.x = ps;
    r6.yz = r0.zx * BBox_Size.yx - r3.yx;
    r3.y = dot(r6.zy, r6.zy) + 0.0;
    ps = -r3.x * -r3.x;
    r10.zw = r5.xy * r5.xy;
    r10.y = ps;
    ps = 1.0 / r0.y;
    r10 = r10.zyyz + r10.wxwx;
    r3.z = ps;
    ps = sqrt(abs(r10.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.x = ps;
    ps = sqrt(abs(r10.w));
    r3.x = r0.y * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r10.z));
    r5.x = max(r5.x, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r10.x));
    r5.x = max(r5.x, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r3.y));
    r1.w = max(r5.x, r1.w);
    r3.y = ps;
    ps = 1.0 / r1.w;
    r3.y = r3.z * r3.y;
    r1.w = ps;
    r1.w = -r3.y * r1.w + r0.y;
    ps = 1.0 / r0.y;
    r1.w = max(r1.w, 0.0);
    r0.y = ps;
    r1.w = saturate(r1.w * r0.y);
    r0.y = -r1.w * 2.0 + 3.0;
    r1.w = r1.w * r1.w;
    r1.w = r3.x * r1.w;
    r5.y = saturate(r1.w * r0.y);
    ps = Demolition_Center.z - r1.x;
    r1.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r3.z = float((SP_Demolition_Style.x > 0.5));
    r1.x = ps;
    ps = 1.0;
    r5.x = saturate(floor(r1.y));
    r1.y = ps;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r1.x = r5.w * r0.y;
            r1.z = ps;
            r1.y = r1.x + r1.z;
            ps = BBox_Size.z * r1.x;
            r0.y = float((r6.x >= r1.x));
            r10.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r6.z = r1.y * BBox_Size.z;
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
            r6.z = r5.z;
            r10.y = ps;
        }
    }
    r1.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.y;
    r3.x = float((Collapse_Endcaps.x > 0.5));
    r7.w = ps;
    ps = r5.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.y * ps;
    r0.y = r3.x * r0.y;
    r6.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xy = r1.xy + r1.zy;
    // UNHANDLED control flow: cjmp
    r1.y = float((r6.x > r3.x));
    r3.y = saturate(r3.y * r5.y);
    ps = sqrt(abs(r6.x));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r3.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.x = r3.y * r3.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r3.y = r1.y * r0.x;
    r0.x = saturate(ps);
    r0.x = r3.x * r0.x;
    p0 = (0.0 == 0.0 && r3.y != 0.0);
    r0.y = (0.0 == 0.0 && r3.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.xx * float2(8e+02, -1e+03);
        r9.y = r1.y + r9.y;
        ps = 3.3333333 * r0.z;
        r6.y = r1.w + r9.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r3.x = float((r0.z > 0.7));
        r1.y = r3.x * r1.y;
    }
    p0 = (r0.y == 0.0 && r1.y != 0.0);
    r0.y = (r0.y == 0.0 && r1.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r1.yw = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r9.y = r1.y + r9.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r9.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r9.z;
        r6.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.y * r0.z;
    r0.y = saturate(ps);
    r0.y = r3.x * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.yy * float2(8e+02, -1e+03);
        r9.x = r1.y + r9.x;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r9.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r3.x = float((r0.x > 0.7));
        r1.y = r3.x * r1.y;
    }
    p0 = (r0.z == 0.0 && r1.y != 0.0);
    r0.z = (r0.z == 0.0 && r1.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r1.yw = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r9.x = r1.y + r9.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r9.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r9.z;
        r6.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r9.z;
    r6.y = ps;
    r0.z = float((r9.z >= r6.z));
    r10.x = -r7.w * r5.y + r6.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r6.yz + r10.yy;
    r5.y = ps;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xy = float2((r6.zy >= r10.xy));
    r0.xy = r6.xx * r5.zz + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r6.yz;
    r0.x = (r3.y == 0.0) ? r6.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r3.x == 0.0) ? r10.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r5.w + r1.z;
            ps = r1.z + r1.z;
            r5.y = r0.w * r0.y;
            r1.y = ps;
            ps = r5.y;
            r6.yz = r5.wy - r1.xx;
            r3.x = ps;
            ps = r1.x;
            r0.z = r6.y + r1.z;
            r3.y = ps;
            ps = max(r3.x, r3.y);
            r1.x = float((r6.z > r0.z));
            r0.z = ps;
            r0.x = (r1.x == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.z = r5.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r5.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r1.x = ps;
    ps = r3.w;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r3.x = ps;
    ps = 1e+01;
    r3.yz = -r5.xy + 1.0;
    r3.w = ps;
    ps = min(r3.x, r3.w);
    r1.z = r6.w * r3.y;
    r3.x = ps;
    r1.xz = r1.xz * r3.xz;
    ps = 25.0 * r0.x;
    r3.x = frac(r1.x);
    r1.x = ps;
    ps = r1.z;
    r0.x = r3.x - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r5.y + ps;
    r0.x = r1.x * r0.x;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.w;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r6.x * 6.2831;
    r0.y = r0.y * r0.z;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.y = frac(r0.y);
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r0.y * 4e+02;
    r0.y = r0.y * r1.x;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r1.w;
    if (p0)
    {
        r9.x = r0.y + r9.x;
    }
    if (!p0)
    {
        r9.y = r0.y + r9.y;
    }
    r1 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r1;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r9.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o2.xyz = r11.xyz;
    o4 = r8;
    o6 = r2.xzyw;
    o0 = r12;
    o1 = r13;
    o3 = r4;

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
