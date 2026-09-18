// vs_6ca2da2df03ad28b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1041 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00001044 0041000B 00000000 00000000 000050A5 00000001 00000006 00000005 00000290 0010002A 0000602B 0000702C 0000302D 0000502E 0021502F 0000F050 0001F157 0002F2A0 0003F3A1 0004F4A2 00001159 00001155 00001157 00001156 00001158
//   vertex element: instruction 42 -> POSITION0
//   vertex element: instruction 43 -> TANGENT0
//   vertex element: instruction 44 -> BINORMAL0
//   vertex element: instruction 45 -> NORMAL0
//   vertex element: instruction 46 -> TEXCOORD0
//   vertex element: instruction 47 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled control flow cjmp at cf 47
// NOTE: unhandled control flow cjmp at cf 56
// NOTE: unhandled control flow cjmp at cf 58
// NOTE: unhandled control flow cjmp at cf 62
// NOTE: unhandled control flow cjmp at cf 66
// NOTE: unhandled control flow cjmp at cf 74

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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r9 = In.position0;
    r1.xyw = In.tangent0.xzy;
    r8.xyz = In.binormal0.xyz;
    r6.xyz = In.normal0.yzx;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r5 = r9.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.x;
    r3.xyz = r6.zxy * 0.003921569;
    r7.y = ps;
    r0.y = -r1.w * 0.007843138 + 1.0;
    r0.xz = r1.xy * 0.007843138 - 1.0;
    r10 = r9.zzzz * LocalToWorld[2].xwzy + r5;
    r8.xyz = r8.zxy * 0.007843138 - 1.0;
    r7.xzw = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.w;
    r5.xyz = r8.xxz * r7.xzz;
    r7.z = ps;
    r6 = r9.yyyy * LocalToWorld[1].xzyw + r10.xzwy;
    r6 = r9.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r5.xyz = r8.zyy * r7.wwx - r5.xyz;
    ps = 0.003921569 * r1.y;
    r0.x = dot(r0.xyz, r5.xyz);
    r7.w = ps;
    r3.w = r0.x * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.x = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r7.y = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.yzw = -r0.zwy + r9.xyz;
    r0.x = ps;
    ps = r3.w;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r2.xz = saturate(r3.yz * r2.xy);
    r2.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.z = r2.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r3.xz = -r0.zw + Demolition_Center.xy;
    ps = -r3.z * -r3.z;
    r3.yw = -r3.xz + BBox_Size.xy;
    r5.x = ps;
    r5.yz = r2.zx * BBox_Size.yx - r3.zx;
    r3.z = dot(r5.zy, r5.zy) + 0.0;
    ps = -r3.x * -r3.x;
    r5.zw = r3.yw * r3.yw;
    r5.y = ps;
    ps = 1.0 / r1.z;
    r5 = r5.zyyz + r5.wxwx;
    r3.y = ps;
    ps = sqrt(abs(r5.w));
    r2.w = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r5.y));
    r3.x = r2.w * SP_DemolitionSpread.x;
    r1.z = ps;
    ps = sqrt(abs(r5.z));
    r3.w = max(r1.z, r3.w);
    r1.z = ps;
    ps = sqrt(abs(r5.x));
    r1.z = max(r3.w, r1.z);
    r3.w = ps;
    ps = sqrt(abs(r3.z));
    r1.z = max(r1.z, r3.w);
    r3.z = ps;
    ps = 1.0 / r1.z;
    r3.y = r3.y * r3.z;
    r1.z = ps;
    r1.z = -r3.y * r1.z + r2.w;
    ps = 1.0 / r2.w;
    r1.z = max(r1.z, 0.0);
    r2.w = ps;
    r1.z = saturate(r1.z * r2.w);
    r2.w = -r1.z * 2.0 + 3.0;
    ps = r1.z * r1.z;
    r1.z = ps;
    r1.z = r3.x * r1.z;
    r3.x = saturate(r1.z * r2.w);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.w = SP_Demolition_Style.x + 0.5;
    r3.y = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r7.x = float((SP_Demolition_Style.x > 0.5));
    r0.z = ps;
    ps = Demolition_Center.z - r0.y;
    r10.x = saturate(floor(r0.w));
    r0.y = ps;
    p0 = (r7.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.w = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r3.y = r7.w * r0.y;
            r3.w = ps;
            r0.z = r3.y + r3.w;
            ps = BBox_Size.z * r3.y;
            r0.y = float((r2.y >= r3.y));
            r3.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.y = r0.z * BBox_Size.z;
            r0.z = ps;
        }
    }
    if (!p0)
    {
        ps = r7.z;
        r3.zw = float2((-abs(r0.xx) > 0.0));
        r5.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r6.w = ps;
    ps = BBox_Size.z * r3.x;
    r0.w = float((1.0 > SP_Demolition_Style.x));
    r1.z = ps;
    ps = r3.x;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r0.z * ps;
    r0.y = r0.y * r0.w;
    r0.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xz = r3.yx + r3.wx;
    // UNHANDLED control flow: cjmp
    r2.w = saturate(r5.z * r0.z);
    r3.x = float((r2.y > r5.x));
    ps = sqrt(abs(r2.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r5.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.w = r2.w * r5.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r5.x = float((0.3 >= r2.z));
    ps = 0.00013333333 * r0.y;
    r5.x = r3.x * r5.x;
    r0.y = saturate(ps);
    r2.w = r2.w * r0.y;
    p0 = (0.0 == 0.0 && r5.x != 0.0);
    r5.z = (0.0 == 0.0 && r5.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.z;
        r6.w = ps;
        r5.xw = r2.ww * float2(-1e+03, 8e+02) + r9.zy;
    }
    p0 = (r5.z == 1.0);
    ps = p0 ? 0.0 : ((r5.z == 0.0) ? 1.0 : r5.z);
    r5.z = ps;
    if (p0)
    {
        r0.y = float((r2.z > 0.7));
        r0.y = r0.y * r3.x;
    }
    p0 = (r5.z == 0.0 && r0.y != 0.0);
    r5.z = (r5.z == 0.0 && r0.y != 0.0) ? 0.0 : r5.z + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.z;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r6.w = ps;
        r5.xw = r2.ww * float2(-1e+03, -8e+02) + r9.zy;
    }
    p0 = (r5.z == 1.0);
    ps = p0 ? 0.0 : ((r5.z == 0.0) ? 1.0 : r5.z);
    r5.z = ps;
    if (p0)
    {
        r5.xw = r9.zy;
    }
    ps = r9.x;
    r5.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r5.x = float((0.3 >= r2.x));
    ps = 0.00013333333 * r0.y;
    r5.x = r3.x * r5.x;
    r0.y = saturate(ps);
    r2.w = r2.w * r0.y;
    p0 = (0.0 == 0.0 && r5.x != 0.0);
    r5.w = (0.0 == 0.0 && r5.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.x;
        r6.w = ps;
        r5.xz = r2.ww * float2(-1e+03, 8e+02) + r9.zx;
    }
    p0 = (r5.w == 1.0);
    ps = p0 ? 0.0 : ((r5.w == 0.0) ? 1.0 : r5.w);
    r5.w = ps;
    if (p0)
    {
        r0.y = float((r2.x > 0.7));
        r0.y = r0.y * r3.x;
    }
    p0 = (r5.w == 0.0 && r0.y != 0.0);
    r5.w = (r5.w == 0.0 && r0.y != 0.0) ? 0.0 : r5.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.x;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r6.w = ps;
        r5.xz = r2.ww * float2(-1e+03, -8e+02) + r9.zx;
    }
    p0 = (r5.w == 1.0);
    ps = p0 ? 0.0 : ((r5.w == 0.0) ? 1.0 : r5.w);
    r5.w = ps;
    if (p0)
    {
        r5.xz = r9.zx;
    }
    ps = r9.y;
    r5.w = ps;
    // UNHANDLED control flow: cjmp
    r5.xzw = r9.zxy;
    r2.w = float((r9.z >= r5.y));
    r3.x = -r1.z * r0.z + r5.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r5.xy + r3.zz;
    r10.y = ps;
    p0 = (r7.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.zw = float2((r5.yx >= r3.xz));
    r0.yz = r2.yy * r7.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r5.xy;
    r0.y = (r10.w == 0.0) ? r5.x : r0.y;
    r0.y = (r2.w == 0.0) ? r0.y : r0.z;
    r1.z = (r10.z == 0.0) ? r3.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r7.w + r3.w;
            ps = r3.w + r3.w;
            r7.x = r0.x * r1.z;
            r2.w = ps;
            ps = r7.x;
            r3.xz = r7.wx - r3.yy;
            r5.x = ps;
            ps = r3.y;
            r0.y = r3.x + r3.w;
            r5.y = ps;
            ps = max(r5.x, r5.y);
            r3.x = float((r3.z > r0.y));
            r0.y = ps;
            r0.y = (r3.x == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.w;
            r0.y = r7.x - r0.y;
            r0.z = ps;
            r0.y = r0.y * r0.z;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r10.y = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.x = float((0.5 > SP_Demolition_Style.x));
    r5.x = ps;
    ps = r7.y;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r7.x = ps;
    ps = 1e+01;
    r3.zw = -r10.xy + 1.0;
    r7.y = ps;
    ps = min(r7.x, r7.y);
    r5.y = r0.w * r3.z;
    r3.y = ps;
    r3.yz = r5.xy * r3.yw;
    ps = 25.0 * r0.z;
    r0.w = frac(r3.y);
    r0.z = ps;
    ps = r3.z;
    r0.w = r0.w - 0.5;
    r0.w = -abs(r0.w) * 2.0 + 1.0;
    ps = r10.y + ps;
    r0.z = r0.z * r0.w;
    r2.w = ps;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.z * r0.x;
    r0.x = -r0.x * r1.z + r1.z;
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
    r0.y = r0.y * r6.w;
    if (p0)
    {
        r5.z = r0.y + r5.z;
    }
    if (!p0)
    {
        r5.w = r0.y + r5.w;
    }
    r10 = r9.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.x;
    r3.xyz = r6.zxy * 0.003921569;
    r7.y = ps;
    r0.z = -r1.w * 0.007843138 + 1.0;
    r0.yw = r1.xy * 0.007843138 - 1.0;
    r11 = r0.xxxx * LocalToWorld[2].xwzy + r10;
    r10.xyz = r8.zxy * 0.007843138 - 1.0;
    r7.xzw = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.w;
    r8.xyz = r10.xxz * r7.xzz;
    r7.z = ps;
    r6 = r5.wwww * LocalToWorld[1].xzyw + r11.xzwy;
    r6 = r5.zzzz * LocalToWorld[0].xywz + r6.xzwy;
    r5.xyz = r10.zyy * r7.wwx - r8.xyz;
    ps = 0.003921569 * r1.y;
    r0.x = dot(r0.yzw, r5.xyz);
    r7.w = ps;
    r3.w = r0.x * 0.5 + 0.5;
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
    r8.z = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.yzw = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r5.xyz = -r1.zwy + r9.xyz;
    r1.x = ps;
    ps = r5.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r1.x * ps;
    r0.xz = saturate(r5.xy * r0.xz);
    r7.x = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.z = r7.x * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r5.xy = -r1.zw + Demolition_Center.xy;
    ps = -r5.y * -r5.y;
    r5.zw = -r5.xy + BBox_Size.xy;
    r11.x = ps;
    r8.xy = r0.zx * BBox_Size.yx - r5.yx;
    r5.y = dot(r8.yx, r8.yx) + 0.0;
    ps = -r5.x * -r5.x;
    r11.zw = r5.zw * r5.zw;
    r11.y = ps;
    ps = 1.0 / r0.y;
    r11 = r11.zyyz + r11.wxwx;
    r5.z = ps;
    ps = sqrt(abs(r11.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.w = ps;
    ps = sqrt(abs(r11.w));
    r5.x = r0.y * SP_DemolitionSpread.x;
    r0.w = ps;
    ps = sqrt(abs(r11.z));
    r5.w = max(r5.w, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r11.x));
    r5.w = max(r5.w, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r5.y));
    r0.w = max(r5.w, r0.w);
    r5.y = ps;
    ps = 1.0 / r0.w;
    r5.y = r5.z * r5.y;
    r0.w = ps;
    r0.w = -r5.y * r0.w + r0.y;
    ps = 1.0 / r0.y;
    r0.w = max(r0.w, 0.0);
    r0.y = ps;
    r0.w = saturate(r0.w * r0.y);
    r0.y = -r0.w * 2.0 + 3.0;
    r0.w = r0.w * r0.w;
    r0.w = r5.x * r0.w;
    r10.y = saturate(r0.w * r0.y);
    ps = Demolition_Center.z - r1.y;
    r0.w = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r8.x = float((SP_Demolition_Style.x > 0.5));
    r1.y = ps;
    ps = 1.0;
    r10.x = saturate(floor(r0.w));
    r1.w = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = saturate(r0.y * r1.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r1.x;
            r1.y = r10.w * r0.y;
            r1.z = ps;
            r0.w = r1.y + r1.z;
            ps = BBox_Size.z * r1.y;
            r0.y = float((r7.x >= r1.y));
            r5.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r0.w = r0.w * BBox_Size.z;
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
            r0.w = r10.z;
            r5.z = ps;
        }
    }
    r5.x = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.w;
    r5.y = float((Collapse_Endcaps.x > 0.5));
    r8.y = ps;
    ps = r10.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.w * ps;
    r0.y = r5.y * r0.y;
    r8.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yw = r1.yw + r1.zw;
    // UNHANDLED control flow: cjmp
    r1.w = float((r7.x > r5.y));
    r5.w = saturate(r5.w * r10.y);
    ps = sqrt(abs(r7.x));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r5.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.y = r5.w * r5.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r5.w = r1.w * r0.x;
    r0.x = saturate(ps);
    r0.x = r5.y * r0.x;
    p0 = (0.0 == 0.0 && r5.w != 0.0);
    r5.y = (0.0 == 0.0 && r5.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.xy = r0.xx * float2(8e+02, -1e+03);
        r9.y = r0.x + r9.y;
        ps = 3.3333333 * r0.z;
        r0.y = r0.y + r9.z;
        r5.x = ps;
    }
    p0 = (r5.y == 1.0);
    ps = p0 ? 0.0 : ((r5.y == 0.0) ? 1.0 : r5.y);
    r5.y = ps;
    if (p0)
    {
        r0.y = float((r0.z > 0.7));
        r0.y = r0.y * r1.w;
    }
    p0 = (r5.y == 0.0 && r0.y != 0.0);
    r5.y = (r5.y == 0.0 && r0.y != 0.0) ? 0.0 : r5.y + 1.0;
    if (p0)
    {
        r0.xy = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r9.y = r0.x + r9.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r0.y + r9.z;
        r5.x = ps;
    }
    p0 = (r5.y == 1.0);
    ps = p0 ? 0.0 : ((r5.y == 0.0) ? 1.0 : r5.y);
    r5.y = ps;
    if (p0)
    {
        ps = r9.z;
        r0.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.w * r0.z;
    r0.y = saturate(ps);
    r0.y = r5.y * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r5.xy = r0.yy * float2(8e+02, -1e+03);
        r9.x = r5.x + r9.x;
        ps = 3.3333333 * r0.x;
        r0.y = r5.y + r9.z;
        r5.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r5.y = float((r0.x > 0.7));
        r1.w = r5.y * r1.w;
    }
    p0 = (r0.z == 0.0 && r1.w != 0.0);
    r0.z = (r0.z == 0.0 && r1.w != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r5.xy = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r9.x = r5.x + r9.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r5.y + r9.z;
        r5.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r9.z;
        r0.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r9.z;
    r0.y = ps;
    r1.w = float((r9.z >= r0.w));
    r5.y = -r8.y * r10.y + r0.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xz = -r0.yw + r5.zz;
    r10.y = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.xy = float2((r0.wy >= r5.yz));
    r0.xz = r7.xx * r10.zz + r0.xz;
    r0.xz = r0.xz * SP_DemolitionSpread.xx + r0.yw;
    r0.x = (r11.y == 0.0) ? r0.y : r0.x;
    r0.x = (r1.w == 0.0) ? r0.x : r0.z;
    r0.y = (r11.x == 0.0) ? r5.y : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r10.w + r1.z;
            ps = r1.z + r1.z;
            r10.y = r1.x * r0.y;
            r0.w = ps;
            ps = r10.y;
            r8.xy = r10.wy - r1.yy;
            r5.y = ps;
            ps = r1.y;
            r0.x = r8.x + r1.z;
            r5.z = ps;
            ps = max(r5.y, r5.z);
            r1.y = float((r8.y > r0.x));
            r0.x = ps;
            r0.x = (r1.y == 0.0) ? r0.x : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r0.w;
            r0.z = r10.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r10.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r1.z = ps;
    ps = r8.z;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r8.x = ps;
    ps = 1e+01;
    r5.zw = -r10.xy + 1.0;
    r8.y = ps;
    ps = min(r8.x, r8.y);
    r1.w = r8.w * r5.z;
    r5.y = ps;
    r1.zw = r1.zw * r5.yw;
    ps = 25.0 * r0.x;
    r5.y = frac(r1.z);
    r0.w = ps;
    ps = r1.w;
    r0.x = r5.y - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r10.y + ps;
    r0.x = r0.w * r0.x;
    r0.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r1.x;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r7.x * 6.2831;
    r0.y = r0.y * r0.z;
    r0.y = r0.y * 0.15915494 + 0.5;
    r0.y = frac(r0.y);
    r0.y = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r0.y);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r0.y = ps;
    r0.y = r0.y * 4e+02;
    r0.y = r0.y * r0.w;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r5.x;
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
    r1 = r0.zzzz * ProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    r0 = r6.zzzz * ShadowMatrix[3].xwzy;
    r0 = r6.wwww * ShadowMatrix[2].xwzy + r0;
    r0 = r6.yyyy * ShadowMatrix[1].xzyw + r0.xzwy;
    o1 = r6.xxxx * ShadowMatrix[0] + r0.xzyw;
    o3.xyz = r7.yzw;
    o3.w = 0.0;
    o2 = r3;
    o4 = r2.xzyw;
    o0 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord7 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    Out.color2 = o4;
    return Out;
}
