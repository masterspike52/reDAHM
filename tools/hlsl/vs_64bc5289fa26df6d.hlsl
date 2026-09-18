// vs_64bc5289fa26df6d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1146 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 000011E8 00910010 00000000 00000000 0000994A 00000001 00000008 0000000A 00000290 0010002C 0000602D 0000702E 0000302F 00005030 00015031 00025032 0020A033 00003050 0001F151 0002F252 0003F354 0004F456 0005F557 0006F658 0007F7A0 0008F8A1 0009F9A2 00001173 0000117B 0000117C 00001176 00001174 00001177 00001178 00001179 00001175 0000117A
//   vertex element: instruction 44 -> POSITION0
//   vertex element: instruction 45 -> TANGENT0
//   vertex element: instruction 46 -> BINORMAL0
//   vertex element: instruction 47 -> NORMAL0
//   vertex element: instruction 48 -> TEXCOORD0
//   vertex element: instruction 49 -> TEXCOORD1
//   vertex element: instruction 50 -> TEXCOORD2
//   vertex element: instruction 51 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
//   interpolator: r9 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled control flow cjmp at cf 18
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled control flow cjmp at cf 28
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled control flow cjmp at cf 47
// NOTE: unhandled control flow cjmp at cf 49
// NOTE: unhandled control flow cjmp at cf 52
// NOTE: unhandled control flow cjmp at cf 60
// NOTE: unhandled control flow cjmp at cf 62
// NOTE: unhandled control flow cjmp at cf 66
// NOTE: unhandled control flow cjmp at cf 70
// NOTE: unhandled control flow cjmp at cf 78

#include "xenos_common.hlsli"

float4 BBox_Center : register(c8); // float3
float4 BBox_Size : register(c7); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c11); // float
float4 CylDemMask_Shallowness : register(c10); // float
float4 Demolition_Center : register(c9); // float3
float4 LightPositionAndInvRadius : register(c21); // float4[2]
float4 LightType : register(c20); // float[2]
float4 LocalToWorld[4] : register(c12); // float4x4 (matrix_columns)
float4 SP_DemolitionSpread : register(c6); // float
float4 SP_Demolition_Style : register(c5); // float
float4 ShadowCoordinateScaleBias : register(c19); // float4
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
    float4 texcoord2 : TEXCOORD2;
    float4 color0 : COLOR0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    float4 o7 = 0.0;
    float4 o8 = 0.0;
    float4 o9 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r12 = In.position0;
    r1.xyw = In.tangent0.zyx;
    r11.xyz = In.binormal0.xzy;
    r6.xyz = In.normal0.yxz;
    r9.xy = In.texcoord0.xy;
    r9.zw = In.texcoord1.yx;
    r7.xy = In.texcoord2.xy;
    r7.z = 0.0;
    r8.zw = In.color0.xy;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r12.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r13.xyz = r6.yxz * 0.003921569;
    r14.x = ps;
    r10.xy = r8.zw * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r4.y = -r1.y * 0.007843138 + 1.0;
    r4.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r12.zzzz * LocalToWorld[2].xwzy + r0;
    r8.xyz = r11.yxz * 0.007843138 - 1.0;
    r5.xyz = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r3.xyz = r8.xxz * r5.xzz;
    r14.y = ps;
    r0 = r12.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    r3.xyz = r8.zyy * r5.yyx - r3.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r4.xyz, r3.xyz);
    r14.z = ps;
    r13.w = r1.z * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.y = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r4.z = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xzw = -r0.zwy + r12.xyz;
    r0.x = ps;
    ps = r3.w;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r2.xz = saturate(r3.xz * r2.xy);
    r2.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r2.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r3.xy = -r0.zw + Demolition_Center.xy;
    ps = -r3.y * -r3.y;
    r3.zw = -r3.xy + BBox_Size.xy;
    r10.x = ps;
    r4.xy = r2.zx * BBox_Size.yx - r3.yx;
    r3.y = dot(r4.yx, r4.yx) + 0.0;
    ps = -r3.x * -r3.x;
    r10.zw = r3.zw * r3.zw;
    r10.y = ps;
    ps = 1.0 / r1.z;
    r10 = r10.zyyz + r10.wxwx;
    r3.z = ps;
    ps = sqrt(abs(r10.y));
    r1.z = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r10.w));
    r3.x = r1.z * SP_DemolitionSpread.x;
    r2.w = ps;
    ps = sqrt(abs(r10.z));
    r3.w = max(r3.w, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r10.x));
    r3.w = max(r3.w, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r3.y));
    r2.w = max(r3.w, r2.w);
    r3.y = ps;
    ps = 1.0 / r2.w;
    r3.y = r3.z * r3.y;
    r2.w = ps;
    r2.w = -r3.y * r2.w + r1.z;
    ps = 1.0 / r1.z;
    r2.w = max(r2.w, 0.0);
    r1.z = ps;
    r2.w = saturate(r2.w * r1.z);
    r1.z = -r2.w * 2.0 + 3.0;
    ps = r2.w * r2.w;
    r2.w = ps;
    r2.w = r3.x * r2.w;
    r3.y = saturate(r2.w * r1.z);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.z = SP_Demolition_Style.x + 0.5;
    r3.x = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.y = float((SP_Demolition_Style.x > 0.5));
    r2.w = ps;
    ps = Demolition_Center.z - r0.y;
    r5.x = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r4.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.z = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r3.x = r5.z * r0.y;
            r3.z = ps;
            r0.z = r3.x + r3.z;
            ps = BBox_Size.z * r3.x;
            r0.y = float((r2.y >= r3.x));
            r10.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r0.w = r0.z * BBox_Size.z;
            r2.w = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
            r3.z = ps;
            ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
            r0.w = r5.w;
            r10.y = ps;
        }
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
    ps = BBox_Size.z * r3.y;
    r0.z = float((Collapse_Endcaps.x > 0.5));
    r3.w = ps;
    ps = r3.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r2.w * ps;
    r4.w = r0.z * r0.y;
    r1.z = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yz = r3.xy + r3.zy;
    // UNHANDLED control flow: cjmp
    r3.y = float((r2.y > r0.y));
    r4.w = saturate(r0.z * r2.w);
    ps = sqrt(abs(r2.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r0.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r4.w * r0.z;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r4.w = float((0.3 >= r2.z));
    ps = 0.00013333333 * r0.y;
    r4.w = r3.y * r4.w;
    r0.y = saturate(ps);
    r0.y = r0.z * r0.y;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r4.w = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(8e+02, -1e+03);
        r8.y = r0.y + r12.y;
        ps = 3.3333333 * r2.z;
        r0.z = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.z = float((r2.z > 0.7));
        r0.z = r0.z * r3.y;
    }
    p0 = (r4.w == 0.0 && r0.z != 0.0);
    r4.w = (r4.w == 0.0 && r0.z != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r2.z;
        r8.y = r0.y + r12.y;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r0.z = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        ps = r12.y;
        r0.z = r12.z;
        r8.y = ps;
    }
    ps = r12.x;
    r8.x = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r4.w = float((0.3 >= r2.x));
    ps = 0.00013333333 * r0.y;
    r4.w = r3.y * r4.w;
    r0.y = saturate(ps);
    r0.y = r0.z * r0.y;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r4.w = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(8e+02, -1e+03);
        r8.x = r0.y + r12.x;
        ps = 3.3333333 * r2.x;
        r0.z = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.z = float((r2.x > 0.7));
        r0.z = r0.z * r3.y;
    }
    p0 = (r4.w == 0.0 && r0.z != 0.0);
    r4.w = (r4.w == 0.0 && r0.z != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r2.x;
        r8.x = r0.y + r12.x;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r0.z = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        ps = r12.x;
        r0.z = r12.z;
        r8.x = ps;
    }
    ps = r12.y;
    r8.y = ps;
    // UNHANDLED control flow: cjmp
    ps = r12.z;
    r8.xy = r12.xy;
    r0.z = ps;
    r4.w = float((r12.z >= r0.w));
    r10.x = -r3.w * r2.w + r0.z;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r10.zw = -r0.zw + r10.yy;
    r5.y = ps;
    p0 = (r4.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.yw = float2((r0.wz >= r10.xy));
    r10.zw = r2.yy * r5.ww + r10.zw;
    r0.yw = r10.zw * SP_DemolitionSpread.xx + r0.zw;
    r0.y = (r3.w == 0.0) ? r0.z : r0.y;
    r0.y = (r4.w == 0.0) ? r0.y : r0.w;
    r0.w = (r3.y == 0.0) ? r10.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r5.z + r3.z;
            ps = r3.z + r3.z;
            r5.y = r0.x * r0.w;
            r2.w = ps;
            ps = r5.y;
            r4.yw = r5.zy - r3.xx;
            r3.y = ps;
            ps = r3.x;
            r0.y = r4.y + r3.z;
            r3.w = ps;
            ps = max(r3.y, r3.w);
            r3.x = float((r4.w > r0.y));
            r0.y = ps;
            r0.y = (r3.x == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.w;
            r0.z = r5.y - r0.y;
            r0.y = ps;
            r0.y = r0.z * r0.y;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.y = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.x = float((0.5 > SP_Demolition_Style.x));
    r4.y = ps;
    ps = r4.z;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r5.z = ps;
    ps = 1e+01;
    r3.zw = -r5.xy + 1.0;
    r5.w = ps;
    ps = min(r5.z, r5.w);
    r4.w = r1.z * r3.z;
    r3.y = ps;
    r3.yz = r4.yw * r3.yw;
    ps = 25.0 * r0.z;
    r2.w = frac(r3.y);
    r1.z = ps;
    ps = r3.z;
    r0.z = r2.w - 0.5;
    r0.z = -abs(r0.z) * 2.0 + 1.0;
    ps = r5.y + ps;
    r0.z = r1.z * r0.z;
    r2.w = ps;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.z * r0.x;
    r0.z = -r0.x * r0.w + r0.w;
    // UNHANDLED control flow: cjmp
    r0.xw = r2.yw * float2(6.2831, 4e+02);
    r0.y = r0.x * r0.y;
    r0.y = r0.y * 0.15915494 + 0.5;
    ps = frac(r0.y);
    r0.y = ps;
    r1.z = r0.y * 6.2831855 - 3.1415927;
    ps = sin(r1.z);
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r0.x = ps;
    r0.x = r0.w * r0.x;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r4.x;
    if (p0)
    {
        r8.x = r0.x + r8.x;
    }
    if (!p0)
    {
        r8.y = r0.x + r8.y;
    }
    r4 = r12.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.w;
    r13.xyz = r6.yxz * 0.003921569;
    r14.x = ps;
    r10.xy = r8.zw * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r3.y = -r1.y * 0.007843138 + 1.0;
    r3.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r0.zzzz * LocalToWorld[2].xzyw + r4;
    r14.yzw = r11.yxz * 0.007843138 - 1.0;
    r5.xyz = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r4.xyz = r14.yyw * r5.xzz;
    r14.y = ps;
    r0 = r8.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r8.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    r4.xyz = r14.wzz * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r3.xyz, r4.xyz);
    r14.z = ps;
    r13.w = r1.z * 0.5 + 0.5;
    r3.xy = r0.ww * ViewProjectionMatrix[3].zw;
    r0.w = float((LightType.x >= 0.9));
    r10.zw = r0.xx * ViewProjectionMatrix[2].zw + r3.xy;
    r8.xyw = -r0.xyz * CameraPosition.www + CameraPosition.zyx;
    r15.xyz = -r0.www * r0.xyz + LightPositionAndInvRadius.zyx;
    r3.xyz = r6.xyz * 0.007843138 - 1.0;
    r5.yzw = r11.xyz * 0.007843138 - 1.0;
    r1.xyz = r1.xyw * 0.007843138 - 1.0;
    r4.x = dot(r1.xzy, WorldToLocal[2].zxy);
    r4.y = dot(r5.zyw, WorldToLocal[2].zxy);
    r4.z = dot(r3.zyx, WorldToLocal[2].zxy);
    r11.xyz = r15.xxx * WorldToLocal[2].xyz;
    r16.xyz = r8.xxx * WorldToLocal[2].xyz;
    r6.xy = r0.yy * ViewProjectionMatrix[1].zw + r10.zw;
    r6.zw = r0.zz * ViewProjectionMatrix[0].zw + r6.xy;
    r8.xyz = r8.yyy * WorldToLocal[1].xyz + r16.xyz;
    r0.xyz = r15.yyy * WorldToLocal[1].xyz + r11.xyz;
    r0.xyz = r15.zzz * WorldToLocal[0].xzy + r0.xzy;
    r11.xyz = r8.www * WorldToLocal[0].xzy + r8.xzy;
    r8.x = dot(r1.xzy, r11.yxz);
    r8.y = dot(r5.zyw, r11.yxz);
    r8.z = dot(r3.zyx, r11.yxz);
    r5.x = dot(r1.xzy, r0.yxz);
    r5.y = dot(r5.zyw, r0.yxz);
    r5.z = dot(r3.zyx, r0.yxz);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r12.wwww * LocalToWorld[3].xwzy;
    r0 = r12.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r12.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r8.w = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r6.y = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.yzw = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r1.zwy + r12.xyz;
    r1.x = ps;
    ps = r3.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r1.x * ps;
    r0.xz = saturate(r3.xy * r0.xz);
    r4.w = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r4.w * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r3.xz = -r1.zw + Demolition_Center.xy;
    ps = -r3.z * -r3.z;
    r3.yw = -r3.xz + BBox_Size.xy;
    r11.x = ps;
    r11.yz = r0.zx * BBox_Size.yx - r3.zx;
    r3.z = dot(r11.zy, r11.zy) + 0.0;
    ps = -r3.x * -r3.x;
    r11.zw = r3.yw * r3.yw;
    r11.y = ps;
    ps = 1.0 / r0.y;
    r11 = r11.zyyz + r11.wxwx;
    r3.y = ps;
    ps = sqrt(abs(r11.w));
    r0.w = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r11.y));
    r3.x = r0.w * SP_DemolitionSpread.x;
    r0.y = ps;
    ps = sqrt(abs(r11.z));
    r3.w = max(r0.y, r3.w);
    r0.y = ps;
    ps = sqrt(abs(r11.x));
    r0.y = max(r3.w, r0.y);
    r3.w = ps;
    ps = sqrt(abs(r3.z));
    r0.y = max(r0.y, r3.w);
    r3.z = ps;
    ps = 1.0 / r0.y;
    r3.y = r3.y * r3.z;
    r0.y = ps;
    r0.y = -r3.y * r0.y + r0.w;
    ps = 1.0 / r0.w;
    r0.y = max(r0.y, 0.0);
    r0.w = ps;
    r0.y = saturate(r0.y * r0.w);
    r0.w = -r0.y * 2.0 + 3.0;
    r0.y = r0.y * r0.y;
    r0.y = r3.x * r0.y;
    r8.w = saturate(r0.y * r0.w);
    ps = Demolition_Center.z - r1.y;
    r0.w = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r5.w = float((SP_Demolition_Style.x > 0.5));
    r3.y = ps;
    ps = 1.0;
    r11.x = saturate(floor(r0.w));
    r3.x = ps;
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.z = saturate(r0.y * r1.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r1.x;
            r3.y = r10.z * r0.y;
            r3.w = ps;
            r0.w = r3.y + r3.w;
            ps = BBox_Size.z * r3.y;
            r0.y = float((r4.w >= r3.y));
            r3.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r1.z = r0.w * BBox_Size.z;
            r3.x = ps;
        }
    }
    if (!p0)
    {
        ps = r10.w;
        r3.zw = r3.yy;
        r1.z = ps;
    }
    r0.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r3.x;
    r1.y = float((1.0 > SP_Demolition_Style.x));
    r7.w = ps;
    ps = r8.w;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r3.x * ps;
    r0.y = r0.y * r1.y;
    r6.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.yw = r3.yx + r3.wx;
    // UNHANDLED control flow: cjmp
    r3.x = saturate(r1.w * r8.w);
    r1.w = float((r4.w > r1.y));
    ps = sqrt(abs(r4.w));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r1.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.y = r3.x * r1.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r3.x = r1.w * r0.x;
    r0.x = saturate(ps);
    r0.x = r1.y * r0.x;
    p0 = (0.0 == 0.0 && r3.x != 0.0);
    r0.y = (0.0 == 0.0 && r3.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.xw = r0.xx * float2(8e+02, -1e+03);
        r12.y = r0.x + r12.y;
        ps = 3.3333333 * r0.z;
        r1.y = r0.w + r12.z;
        r0.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r1.y = float((r0.z > 0.7));
        r1.y = r1.y * r1.w;
    }
    p0 = (r0.y == 0.0 && r1.y != 0.0);
    r0.y = (r0.y == 0.0 && r1.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r0.xw = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r12.y = r0.x + r12.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r1.y = r0.w + r12.z;
        r0.w = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r12.z;
        r1.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r1.w * r0.z;
    r0.y = saturate(ps);
    r0.y = r1.y * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yw = r0.yy * float2(8e+02, -1e+03);
        r12.x = r0.y + r12.x;
        ps = 3.3333333 * r0.x;
        r1.y = r0.w + r12.z;
        r0.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r1.y = float((r0.x > 0.7));
        r1.y = r1.y * r1.w;
    }
    p0 = (r0.z == 0.0 && r1.y != 0.0);
    r0.z = (r0.z == 0.0 && r1.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r0.yw = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r12.x = r0.y + r12.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r1.y = r0.w + r12.z;
        r0.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r12.z;
        r1.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r12.z;
    r1.y = ps;
    r0.z = float((r12.z >= r1.z));
    r3.x = -r7.w * r8.w + r1.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r1.yz + r3.zz;
    r11.y = ps;
    p0 = (r5.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.zw = float2((r1.zy >= r3.xz));
    r0.xy = r4.ww * r10.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r1.yz;
    r0.x = (r11.w == 0.0) ? r1.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r11.z == 0.0) ? r3.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.x = r10.z + r3.w;
            ps = r3.w + r3.w;
            r10.w = r1.x * r0.y;
            r1.y = ps;
            ps = r10.w;
            r1.zw = r10.zw - r3.yy;
            r3.x = ps;
            ps = r3.y;
            r0.z = r1.z + r3.w;
            r3.z = ps;
            ps = max(r3.x, r3.z);
            r1.z = float((r1.w > r0.z));
            r0.z = ps;
            r0.x = (r1.z == 0.0) ? r0.z : r0.x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.y;
            r0.x = r10.w - r0.x;
            r0.z = ps;
            r0.x = r0.x * r0.z;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r11.y = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.y = float((0.5 > SP_Demolition_Style.x));
    r1.z = ps;
    ps = r6.y;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r3.x = ps;
    ps = 1e+01;
    r3.yz = -r11.xy + 1.0;
    r3.w = ps;
    ps = min(r3.x, r3.w);
    r1.w = r6.x * r3.y;
    r3.x = ps;
    r1.zw = r1.zw * r3.xz;
    ps = 25.0 * r0.x;
    r3.x = frac(r1.z);
    r0.x = ps;
    ps = r1.w;
    r1.z = r3.x - 0.5;
    r1.z = -abs(r1.z) * 2.0 + 1.0;
    ps = r11.y + ps;
    r1.z = r0.x * r1.z;
    r0.x = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = r1.z * r1.x;
    r0.y = -r1.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r1.x = r4.w * 6.2831;
    r0.z = r1.x * r0.z;
    r0.z = r0.z * 0.15915494 + 0.5;
    r0.z = frac(r0.z);
    r1.x = r0.z * 6.2831855 - 3.1415927;
    ps = sin(r1.x);
    r0.z = float((Collapse_Endcaps.x >= 2.0));
    r1.x = ps;
    r1.x = r1.x * 4e+02;
    r0.x = r1.x * r0.x;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.w;
    if (p0)
    {
        r12.x = r0.x + r12.x;
    }
    if (!p0)
    {
        r12.y = r0.x + r12.y;
    }
    r1 = r12.wwww * LocalToWorld[3].xwzy;
    r0 = r0.yyyy * LocalToWorld[2].xwzy + r1;
    r0 = r12.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    o0.xy = r10.xy;
    o4.zw = r6.zw;
    o4.xy = 1.0;
    o8.xyz = r14.xyz;
    o8.w = 0.0;
    o3.xyz = r5.xyz;
    o3.w = 0.0;
    o5.xyz = r8.xyz;
    o5.w = 0.0;
    o6.xyz = r4.xyz;
    o6.w = 0.0;
    o7 = r13;
    o9 = r2.xzyw;
    o1 = r9;
    o2 = r7.xyzz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord4 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.texcoord8 = o6;
    Out.color0 = o7;
    Out.color1 = o8;
    Out.color2 = o9;
    return Out;
}
