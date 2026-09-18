// vs_cc5d35d205b1fce1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 972 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00000F30 0031000A 00000000 00000000 00004084 00000001 00000004 00000004 00000290 00100028 0001A029 0000502A 0021502B 0000F050 0001F157 0002F2A0 0003F3A2 00001142 0000113F 00001140 00001141
//   vertex element: instruction 40 -> POSITION0
//   vertex element: instruction 41 -> COLOR1
//   vertex element: instruction 42 -> TEXCOORD0
//   vertex element: instruction 43 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 1
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 16
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 37
// NOTE: unhandled control flow cjmp at cf 39
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled control flow cjmp at cf 51
// NOTE: unhandled control flow cjmp at cf 53
// NOTE: unhandled control flow cjmp at cf 57
// NOTE: unhandled control flow cjmp at cf 61
// NOTE: unhandled control flow cjmp at cf 69

#include "xenos_common.hlsli"

float4 BBox_Center : register(c8); // float3
float4 BBox_Size : register(c7); // float3
float4 Collapse_Endcaps : register(c11); // float
float4 CylDemMask_Shallowness : register(c10); // float
float4 Demolition_Center : register(c9); // float3
float4 LocalToWorld[4] : register(c12); // float4x4 (matrix_columns)
float4 ProjectionMatrix[4] : register(c20); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c6); // float
float4 SP_Demolition_Style : register(c5); // float
float4 ShadowMatrix[4] : register(c16); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r9 = In.position0;
    r7 = In.color1;
    r3.xy = In.texcoord0.xy;
    r3.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r9.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r5 = r9.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r1.x = ps;
    ps = 1.0 / BBox_Size.y;
    r6.x = BBox_Size.z * 0.0026041667;
    r1.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r2.yzw = -r0.zwy + r9.xyz;
    r0.x = ps;
    ps = r2.w;
    r1.w = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r1.xz = saturate(r2.yz * r1.xy);
    r1.y = saturate(ps);
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.y = r1.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.w = max(CylDemMask_Shallowness.x, 1.0);
    r2.xw = -r0.zw + Demolition_Center.xy;
    ps = -r2.w * -r2.w;
    r2.yz = -r2.xw + BBox_Size.xy;
    r4.x = ps;
    r4.yz = r1.zx * BBox_Size.yx - r2.wx;
    r2.w = dot(r4.zy, r4.zy) + 0.0;
    ps = -r2.x * -r2.x;
    r4.zw = r2.yz * r2.yz;
    r4.y = ps;
    ps = 1.0 / r1.w;
    r4 = r4.zyyz + r4.wxwx;
    r2.z = ps;
    ps = sqrt(abs(r4.w));
    r2.x = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.x = ps;
    ps = sqrt(abs(r4.y));
    r2.y = r2.x * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r4.z));
    r5.x = max(r1.w, r5.x);
    r1.w = ps;
    ps = sqrt(abs(r4.x));
    r1.w = max(r5.x, r1.w);
    r4.x = ps;
    ps = sqrt(abs(r2.w));
    r1.w = max(r1.w, r4.x);
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
    r4.w = float((SP_Demolition_Style.x > 0.5));
    r1.w = ps;
    ps = Demolition_Center.z - r0.y;
    r6.z = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.x = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r2.y = r8.x * r0.y;
            r2.w = ps;
            r0.z = r2.y + r2.w;
            ps = BBox_Size.z * r2.y;
            r0.y = float((r1.y >= r2.y));
            r2.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.y = r0.z * BBox_Size.z;
            r1.w = ps;
        }
    }
    if (!p0)
    {
        ps = r6.y;
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r5.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
    ps = BBox_Size.z * r2.x;
    r0.w = float((1.0 > SP_Demolition_Style.x));
    r0.z = ps;
    ps = r2.x;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r1.w * ps;
    r0.y = r0.y * r0.w;
    r0.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.yz = r2.yx + r2.wx;
    // UNHANDLED control flow: cjmp
    r2.x = saturate(r4.z * r1.w);
    r4.y = float((r1.y > r4.y));
    ps = sqrt(abs(r1.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.x = r2.x * r4.z;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r4.z = float((0.3 >= r1.z));
    ps = 0.00013333333 * r0.y;
    r4.z = r4.y * r4.z;
    r0.y = saturate(ps);
    r2.x = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r4.z != 0.0);
    r4.z = (0.0 == 0.0 && r4.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r1.z;
        r4.x = ps;
        r5.xw = r2.xx * float2(-1e+03, 8e+02) + r9.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r0.y = float((r1.z > 0.7));
        r0.y = r0.y * r4.y;
    }
    p0 = (r4.z == 0.0 && r0.y != 0.0);
    r4.z = (r4.z == 0.0 && r0.y != 0.0) ? 0.0 : r4.z + 1.0;
    if (p0)
    {
        ps = 1.0 - r1.z;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r4.x = ps;
        r5.xw = r2.xx * float2(-1e+03, -8e+02) + r9.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r5.xw = r9.zy;
    }
    ps = r9.x;
    r5.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r4.z = float((0.3 >= r1.x));
    ps = 0.00013333333 * r0.y;
    r4.z = r4.y * r4.z;
    r0.y = saturate(ps);
    r2.x = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r4.z != 0.0);
    r4.z = (0.0 == 0.0 && r4.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r1.x;
        r4.x = ps;
        r5.xz = r2.xx * float2(-1e+03, 8e+02) + r9.zx;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r0.y = float((r1.x > 0.7));
        r0.y = r0.y * r4.y;
    }
    p0 = (r4.z == 0.0 && r0.y != 0.0);
    r4.z = (r4.z == 0.0 && r0.y != 0.0) ? 0.0 : r4.z + 1.0;
    if (p0)
    {
        ps = 1.0 - r1.x;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r4.x = ps;
        r5.xz = r2.xx * float2(-1e+03, -8e+02) + r9.zx;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r5.xz = r9.zx;
    }
    ps = r9.y;
    r5.w = ps;
    // UNHANDLED control flow: cjmp
    r5.xzw = r9.zxy;
    r8.y = float((r9.z >= r5.y));
    r2.x = -r0.z * r1.w + r5.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r5.xy + r2.zz;
    r6.w = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.yz = float2((r5.yx >= r2.xz));
    r0.yz = r1.yy * r6.yy + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r5.xy;
    r0.y = (r4.z == 0.0) ? r5.x : r0.y;
    r0.y = (r8.y == 0.0) ? r0.y : r0.z;
    r2.x = (r4.y == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r8.x + r2.w;
            ps = r2.w + r2.w;
            r8.y = r0.x * r2.x;
            r1.w = ps;
            ps = r8.y;
            r5.xy = r8.xy - r2.yy;
            r4.y = ps;
            ps = r2.y;
            r0.y = r5.x + r2.w;
            r4.z = ps;
            ps = max(r4.y, r4.z);
            r2.y = float((r5.y > r0.y));
            r0.y = ps;
            r0.y = (r2.y == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.w;
            r0.y = r8.y - r0.y;
            r0.z = ps;
            r0.y = r0.y * r0.z;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r6.w = ps;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r2.y = float((0.5 > SP_Demolition_Style.x));
    r2.z = ps;
    ps = r6.x;
    r0.y = float((SP_DemolitionSpread.x >= 0.25));
    r5.x = ps;
    ps = 1e+01;
    r4.zw = -r6.zw + 1.0;
    r5.y = ps;
    ps = min(r5.x, r5.y);
    r2.w = r0.w * r4.z;
    r4.y = ps;
    r2.zw = r2.zw * r4.yw;
    ps = 25.0 * r0.y;
    r0.w = frac(r2.z);
    r0.y = ps;
    ps = r2.w;
    r0.w = r0.w - 0.5;
    r0.w = -abs(r0.w) * 2.0 + 1.0;
    ps = r6.w + ps;
    r0.y = r0.y * r0.w;
    r1.w = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.y * r0.x;
    r0.x = -r0.x * r2.x + r2.x;
    // UNHANDLED control flow: cjmp
    r0.yw = r1.yw * float2(6.2831, 4e+02);
    r0.z = r0.y * r0.z;
    r0.z = r0.z * 0.15915494 + 0.5;
    ps = frac(r0.z);
    r0.z = ps;
    r2.x = r0.z * 6.2831855 - 3.1415927;
    ps = sin(r2.x);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r2.x = ps;
    r0.y = r0.w * r2.x;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r4.x;
    if (p0)
    {
        r5.z = r0.y + r5.z;
    }
    if (!p0)
    {
        r5.w = r0.y + r5.w;
    }
    r2 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r2;
    r0 = r5.wwww * LocalToWorld[1].xzyw + r0.xzwy;
    r5 = r5.zzzz * LocalToWorld[0].xywz + r0.xzwy;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r9.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r9.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r10.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r8.x = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r2.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r4.xyz = -r2.yzx + r9.xyz;
    r0.w = ps;
    ps = r4.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r4.xy * r0.xz);
    r6.z = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r6.z * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r4.xy = -r2.yz + Demolition_Center.xy;
    ps = -r4.y * -r4.y;
    r4.zw = -r4.xy + BBox_Size.xy;
    r10.x = ps;
    r6.xy = r0.zx * BBox_Size.yx - r4.yx;
    r4.y = dot(r6.yx, r6.yx) + 0.0;
    ps = -r4.x * -r4.x;
    r10.zw = r4.zw * r4.zw;
    r10.y = ps;
    ps = 1.0 / r0.y;
    r10 = r10.zyyz + r10.wxwx;
    r4.z = ps;
    ps = sqrt(abs(r10.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r4.w = ps;
    ps = sqrt(abs(r10.w));
    r4.x = r0.y * SP_DemolitionSpread.x;
    r2.w = ps;
    ps = sqrt(abs(r10.z));
    r4.w = max(r4.w, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r10.x));
    r4.w = max(r4.w, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r4.y));
    r2.w = max(r4.w, r2.w);
    r4.y = ps;
    ps = 1.0 / r2.w;
    r4.y = r4.z * r4.y;
    r2.w = ps;
    r2.w = -r4.y * r2.w + r0.y;
    ps = 1.0 / r0.y;
    r2.w = max(r2.w, 0.0);
    r0.y = ps;
    r2.w = saturate(r2.w * r0.y);
    r0.y = -r2.w * 2.0 + 3.0;
    r2.w = r2.w * r2.w;
    r2.w = r4.x * r2.w;
    r10.y = saturate(r2.w * r0.y);
    ps = Demolition_Center.z - r2.x;
    r2.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r6.w = float((SP_Demolition_Style.x > 0.5));
    r2.x = ps;
    ps = 1.0;
    r8.z = saturate(floor(r2.y));
    r2.y = ps;
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.x = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r2.x = r10.x * r0.y;
            r2.z = ps;
            r2.y = r2.x + r2.z;
            ps = BBox_Size.z * r2.x;
            r0.y = float((r6.z >= r2.x));
            r2.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r6.y = r2.y * BBox_Size.z;
            r2.y = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = r2.x;
            r2.z = ps;
            ps = r2.x;
            r6.y = r8.w;
            r2.w = ps;
        }
    }
    r4.x = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r2.y;
    r4.y = float((Collapse_Endcaps.x > 0.5));
    r8.y = ps;
    ps = r10.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r2.y * ps;
    r0.y = r4.y * r0.y;
    r4.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.zw = r2.xy + r2.zy;
    // UNHANDLED control flow: cjmp
    r2.y = float((r6.z > r4.z));
    r4.w = saturate(r4.w * r10.y);
    ps = sqrt(abs(r6.z));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.z = r4.w * r4.z;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r4.w = r2.y * r0.x;
    r0.x = saturate(ps);
    r0.x = r4.z * r0.x;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r0.y = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xz = r0.xx * float2(8e+02, -1e+03);
        r9.y = r4.x + r9.y;
        ps = 3.3333333 * r0.z;
        r6.x = r4.z + r9.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r4.z = float((r0.z > 0.7));
        r2.y = r4.z * r2.y;
    }
    p0 = (r0.y == 0.0 && r2.y != 0.0);
    r0.y = (r0.y == 0.0 && r2.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r4.xz = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r9.y = r4.x + r9.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.x = r4.z + r9.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r9.z;
        r6.x = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r2.y * r0.z;
    r0.y = saturate(ps);
    r0.y = r4.z * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xz = r0.yy * float2(8e+02, -1e+03);
        r9.x = r4.x + r9.x;
        ps = 3.3333333 * r0.x;
        r6.x = r4.z + r9.z;
        r4.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r4.z = float((r0.x > 0.7));
        r2.y = r4.z * r2.y;
    }
    p0 = (r0.z == 0.0 && r2.y != 0.0);
    r0.z = (r0.z == 0.0 && r2.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r4.xz = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r9.x = r4.x + r9.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r6.x = r4.z + r9.z;
        r4.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r9.z;
        r6.x = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r9.z;
    r6.x = ps;
    r0.z = float((r9.z >= r6.y));
    r2.y = -r8.y * r10.y + r6.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r6.xy + r2.ww;
    r8.y = ps;
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.zw = float2((r6.yx >= r2.yw));
    r0.xy = r6.zz * r8.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r6.xy;
    r0.x = (r4.w == 0.0) ? r6.x : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r4.z == 0.0) ? r2.y : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r10.x + r2.z;
            ps = r2.z + r2.z;
            r10.y = r0.w * r0.y;
            r2.y = ps;
            ps = r10.y;
            r6.xy = r10.xy - r2.xx;
            r4.z = ps;
            ps = r2.x;
            r0.x = r6.x + r2.z;
            r4.w = ps;
            ps = max(r4.z, r4.w);
            r2.x = float((r6.y > r0.x));
            r0.x = ps;
            r0.x = (r2.x == 0.0) ? r0.x : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.y;
            r0.z = r10.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r8.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r2.y = float((0.5 > SP_Demolition_Style.x));
    r4.z = ps;
    ps = r8.x;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r6.x = ps;
    ps = 1e+01;
    r2.zw = -r8.zy + 1.0;
    r6.y = ps;
    ps = min(r6.x, r6.y);
    r4.w = r4.y * r2.z;
    r2.x = ps;
    r2.xz = r4.zw * r2.xw;
    ps = 25.0 * r0.x;
    r2.w = frac(r2.x);
    r2.x = ps;
    ps = r2.z;
    r0.x = r2.w - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r8.y + ps;
    r0.x = r2.x * r0.x;
    r2.x = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.w;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r6.z * 6.2831;
    r0.y = r0.y * r0.z;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.y = frac(r0.y);
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r0.y * 4e+02;
    r0.y = r0.y * r2.x;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r4.x;
    if (p0)
    {
        r9.x = r0.y + r9.x;
    }
    if (!p0)
    {
        r9.y = r0.y + r9.y;
    }
    r2 = r9.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r2;
    r0 = r9.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r9.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r2 = r0.zzzz * ProjectionMatrix[3].xwzy;
    r2 = r0.wwww * ProjectionMatrix[2].xwzy + r2;
    r2 = r0.yyyy * ProjectionMatrix[1].xzyw + r2.xzwy;
    r0 = r0.xxxx * ProjectionMatrix[0] + r2.xzyw;
    oPos = r0;
    r0 = r5.zzzz * ShadowMatrix[3].xwzy;
    r0 = r5.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r5.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r5.xxxx * ShadowMatrix[0] + r0.xzyw;
    o2 = r7;
    o3 = r1.xzyw;
    o0 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color2 = o3;
    return Out;
}
