// vs_3b17aaf43a404311.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1209 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 000012E4 00610011 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 0010002E 0000602F 00007030 00003031 00005032 00215033 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 0000118F 00001190 0000118C 00001191 0000118D 0000118B 0000118E
//   vertex element: instruction 46 -> POSITION0
//   vertex element: instruction 47 -> TANGENT0
//   vertex element: instruction 48 -> BINORMAL0
//   vertex element: instruction 49 -> NORMAL0
//   vertex element: instruction 50 -> TEXCOORD0
//   vertex element: instruction 51 -> TEXCOORD1
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
// NOTE: unhandled control flow cjmp at cf 50
// NOTE: unhandled control flow cjmp at cf 52
// NOTE: unhandled control flow cjmp at cf 55
// NOTE: unhandled control flow cjmp at cf 64
// NOTE: unhandled control flow cjmp at cf 66
// NOTE: unhandled control flow cjmp at cf 70
// NOTE: unhandled control flow cjmp at cf 74
// NOTE: unhandled control flow cjmp at cf 82

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
    float4 r17 = 0.0;
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
    r1.xyz = In.tangent0.xzy;
    r11.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.yzx;
    r12.xy = In.texcoord0.xy;
    r12.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.x;
    r9.xyz = r6.zxy * 0.003921569;
    r8.x = ps;
    r3.y = -r1.z * 0.007843138 + 1.0;
    r3.xz = r1.xy * 0.007843138 - 1.0;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r7.xyz = r11.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r7.xxz * r5.xzz;
    r8.y = ps;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].zxyw + r0.yxzw;
    r4.xyz = r7.zyy * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r1.w = dot(r3.xyz, r4.xyz);
    r8.z = ps;
    r9.w = r1.w * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.x = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r4.x = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.xyw = -BBox_Size.xyz * 0.5 + BBox_Center.xyz;
    ps = 1.0 / BBox_Size.z;
    r3.yzw = -r0.xyw + r10.xyz;
    r0.z = ps;
    ps = r3.w;
    r1.w = float((2.0 > SP_Demolition_Style.x));
    ps = r0.z * ps;
    r2.xz = saturate(r3.yz * r2.xy);
    r2.y = saturate(ps);
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.z = r2.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.w = max(CylDemMask_Shallowness.x, 1.0);
    r3.xz = -r0.xy + Demolition_Center.xy;
    ps = -r3.z * -r3.z;
    r3.yw = -r3.xz + BBox_Size.xy;
    r5.x = ps;
    r4.yw = r2.zx * BBox_Size.yx - r3.zx;
    r3.z = dot(r4.wy, r4.wy) + 0.0;
    ps = -r3.x * -r3.x;
    r5.zw = r3.yw * r3.yw;
    r5.y = ps;
    ps = 1.0 / r1.w;
    r5 = r5.zyyz + r5.wxwx;
    r3.y = ps;
    ps = sqrt(abs(r5.w));
    r2.w = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r5.y));
    r3.x = r2.w * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r5.z));
    r3.w = max(r1.w, r3.w);
    r1.w = ps;
    ps = sqrt(abs(r5.x));
    r1.w = max(r3.w, r1.w);
    r3.w = ps;
    ps = sqrt(abs(r3.z));
    r1.w = max(r1.w, r3.w);
    r3.z = ps;
    ps = 1.0 / r1.w;
    r3.y = r3.y * r3.z;
    r1.w = ps;
    r1.w = -r3.y * r1.w + r2.w;
    ps = 1.0 / r2.w;
    r1.w = max(r1.w, 0.0);
    r2.w = ps;
    r1.w = saturate(r1.w * r2.w);
    r2.w = -r1.w * 2.0 + 3.0;
    ps = r1.w * r1.w;
    r1.w = ps;
    r1.w = r3.x * r1.w;
    r3.x = saturate(r1.w * r2.w);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.x = SP_Demolition_Style.x + 0.5;
    r3.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r2.w = float((SP_Demolition_Style.x > 0.5));
    r1.w = ps;
    ps = Demolition_Center.z - r0.w;
    r4.w = saturate(floor(r0.x));
    r0.x = ps;
    p0 = (r2.w != 0.0);
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
            r1.w = ps;
        }
    }
    if (!p0)
    {
        ps = r4.z;
        r3.zw = float2((-abs(r0.xx) > 0.0));
        r7.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r0.w = ps;
    ps = BBox_Size.z * r3.x;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    r4.y = ps;
    ps = r3.x;
    r0.x = float((Collapse_Endcaps.x > 0.5));
    ps = r1.w * ps;
    r5.y = r0.x * r0.y;
    r5.z = ps;
    p0 = (r5.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xy = r3.yx + r3.wx;
    // UNHANDLED control flow: cjmp
    r3.x = saturate(r0.y * r1.w);
    r0.x = float((r2.y > r0.x));
    ps = sqrt(abs(r2.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r5.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.x = r3.x * r5.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r5.y = float((0.3 >= r2.z));
    ps = 0.00013333333 * r0.y;
    r5.y = r0.x * r5.y;
    r0.y = saturate(ps);
    r0.y = r3.x * r0.y;
    p0 = (0.0 == 0.0 && r5.y != 0.0);
    r3.x = (0.0 == 0.0 && r5.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.z;
        r0.w = ps;
        r7.xw = r0.yy * float2(-1e+03, 8e+02) + r10.zy;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r5.y = float((r2.z > 0.7));
        r0.x = r5.y * r0.x;
    }
    p0 = (r3.x == 0.0 && r0.x != 0.0);
    r3.x = (r3.x == 0.0 && r0.x != 0.0) ? 0.0 : r3.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.z;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.w = ps;
        r7.xw = r0.yy * float2(-1e+03, -8e+02) + r10.zy;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r7.xw = r10.zy;
    }
    ps = r10.x;
    r7.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r5.y = float((0.3 >= r2.x));
    ps = 0.00013333333 * r0.y;
    r5.y = r0.x * r5.y;
    r0.y = saturate(ps);
    r0.y = r3.x * r0.y;
    p0 = (0.0 == 0.0 && r5.y != 0.0);
    r3.x = (0.0 == 0.0 && r5.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.x;
        r0.w = ps;
        r7.xz = r0.yy * float2(-1e+03, 8e+02) + r10.zx;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r5.y = float((r2.x > 0.7));
        r0.x = r5.y * r0.x;
    }
    p0 = (r3.x == 0.0 && r0.x != 0.0);
    r3.x = (r3.x == 0.0 && r0.x != 0.0) ? 0.0 : r3.x + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.w = ps;
        r7.xz = r0.yy * float2(-1e+03, -8e+02) + r10.zx;
    }
    p0 = (r3.x == 1.0);
    ps = p0 ? 0.0 : ((r3.x == 0.0) ? 1.0 : r3.x);
    r3.x = ps;
    if (p0)
    {
        r7.xz = r10.zx;
    }
    ps = r10.y;
    r7.w = ps;
    // UNHANDLED control flow: cjmp
    r7.xzw = r10.zxy;
    r6.w = float((r10.z >= r7.y));
    r3.x = -r4.y * r1.w + r7.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r7.xy + r3.zz;
    r4.y = ps;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yw = float2((r7.yx >= r3.xz));
    r0.xy = r2.yy * r4.zz + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r7.xy;
    r0.x = (r5.w == 0.0) ? r7.x : r0.x;
    r0.x = (r6.w == 0.0) ? r0.x : r0.y;
    r1.w = (r5.y == 0.0) ? r3.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.y = r5.x + r3.w;
            ps = r3.w + r3.w;
            r5.y = r0.z * r1.w;
            r2.w = ps;
            ps = r5.y;
            r3.xz = r5.xy - r3.yy;
            r4.y = ps;
            ps = r3.y;
            r0.x = r3.x + r3.w;
            r4.z = ps;
            ps = max(r4.y, r4.z);
            r3.x = float((r3.z > r0.x));
            r0.x = ps;
            r0.x = (r3.x == 0.0) ? r0.x : r0.y;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.w;
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
    r3.x = float((0.5 > SP_Demolition_Style.x));
    r5.x = ps;
    ps = r4.x;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r4.x = ps;
    ps = 1e+01;
    r3.zw = -r4.wy + 1.0;
    r4.z = ps;
    ps = min(r4.x, r4.z);
    r5.y = r5.z * r3.z;
    r3.y = ps;
    r3.yz = r5.xy * r3.yw;
    ps = 25.0 * r0.x;
    r2.w = frac(r3.y);
    r0.x = ps;
    ps = r3.z;
    r2.w = r2.w - 0.5;
    r2.w = -abs(r2.w) * 2.0 + 1.0;
    ps = r4.y + ps;
    r0.x = r0.x * r2.w;
    r2.w = ps;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.z;
    r0.x = -r0.x * r1.w + r1.w;
    // UNHANDLED control flow: cjmp
    r3.xy = r2.yw * float2(6.2831, 4e+02);
    r0.y = r3.x * r0.y;
    r0.y = r0.y * 0.15915494 + 0.5;
    ps = frac(r0.y);
    r0.y = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r3.y * r0.y;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r0.w;
    if (p0)
    {
        r7.z = r0.y + r7.z;
    }
    if (!p0)
    {
        r7.w = r0.y + r7.w;
    }
    r4 = r10.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.x;
    r9.xyz = r6.zxy * 0.003921569;
    r8.x = ps;
    r3.y = -r1.z * 0.007843138 + 1.0;
    r3.xz = r1.xy * 0.007843138 - 1.0;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r4;
    r8.yzw = r11.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r8.yyw * r5.xzz;
    r8.y = ps;
    r0 = r7.wwww * LocalToWorld[1].xzyw + r0;
    r0 = r7.zzzz * LocalToWorld[0].zxyw + r0.yxzw;
    r4.xyz = r8.wzz * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r1.w = dot(r3.xyz, r4.xyz);
    r8.z = ps;
    r9.w = r1.w * 0.5 + 0.5;
    r15 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r14 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r3 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r4.xyz = r6.xzy * 0.007843138 - 1.0;
    r5.xyz = r11.xzy * 0.007843138 - 1.0;
    r1.yzw = r1.yzx * 0.007843138 - 1.0;
    ps = FogVolumeBoxMin.z - r0.x;
    r7.xyz = -r0.xyz + FogVolumeBoxMax.zxy;
    r11.x = ps;
    r13 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r3;
    ps = FogVolumeBoxMin.x - r0.y;
    r16.xyz = r0.yzx - CameraPosition.xyz;
    r11.y = ps;
    r3.xyw = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = FogVolumeBoxMin.y - r0.z;
    r6.xyz = -r0.yzx + CameraPosition.xyz;
    r11.z = ps;
    ps = 1.0 / r6.x;
    r0.w = dot(r6.zxy, r6.zxy);
    r6.x = ps;
    ps = 1.0 / r6.y;
    r17.xyz = r3.xxx * WorldToLocal[2].xyz;
    r6.y = ps;
    ps = 1.0 / r6.z;
    r1.x = float((0.001 >= abs(r16.z)));
    r6.z = ps;
    r13 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r13.xzwy;
    r13 = r0.yyyy * ViewProjectionMatrix[0] + r13.xzyw;
    r1.x = (r1.x == 0.0) ? r16.z : 0.001;
    r3.xyz = r3.yyy * WorldToLocal[1].xyz + r17.xyz;
    ps = sqrt(abs(r0.w));
    r4.w = dot(r16.zxy, r16.zxy);
    r0.y = ps;
    r11.yzw = r11.xzy * r6.zyx;
    ps = sqrt(abs(r4.w));
    r0.xzw = r7.yzx * r6.xyz;
    r4.w = ps;
    r7 = r4.wwww - FogStartDistance.wzyx;
    r3.xyz = r3.www * WorldToLocal[0].xzy + r3.xzy;
    ps = 1.0 / r1.x;
    r11.x = dot(r1.ywz, r3.yxz);
    r1.x = ps;
    r14 = saturate(r14.wzyx * r1.xxxx);
    r6 = saturate(r15.wzyx * r1.xxxx);
    r1.xyw = min(r11.yzw, r0.wzx);
    r11.yzw = max(r11.ywz, r0.wxz);
    ps = FirstDensityFunctionParameters.x * r0.y;
    r7 = max(r7, 0.0);
    r0.z = ps;
    ps = min(r11.w, r11.y);
    r6 = r14.wzyx - r6.wzyx;
    r3.w = ps;
    ps = max(r1.y, r1.x);
    r1.z = abs(r6.w) * FogDistanceScale.x;
    r4.w = ps;
    ps = r4.w;
    r0.xyw = r7.xyz * FogDistanceScale.wzy;
    r1.y = ps;
    ps = r1.w;
    r1.x = saturate(min(r3.w, r11.z));
    r1.w = ps;
    ps = max(r1.y, r1.w);
    r0.xyw = r0.ywx * abs(r6.yzx);
    r1.w = saturate(ps);
    ps = pow(2.0, r0.y);
    r6 = abs(r6) * r7;
    r1.y = ps;
    ps = pow(2.0, r0.x);
    r0.y = r1.z * r7.w;
    r1.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = saturate(-r1.w + r1.x);
    r1.w = ps;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.x;
    r1.x = ps;
    ps = pow(2.0, -r0.x);
    r6 = float4((FogExtinctionDistance.wzyx > r6));
    r0.z = ps;
    ps = 1.0 - r0.z;
    r1 = r6.wzyx * r1;
    r0.x = ps;
    ps = r1.y * r1.x;
    r11.y = dot(r5.yxz, r3.yxz);
    r0.w = ps;
    ps = ApproxFogColor.z * r0.x;
    r11.z = dot(r4.zyx, r3.yxz);
    r6.x = ps;
    ps = r1.w;
    r3 = r1.wzyx - 1.0;
    r0.y = ps;
    ps = ApproxFogColor.x * r0.y;
    r4.w = r1.z * r0.w;
    r0.y = ps;
    ps = ApproxFogColor.y * r0.x;
    r0.y = r0.y * r4.w;
    r6.y = ps;
    ps = r0.y;
    r4.xyz = r3.www * FogInScattering[0].xyz;
    ps = r0.x * ps;
    r5 = r1.yyyw * r4;
    r0.x = ps;
    ps = r5.w;
    r4.xyz = r3.yyy * FogInScattering[2].xyz;
    ps = r0.z * ps;
    r0.yw = r6.xy * r5.ww;
    r4.w = ps;
    r5.xyz = r3.zzz * FogInScattering[1].xyz + r5.xyz;
    r1.xyz = r1.zzz * r5.xzy + r4.xzy;
    r0.xyz = r3.xxx * FogInScattering[3].xyz + r0.xwy;
    r4.xyz = r1.www * r1.xzy + r0.xyz;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r5.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r3.w = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r1.yzx + r10.xyz;
    r0.w = ps;
    ps = r3.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r3.xy * r0.xz);
    r5.z = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r5.z * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r3.xy = -r1.yz + Demolition_Center.xy;
    ps = -r3.y * -r3.y;
    r5.xy = -r3.xy + BBox_Size.xy;
    r6.x = ps;
    r6.yz = r0.zx * BBox_Size.yx - r3.yx;
    r3.y = dot(r6.zy, r6.zy) + 0.0;
    ps = -r3.x * -r3.x;
    r6.zw = r5.xy * r5.xy;
    r6.y = ps;
    ps = 1.0 / r0.y;
    r6 = r6.zyyz + r6.wxwx;
    r3.z = ps;
    ps = sqrt(abs(r6.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.x = ps;
    ps = sqrt(abs(r6.w));
    r3.x = r0.y * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r6.z));
    r5.x = max(r5.x, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r6.x));
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
    r6.x = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r1.x = r6.x * r0.y;
            r1.z = ps;
            r1.y = r1.x + r1.z;
            ps = BBox_Size.z * r1.x;
            r0.y = float((r5.z >= r1.x));
            r7.y = ps;
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
            r6.z = r5.w;
            r7.y = ps;
        }
    }
    r1.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.y;
    r3.x = float((Collapse_Endcaps.x > 0.5));
    r7.x = ps;
    ps = r5.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.y * ps;
    r0.y = r3.x * r0.y;
    r6.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xy = r1.xy + r1.zy;
    // UNHANDLED control flow: cjmp
    r1.y = float((r5.z > r3.x));
    r3.y = saturate(r3.y * r5.y);
    ps = sqrt(abs(r5.z));
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
        r10.y = r1.y + r10.y;
        ps = 3.3333333 * r0.z;
        r6.y = r1.w + r10.z;
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
        r10.y = r1.y + r10.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r10.z;
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
        r10.x = r1.y + r10.x;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r10.z;
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
        r10.x = r1.y + r10.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r10.z;
        r6.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r10.z;
    r6.y = ps;
    r0.z = float((r10.z >= r6.z));
    r7.x = -r7.x * r5.y + r6.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r6.yz + r7.yy;
    r5.y = ps;
    p0 = (r3.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xy = float2((r6.zy >= r7.xy));
    r0.xy = r5.zz * r5.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r6.yz;
    r0.x = (r3.y == 0.0) ? r6.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r3.x == 0.0) ? r7.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r6.x + r1.z;
            ps = r1.z + r1.z;
            r6.y = r0.w * r0.y;
            r1.y = ps;
            ps = r6.y;
            r5.yw = r6.xy - r1.xx;
            r3.x = ps;
            ps = r1.x;
            r0.z = r5.y + r1.z;
            r3.y = ps;
            ps = max(r3.x, r3.y);
            r1.x = float((r5.w > r0.z));
            r0.z = ps;
            r0.x = (r1.x == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.z = r6.y - r0.x;
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
    r0.y = r5.z * 6.2831;
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
    o5.xyz = r8.xyz;
    o5.w = 0.0;
    o2.xyz = r11.xyz;
    o4 = r9;
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
