// vs_ed469f5493366730.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 1056 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000080 00001080 0061000D 00000000 00000000 000068E7 00000001 00000008 00000007 00000290 0010002A 0000602B 0000702C 0000302D 0001A02E 0000502F 00015030 00201031 0000F050 00017154 0002F255 00037356 0004F457 0005F5A0 0006F6A2 0000115C 00001158 0000115D 00001159 0000115E 0000115A 0000115B
//   vertex element: instruction 42 -> POSITION0
//   vertex element: instruction 43 -> TANGENT0
//   vertex element: instruction 44 -> BINORMAL0
//   vertex element: instruction 45 -> NORMAL0
//   vertex element: instruction 46 -> COLOR1
//   vertex element: instruction 47 -> TEXCOORD0
//   vertex element: instruction 48 -> TEXCOORD1
//   vertex element: instruction 49 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
float4 LightPositionAndInvRadius : register(c19); // float4
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
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    r3.yzw = In.tangent0.zyx;
    r6.xyz = In.binormal0.xzy;
    r8.xyz = In.normal0.yxz;
    r13 = In.color1;
    r7.xy = In.texcoord0.xy;
    r7.zw = In.texcoord1.yx;
    r8.w = In.blendweight0.x;
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r1 = float4((-abs(r0.xxxx) > 0.0));
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].zyxw + r0.yzxw;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r2.x = float((abs(r0.x) >= 0.0));
    r1.x = ps;
    ps = 1.0 / BBox_Size.y;
    r5.y = BBox_Size.z * 0.0026041667;
    r1.y = ps;
    r0.yzw = -BBox_Size.zxy * 0.5 + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r2.yzw = -r0.zwy + r10.xyz;
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
    r9.x = saturate(floor(r0.z));
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
        r4.xw = r2.xx * float2(-1e+03, 8e+02) + r10.zy;
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
        r4.xw = r2.xx * float2(-1e+03, -8e+02) + r10.zy;
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
        r4.xz = r2.xx * float2(-1e+03, 8e+02) + r10.zx;
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
        r4.xz = r2.xx * float2(-1e+03, -8e+02) + r10.zx;
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
    r6.w = float((r10.z >= r4.y));
    r2.x = -r0.z * r1.w + r4.x;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.yz = -r4.xy + r2.zz;
    r9.y = ps;
    p0 = (r5.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.zw = float2((r4.yx >= r2.xz));
    r0.yz = r1.yy * r5.zz + r0.yz;
    r0.yz = r0.yz * SP_DemolitionSpread.xx + r4.xy;
    r0.y = (r9.w == 0.0) ? r4.x : r0.y;
    r0.y = (r6.w == 0.0) ? r0.y : r0.z;
    r2.x = (r9.z == 0.0) ? r2.x : r0.y;
    if (p0)
    {
        if (p0)
        {
            r0.z = r5.w + r2.w;
            ps = r2.w + r2.w;
            r5.x = r0.x * r2.x;
            r1.w = ps;
            ps = r5.x;
            r9.yz = r5.wx - r2.yy;
            r4.x = ps;
            ps = r2.y;
            r0.y = r9.y + r2.w;
            r4.y = ps;
            ps = max(r4.x, r4.y);
            r2.y = float((r9.z > r0.y));
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
            r9.y = ps;
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
    r5.yz = -r9.xy + 1.0;
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
    ps = r9.y + ps;
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
    r2 = r10.wwww * LocalToWorld[3].xzyw;
    r0 = r0.xxxx * LocalToWorld[2].xzyw + r2;
    r0 = r4.wwww * LocalToWorld[1].xzyw + r0;
    r0 = r4.zzzz * LocalToWorld[0].zyxw + r0.yzxw;
    r4 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r2.xyz = r8.xyz * 0.007843138 - 1.0;
    r5.xyz = r6.xyz * 0.007843138 - 1.0;
    r6.xyz = r3.yzw * 0.007843138 - 1.0;
    r3 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r4;
    r4.xyw = -r0.xyz * CameraPosition.www + CameraPosition.zyx;
    r12.xyz = -r0.zyx + LightPositionAndInvRadius.xyz;
    r8.xyz = r12.zzz * WorldToLocal[2].xzy;
    r9.xyz = r4.xxx * WorldToLocal[2].xyz;
    r3 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r0.zzzz * ViewProjectionMatrix[0] + r3.xzyw;
    r4.xyz = r4.yyy * WorldToLocal[1].xyz + r9.xyz;
    r0.xyz = r12.yyy * WorldToLocal[1].xzy + r8.xyz;
    r0.xyz = r12.xxx * WorldToLocal[0].xyz + r0.xzy;
    r8.xyz = r4.www * WorldToLocal[0].xzy + r4.xzy;
    r4.y = dot(r6.xzy, r8.yxz);
    r4.z = dot(r5.yxz, r8.yxz);
    r4.w = dot(r2.zyx, r8.yxz);
    r9.x = dot(r6.xzy, r0.zxy);
    r9.y = dot(r5.yxz, r0.zxy);
    r9.z = dot(r2.zyx, r0.zxy);
    p0 = (-SP_DemolitionSpread.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    // UNHANDLED control flow: cjmp
    r0 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r10.zzzz * LocalToWorld[2].xwzy + r0;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    // UNHANDLED control flow: cjmp
    ps = 1.0 / BBox_Size.x;
    r8.y = float((abs(r0.x) >= 0.0));
    r0.x = ps;
    ps = 1.0 / BBox_Size.y;
    r6.w = BBox_Size.z * 0.0026041667;
    r0.z = ps;
    r2.xyz = BBox_Size.zxy * (-0.5) + BBox_Center.zxy;
    ps = 1.0 / BBox_Size.z;
    r5.xyz = -r2.yzx + r10.xyz;
    r0.w = ps;
    ps = r5.z;
    r0.y = float((2.0 > SP_Demolition_Style.x));
    ps = r0.w * ps;
    r0.xz = saturate(r5.xy * r0.xz);
    r6.x = saturate(ps);
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r8.z = r6.x * 384.0;
    // UNHANDLED control flow: cjmp
    r0.y = max(CylDemMask_Shallowness.x, 1.0);
    r5.xy = -r2.zy + Demolition_Center.yx;
    ps = -r5.x * -r5.x;
    r5.zw = -r5.yx + BBox_Size.xy;
    r11.x = ps;
    r6.yz = r0.zx * BBox_Size.yx - r5.xy;
    r5.x = dot(r6.zy, r6.zy) + 0.0;
    ps = -r5.y * -r5.y;
    r11.zw = r5.zw * r5.zw;
    r11.y = ps;
    ps = 1.0 / r0.y;
    r11 = r11.zyyz + r11.wxwx;
    r5.y = ps;
    ps = sqrt(abs(r11.y));
    r0.y = SP_DemolitionSpread.x + SP_DemolitionSpread.x;
    r5.z = ps;
    ps = sqrt(abs(r11.w));
    r4.x = r0.y * SP_DemolitionSpread.x;
    r2.w = ps;
    ps = sqrt(abs(r11.z));
    r5.z = max(r5.z, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r11.x));
    r5.z = max(r5.z, r2.w);
    r2.w = ps;
    ps = sqrt(abs(r5.x));
    r2.w = max(r5.z, r2.w);
    r5.x = ps;
    ps = 1.0 / r2.w;
    r5.x = r5.y * r5.x;
    r2.w = ps;
    r2.w = -r5.x * r2.w + r0.y;
    ps = 1.0 / r0.y;
    r2.w = max(r2.w, 0.0);
    r0.y = ps;
    r2.w = saturate(r2.w * r0.y);
    r0.y = -r2.w * 2.0 + 3.0;
    r2.w = r2.w * r2.w;
    r2.w = r4.x * r2.w;
    r8.y = saturate(r2.w * r0.y);
    ps = Demolition_Center.z - r2.x;
    r2.y = SP_Demolition_Style.x + 0.5;
    r0.y = ps;
    ps = 0.0;
    r6.z = float((SP_Demolition_Style.x > 0.5));
    r2.x = ps;
    ps = 1.0;
    r8.x = saturate(floor(r2.y));
    r2.y = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.x = saturate(r0.y * r0.w);
    if (p0)
    {
        if (p0)
        {
            r0.y = -SP_DemolitionSpread.x + 1.0;
            ps = 384.0 * r0.w;
            r2.x = r11.x * r0.y;
            r2.z = ps;
            r2.y = r2.x + r2.z;
            ps = BBox_Size.z * r2.x;
            r0.y = float((r6.x >= r2.x));
            r2.w = ps;
            ps = SP_DemolitionSpread.x * r0.y;
            r5.w = r2.y * BBox_Size.z;
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
            r5.w = r8.z;
            r2.w = ps;
        }
    }
    r4.x = float((abs(r0.x) >= 0.0));
    ps = BBox_Size.z * r2.y;
    r5.x = float((Collapse_Endcaps.x > 0.5));
    r6.y = ps;
    ps = r8.y;
    r0.y = float((1.0 > SP_Demolition_Style.x));
    ps = r2.y * ps;
    r0.y = r5.x * r0.y;
    r5.x = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yz = r2.xy + r2.zy;
    // UNHANDLED control flow: cjmp
    r2.y = float((r6.x > r5.y));
    r5.z = saturate(r5.z * r8.y);
    ps = sqrt(abs(r6.x));
    r0.y = float((Collapse_Endcaps.x >= 2.0));
    r5.y = ps;
    p0 = (r0.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.y = r5.z * r5.y;
    // UNHANDLED control flow: cjmp
    r0.y = BBox_Size.y - 2.5e+03;
    r0.x = float((0.3 >= r0.z));
    ps = 0.00013333333 * r0.y;
    r5.z = r2.y * r0.x;
    r0.x = saturate(ps);
    r0.x = r5.y * r0.x;
    p0 = (0.0 == 0.0 && r5.z != 0.0);
    r0.y = (0.0 == 0.0 && r5.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r5.yz = r0.xx * float2(8e+02, -1e+03);
        r10.y = r5.y + r10.y;
        ps = 3.3333333 * r0.z;
        r5.y = r5.z + r10.z;
        r4.x = ps;
    }
    p0 = (r0.y == 1.0);
    ps = p0 ? 0.0 : ((r0.y == 0.0) ? 1.0 : r0.y);
    r0.y = ps;
    if (p0)
    {
        r5.y = float((r0.z > 0.7));
        r2.y = r5.y * r2.y;
    }
    p0 = (r0.y == 0.0 && r2.y != 0.0);
    r0.y = (r0.y == 0.0 && r2.y != 0.0) ? 0.0 : r0.y + 1.0;
    if (p0)
    {
        r5.yz = r0.xx * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.z;
        r10.y = r5.y + r10.y;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r5.y = r5.z + r10.z;
        r4.x = ps;
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
    r0.z = r2.y * r0.z;
    r0.y = saturate(ps);
    r0.y = r5.y * r0.y;
    p0 = (0.0 == 0.0 && r0.z != 0.0);
    r0.z = (0.0 == 0.0 && r0.z != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r5.yz = r0.yy * float2(8e+02, -1e+03);
        r10.x = r5.y + r10.x;
        ps = 3.3333333 * r0.x;
        r5.y = r5.z + r10.z;
        r4.x = ps;
    }
    p0 = (r0.z == 1.0);
    ps = p0 ? 0.0 : ((r0.z == 0.0) ? 1.0 : r0.z);
    r0.z = ps;
    if (p0)
    {
        r5.y = float((r0.x > 0.7));
        r2.y = r5.y * r2.y;
    }
    p0 = (r0.z == 0.0 && r2.y != 0.0);
    r0.z = (r0.z == 0.0 && r2.y != 0.0) ? 0.0 : r0.z + 1.0;
    if (p0)
    {
        r5.yz = r0.yy * float2(-8e+02, -1e+03);
        ps = 1.0 - r0.x;
        r10.x = r5.y + r10.x;
        r0.x = ps;
        ps = 3.3333333 * r0.x;
        r5.y = r5.z + r10.z;
        r4.x = ps;
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
    r0.z = float((r10.z >= r5.w));
    r2.y = -r6.y * r8.y + r5.y;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.xy = -r5.yw + r2.ww;
    r8.y = ps;
    p0 = (r6.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r11.yz = float2((r5.wy >= r2.yw));
    r0.xy = r6.xx * r8.zz + r0.xy;
    r0.xy = r0.xy * SP_DemolitionSpread.xx + r5.yw;
    r0.x = (r11.z == 0.0) ? r5.y : r0.x;
    r0.x = (r0.z == 0.0) ? r0.x : r0.y;
    r0.y = (r11.y == 0.0) ? r2.y : r0.x;
    if (p0)
    {
        if (p0)
        {
            r0.z = r11.x + r2.z;
            ps = r2.z + r2.z;
            r11.y = r0.w * r0.y;
            r2.y = ps;
            ps = r11.y;
            r6.yz = r11.xy - r2.xx;
            r5.y = ps;
            ps = r2.x;
            r0.x = r6.y + r2.z;
            r5.z = ps;
            ps = max(r5.y, r5.z);
            r2.x = float((r6.z > r0.x));
            r0.x = ps;
            r0.x = (r2.x == 0.0) ? r0.x : r0.z;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = 1.0 / r2.y;
            r0.z = r11.y - r0.x;
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
    r5.y = ps;
    ps = r6.w;
    r0.x = float((SP_DemolitionSpread.x >= 0.25));
    r6.y = ps;
    ps = 1e+01;
    r2.zw = -r8.xy + 1.0;
    r6.z = ps;
    ps = min(r6.y, r6.z);
    r5.z = r5.x * r2.z;
    r2.x = ps;
    r2.xz = r5.yz * r2.xw;
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
    r0.y = r6.x * 6.2831;
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
        r10.x = r0.y + r10.x;
    }
    if (!p0)
    {
        r10.y = r0.y + r10.y;
    }
    r2 = r10.wwww * LocalToWorld[3].xwzy;
    r0 = r0.xxxx * LocalToWorld[2].xwzy + r2;
    r0 = r10.yyyy * LocalToWorld[1].xzyw + r0.xzwy;
    r0 = r10.xxxx * LocalToWorld[0].xywz + r0.xzwy;
    r2 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
    r2 = r0.wwww * ViewProjectionMatrix[2].xwzy + r2;
    r2 = r0.yyyy * ViewProjectionMatrix[1].xzyw + r2.xzwy;
    r0 = r0.xxxx * ViewProjectionMatrix[0] + r2.xzyw;
    oPos = r0;
    r8.xyz = r12.xyz * LightPositionAndInvRadius.www;
    o1.xyz = r9.xyz;
    o3.xyz = r4.yzw;
    o5 = r13;
    o6 = r1.xzyw;
    o0 = r7;
    o2 = r8;
    o4 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord4 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color2 = o6;
    return Out;
}
