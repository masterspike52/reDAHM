// vs_7d5919c730827344.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1167 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 0000123C 0061000D 00000000 00000000 00006CE7 00000001 00000006 00000007 00000290 0010002D 0000602E 0000702F 00003030 00005031 00215032 0000F050 0001F155 00027256 0003F357 0004F4A0 0005F5A1 0006F6A2 00001181 00001182 0000117E 00001183 0000117F 0000117D 00001180
//   vertex element: instruction 45 -> POSITION0
//   vertex element: instruction 46 -> TANGENT0
//   vertex element: instruction 47 -> BINORMAL0
//   vertex element: instruction 48 -> NORMAL0
//   vertex element: instruction 49 -> TEXCOORD0
//   vertex element: instruction 50 -> TEXCOORD1
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
// NOTE: unhandled control flow cjmp at cf 48
// NOTE: unhandled control flow cjmp at cf 50
// NOTE: unhandled control flow cjmp at cf 53
// NOTE: unhandled control flow cjmp at cf 62
// NOTE: unhandled control flow cjmp at cf 64
// NOTE: unhandled control flow cjmp at cf 68
// NOTE: unhandled control flow cjmp at cf 72
// NOTE: unhandled control flow cjmp at cf 80

#include "xenos_common.hlsli"

float4 BBox_Center : register(c17); // float3
float4 BBox_Size : register(c16); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c20); // float
float4 CylDemMask_Shallowness : register(c19); // float
float4 Demolition_Center : register(c18); // float3
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c21); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c15); // float
float4 SP_Demolition_Style : register(c14); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c25); // float3x3 (matrix_columns)

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
    r3 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.x;
    r9.xyz = r6.zxy * 0.003921569;
    r8.x = ps;
    r2.y = -r1.z * 0.007843138 + 1.0;
    r2.xz = r1.xy * 0.007843138 - 1.0;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r7.xyz = r11.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r7.xxz * r5.xzz;
    r8.y = ps;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0] + r0.xzyw;
    r4.xyz = r7.zyy * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r1.w = dot(r2.xyz, r4.xyz);
    r8.z = ps;
    r9.w = r1.w * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r2.y = ps;
    ps = 1.0 / BBox_Size.y;
    r4.y = BBox_Size.z * 0.0026041667;
    r2.z = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r0.zwy + r10.xyz;
    r0.x = ps;
    ps = r3.z;
    r1.w = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r3.xz = saturate(r3.xy * r2.yz);
    r3.y = saturate(ps);
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = r3.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.w = max(CylDemMask_Shallowness.x, 1.0);
    r2.xw = -r0.zw + Demolition_Center.xy;
    ps = -r2.w * -r2.w;
    r2.yz = -r2.xw + BBox_Size.xy;
    r5.x = ps;
    r4.xz = r3.zx * BBox_Size.yx - r2.wx;
    r2.w = dot(r4.zx, r4.zx) + 0.0;
    ps = -r2.x * -r2.x;
    r5.zw = r2.yz * r2.yz;
    r5.y = ps;
    ps = 1.0 / r1.w;
    r5 = r5.zyyz + r5.wxwx;
    r2.z = ps;
    ps = sqrt(abs(r5.w));
    r2.x = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r5.y));
    r2.y = r2.x * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r5.z));
    r3.w = max(r1.w, r3.w);
    r1.w = ps;
    ps = sqrt(abs(r5.x));
    r1.w = max(r3.w, r1.w);
    r3.w = ps;
    ps = sqrt(abs(r2.w));
    r1.w = max(r1.w, r3.w);
    r2.w = ps;
    ps = 1.0 / r1.w;
    r2.z = r2.z * r2.w;
    r1.w = ps;
    r1.w = -r2.z * r1.w + r2.x;
    ps = 1.0 / r2.x;
    r1.w = max(r1.w, 0.0);
    r2.x = ps;
    r1.w = saturate(r1.w * r2.x);
    r2.x = -r1.w * 2.0 + 3.0;
    ps = r1.w * r1.w;
    r1.w = ps;
    r1.w = r2.y * r1.w;
    r2.x = saturate(r1.w * r2.x);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.z = SP_Demolition_Style.x + 0.5;
    r2.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = float((SP_Demolition_Style.x > 0.5));
    r0.w = ps;
    ps = Demolition_Center.z - r0.y;
    r5.x = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.z = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r2.y = r5.z * r0.y;
            r2.w = ps;
            r0.z = r2.y + r2.w;
            ps = BBox_Size.z * r2.y;
            r0.y = float((r3.y >= r2.y));
            r2.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r7.y = r0.z * BBox_Size.z;
            r0.w = ps;
        }
    }
    if (!p0)
    {
        ps = r4.w;
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r7.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r0.z = ps;
    ps = BBox_Size.z * r2.x;
    r3.w = float((1.0 > SP_Demolition_Style.x));
    r1.w = ps;
    ps = r2.x;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r0.w * ps;
    r0.y = r0.y * r3.w;
    r4.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yw = r2.yx + r2.wx;
    // UNHANDLED control flow: cjmp
    r3.w = saturate(r5.w * r0.w);
    r2.x = float((r3.y > r5.y));
    ps = sqrt(abs(r3.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r5.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = r3.w * r5.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r5.y = float((0.3 >= r3.z));
    ps = 0.00013333333 * r0.y;
    r5.y = r2.x * r5.y;
    r0.y = saturate(ps);
    r0.y = r3.w * r0.y;
    p0 = (0.0 == 0.0 && r5.y != 0.0);
    r3.w = (0.0 == 0.0 && r5.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r3.z;
        r0.z = ps;
        r7.xw = r0.yy * float2(-1e+03, 8e+02) + r10.zy;
    }
    p0 = (r3.w == 1.0);
    ps = p0 ? 0.0 : ((r3.w == 0.0) ? 1.0 : r3.w);
    r3.w = ps;
    if (p0)
    {
        r5.y = float((r3.z > 0.7));
        r2.x = r5.y * r2.x;
    }
    p0 = (r3.w == 0.0 && r2.x != 0.0);
    r3.w = (r3.w == 0.0 && r2.x != 0.0) ? 0.0 : r3.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r3.z;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r0.z = ps;
        r7.xw = r0.yy * float2(-1e+03, -8e+02) + r10.zy;
    }
    p0 = (r3.w == 1.0);
    ps = p0 ? 0.0 : ((r3.w == 0.0) ? 1.0 : r3.w);
    r3.w = ps;
    if (p0)
    {
        r7.xw = r10.zy;
    }
    ps = r10.x;
    r7.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r5.y = float((0.3 >= r3.x));
    ps = 0.00013333333 * r0.y;
    r5.y = r2.x * r5.y;
    r0.y = saturate(ps);
    r0.y = r3.w * r0.y;
    p0 = (0.0 == 0.0 && r5.y != 0.0);
    r3.w = (0.0 == 0.0 && r5.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r3.x;
        r0.z = ps;
        r7.xz = r0.yy * float2(-1e+03, 8e+02) + r10.zx;
    }
    p0 = (r3.w == 1.0);
    ps = p0 ? 0.0 : ((r3.w == 0.0) ? 1.0 : r3.w);
    r3.w = ps;
    if (p0)
    {
        r5.y = float((r3.x > 0.7));
        r2.x = r5.y * r2.x;
    }
    p0 = (r3.w == 0.0 && r2.x != 0.0);
    r3.w = (r3.w == 0.0 && r2.x != 0.0) ? 0.0 : r3.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r3.x;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r0.z = ps;
        r7.xz = r0.yy * float2(-1e+03, -8e+02) + r10.zx;
    }
    p0 = (r3.w == 1.0);
    ps = p0 ? 0.0 : ((r3.w == 0.0) ? 1.0 : r3.w);
    r3.w = ps;
    if (p0)
    {
        r7.xz = r10.zx;
    }
    ps = r10.y;
    r7.w = ps;
    // UNHANDLED control flow: cjmp
    r7.xzw = r10.zxy;
    r3.w = float((r10.z >= r7.y));
    r2.x = -r1.w * r0.w + r7.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yw = -r7.xy + r2.zz;
    r5.y = ps;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.xy = float2((r7.yx >= r2.xz));
    r0.yw = r3.yy * r4.ww + r0.yw;
    r0.yw = r0.yw * SP_DemolitionSpread.xx + r7.xy;
    r0.y = (r8.y == 0.0) ? r7.x : r0.y;
    r0.y = (r3.w == 0.0) ? r0.y : r0.w;
    r1.w = (r8.x == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.w = r5.z + r2.w;
            ps = r2.w + r2.w;
            r5.y = r0.x * r1.w;
            r2.x = ps;
            ps = r5.y;
            r7.xy = r5.zy - r2.yy;
            r4.x = ps;
            ps = r2.y;
            r0.y = r7.x + r2.w;
            r4.w = ps;
            ps = max(r4.x, r4.w);
            r2.y = float((r7.y > r0.y));
            r0.y = ps;
            r0.y = (r2.y == 0.0) ? r0.y : r0.w;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.x;
            r0.y = r5.y - r0.y;
            r0.w = ps;
            r0.y = r0.y * r0.w;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.y = ps;
        }
    }
    r0.w = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r2.x = float((0.5 > SP_Demolition_Style.x));
    r4.x = ps;
    ps = r4.y;
    r0.y = float((SP_DemolitionSpread.x >= 0.25));
    r5.z = ps;
    ps = 1e+01;
    r2.zw = -r5.xy + 1.0;
    r5.w = ps;
    ps = min(r5.z, r5.w);
    r4.w = r4.z * r2.z;
    r2.y = ps;
    r2.yz = r4.xw * r2.yw;
    ps = 25.0 * r0.y;
    r2.w = frac(r2.y);
    r0.y = ps;
    ps = r2.z;
    r2.y = r2.w - 0.5;
    r2.y = -abs(r2.y) * 2.0 + 1.0;
    ps = r5.y + ps;
    r0.y = r0.y * r2.y;
    r3.w = ps;
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.y * r0.x;
    r0.x = -r0.x * r1.w + r1.w;
    // UNHANDLED control flow: cjmp
    r2.xy = r3.yw * float2(6.2831, 4e+02);
    r0.y = r2.x * r0.w;
    r0.y = r0.y * 0.15915494 + 0.5;
    ps = frac(r0.y);
    r0.y = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.w = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r2.y * r0.y;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r0.z;
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
    r2.y = -r1.z * 0.007843138 + 1.0;
    r2.xz = r1.xy * 0.007843138 - 1.0;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r4;
    r8.yzw = r11.zxy * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.z;
    r4.xyz = r8.yyw * r5.xzz;
    r8.y = ps;
    r0 = r7.wwww * LocalToWorld[1].xzyw + r0;
    r0 = r7.zzzz * LocalToWorld[0] + r0.xzyw;
    r4.xyz = r8.wzz * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.y;
    r1.w = dot(r2.xyz, r4.xyz);
    r8.z = ps;
    r9.w = r1.w * 0.5 + 0.5;
    r2 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r4 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r5.xyz = r6.xzy * 0.007843138 - 1.0;
    r6.xyz = r11.xzy * 0.007843138 - 1.0;
    r7.xyz = r1.yzx * 0.007843138 - 1.0;
    r11 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r4;
    r13.xyz = -r0.zyx * CameraPosition.www + CameraPosition.zyx;
    r4.xyz = r0.xyz - CameraPosition.xyz;
    r0.w = dot(r4.zxy, r4.zxy);
    r1.yzw = r13.xxx * WorldToLocal[2].xzy;
    r1.x = float((0.001 >= abs(r4.z)));
    r11 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r11.xzwy;
    r11 = r0.xxxx * ViewProjectionMatrix[0] + r11.xzyw;
    r1.x = (r1.x == 0.0) ? r4.z : 0.001;
    r1.yzw = r13.yyy * WorldToLocal[1].xzy + r1.yzw;
    ps = sqrt(abs(r0.w));
    r4 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r0.x = ps;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r1.yzw = r13.zzz * WorldToLocal[0].xyz + r1.ywz;
    r13.x = dot(r7.xzy, r1.wyz);
    r13.y = dot(r6.yxz, r1.wyz);
    ps = 1.0 / r1.x;
    r13.z = dot(r5.zyx, r1.wyz);
    r1.x = ps;
    r4 = saturate(r4.wzyx * r1.xxxx);
    r1 = saturate(r2.wzyx * r1.xxxx);
    r2 = max(r0, 0.0);
    r0.xyz = r2.xyz * FogDistanceScale.wzy;
    r1 = r4.wzyx - r1.wzyx;
    r0.xyw = r0.yzx * abs(r1.yzx);
    ps = pow(2.0, r0.y);
    r4.x = abs(r1.w) * FogDistanceScale.x;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r1 = abs(r1) * r2;
    r0.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = r4.x * r2.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r1 = float4((FogExtinctionDistance.wzyx > r1));
    r0.x = ps;
    r2 = r1.yxzw * r0.zwyx;
    ps = r2.z * r2.w;
    r0 = r2 - 1.0;
    r5.w = ps;
    ps = r0.x;
    r1.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r5.xyz = r0.www * FogInScattering[0].xyz;
    r4.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r5 = r2.zzzx * r5;
    r4.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r2.w = r2.y * r5.w;
    r4.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r5.xyz;
    r0.xyz = r2.xxx * r0.xyz + r4.xyz;
    r2.xyz = r2.yyy * r0.xyz + r1.xyz;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r6.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r5.x = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r4.xyz = -r1.yzx + r10.xyz;
    r0.w = ps;
    ps = r4.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r4.xy * r0.xz);
    r4.w = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r4.w * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r4.xy = -r1.yz + Demolition_Center.xy;
    ps = -r4.y * -r4.y;
    r5.yz = -r4.xy + BBox_Size.xy;
    r6.x = ps;
    r6.yz = r0.zx * BBox_Size.yx - r4.yx;
    r4.y = dot(r6.zy, r6.zy) + 0.0;
    ps = -r4.x * -r4.x;
    r6.zw = r5.yz * r5.yz;
    r6.y = ps;
    ps = 1.0 / r0.y;
    r6 = r6.zyyz + r6.wxwx;
    r4.z = ps;
    ps = sqrt(abs(r6.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.y = ps;
    ps = sqrt(abs(r6.w));
    r4.x = r0.y * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r6.z));
    r5.y = max(r5.y, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r6.x));
    r5.y = max(r5.y, r1.w);
    r1.w = ps;
    ps = sqrt(abs(r4.y));
    r1.w = max(r5.y, r1.w);
    r4.y = ps;
    ps = 1.0 / r1.w;
    r4.y = r4.z * r4.y;
    r1.w = ps;
    r1.w = -r4.y * r1.w + r0.y;
    ps = 1.0 / r0.y;
    r1.w = max(r1.w, 0.0);
    r0.y = ps;
    r1.w = saturate(r1.w * r0.y);
    r0.y = -r1.w * 2.0 + 3.0;
    r1.w = r1.w * r1.w;
    r1.w = r4.x * r1.w;
    r6.y = saturate(r1.w * r0.y);
    ps = Demolition_Center.z - r1.x;
    r1.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r4.z = float((SP_Demolition_Style.x > 0.5));
    r1.x = ps;
    ps = 1.0;
    r6.x = saturate(floor(r1.y));
    r1.y = ps;
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.x = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r1.x = r7.x * r0.y;
            r1.z = ps;
            r1.y = r1.x + r1.z;
            ps = BBox_Size.z * r1.x;
            r0.y = float((r4.w >= r1.x));
            r6.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.z = r1.y * BBox_Size.z;
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
            r5.z = r5.w;
            r6.w = ps;
        }
    }
    r1.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.y;
    r4.x = float((Collapse_Endcaps.x > 0.5));
    r6.z = ps;
    ps = r6.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.y * ps;
    r0.y = r4.x * r0.y;
    r7.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xy = r1.xy + r1.zy;
    // UNHANDLED control flow: cjmp
    r4.x = float((r4.w > r4.x));
    r4.y = saturate(r4.y * r6.y);
    ps = sqrt(abs(r4.w));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r1.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.y = r4.y * r1.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r4.y = r4.x * r0.x;
    r0.x = saturate(ps);
    r0.x = r1.y * r0.x;
    p0 = (0.0 == 0.0 && r4.y != 0.0);
    r0.y = (0.0 == 0.0 && r4.y != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.xx * float2(8e+02, -1e+03);
        r10.y = r1.y + r10.y;
        ps = 3.3333333 * r0.z;
        r5.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r1.y = float((r0.z > 0.7));
        r1.y = r1.y * r4.x;
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
        r5.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r10.z;
        r5.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r4.x * r0.z;
    r0.y = saturate(ps);
    r0.y = r1.y * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yw = r0.yy * float2(8e+02, -1e+03);
        r10.x = r1.y + r10.x;
        ps = 3.3333333 * r0.x;
        r5.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r1.y = float((r0.x > 0.7));
        r1.y = r1.y * r4.x;
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
        r5.y = r1.w + r10.z;
        r1.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r10.z;
        r5.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r10.z;
    r5.y = ps;
    r0.z = float((r10.z >= r5.z));
    r6.z = -r6.z * r6.y + r5.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r5.yz + r6.ww;
    r6.y = ps;
    p0 = (r4.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xy = float2((r5.zy >= r6.zw));
    r0.xy = r4.ww * r5.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r5.yz;
    r0.x = (r4.y == 0.0) ? r5.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r4.x == 0.0) ? r6.z : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r7.x + r1.z;
            ps = r1.z + r1.z;
            r7.y = r0.w * r0.y;
            r1.y = ps;
            ps = r7.y;
            r5.yz = r7.xy - r1.xx;
            r4.x = ps;
            ps = r1.x;
            r0.z = r5.y + r1.z;
            r4.y = ps;
            ps = max(r4.x, r4.y);
            r1.x = float((r5.z > r0.z));
            r0.z = ps;
            r0.x = (r1.x == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.z = r7.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r6.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r1.x = ps;
    ps = r5.x;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r5.x = ps;
    ps = 1e+01;
    r4.yz = -r6.xy + 1.0;
    r5.y = ps;
    ps = min(r5.x, r5.y);
    r1.z = r7.z * r4.y;
    r4.x = ps;
    r1.xz = r1.xz * r4.xz;
    ps = 25.0 * r0.x;
    r4.x = frac(r1.x);
    r1.x = ps;
    ps = r1.z;
    r0.x = r4.x - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r6.y + ps;
    r0.x = r1.x * r0.x;
    r1.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.w;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r4.w * 6.2831;
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
    o2.xyz = r13.xyz;
    o4 = r9;
    o6 = r3.xzyw;
    o0 = r12;
    o1 = r11;
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
