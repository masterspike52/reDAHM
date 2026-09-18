// vs_66f8439862964813.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1164 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00001230 00910011 00000000 00000000 0000A14A 00000001 00000008 0000000A 00000290 0010002D 0000602E 0000702F 00003030 00005031 00015032 00025033 00255034 0000F050 0001F151 0002F253 0003F354 0004F456 0005F557 0006F658 0007F7A0 0008F8A1 0009F9A2 0000117D 0000117E 00001182 00001178 00001176 00001179 0000117A 0000117B 00001177 0000117C
//   vertex element: instruction 45 -> POSITION0
//   vertex element: instruction 46 -> TANGENT0
//   vertex element: instruction 47 -> BINORMAL0
//   vertex element: instruction 48 -> NORMAL0
//   vertex element: instruction 49 -> TEXCOORD0
//   vertex element: instruction 50 -> TEXCOORD1
//   vertex element: instruction 51 -> TEXCOORD2
//   vertex element: instruction 52 -> TEXCOORD5
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD3 (flags 0xF)
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
float4 LightMapScale : register(c19); // float3
float4 LightPositionAndInvRadius : register(c21); // float4[2]
float4 LightType : register(c20); // float[2]
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
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord5 : TEXCOORD5;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord3 : TEXCOORD3;
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
    float4 r17 = 0.0;
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
    r9.xyz = In.binormal0.xzy;
    r6.xyz = In.normal0.yxz;
    r11.xy = In.texcoord0.xy;
    r11.zw = In.texcoord1.yx;
    r7.xy = In.texcoord2.xy;
    r7.z = 0.0;
    r10.xyz = In.texcoord5.xyz;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r3 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r12.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r13.xyz = r6.yxz * 0.003921569;
    r14.x = ps;
    r4.y = -r1.y * 0.007843138 + 1.0;
    r4.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r12.zzzz * LocalToWorld[2].xwzy + r0;
    r8.xyz = r9.yxz * 0.007843138 - 1.0;
    r5.xyz = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r2.xyz = r8.xxz * r5.xzz;
    r14.y = ps;
    r0 = r12.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    r2.xyz = r8.zyy * r5.yyx - r2.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r4.xyz, r2.xyz);
    r14.z = ps;
    r13.w = r1.z * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.y = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r4.z = BBox_Size.z * 0.0026041667;
    r2.z = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.xyz = -r0.zwy + r12.xyz;
    r0.x = ps;
    ps = r3.z;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r3.xz = saturate(r3.xy * r2.xz);
    r3.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = r3.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r2.xz = -r0.zw + Demolition_Center.xy;
    ps = -r2.z * -r2.z;
    r2.yw = -r2.xz + BBox_Size.xy;
    r8.x = ps;
    r4.xy = r3.zx * BBox_Size.yx - r2.zx;
    r2.z = dot(r4.yx, r4.yx) + 0.0;
    ps = -r2.x * -r2.x;
    r8.zw = r2.yw * r2.yw;
    r8.y = ps;
    ps = 1.0 / r1.z;
    r8 = r8.zyyz + r8.wxwx;
    r2.w = ps;
    ps = sqrt(abs(r8.y));
    r1.z = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.w = ps;
    ps = sqrt(abs(r8.w));
    r2.y = r1.z * SP_DemolitionSpread.x;
    r2.x = ps;
    ps = sqrt(abs(r8.z));
    r3.w = max(r3.w, r2.x);
    r2.x = ps;
    ps = sqrt(abs(r8.x));
    r3.w = max(r3.w, r2.x);
    r2.x = ps;
    ps = sqrt(abs(r2.z));
    r2.x = max(r3.w, r2.x);
    r2.z = ps;
    ps = 1.0 / r2.x;
    r2.z = r2.w * r2.z;
    r2.x = ps;
    r2.x = -r2.z * r2.x + r1.z;
    ps = 1.0 / r1.z;
    r2.x = max(r2.x, 0.0);
    r1.z = ps;
    r2.x = saturate(r2.x * r1.z);
    r1.z = -r2.x * 2.0 + 3.0;
    ps = r2.x * r2.x;
    r2.x = ps;
    r2.x = r2.y * r2.x;
    r2.y = saturate(r2.x * r1.z);
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.z = SP_Demolition_Style.x + 0.5;
    r2.x = ps;
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.y = float((SP_Demolition_Style.x > 0.5));
    r1.z = ps;
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
            r2.x = r5.z * r0.y;
            r2.z = ps;
            r0.z = r2.x + r2.z;
            ps = BBox_Size.z * r2.x;
            r0.y = float((r3.y >= r2.x));
            r8.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r0.w = r0.z * BBox_Size.z;
            r1.z = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
            r2.z = ps;
            ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
            r0.w = r5.w;
            r8.w = ps;
        }
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
    ps = BBox_Size.z * r2.y;
    r0.z = float((Collapse_Endcaps.x > 0.5));
    r3.w = ps;
    ps = r2.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.z * ps;
    r4.w = r0.z * r0.y;
    r2.w = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.yz = r2.xy + r2.zy;
    // UNHANDLED control flow: cjmp
    r2.y = float((r3.y > r0.y));
    r4.w = saturate(r0.z * r1.z);
    ps = sqrt(abs(r3.y));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r0.z = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r4.w * r0.z;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r4.w = float((0.3 >= r3.z));
    ps = 0.00013333333 * r0.y;
    r4.w = r2.y * r4.w;
    r0.y = saturate(ps);
    r0.y = r0.z * r0.y;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r4.w = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(8e+02, -1e+03);
        r8.y = r0.y + r12.y;
        ps = 3.3333333 * r3.z;
        r0.y = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.z = float((r3.z > 0.7));
        r0.z = r0.z * r2.y;
    }
    p0 = (r4.w == 0.0 && r0.z != 0.0);
    r4.w = (r4.w == 0.0 && r0.z != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(-1e+03, -8e+02);
        ps = 1.0 - r3.z;
        r8.y = r0.z + r12.y;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r0.y = r0.y + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        ps = r12.y;
        r0.y = r12.z;
        r8.y = ps;
    }
    ps = r12.x;
    r8.x = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r4.w = float((0.3 >= r3.x));
    ps = 0.00013333333 * r0.y;
    r4.w = r2.y * r4.w;
    r0.y = saturate(ps);
    r0.y = r0.z * r0.y;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r4.w = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(8e+02, -1e+03);
        r8.x = r0.y + r12.x;
        ps = 3.3333333 * r3.x;
        r0.y = r0.z + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.z = float((r3.x > 0.7));
        r0.z = r0.z * r2.y;
    }
    p0 = (r4.w == 0.0 && r0.z != 0.0);
    r4.w = (r4.w == 0.0 && r0.z != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r0.yz = r0.yy * float2(-1e+03, -8e+02);
        ps = 1.0 - r3.x;
        r8.x = r0.z + r12.x;
        r0.z = ps;
        ps = 3.3333333 * r0.z;
        r0.y = r0.y + r12.z;
        r4.x = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        ps = r12.x;
        r0.y = r12.z;
        r8.x = ps;
    }
    ps = r12.y;
    r8.y = ps;
    // UNHANDLED control flow: cjmp
    ps = r12.z;
    r8.xy = r12.xy;
    r0.y = ps;
    r2.y = float((r12.z >= r0.w));
    r8.z = -r3.w * r1.z + r0.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r13.zw = -r0.yw + r8.ww;
    r5.y = ps;
    p0 = (r4.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.xy = float2((r0.wy >= r8.zw));
    r4.yw = r3.yy * r5.ww + r13.zw;
    r0.zw = r4.yw * SP_DemolitionSpread.xx + r0.yw;
    r0.y = (r13.y == 0.0) ? r0.y : r0.z;
    r0.y = (r2.y == 0.0) ? r0.y : r0.w;
    r0.w = (r13.x == 0.0) ? r8.z : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r5.z + r2.z;
            ps = r2.z + r2.z;
            r5.y = r0.x * r0.w;
            r1.z = ps;
            ps = r5.y;
            r8.zw = r5.zy - r2.xx;
            r4.y = ps;
            ps = r2.x;
            r0.y = r8.z + r2.z;
            r4.w = ps;
            ps = max(r4.y, r4.w);
            r2.x = float((r8.w > r0.y));
            r0.y = ps;
            r0.y = (r2.x == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.z;
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
    r1.z = float((0.5 > SP_Demolition_Style.x));
    r4.y = ps;
    ps = r4.z;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r5.z = ps;
    ps = 1e+01;
    r2.yz = -r5.xy + 1.0;
    r5.w = ps;
    ps = min(r5.z, r5.w);
    r4.w = r2.w * r2.y;
    r2.x = ps;
    r2.xy = r4.yw * r2.xz;
    ps = 25.0 * r0.z;
    r2.z = frac(r2.x);
    r2.x = ps;
    ps = r2.y;
    r0.z = r2.z - 0.5;
    r0.z = -abs(r0.z) * 2.0 + 1.0;
    ps = r5.y + ps;
    r0.z = r2.x * r0.z;
    r3.w = ps;
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.z * r0.x;
    r0.z = -r0.x * r0.w + r0.w;
    // UNHANDLED control flow: cjmp
    r0.xw = r3.yw * float2(6.2831, 4e+02);
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
    r2.y = -r1.y * 0.007843138 + 1.0;
    r2.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r0.zzzz * LocalToWorld[2].xzyw + r4;
    r14.yzw = r9.yxz * 0.007843138 - 1.0;
    r5.xyz = r6.xzy * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r4.xyz = r14.yyw * r5.xzz;
    r14.y = ps;
    r0 = r8.yyyy * LocalToWorld[1].xzyw + r0;
    r0 = r8.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    r4.xyz = r14.wzz * r5.yyx - r4.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r2.xyz, r4.xyz);
    r14.z = ps;
    r13.w = r1.z * 0.5 + 0.5;
    r2.xy = r0.ww * ViewProjectionMatrix[3].zw;
    r0.w = float((LightType.x >= 0.9));
    r17.xy = r0.xx * ViewProjectionMatrix[2].zw + r2.xy;
    r8.xyz = -r0.xyz * CameraPosition.www + CameraPosition.zyx;
    r15.xyz = -r0.www * r0.xyz + LightPositionAndInvRadius.zyx;
    r4.xyz = r6.xyz * 0.007843138 - 1.0;
    r5.yzw = r9.xyz * 0.007843138 - 1.0;
    r1.xyz = r1.xyw * 0.007843138 - 1.0;
    r2.y = dot(r1.xzy, WorldToLocal[2].zxy);
    r2.z = dot(r5.zyw, WorldToLocal[2].zxy);
    r2.w = dot(r4.zyx, WorldToLocal[2].zxy);
    r16.xyz = r15.xxx * WorldToLocal[2].xyz;
    r6.xyz = r8.xxx * WorldToLocal[2].xyz;
    r9.xy = r0.yy * ViewProjectionMatrix[1].zw + r17.xy;
    r9.xy = r0.zz * ViewProjectionMatrix[0].zw + r9.xy;
    r6.xyz = r8.yyy * WorldToLocal[1].xyz + r6.xyz;
    r0.xyz = r15.yyy * WorldToLocal[1].xyz + r16.xyz;
    r0.xyz = r15.zzz * WorldToLocal[0].xzy + r0.xzy;
    r6.xyz = r8.zzz * WorldToLocal[0].xzy + r6.xzy;
    r8.x = dot(r1.xzy, r6.yxz);
    r8.y = dot(r5.zyw, r6.yxz);
    r8.z = dot(r4.zyx, r6.yxz);
    r5.x = dot(r1.xzy, r0.yxz);
    r5.y = dot(r5.zyw, r0.yxz);
    r5.z = dot(r4.zyx, r0.yxz);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r12.wwww * LocalToWorld[3].xwzy;
    r0 = r12.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r12.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r12.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r7.w = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r6.z = BBox_Size.z * 0.0026041667;
    r0.w = ps;
    r1.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r4.xyz = -r1.yzx + r12.xyz;
    r0.z = ps;
    ps = r4.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.z * ps;
    r0.xw = saturate(r4.xy * r0.xw);
    r2.x = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.w = r2.x * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r4.xz = -r1.yz + Demolition_Center.xy;
    ps = -r4.z * -r4.z;
    r4.yw = -r4.xz + BBox_Size.xy;
    r15.x = ps;
    r6.xy = r0.wx * BBox_Size.yx - r4.zx;
    r4.z = dot(r6.yx, r6.yx) + 0.0;
    ps = -r4.x * -r4.x;
    r15.zw = r4.yw * r4.yw;
    r15.y = ps;
    ps = 1.0 / r0.y;
    r15 = r15.zyyz + r15.wxwx;
    r4.y = ps;
    ps = sqrt(abs(r15.w));
    r1.w = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r4.w = ps;
    ps = sqrt(abs(r15.y));
    r4.x = r1.w * SP_DemolitionSpread.x;
    r0.y = ps;
    ps = sqrt(abs(r15.z));
    r4.w = max(r0.y, r4.w);
    r0.y = ps;
    ps = sqrt(abs(r15.x));
    r0.y = max(r4.w, r0.y);
    r4.w = ps;
    ps = sqrt(abs(r4.z));
    r0.y = max(r0.y, r4.w);
    r4.z = ps;
    ps = 1.0 / r0.y;
    r4.y = r4.y * r4.z;
    r0.y = ps;
    r0.y = -r4.y * r0.y + r1.w;
    ps = 1.0 / r1.w;
    r0.y = max(r0.y, 0.0);
    r1.w = ps;
    r0.y = saturate(r0.y * r1.w);
    r1.w = -r0.y * 2.0 + 3.0;
    r0.y = r0.y * r0.y;
    r0.y = r4.x * r0.y;
    r7.w = saturate(r0.y * r1.w);
    ps = Demolition_Center.z - r1.x;
    r1.z = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r6.x = float((SP_Demolition_Style.x > 0.5));
    r1.y = ps;
    ps = 1.0;
    r9.z = saturate(floor(r1.z));
    r1.x = ps;
    p0 = (r6.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = saturate(r0.y * r0.z);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.z;
            r1.y = r6.w * r0.y;
            r1.w = ps;
            r1.x = r1.y + r1.w;
            ps = BBox_Size.z * r1.y;
            r0.y = float((r2.x >= r1.y));
            r1.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r4.z = r1.x * BBox_Size.z;
            r1.x = ps;
        }
    }
    if (!p0)
    {
        ps = r8.w;
        r1.zw = r1.yy;
        r4.z = ps;
    }
    r4.x = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.x;
    r4.y = float((1.0 > SP_Demolition_Style.x));
    r6.y = ps;
    ps = r7.w;
    r0.y = float((Collapse_Endcaps.x > 0.5));
    ps = r1.x * ps;
    r0.y = r0.y * r4.y;
    r5.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.yw = r1.yx + r1.wx;
    // UNHANDLED control flow: cjmp
    r4.w = saturate(r4.w * r7.w);
    r1.x = float((r2.x > r4.y));
    ps = sqrt(abs(r2.x));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.y = r4.w * r4.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.w));
    ps = 0.00013333333 * r0.y;
    r4.w = r1.x * r0.x;
    r0.x = saturate(ps);
    r0.x = r4.y * r0.x;
    p0 = (0.0 == 0.0 && r4.w != 0.0);
    r0.y = (0.0 == 0.0 && r4.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xy = r0.xx * float2(8e+02, -1e+03);
        r12.y = r4.x + r12.y;
        ps = 3.3333333 * r0.w;
        r4.y = r4.y + r12.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r4.y = float((r0.w > 0.7));
        r1.x = r4.y * r1.x;
    }
    p0 = (r0.y == 0.0 && r1.x != 0.0);
    r0.y = (r0.y == 0.0 && r1.x != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r4.xy = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.w;
        r12.y = r4.x + r12.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r12.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r12.z;
        r4.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.w = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.w = r1.x * r0.w;
    r0.y = saturate(ps);
    r0.y = r4.y * r0.y;
    p0 = (0.0 == 0.0 && r0.w != 0.0);
    r0.w = (0.0 == 0.0 && r0.w != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xy = r0.yy * float2(8e+02, -1e+03);
        r12.x = r4.x + r12.x;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r12.z;
        r4.x = ps;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        r4.y = float((r0.x > 0.7));
        r1.x = r4.y * r1.x;
    }
    p0 = (r0.w == 0.0 && r1.x != 0.0);
    r0.w = (r0.w == 0.0 && r1.x != 0.0) ? 0.0 : r0.w + 1.0;
    if (p0)
    {
        r4.xy = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r12.x = r4.x + r12.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r12.z;
        r4.x = ps;
    }
    p0 = (r0.w == 1.0);
    ps = p0 ? 0.0 : ((r0.w == 0.0) ? 1.0 : r0.w);
    r0.w = ps;
    if (p0)
    {
        ps = r12.z;
        r4.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r12.z;
    r4.y = ps;
    r0.w = float((r12.z >= r4.z));
    r1.x = -r6.y * r7.w + r4.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r4.yz + r1.zz;
    r9.w = ps;
    p0 = (r6.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r15.xy = float2((r4.zy >= r1.xz));
    r0.xy = r2.xx * r8.ww + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r4.yz;
    r0.x = (r15.y == 0.0) ? r4.y : r0.x;
    r0.x = (r0.w == 0.0) ? r0.x : r0.y;
    r0.y = (r15.x == 0.0) ? r1.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.w = r6.w + r1.w;
            ps = r1.w + r1.w;
            r6.x = r0.z * r0.y;
            r1.x = ps;
            ps = r6.x;
            r15.xy = r6.wx - r1.yy;
            r4.y = ps;
            ps = r1.y;
            r0.x = r15.x + r1.w;
            r4.z = ps;
            ps = max(r4.y, r4.z);
            r1.y = float((r15.y > r0.x));
            r0.x = ps;
            r0.x = (r1.y == 0.0) ? r0.x : r0.w;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.x;
            r0.x = r6.x - r0.x;
            r0.w = ps;
            r0.x = r0.x * r0.w;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r9.w = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.w = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r1.x = float((0.5 > SP_Demolition_Style.x));
    r4.y = ps;
    ps = r6.z;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r6.x = ps;
    ps = 1e+01;
    r1.zw = -r9.zw + 1.0;
    r6.y = ps;
    ps = min(r6.x, r6.y);
    r4.z = r5.w * r1.z;
    r1.y = ps;
    r1.yz = r4.yz * r1.yw;
    ps = 25.0 * r0.x;
    r1.w = frac(r1.y);
    r0.x = ps;
    ps = r1.z;
    r1.y = r1.w - 0.5;
    r1.y = -abs(r1.y) * 2.0 + 1.0;
    ps = r9.w + ps;
    r1.y = r0.x * r1.y;
    r0.x = ps;
    p0 = (r1.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r1.y * r0.z;
    r0.y = -r0.z * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.z = r2.x * 6.2831;
    r0.z = r0.z * r0.w;
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
    r0.x = r0.x * r4.x;
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
    ps = log2(abs(r10.x));
    r0.x = ps;
    ps = log2(abs(r10.y));
    r0.y = ps;
    ps = log2(abs(r10.z));
    r0.z = ps;
    r0.xyz = r0.xyz * 2.2;
    o4.zw = r9.xy;
    o4.xy = 1.0;
    o8.xyz = r14.xyz;
    o8.w = 0.0;
    o3.xyz = r5.xyz;
    o3.w = 0.0;
    o5.xyz = r8.xyz;
    o5.w = 0.0;
    o6.xyz = r2.yzw;
    o6.w = 0.0;
    o7 = r13;
    o9 = r3.xzyw;
    o0 = r11;
    o1 = r7.xyzz;
    ps = pow(2.0, r0.x);
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r0.z = ps;
    o2.xyz = r0.xyz * LightMapScale.xyz;
    o2.w = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord3 = o2;
    Out.texcoord4 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.texcoord8 = o6;
    Out.color0 = o7;
    Out.color1 = o8;
    Out.color2 = o9;
    return Out;
}
