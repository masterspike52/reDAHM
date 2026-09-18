// vs_43d1ce1c6903ef2e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1134 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 000011B8 0081000F 00000000 00000000 00008929 00000001 00000007 00000009 00000290 0010002C 0000602D 0000702E 0000302F 00005030 00015031 0020A032 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 0008F8A2 00001170 00001178 00001173 00001171 00001174 00001175 00001176 00001172 00001177
//   vertex element: instruction 44 -> POSITION0
//   vertex element: instruction 45 -> TANGENT0
//   vertex element: instruction 46 -> BINORMAL0
//   vertex element: instruction 47 -> NORMAL0
//   vertex element: instruction 48 -> TEXCOORD0
//   vertex element: instruction 49 -> TEXCOORD1
//   vertex element: instruction 50 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
// NOTE: unhandled control flow cjmp at cf 46
// NOTE: unhandled control flow cjmp at cf 48
// NOTE: unhandled control flow cjmp at cf 51
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
    float4 color0 : COLOR0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 o8 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r11 = In.position0;
    r1.xyw = In.tangent0.zyx;
    r6.yzw = In.binormal0.xzy;
    r8.xyz = In.normal0.yxz;
    r9.xy = In.texcoord0.xy;
    r9.zw = In.texcoord1.yx;
    r4.yz = In.color0.xy;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r2 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r11.wwww * LocalToWorld[3].xwzy;
    ps = 0.003921569 * r1.w;
    r3.xyz = r8.yxz * 0.003921569;
    r7.y = ps;
    r12.xy = r4.yz * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r4.y = -r1.y * 0.007843138 + 1.0;
    r4.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r11.zzzz * LocalToWorld[2].xwzy + r0;
    r10.xyz = r6.zyw * 0.007843138 - 1.0;
    r7.xzw = r8.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r5.xyz = r10.xxz * r7.xzz;
    r7.z = ps;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r11.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    r5.xyz = r10.zyy * r7.wwx - r5.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r4.xyz, r5.xyz);
    r7.w = ps;
    r3.w = r1.z * 0.5 + 0.5;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r3.x = float((abs(r0.x) >= 0.0));
    r2.x = ps;
    ps = 1.0 / BBox_Size.y;
    r6.x = BBox_Size.z * 0.0026041667;
    r2.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r3.yzw = -r0.zwy + r11.xyz;
    r0.x = ps;
    ps = r3.w;
    r1.z = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r2.xz = saturate(r3.yz * r2.xy);
    r2.y = saturate(ps);
    p0 = (r1.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.x = r2.y * 384.0;
    // UNHANDLED control flow: cjmp
    r1.z = max(CylDemMask_Shallowness.x, 1.0);
    r3.xz = -r0.zw + Demolition_Center.xy;
    ps = -r3.z * -r3.z;
    r3.yw = -r3.xz + BBox_Size.xy;
    r5.x = ps;
    r4.xw = r2.zx * BBox_Size.yx - r3.zx;
    r3.z = dot(r4.wx, r4.wx) + 0.0;
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
    r4.w = float((SP_Demolition_Style.x > 0.5));
    r0.z = ps;
    ps = Demolition_Center.z - r0.y;
    r7.y = saturate(floor(r0.w));
    r0.y = ps;
    p0 = (r4.w != 0.0);
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
        ps = r7.x;
        r3.zw = float2((-abs(r0.xx) > 0.0));
        r5.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r4.x = ps;
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
        r4.x = ps;
        r5.xw = r2.ww * float2(-1e+03, 8e+02) + r11.zy;
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
        r4.x = ps;
        r5.xw = r2.ww * float2(-1e+03, -8e+02) + r11.zy;
    }
    p0 = (r5.z == 1.0);
    ps = p0 ? 0.0 : ((r5.z == 0.0) ? 1.0 : r5.z);
    r5.z = ps;
    if (p0)
    {
        r5.xw = r11.zy;
    }
    ps = r11.x;
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
        r4.x = ps;
        r5.xz = r2.ww * float2(-1e+03, 8e+02) + r11.zx;
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
        r4.x = ps;
        r5.xz = r2.ww * float2(-1e+03, -8e+02) + r11.zx;
    }
    p0 = (r5.w == 1.0);
    ps = p0 ? 0.0 : ((r5.w == 0.0) ? 1.0 : r5.w);
    r5.w = ps;
    if (p0)
    {
        r5.xz = r11.zx;
    }
    ps = r11.y;
    r5.w = ps;
    // UNHANDLED control flow: cjmp
    r5.xzw = r11.zxy;
    r2.w = float((r11.z >= r5.y));
    r3.x = -r1.z * r0.z + r5.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r5.xy + r3.zz;
    r7.z = ps;
    p0 = (r4.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.xy = float2((r5.yx >= r3.xz));
    r0.yz = r2.yy * r7.xx + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r5.xy;
    r0.y = (r10.y == 0.0) ? r5.x : r0.y;
    r0.y = (r2.w == 0.0) ? r0.y : r0.z;
    r1.z = (r10.x == 0.0) ? r3.x : r0.y;
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
            r7.z = ps;
        }
    }
    r0.y = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r3.x = float((0.5 > SP_Demolition_Style.x));
    r5.x = ps;
    ps = r6.x;
    r0.z = float((SP_DemolitionSpread.x >= 0.25));
    r7.x = ps;
    ps = 1e+01;
    r3.zw = -r7.yz + 1.0;
    r7.w = ps;
    ps = min(r7.x, r7.w);
    r5.y = r0.w * r3.z;
    r3.y = ps;
    r3.yz = r5.xy * r3.yw;
    ps = 25.0 * r0.z;
    r0.w = frac(r3.y);
    r0.z = ps;
    ps = r3.z;
    r0.w = r0.w - 0.5;
    r0.w = -abs(r0.w) * 2.0 + 1.0;
    ps = r7.z + ps;
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
    r0.y = r0.y * r4.x;
    if (p0)
    {
        r5.z = r0.y + r5.z;
    }
    if (!p0)
    {
        r5.w = r0.y + r5.w;
    }
    r10 = r11.wwww * LocalToWorld[3].xzyw;
    ps = 0.003921569 * r1.w;
    r3.xyz = r8.yxz * 0.003921569;
    r7.y = ps;
    r12.xy = r4.yz * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r4.y = -r1.y * 0.007843138 + 1.0;
    r4.xz = r1.wx * 0.007843138 - 1.0;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r10;
    r13.xyz = r6.zyw * 0.007843138 - 1.0;
    r7.xzw = r8.xyz * 0.007843138 - 1.0;
    ps = 0.003921569 * r1.y;
    r10.xyz = r13.xxz * r7.xzz;
    r7.z = ps;
    r0 = r5.wwww * LocalToWorld[1].xzyw + r0;
    r0 = r5.zzzz * LocalToWorld[0].zyxw + r0.yzxw;
    r5.xyz = r13.zyy * r7.wwx - r10.xyz;
    ps = 0.003921569 * r1.x;
    r1.z = dot(r4.xyz, r5.xyz);
    r7.w = ps;
    r3.w = r1.z * 0.5 + 0.5;
    r4.xy = r0.ww * ViewProjectionMatrix[3].zw;
    r0.w = float((LightType.x >= 0.9));
    r12.zw = r0.xx * ViewProjectionMatrix[2].zw + r4.xy;
    r10.xyz = -r0.xyz * CameraPosition.www + CameraPosition.zyx;
    r14.xyz = -r0.www * r0.xyz + LightPositionAndInvRadius.zyx;
    r13.xyz = r8.xyz * 0.007843138 - 1.0;
    r5.yzw = r6.yzw * 0.007843138 - 1.0;
    r1.xyz = r1.xyw * 0.007843138 - 1.0;
    r4.x = dot(r1.xzy, WorldToLocal[2].zxy);
    r4.y = dot(r5.zyw, WorldToLocal[2].zxy);
    r4.z = dot(r13.zyx, WorldToLocal[2].zxy);
    r15.xyz = r14.xxx * WorldToLocal[2].xyz;
    r6.xyz = r10.xxx * WorldToLocal[2].xyz;
    r8.xy = r0.yy * ViewProjectionMatrix[1].zw + r12.zw;
    r8.zw = r0.zz * ViewProjectionMatrix[0].zw + r8.xy;
    r6.xyz = r10.yyy * WorldToLocal[1].xyz + r6.xyz;
    r0.xyz = r14.yyy * WorldToLocal[1].xyz + r15.xyz;
    r0.xyz = r14.zzz * WorldToLocal[0].xzy + r0.xzy;
    r6.xyz = r10.zzz * WorldToLocal[0].xzy + r6.xzy;
    r10.x = dot(r1.xzy, r6.yxz);
    r10.y = dot(r5.zyw, r6.yxz);
    r10.z = dot(r13.zyx, r6.yxz);
    r5.x = dot(r1.xzy, r0.yxz);
    r5.y = dot(r5.zyw, r0.yxz);
    r5.z = dot(r13.zyx, r0.yxz);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r11.wwww * LocalToWorld[3].xwzy;
    r0 = r11.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r11.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r12.w = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r8.y = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r1.yzw = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r6.xyz = -r1.zwy + r11.xyz;
    r1.x = ps;
    ps = r6.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r1.x * ps;
    r0.xz = saturate(r6.xy * r0.xz);
    r6.z = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r10.w = r6.z * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r6.xy = -r1.zw + Demolition_Center.xy;
    ps = -r6.y * -r6.y;
    r12.zw = -r6.xy + BBox_Size.xy;
    r13.x = ps;
    r13.yz = r0.zx * BBox_Size.yx - r6.yx;
    r5.w = dot(r13.zy, r13.zy) + 0.0;
    ps = -r6.x * -r6.x;
    r13.zw = r12.zw * r12.zw;
    r13.y = ps;
    ps = 1.0 / r0.y;
    r13 = r13.zyyz + r13.wxwx;
    r6.x = ps;
    ps = sqrt(abs(r13.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r6.y = ps;
    ps = sqrt(abs(r13.w));
    r4.w = r0.y * SP_DemolitionSpread.x;
    r0.w = ps;
    ps = sqrt(abs(r13.z));
    r6.y = max(r6.y, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r13.x));
    r6.y = max(r6.y, r0.w);
    r0.w = ps;
    ps = sqrt(abs(r5.w));
    r0.w = max(r6.y, r0.w);
    r5.w = ps;
    ps = 1.0 / r0.w;
    r5.w = r6.x * r5.w;
    r0.w = ps;
    r0.w = -r5.w * r0.w + r0.y;
    ps = 1.0 / r0.y;
    r0.w = max(r0.w, 0.0);
    r0.y = ps;
    r0.w = saturate(r0.w * r0.y);
    r0.y = -r0.w * 2.0 + 3.0;
    r0.w = r0.w * r0.w;
    r0.w = r4.w * r0.w;
    r12.w = saturate(r0.w * r0.y);
    ps = Demolition_Center.z - r1.y;
    r0.w = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r8.x = float((SP_Demolition_Style.x > 0.5));
    r1.y = ps;
    ps = 1.0;
    r12.z = saturate(floor(r0.w));
    r1.w = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.x = saturate(r0.y * r1.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r1.x;
            r1.y = r13.x * r0.y;
            r1.z = ps;
            r0.w = r1.y + r1.z;
            ps = BBox_Size.z * r1.y;
            r0.y = float((r6.z >= r1.y));
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
            r0.w = r10.w;
            r6.y = ps;
        }
    }
    r4.w = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r1.w;
    r5.w = float((Collapse_Endcaps.x > 0.5));
    r7.x = ps;
    ps = r12.w;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r1.w * ps;
    r0.y = r5.w * r0.y;
    r5.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xw = r1.yw + r1.zw;
    // UNHANDLED control flow: cjmp
    r1.w = float((r6.z > r6.x));
    r6.w = saturate(r6.w * r12.w);
    ps = sqrt(abs(r6.z));
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
        r11.y = r0.x + r11.y;
        ps = 3.3333333 * r0.z;
        r0.y = r0.y + r11.z;
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
        r11.y = r0.x + r11.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r0.y + r11.z;
        r4.w = ps;
    }
    p0 = (r6.x == 1.0);
    ps = p0 ? 0.0 : ((r6.x == 0.0) ? 1.0 : r6.x);
    r6.x = ps;
    if (p0)
    {
        ps = r11.z;
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
        r11.x = r6.x + r11.x;
        ps = 3.3333333 * r0.x;
        r0.y = r6.w + r11.z;
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
        r11.x = r6.x + r11.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r0.y = r6.w + r11.z;
        r4.w = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r11.z;
        r0.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r11.z;
    r0.y = ps;
    r1.w = float((r11.z >= r0.w));
    r6.x = -r7.x * r12.w + r0.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xz = -r0.yw + r6.yy;
    r12.w = ps;
    p0 = (r8.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r13.yz = float2((r0.wy >= r6.xy));
    r0.xz = r6.zz * r10.ww + r0.xz;
    r0.xz = r0.xz * SP_DemolitionSpread.xx + r0.yw;
    r0.x = (r13.z == 0.0) ? r0.y : r0.x;
    r0.x = (r1.w == 0.0) ? r0.x : r0.z;
    r0.y = (r13.y == 0.0) ? r6.x : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r13.x + r1.z;
            ps = r1.z + r1.z;
            r13.y = r1.x * r0.y;
            r0.w = ps;
            ps = r13.y;
            r13.zw = r13.xy - r1.yy;
            r6.x = ps;
            ps = r1.y;
            r0.x = r13.z + r1.z;
            r6.y = ps;
            ps = max(r6.x, r6.y);
            r1.y = float((r13.w > r0.x));
            r0.x = ps;
            r0.x = (r1.y == 0.0) ? r0.x : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r0.w;
            r0.z = r13.y - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r12.w = r0.x * SP_DemolitionSpread.x;
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
    r6.yw = -r12.zw + 1.0;
    r8.y = ps;
    ps = min(r8.x, r8.y);
    r1.w = r5.w * r6.y;
    r6.x = ps;
    r1.zw = r1.zw * r6.xw;
    ps = 25.0 * r0.x;
    r5.w = frac(r1.z);
    r0.w = ps;
    ps = r1.w;
    r0.x = r5.w - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r12.w + ps;
    r0.x = r0.w * r0.x;
    r0.w = ps;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r1.x;
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
    r0.y = r0.y * r0.w;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r0.y * r4.w;
    if (p0)
    {
        r11.x = r0.y + r11.x;
    }
    if (!p0)
    {
        r11.y = r0.y + r11.y;
    }
    r1 = r11.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r1;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r11.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r0.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r0;
    o0.xy = r12.xy;
    o3.zw = r8.zw;
    o3.xy = 1.0;
    o7.xyz = r7.yzw;
    o7.w = 0.0;
    o2.xyz = r5.xyz;
    o2.w = 0.0;
    o4.xyz = r10.xyz;
    o4.w = 0.0;
    o5.xyz = r4.xyz;
    o5.w = 0.0;
    o6 = r3;
    o8 = r2.xzyw;
    o1 = r9;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    Out.color2 = o8;
    return Out;
}
