// vs_8ca92b4855871efc.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002A0 00310009 00000000 00000000 00004084 00000001 00000004 00000004 00000290 00100006 00006007 00007008 00303009 0000F056 0001F1A0 0002F2A1 0003F3A2 00001034 00001036 00001035 00001033
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 PrevViewProjectionMatrix[4] : register(c13); // float4x4 (matrix_columns)
float4 PreviousLocalToWorld[4] : register(c9); // float4x4 (matrix_columns)
float4 StretchTimeScale : register(c17); // float4 // default: 1.0, 0.0, 0.0, 0.0
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 tangent0 : TANGENT0;
    float4 binormal0 : BINORMAL0;
    float4 normal0 : NORMAL0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r6 = In.position0.yzwx;
    r5.xyz = In.tangent0.xyz;
    r1.xyz = In.binormal0.xyz;
    r0.xyz = In.normal0.xyz;
    r4.y = -r5.y * 0.007843138 + 1.0;
    r4.xz = r5.xz * 0.007843138 - 1.0;
    r9.xyz = r1.zxy * 0.007843138 - 1.0;
    r2 = r6.zzzz * PreviousLocalToWorld[3];
    r1 = r6.zzzz * LocalToWorld[3].xwzy;
    r7.xyw = r0.yzx * 0.007843138 - 1.0;
    r8.xyz = r7.yyy * LocalToWorld[2].xzy;
    r1 = r6.yyyy * LocalToWorld[2].xwzy + r1;
    r2 = r6.yyyy * PreviousLocalToWorld[2] + r2;
    r3.xyz = r9.xxz * r7.xww;
    r3.xyz = r9.zyy * r7.yyx - r3.xyz;
    r2 = r6.xxxx * PreviousLocalToWorld[1] + r2;
    r1 = r6.xxxx * LocalToWorld[1].xzyw + r1.xzwy;
    r7.xyz = r7.xxx * LocalToWorld[1].xzy + r8.xyz;
    r6.xyz = r7.www * LocalToWorld[0].xyz + r7.xzy;
    r1 = r6.wwww * LocalToWorld[0].wzyx + r1.wyzx;
    r2 = r6.wwww * PreviousLocalToWorld[0] + r2;
    ps = 0.003921569 * r0.x;
    r0.w = dot(r4.xyz, r3.xyz);
    r4.x = ps;
    r4.w = r0.w * 0.5 + 0.5;
    ps = 0.003921569 * r0.y;
    r3.xyz = r1.wzy - r2.xyz;
    r4.y = ps;
    ps = 0.003921569 * r0.z;
    r0.w = dot(r6.zxy, r3.zxy);
    r4.z = ps;
    p0 = (-r0.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r5.xyz * 0.003921569;
    if (p0)
    {
        r2.xy = float2((-abs(r0.xx) > 0.0));
        r3 = -r3.zzyx * StretchTimeScale.wxxx + r1;
        r1 = r3.xxxx * ViewProjectionMatrix[3].xwzy;
        r1 = r3.yyyy * ViewProjectionMatrix[2].xwzy + r1;
        r1 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
        r1 = r3.wwww * ViewProjectionMatrix[0] + r1.xzyw;
    }
    if (!p0)
    {
        r5.xyz = r2.www * PrevViewProjectionMatrix[3].xyw;
        r3 = r1.xxxx * ViewProjectionMatrix[3].xwyz;
        r3 = r1.yyyy * ViewProjectionMatrix[2].xwyz + r3;
        r5.xyz = r2.zzz * PrevViewProjectionMatrix[2].xyw + r5.xyz;
    }
    if (!p0)
    {
        if (!p0)
        {
            r2.yzw = r2.yyy * PrevViewProjectionMatrix[1].xyw + r5.xyz;
            r3 = r1.zzzz * ViewProjectionMatrix[1].xwyz + r3;
            r1 = r1.wwww * ViewProjectionMatrix[0] + r3.xzwy;
            r2.xyz = r2.xxx * PrevViewProjectionMatrix[0].xyw + r2.yzw;
            ps = 1.0 / r2.z;
            r0.w = ps;
            ps = 1.0 / r1.w;
            r2.xy = r2.xy * r0.ww;
            r0.w = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r2.xy = r1.xy * r0.ww - r2.xy;
        }
    }
    r1.z = r1.w * StretchTimeScale.y + r1.z;
    oPos = r1;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.x = ps;
    o3.yzw = 0.0;
    o0.xy = r2.xy;
    o0.zw = 0.0;
    o2.xyz = r0.xyz;
    o2.w = 0.0;
    o1 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    Out.color0 = o1;
    Out.color1 = o2;
    Out.color2 = o3;
    return Out;
}
