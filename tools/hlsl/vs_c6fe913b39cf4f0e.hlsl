// vs_c6fe913b39cf4f0e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 144 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000240 00310006 00000000 00000000 00004084 00000001 00000004 00000004 00000290 00100005 00003006 0001A007 00205008 0000F050 0001F156 0002F2A0 0003F3A2 0000102E 0000102C 0000102D 0000102B
//   vertex element: instruction 5 -> POSITION0
//   vertex element: instruction 6 -> NORMAL0
//   vertex element: instruction 7 -> COLOR1
//   vertex element: instruction 8 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
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
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 oPos = 0.0;
    bool p0 = false;

    r2 = In.position0;
    r5.xyz = In.normal0.xyz;
    r3 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.z = 0.0;
    r1 = r2.wwww * PreviousLocalToWorld[3].xzyw;
    r0 = r2.wwww * LocalToWorld[3];
    r5.xyw = r5.zyx * 0.007843138 - 1.0;
    r6.xyz = r5.xxx * LocalToWorld[2].xzy;
    r0 = r2.zzzz * LocalToWorld[2] + r0;
    r1 = r2.zzzz * PreviousLocalToWorld[2].xzyw + r1;
    r1 = r2.yyyy * PreviousLocalToWorld[1].xzyw + r1;
    r0 = r2.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r5.xyz = r5.yyy * LocalToWorld[1].xzy + r6.xyz;
    r5.xyz = r5.www * LocalToWorld[0].xyz + r5.xzy;
    r0 = r2.xxxx * LocalToWorld[0].wzyx + r0.zywx;
    r1 = r2.xxxx * PreviousLocalToWorld[0].xzyw + r1;
    r2.xyz = r0.yzw - r1.yzx;
    r2.w = dot(r5.zxy, r2.xzy);
    p0 = (r2.w >= 0.0);
    if (p0)
    {
        r5.xyz = r1.www * PrevViewProjectionMatrix[3].xyw;
        r2 = r0.xxxx * ViewProjectionMatrix[3].xwzy;
        r2 = r0.yyyy * ViewProjectionMatrix[2].xwzy + r2;
        r5.xyz = r1.yyy * PrevViewProjectionMatrix[2].xyw + r5.xyz;
        r1.yzw = r1.zzz * PrevViewProjectionMatrix[1].xyw + r5.xyz;
    }
    if (p0)
    {
        if (p0)
        {
            r2 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r2.xzwy;
            r0 = r0.wwww * ViewProjectionMatrix[0] + r2.xzyw;
            r1.xyz = r1.xxx * PrevViewProjectionMatrix[0].wxy + r1.wyz;
            r1.x = 1.0 / r1.x;
            r1.xy = r1.yz * r1.xx;
            r1.z = 1.0 / r0.w;
            r1.xy = r0.xy * r1.zz - r1.xy;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r1.xy = float2((-abs(r0.xx) > 0.0));
            r2 = -r2.xxyz * StretchTimeScale.wxxx + r0;
            r0 = r2.xxxx * ViewProjectionMatrix[3].xwyz;
            r0 = r2.yyyy * ViewProjectionMatrix[2].xwyz + r0;
            r0 = r2.zzzz * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r2.wwww * ViewProjectionMatrix[0] + r0.xzwy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o3.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o3.yzw = 0.0;
    o1.xy = r1.xy;
    o1.zw = 0.0;
    o2 = r3;
    o0 = r4.xyzz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord6 = o1;
    Out.color0 = o2;
    Out.color2 = o3;
    return Out;
}
