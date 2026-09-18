// vs_32f7809be92361ef.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1080 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 000010E0 0051000C 00000000 00000000 00005CC6 00000001 00000006 00000006 00000290 0010002B 0000602C 0000702D 0000302E 0000502F 00215030 0000F050 0001F155 00027256 0003F3A0 0004F4A1 0005F5A2 00001165 00001166 00001162 00001163 00001161 00001164
//   vertex element: instruction 43 -> POSITION0
//   vertex element: instruction 44 -> TANGENT0
//   vertex element: instruction 45 -> BINORMAL0
//   vertex element: instruction 46 -> NORMAL0
//   vertex element: instruction 47 -> TEXCOORD0
//   vertex element: instruction 48 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled control flow cjmp at cf 46
// NOTE: unhandled control flow cjmp at cf 49
// NOTE: unhandled control flow cjmp at cf 58
// NOTE: unhandled control flow cjmp at cf 60
// NOTE: unhandled control flow cjmp at cf 64
// NOTE: unhandled control flow cjmp at cf 68
// NOTE: unhandled control flow cjmp at cf 76

#include "xenos_common.hlsli"

float4 BBox_Center : register(c8); // float3
float4 BBox_Size : register(c7); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c11); // float
float4 CylDemMask_Shallowness : register(c10); // float
float4 Demolition_Center : register(c9); // float3
float4 LocalToWorld[4] : register(c12); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c6); // float
float4 SP_Demolition_Style : register(c5); // float
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)
float4 WorldToLocal[3] : register(c16); // float3x3 (matrix_columns)

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
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r10 = In.position0;
    r1.xyw = In.tangent0.zyx;
    r6.xyz = In.binormal0.xzy;
    r9.xyz = In.normal0.yxz;
    r5.xy = In.texcoord0.xy;
    r5.zw = In.texcoord1.yx;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r3.xyz = r9.yxz * 0.003921569;
    r7.y = ps;
    r4.y = -r1.y * 0.007843138 + 1.0;
    r4.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r11.xyz = r6.yxz * 0.007843138 - 1.0;
    r7.xzw = r9.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r8.xyz = r11.xxz * r7.xzz;
    r7.z = ps;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0] + r0.xzyw;
    r8.xyz = r11.zyy * r7.wwx - r8.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r4.xyz, r8.xyz);
    r7.w = ps;
    r3.w = r1.z * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.x = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r7.y = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.yzw = -r0.zwy + r10.xyz;
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
    r4.x = ps;
    r4.yz = r2.zx * BBox_Size.yx - r3.zx;
    r3.z = dot(r4.zy, r4.zy) + 0.0;
    ps = -r3.x * -r3.x;
    r4.zw = r3.yw * r3.yw;
    r4.y = ps;
    ps = 1.0 / r1.z;
    r4 = r4.zyyz + r4.wxwx;
    r3.y = ps;
    ps = sqrt(abs(r4.w));
    r2.w = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r4.y));
    r3.x = r2.w * SP_DemolitionSpread.x;
    r1.z = ps;
    ps = sqrt(abs(r4.z));
    r3.w = max(r1.z, r3.w);
    r1.z = ps;
    ps = sqrt(abs(r4.x));
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
    r8.x = saturate(floor(r0.w));
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
            r4.y = r0.z * BBox_Size.z;
            r0.z = ps;
        }
    }
    if (!p0)
    {
        ps = r7.z;
        r3.zw = float2((-abs(r0.xx) > 0.0));
        r4.y = ps;
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
    r4.xz = r3.yx + r3.wx;
    // UNHANDLED control flow: cjmp
    r2.w = saturate(r4.z * r0.z);
    r3.x = float((r2.y > r4.x));
    ps = sqrt(abs(r2.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.w = r2.w * r4.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r4.x = float((0.3 >= r2.z));
    ps = 0.00013333333 * r0.y;
    r4.x = r3.x * r4.x;
    r0.y = saturate(ps);
    r2.w = r2.w * r0.y;
    p0 = (0.0 == 0.0 && r4.x != 0.0);
    r4.z = (0.0 == 0.0 && r4.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.z;
        r6.w = ps;
        r4.xw = r2.ww * float2(-1e+03, 8e+02) + r10.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r0.y = float((r2.z > 0.7));
        r0.y = r0.y * r3.x;
    }
    p0 = (r4.z == 0.0 && r0.y != 0.0);
    r4.z = (r4.z == 0.0 && r0.y != 0.0) ? 0.0 : r4.z + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.z;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r6.w = ps;
        r4.xw = r2.ww * float2(-1e+03, -8e+02) + r10.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r4.xw = r10.zy;
    }
    ps = r10.x;
    r4.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r4.x = float((0.3 >= r2.x));
    ps = 0.00013333333 * r0.y;
    r4.x = r3.x * r4.x;
    r0.y = saturate(ps);
    r2.w = r2.w * r0.y;
    p0 = (0.0 == 0.0 && r4.x != 0.0);
    r4.w = (0.0 == 0.0 && r4.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r2.x;
        r6.w = ps;
        r4.xz = r2.ww * float2(-1e+03, 8e+02) + r10.zx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.y = float((r2.x > 0.7));
        r0.y = r0.y * r3.x;
    }
    p0 = (r4.w == 0.0 && r0.y != 0.0);
    r4.w = (r4.w == 0.0 && r0.y != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r2.x;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r6.w = ps;
        r4.xz = r2.ww * float2(-1e+03, -8e+02) + r10.zx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r4.xz = r10.zx;
    }
    ps = r10.y;
    r4.w = ps;
    // UNHANDLED control flow: cjmp
    r4.xzw = r10.zxy;
    r2.w = float((r10.z >= r4.y));
    r3.x = -r1.z * r0.z + r4.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r4.xy + r3.zz;
    r8.y = ps;
    p0 = (r7.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.zw = float2((r4.yx >= r3.xz));
    r0.yz = r2.yy * r7.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r4.xy;
    r0.y = (r8.w == 0.0) ? r4.x : r0.y;
    r0.y = (r2.w == 0.0) ? r0.y : r0.z;
    r1.z = (r8.z == 0.0) ? r3.x : r0.y;
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
            r4.x = ps;
            ps = r3.y;
            r0.y = r3.x + r3.w;
            r4.y = ps;
            ps = max(r4.x, r4.y);
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
            r8.y = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.x = float((0.5 > SP_Demolition_Style.x));
    r4.x = ps;
    ps = r7.y;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r7.x = ps;
    ps = 1e+01;
    r3.zw = -r8.xy + 1.0;
    r7.y = ps;
    ps = min(r7.x, r7.y);
    r4.y = r0.w * r3.z;
    r3.y = ps;
    r3.yz = r4.xy * r3.yw;
    ps = 25.0 * r0.z;
    r0.w = frac(r3.y);
    r0.z = ps;
    ps = r3.z;
    r0.w = r0.w - 0.5;
    r0.w = -abs(r0.w) * 2.0 + 1.0;
    ps = r8.y + ps;
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
        r4.z = r0.y + r4.z;
    }
    if (!p0)
    {
        r4.w = r0.y + r4.w;
    }
    r11 = r10.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.w;
    r3.xyz = r9.yxz * 0.003921569;
    r7.y = ps;
    r8.y = -r1.y * 0.007843138 + 1.0;
    r8.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r11;
    r12.xyz = r6.yxz * 0.007843138 - 1.0;
    r7.xzw = r9.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r11.xyz = r12.xxz * r7.xzz;
    r7.z = ps;
    r0 = r4.wwww * LocalToWorld[1].xzyw + r0;
    r0 = r4.zzzz * LocalToWorld[0] + r0.xzyw;
    r4.xyz = r12.zyy * r7.wwx - r11.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r8.xyz, r4.xyz);
    r7.w = ps;
    r3.w = r1.z * 0.5 + 0.5;
    r11 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r8.xyz = r9.xyz * 0.007843138 - 1.0;
    r4.yzw = r6.xyz * 0.007843138 - 1.0;
    r1.xyz = r1.xyw * 0.007843138 - 1.0;
    r9 = r0.zzzz * ViewProjectionMatrix[2].xwzy + r11;
    r6.xyz = -r0.zyx * CameraPosition.www + CameraPosition.zyx;
    r11.xyz = r6.xxx * WorldToLocal[2].xzy;
    r9 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r9.xzwy;
    r9 = r0.xxxx * ViewProjectionMatrix[0] + r9.xzyw;
    r0.xyz = r6.yyy * WorldToLocal[1].xzy + r11.xyz;
    r0.xyz = r6.zzz * WorldToLocal[0].xyz + r0.xzy;
    r4.x = dot(r1.xzy, r0.zxy);
    r4.y = dot(r4.zyw, r0.zxy);
    r4.z = dot(r8.zyx, r0.zxy);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r11.z = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r8.y = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.yzw = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r6.xyz = -r1.zwy + r10.xyz;
    r1.x = ps;
    ps = r6.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r1.x * ps;
    r0.xz = saturate(r6.xy * r0.xz);
    r7.x = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.x = r7.x * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r6.xy = -r1.wz + Demolition_Center.yx;
    ps = -r6.x * -r6.x;
    r6.zw = -r6.yx + BBox_Size.xy;
    r12.x = ps;
    r8.xz = r0.zx * BBox_Size.yx - r6.xy;
    r6.x = dot(r8.zx, r8.zx) + 0.0;
    ps = -r6.y * -r6.y;
    r12.zw = r6.zw * r6.zw;
    r12.y = ps;
    ps = 1.0 / r0.y;
    r12 = r12.zyyz + r12.wxwx;
    r6.y = ps;
    ps = sqrt(abs(r12.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r6.z = ps;
    ps = sqrt(abs(r12.w));
    r4.w = r0.y * SP_DemolitionSpread.x;
    r0.w = ps;
    ps = sqrt(abs(r12.z));
    r6.z = max(r6.z, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r12.x));
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
    r11.z = saturate(r0.w * r0.y);
    ps = Demolition_Center.z - r1.y;
    r0.w = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r8.x = float((SP_Demolition_Style.x > 0.5));
    r1.y = ps;
    ps = 1.0;
    r8.w = saturate(floor(r0.w));
    r1.w = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.y = saturate(r0.y * r1.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r1.x;
            r1.y = r11.y * r0.y;
            r1.z = ps;
            r0.w = r1.y + r1.z;
            ps = BBox_Size.z * r1.y;
            r0.y = float((r7.x >= r1.y));
            r6.y = ps;
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
            r0.w = r11.x;
            r6.y = ps;
        }
    }
    r4.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.w;
    r6.x = float((Collapse_Endcaps.x > 0.5));
    r8.z = ps;
    ps = r11.z;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.w * ps;
    r0.y = r6.x * r0.y;
    r6.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xw = r1.yw + r1.zw;
    // UNHANDLED control flow: cjmp
    r1.w = float((r7.x > r6.x));
    r6.w = saturate(r6.w * r11.z);
    ps = sqrt(abs(r7.x));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r6.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.x = r6.w * r6.x;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r6.w = r1.w * r0.x;
    r0.x = saturate(ps);
    r0.x = r6.x * r0.x;
    p0 = (0.0 == 0.0 && r6.w != 0.0);
    r6.x = (0.0 == 0.0 && r6.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.xy = r0.xx * float2(8e+02, -1e+03);
        r10.y = r0.x + r10.y;
        ps = 3.3333333 * r0.z;
        r0.y = r0.y + r10.z;
        r4.w = ps;
    }
    p0 = (r6.x == 1.0);
    ps = p0 ? 0.0 : ((r6.x == 0.0) ? 1.0 : r6.x);
    r6.x = ps;
    if (p0)
    {
        r0.y = float((r0.z > 0.7));
        r0.y = r0.y * r1.w;
    }
    p0 = (r6.x == 0.0 && r0.y != 0.0);
    r6.x = (r6.x == 0.0 && r0.y != 0.0) ? 0.0 : r6.x + 1.0;
    if (p0)
    {
        r0.xy = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r10.y = r0.x + r10.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r0.y + r10.z;
        r4.w = ps;
    }
    p0 = (r6.x == 1.0);
    ps = p0 ? 0.0 : ((r6.x == 0.0) ? 1.0 : r6.x);
    r6.x = ps;
    if (p0)
    {
        ps = r10.z;
        r0.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.w * r0.z;
    r0.y = saturate(ps);
    r0.y = r6.x * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r6.xw = r0.yy * float2(8e+02, -1e+03);
        r10.x = r6.x + r10.x;
        ps = 3.3333333 * r0.x;
        r0.y = r6.w + r10.z;
        r4.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r6.x = float((r0.x > 0.7));
        r1.w = r6.x * r1.w;
    }
    p0 = (r0.z == 0.0 && r1.w != 0.0);
    r0.z = (r0.z == 0.0 && r1.w != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r6.xw = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r10.x = r6.x + r10.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r6.w + r10.z;
        r4.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r10.z;
        r0.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r10.z;
    r0.y = ps;
    r1.w = float((r10.z >= r0.w));
    r6.x = -r8.z * r11.z + r0.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xz = -r0.yw + r6.yy;
    r8.z = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.zw = float2((r0.wy >= r6.xy));
    r0.xz = r7.xx * r11.xx + r0.xz;
    r0.xz = r0.xz * SP_DemolitionSpread.xx + r0.yw;
    r0.x = (r11.w == 0.0) ? r0.y : r0.x;
    r0.x = (r1.w == 0.0) ? r0.x : r0.z;
    r0.y = (r11.z == 0.0) ? r6.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r11.y + r1.z;
            ps = r1.z + r1.z;
            r11.x = r1.x * r0.y;
            r0.w = ps;
            ps = r11.x;
            r8.xz = r11.yx - r1.yy;
            r6.x = ps;
            ps = r1.y;
            r0.x = r8.x + r1.z;
            r6.y = ps;
            ps = max(r6.x, r6.y);
            r1.y = float((r8.z > r0.x));
            r0.x = ps;
            r0.x = (r1.y == 0.0) ? r0.x : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r0.w;
            r0.z = r11.x - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r8.z = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r1.z = ps;
    ps = r8.y;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r8.x = ps;
    ps = 1e+01;
    r6.yw = -r8.wz + 1.0;
    r8.y = ps;
    ps = min(r8.x, r8.y);
    r1.w = r6.z * r6.y;
    r6.x = ps;
    r1.zw = r1.zw * r6.xw;
    ps = 25.0 * r0.x;
    r6.x = frac(r1.z);
    r0.w = ps;
    ps = r1.w;
    r0.x = r6.x - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r8.z + ps;
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
    r0.y = r0.y * r4.w;
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
    o4.xyz = r7.yzw;
    o4.w = 0.0;
    o2.xyz = r4.xyz;
    o3 = r3;
    o5 = r2.xzyw;
    o0 = r5;
    o1 = r9;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord5 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    Out.color2 = o5;
    return Out;
}
