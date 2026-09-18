// vs_e7adc88f394edfa3.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1056 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00001080 0071000C 00000000 00000000 00007108 00000001 00000008 00000008 00000290 0010002A 0000602B 0000702C 0000302D 0001A02E 0000502F 00015030 0020A031 00003050 0001F151 00027254 0003F355 00047456 0005F557 0006F6A0 0007F7A2 00001158 0000115D 00001159 00001157 0000115A 0000115E 0000115B 0000115C
//   vertex element: instruction 42 -> POSITION0
//   vertex element: instruction 43 -> TANGENT0
//   vertex element: instruction 44 -> BINORMAL0
//   vertex element: instruction 45 -> NORMAL0
//   vertex element: instruction 46 -> COLOR1
//   vertex element: instruction 47 -> TEXCOORD0
//   vertex element: instruction 48 -> TEXCOORD1
//   vertex element: instruction 49 -> COLOR0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 43
// NOTE: unhandled control flow cjmp at cf 46
// NOTE: unhandled control flow cjmp at cf 55
// NOTE: unhandled control flow cjmp at cf 57
// NOTE: unhandled control flow cjmp at cf 61
// NOTE: unhandled control flow cjmp at cf 65
// NOTE: unhandled control flow cjmp at cf 73

#include "xenos_common.hlsli"

float4 BBox_Center : register(c8); // float3
float4 BBox_Size : register(c7); // float3
float4 CameraPosition : register(c4); // float4
float4 Collapse_Endcaps : register(c11); // float
float4 CylDemMask_Shallowness : register(c10); // float
float4 Demolition_Center : register(c9); // float3
float4 LightDirection : register(c20); // float3
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
    float4 color1 : COLOR1;
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
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r11 = In.position0;
    r3.yzw = In.tangent0.zyx;
    r6.xyz = In.binormal0.xzy;
    r8.xyz = In.normal0.yxz;
    r7 = In.color1;
    r9.xy = In.texcoord0.xy;
    r9.zw = In.texcoord1.yx;
    r10.zw = In.color0.xy;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r11.wwww * LocalToWorld[3].xwzy;
    r10.xy = r10.zw * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r0 = r11.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r2 = r11.xxxx * LocalToWorld[0] + r0.xzyw;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r1.x = ps;
    ps = 1.0 / BBox_Size.y;
    r5.y = BBox_Size.z * 0.0026041667;
    r1.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r2.yzw = -r0.zwy + r11.xyz;
    r0.x = ps;
    ps = r2.w;
    r1.w = float((2.0 > SP_Demolition_Style.x));
    ps = r0.x * ps;
    r1.xz = saturate(r2.yz * r1.xy);
    r1.y = saturate(ps);
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.z = r1.y * 384.0;
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
    r3.x = ps;
    ps = sqrt(abs(r4.y));
    r2.y = r2.x * SP_DemolitionSpread.x;
    r1.w = ps;
    ps = sqrt(abs(r4.z));
    r3.x = max(r1.w, r3.x);
    r1.w = ps;
    ps = sqrt(abs(r4.x));
    r1.w = max(r3.x, r1.w);
    r3.x = ps;
    ps = sqrt(abs(r2.w));
    r1.w = max(r1.w, r3.x);
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
    r5.x = float((SP_Demolition_Style.x > 0.5));
    r1.w = ps;
    ps = Demolition_Center.z - r0.y;
    r10.x = saturate(floor(r0.z));
    r0.y = ps;
    p0 = (r5.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.w = saturate(r0.y * r0.x);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.x;
            r2.y = r5.w * r0.y;
            r2.w = ps;
            r0.z = r2.y + r2.w;
            ps = BBox_Size.z * r2.y;
            r0.y = float((r1.y >= r2.y));
            r2.z = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r4.y = r0.z * BBox_Size.z;
            r1.w = ps;
        }
    }
    if (!p0)
    {
        ps = r5.z;
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r4.y = ps;
    }
    ps = (abs(r0.x) >= 0.0) ? 1.0 : 0.0;
    r3.x = ps;
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
    r4.xz = r2.yx + r2.wx;
    // UNHANDLED control flow: cjmp
    r2.x = saturate(r4.z * r1.w);
    r4.x = float((r1.y > r4.x));
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
    r4.z = r4.x * r4.z;
    r0.y = saturate(ps);
    r2.x = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r4.z != 0.0);
    r4.z = (0.0 == 0.0 && r4.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r1.z;
        r3.x = ps;
        r4.xw = r2.xx * float2(-1e+03, 8e+02) + r11.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r0.y = float((r1.z > 0.7));
        r0.y = r0.y * r4.x;
    }
    p0 = (r4.z == 0.0 && r0.y != 0.0);
    r4.z = (r4.z == 0.0 && r0.y != 0.0) ? 0.0 : r4.z + 1.0;
    if (p0)
    {
        ps = 1.0 - r1.z;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r3.x = ps;
        r4.xw = r2.xx * float2(-1e+03, -8e+02) + r11.zy;
    }
    p0 = (r4.z == 1.0);
    ps = p0 ? 0.0 : ((r4.z == 0.0) ? 1.0 : r4.z);
    r4.z = ps;
    if (p0)
    {
        r4.xw = r11.zy;
    }
    ps = r11.x;
    r4.z = ps;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r4.z = float((0.3 >= r1.x));
    ps = 0.00013333333 * r0.y;
    r4.z = r4.x * r4.z;
    r0.y = saturate(ps);
    r2.x = r2.x * r0.y;
    p0 = (0.0 == 0.0 && r4.z != 0.0);
    r4.w = (0.0 == 0.0 && r4.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        ps = 3.3333333 * r1.x;
        r3.x = ps;
        r4.xz = r2.xx * float2(-1e+03, 8e+02) + r11.zx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r0.y = float((r1.x > 0.7));
        r0.y = r0.y * r4.x;
    }
    p0 = (r4.w == 0.0 && r0.y != 0.0);
    r4.w = (r4.w == 0.0 && r0.y != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        ps = 1.0 - r1.x;
        r0.y = ps;
        ps = 3.3333333 * r0.y;
        r3.x = ps;
        r4.xz = r2.xx * float2(-1e+03, -8e+02) + r11.zx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r4.xz = r11.zx;
    }
    ps = r11.y;
    r4.w = ps;
    // UNHANDLED control flow: cjmp
    r4.xzw = r11.zxy;
    r6.w = float((r11.z >= r4.y));
    r2.x = -r0.z * r1.w + r4.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r4.xy + r2.zz;
    r10.y = ps;
    p0 = (r5.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.xy = float2((r4.yx >= r2.xz));
    r0.yz = r1.yy * r5.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r4.xy;
    r0.y = (r12.y == 0.0) ? r4.x : r0.y;
    r0.y = (r6.w == 0.0) ? r0.y : r0.z;
    r2.x = (r12.x == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r5.w + r2.w;
            ps = r2.w + r2.w;
            r5.x = r0.x * r2.x;
            r1.w = ps;
            ps = r5.x;
            r12.xy = r5.wx - r2.yy;
            r4.x = ps;
            ps = r2.y;
            r0.y = r12.x + r2.w;
            r4.y = ps;
            ps = max(r4.x, r4.y);
            r2.y = float((r12.y > r0.y));
            r0.y = ps;
            r0.y = (r2.y == 0.0) ? r0.y : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r1.w;
            r0.y = r5.x - r0.y;
            r0.z = ps;
            r0.y = r0.y * r0.z;
            r0.y = saturate(-abs(r0.y) + 1.0);
            ps = r0.y * r0.y;
            r0.y = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r10.y = ps;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r2.y = float((0.5 > SP_Demolition_Style.x));
    r2.z = ps;
    ps = r5.y;
    r0.y = float((SP_DemolitionSpread.x >= 0.25));
    r4.x = ps;
    ps = 1e+01;
    r5.yz = -r10.xy + 1.0;
    r4.y = ps;
    ps = min(r4.x, r4.y);
    r2.w = r0.w * r5.y;
    r5.x = ps;
    r2.zw = r2.zw * r5.xz;
    ps = 25.0 * r0.y;
    r0.w = frac(r2.z);
    r0.y = ps;
    ps = r2.w;
    r0.w = r0.w - 0.5;
    r0.w = -abs(r0.w) * 2.0 + 1.0;
    ps = r10.y + ps;
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
    r0.y = r0.y * r3.x;
    if (p0)
    {
        r4.z = r0.y + r4.z;
    }
    if (!p0)
    {
        r4.w = r0.y + r4.w;
    }
    r2 = r11.wwww * LocalToWorld[3].xzyw;
    r10.xy = r10.zw * ShadowCoordinateScaleBias.xy + ShadowCoordinateScaleBias.wz;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r2;
    r0 = r4.wwww * LocalToWorld[1].xzyw + r0;
    r2 = r4.zzzz * LocalToWorld[0] + r0.xzyw;
    r0.xyz = WorldToLocal[2].xzy * LightDirection.zzz;
    r12 = r2.wwww * ViewProjectionMatrix[3].xwzy;
    r4.xyz = r8.xyz * 0.007843138 - 1.0;
    r5.yzw = r6.xyz * 0.007843138 - 1.0;
    r6.xyz = r3.yzw * 0.007843138 - 1.0;
    r3 = r2.zzzz * ViewProjectionMatrix[2].xwzy + r12;
    r8.xyz = WorldToLocal[1].xzy * LightDirection.yyy + r0.xyz;
    r0.xyw = -r2.yxz * CameraPosition.www + CameraPosition.yxz;
    r12.xyz = WorldToLocal[0].xyz * LightDirection.xxx + r8.xzy;
    r3 = r2.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r2.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    ps = WorldToLocal[2].x * r0.w;
    r8.y = dot(r6.xzy, r12.zxy);
    r2.x = ps;
    ps = WorldToLocal[2].z * r0.w;
    r8.z = dot(r5.zyw, r12.zxy);
    r2.y = ps;
    ps = WorldToLocal[2].y * r0.w;
    r8.w = dot(r4.zyx, r12.zxy);
    r2.z = ps;
    r2.xyz = r0.xxx * WorldToLocal[1].xzy + r2.xyz;
    r0.xyz = r0.yyy * WorldToLocal[0].xyz + r2.xzy;
    r5.x = dot(r6.xzy, r0.zxy);
    r5.y = dot(r5.zyw, r0.zxy);
    r5.z = dot(r4.zyx, r0.zxy);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r11.wwww * LocalToWorld[3].xwzy;
    r0 = r11.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r11.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r10.w = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r8.x = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r2.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r4.xyz = -r2.yzx + r11.xyz;
    r0.w = ps;
    ps = r4.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r4.xy * r0.xz);
    r5.w = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.x = r5.w * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r4.xy = -r2.yz + Demolition_Center.xy;
    ps = -r4.y * -r4.y;
    r4.zw = -r4.xy + BBox_Size.xy;
    r6.x = ps;
    r6.yz = r0.zx * BBox_Size.yx - r4.yx;
    r4.y = dot(r6.zy, r6.zy) + 0.0;
    ps = -r4.x * -r4.x;
    r6.zw = r4.zw * r4.zw;
    r6.y = ps;
    ps = 1.0 / r0.y;
    r6 = r6.zyyz + r6.wxwx;
    r4.z = ps;
    ps = sqrt(abs(r6.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r4.w = ps;
    ps = sqrt(abs(r6.w));
    r4.x = r0.y * SP_DemolitionSpread.x;
    r2.w = ps;
    ps = sqrt(abs(r6.z));
    r4.w = max(r4.w, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r6.x));
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
    r10.w = saturate(r2.w * r0.y);
    ps = Demolition_Center.z - r2.x;
    r2.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r6.w = float((SP_Demolition_Style.x > 0.5));
    r2.x = ps;
    ps = 1.0;
    r10.z = saturate(floor(r2.y));
    r2.y = ps;
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r12.y = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r2.x = r12.y * r0.y;
            r2.z = ps;
            r2.y = r2.x + r2.z;
            ps = BBox_Size.z * r2.x;
            r0.y = float((r5.w >= r2.x));
            r2.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r4.z = r2.y * BBox_Size.z;
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
            r4.z = r12.x;
            r2.w = ps;
        }
    }
    r4.x = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r2.y;
    r4.y = float((Collapse_Endcaps.x > 0.5));
    r6.z = ps;
    ps = r10.w;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r2.y * ps;
    r0.y = r4.y * r0.y;
    r4.w = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xy = r2.xy + r2.zy;
    // UNHANDLED control flow: cjmp
    r2.y = float((r5.w > r6.x));
    r6.x = saturate(r6.y * r10.w);
    ps = sqrt(abs(r5.w));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r4.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.y = r6.x * r4.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r6.x = r2.y * r0.x;
    r0.x = saturate(ps);
    r0.x = r4.y * r0.x;
    p0 = (0.0 == 0.0 && r6.x != 0.0);
    r0.y = (0.0 == 0.0 && r6.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xy = r0.xx * float2(8e+02, -1e+03);
        r11.y = r4.x + r11.y;
        ps = 3.3333333 * r0.z;
        r4.y = r4.y + r11.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r4.y = float((r0.z > 0.7));
        r2.y = r4.y * r2.y;
    }
    p0 = (r0.y == 0.0 && r2.y != 0.0);
    r0.y = (r0.y == 0.0 && r2.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r4.xy = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r11.y = r4.x + r11.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r11.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        ps = r11.z;
        r4.y = ps;
    }
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.x - 2.5e+03;
    r0.z = float((0.3 >= r0.x));
    ps = 0.00013333333 * r0.y;
    r0.z = r2.y * r0.z;
    r0.y = saturate(ps);
    r0.y = r4.y * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r4.xy = r0.yy * float2(8e+02, -1e+03);
        r11.x = r4.x + r11.x;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r11.z;
        r4.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r4.y = float((r0.x > 0.7));
        r2.y = r4.y * r2.y;
    }
    p0 = (r0.z == 0.0 && r2.y != 0.0);
    r0.z = (r0.z == 0.0 && r2.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r4.xy = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r11.x = r4.x + r11.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r4.y = r4.y + r11.z;
        r4.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        ps = r11.z;
        r4.y = ps;
    }
    // UNHANDLED control flow: cjmp
    ps = r11.z;
    r4.y = ps;
    r0.z = float((r11.z >= r4.z));
    r2.y = -r6.z * r10.w + r4.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r4.yz + r2.ww;
    r10.w = ps;
    p0 = (r6.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xy = float2((r4.zy >= r2.yw));
    r0.xy = r5.ww * r12.xx + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r4.yz;
    r0.x = (r6.y == 0.0) ? r4.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r6.x == 0.0) ? r2.y : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r12.y + r2.z;
            ps = r2.z + r2.z;
            r12.x = r0.w * r0.y;
            r2.y = ps;
            ps = r12.x;
            r6.xy = r12.yx - r2.xx;
            r4.y = ps;
            ps = r2.x;
            r0.x = r6.x + r2.z;
            r4.z = ps;
            ps = max(r4.y, r4.z);
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
            r0.z = r12.x - r0.x;
            r0.x = ps;
            r0.x = r0.z * r0.x;
            r0.x = saturate(-abs(r0.x) + 1.0);
            r0.x = r0.x * r0.x;
            r10.w = r0.x * SP_DemolitionSpread.x;
        }
    }
    r0.z = BBox_Size.z * 0.0008680556;
    ps = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r2.y = float((0.5 > SP_Demolition_Style.x));
    r4.y = ps;
    ps = r8.x;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r6.x = ps;
    ps = 1e+01;
    r2.zw = -r10.zw + 1.0;
    r6.y = ps;
    ps = min(r6.x, r6.y);
    r4.z = r4.w * r2.z;
    r2.x = ps;
    r2.xz = r4.yz * r2.xw;
    ps = 25.0 * r0.x;
    r2.w = frac(r2.x);
    r2.x = ps;
    ps = r2.z;
    r0.x = r2.w - 0.5;
    r0.x = -abs(r0.x) * 2.0 + 1.0;
    ps = r10.w + ps;
    r0.x = r2.x * r0.x;
    r2.x = ps;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r0.x * r0.w;
    r0.x = -r0.x * r0.y + r0.y;
    // UNHANDLED control flow: cjmp
    r0.y = r5.w * 6.2831;
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
        r11.x = r0.y + r11.x;
    }
    if (!p0)
    {
        r11.y = r0.y + r11.y;
    }
    r2 = r11.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r2;
    r0 = r11.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r11.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r2 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r0.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r10.xy;
    o2.xyz = r8.yzw;
    o4.xyz = r5.xyz;
    o6 = r7;
    o7 = r1.xzyw;
    o1 = r9;
    o5 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord5 = o3;
    Out.texcoord6 = o4;
    Out.texcoord7 = o5;
    Out.color0 = o6;
    Out.color2 = o7;
    return Out;
}
