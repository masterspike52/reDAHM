// vs_139096dce681a96f.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000002C4 0041000A 00000000 00000000 000050A5 00000001 00000006 00000005 00000290 00100006 00006007 00007008 00003009 0000500A 0031500B 0000F050 0001F156 0002F2A0 0003F3A1 0004F4A2 00001039 00001036 00001038 00001037 00001035
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> TANGENT0
//   vertex element: instruction 8 -> BINORMAL0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r7 = In.position0.yzwx;
    r6.xyz = In.tangent0.xyz;
    r2.xyz = In.binormal0.xyz;
    r1.xyz = In.normal0.xyz;
    r0.yz = In.texcoord0.xy;
    r0.xw = In.texcoord1.yx;
    r5.y = -r6.y * 0.007843138 + 1.0;
    r5.xz = r6.xz * 0.007843138 - 1.0;
    r10.xyz = r2.zxy * 0.007843138 - 1.0;
    r3 = r7.zzzz * PreviousLocalToWorld[3].xzyw;
    r2 = r7.zzzz * LocalToWorld[3];
    r8.xyw = r1.yzx * 0.007843138 - 1.0;
    r9.xyz = r8.yyy * LocalToWorld[2].xzy;
    r2 = r7.yyyy * LocalToWorld[2] + r2;
    r3 = r7.yyyy * PreviousLocalToWorld[2].xzyw + r3;
    r4.xyz = r10.xxz * r8.xww;
    r4.xyz = r10.zyy * r8.yyx - r4.xyz;
    r3 = r7.xxxx * PreviousLocalToWorld[1].xzyw + r3;
    r2 = r7.xxxx * LocalToWorld[1].xzwy + r2.xzwy;
    r8.xyz = r8.xxx * LocalToWorld[1].xzy + r9.xyz;
    r7.xyz = r8.www * LocalToWorld[0].xyz + r8.xzy;
    r2 = r7.wwww * LocalToWorld[0].wzyx + r2.zywx;
    r3 = r7.wwww * PreviousLocalToWorld[0].xzyw + r3;
    ps = 0.003921569 * r1.x;
    r1.w = dot(r5.xyz, r4.xyz);
    r5.x = ps;
    r5.w = r1.w * 0.5 + 0.5;
    ps = 0.003921569 * r1.y;
    r4.xyz = r2.yzw - r3.yzx;
    r5.y = ps;
    ps = 0.003921569 * r1.z;
    r1.w = dot(r7.zxy, r4.xzy);
    r5.z = ps;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r6.xyz * 0.003921569;
    if (p0)
    {
        r1.xy = float2((-abs(r0.xx) > 0.0));
        r3 = -r4.xxyz * StretchTimeScale.wxxx + r2;
        r2 = r3.xxxx * ViewProjectionMatrix[3].xwzy;
        r2 = r3.yyyy * ViewProjectionMatrix[2].xwzy + r2;
        r2 = r3.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
        r2 = r3.wwww * ViewProjectionMatrix[0] + r2.xzyw;
    }
    if (!p0)
    {
        r1.xyz = r3.www * PrevViewProjectionMatrix[3].xyw;
        r4 = r2.xxxx * ViewProjectionMatrix[3].xwyz;
    }
    if (!p0)
    {
        if (!p0)
        {
            r4 = r2.yyyy * ViewProjectionMatrix[2].xwyz + r4;
            r1.xyz = r3.yyy * PrevViewProjectionMatrix[2].xyw + r1.xyz;
            r1.xyz = r3.zzz * PrevViewProjectionMatrix[1].xyw + r1.xyz;
            r4 = r2.zzzz * ViewProjectionMatrix[1].xwyz + r4;
            r2 = r2.wwww * ViewProjectionMatrix[0] + r4.xzwy;
            r1.xyz = r3.xxx * PrevViewProjectionMatrix[0].wxy + r1.zxy;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = 1.0 / r1.x;
            r1.x = ps;
            ps = 1.0 / r2.w;
            r1.xy = r1.yz * r1.xx;
            r1.z = ps;
            r1.xy = r2.xy * r1.zz - r1.xy;
        }
    }
    r2.z = r2.w * StretchTimeScale.y + r2.z;
    oPos = r2;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.x = ps;
    o4.yzw = 0.0;
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o3.xyz = r6.xyz;
    o3.w = 0.0;
    o2 = r5;
    o0 = r0.yzxw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.color0 = o2;
    Out.color1 = o3;
    Out.color2 = o4;
    return Out;
}
