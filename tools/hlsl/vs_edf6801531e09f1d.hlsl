// vs_edf6801531e09f1d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000270 00410007 00000000 00000000 000050A5 00000001 00000006 00000005 00000290 00100006 00003007 0001A008 00005009 0001500A 0032500B 0000F050 0001F151 0002F256 0003F3A0 0004F4A2 00001032 00001030 0000102F 00001031 0000102E
//   vertex element: instruction 6 -> POSITION0
//   vertex element: instruction 7 -> NORMAL0
//   vertex element: instruction 8 -> COLOR1
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> TEXCOORD1
//   vertex element: instruction 11 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
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
    float4 normal0 : NORMAL0;
    float4 color1 : COLOR1;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 r7 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    bool p0 = false;

    r3 = In.position0;
    r6.xyz = In.normal0.xyz;
    r5 = In.color1;
    r4.xy = In.texcoord0.xy;
    r4.zw = In.texcoord1.yx;
    r0.xy = In.texcoord2.xy;
    r2 = r3.wwww * PreviousLocalToWorld[3].xzyw;
    r1 = r3.wwww * LocalToWorld[3];
    r6.xyw = r6.zyx * 0.007843138 - 1.0;
    r7.xyz = r6.xxx * LocalToWorld[2].xzy;
    r1 = r3.zzzz * LocalToWorld[2] + r1;
    r2 = r3.zzzz * PreviousLocalToWorld[2].xzyw + r2;
    r2 = r3.yyyy * PreviousLocalToWorld[1].xzyw + r2;
    r1 = r3.yyyy * LocalToWorld[1].xzwy + r1.xzwy;
    r6.xyz = r6.yyy * LocalToWorld[1].xzy + r7.xyz;
    r6.xyz = r6.www * LocalToWorld[0].xyz + r6.xzy;
    r1 = r3.xxxx * LocalToWorld[0].wzyx + r1.zywx;
    r2 = r3.xxxx * PreviousLocalToWorld[0].xzyw + r2;
    r3.xyz = r1.yzw - r2.yzx;
    r0.z = dot(r6.zxy, r3.xzy);
    p0 = (-r0.z > 0.0);
    if (p0)
    {
        r0.zw = float2((-abs(r0.xx) > 0.0));
        r2 = -r3.xxyz * StretchTimeScale.wxxx + r1;
        r1 = r2.xxxx * ViewProjectionMatrix[3].xwzy;
        r1 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r1;
        r1 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
        r1 = r2.wwww * ViewProjectionMatrix[0] + r1.xzyw;
    }
    if (!p0)
    {
        r6.xyz = r2.www * PrevViewProjectionMatrix[3].xyw;
        r3 = r1.xxxx * ViewProjectionMatrix[3].xwyz;
        r3 = r1.yyyy * ViewProjectionMatrix[2].xwyz + r3;
    }
    if (!p0)
    {
        if (!p0)
        {
            r6.xyz = r2.yyy * PrevViewProjectionMatrix[2].xyw + r6.xyz;
            r2.yzw = r2.zzz * PrevViewProjectionMatrix[1].xyw + r6.xyz;
            r3 = r1.zzzz * ViewProjectionMatrix[1].xwyz + r3;
            r1 = r1.wwww * ViewProjectionMatrix[0] + r3.xzwy;
            r2.xyz = r2.xxx * PrevViewProjectionMatrix[0].xyw + r2.yzw;
            r0.z = 1.0 / r2.z;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r0.zw = r2.xy * r0.zz;
            r2.x = 1.0 / r1.w;
            r0.zw = r1.xy * r2.xx - r0.zw;
        }
    }
    r1.z = r1.w * StretchTimeScale.y + r1.z;
    oPos = r1;
    o4.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.yzw = 0.0;
    o2.xy = r0.zw;
    o2.zw = 0.0;
    o1.xy = r0.xy;
    o1.zw = 0.0;
    o3 = r5;
    o0 = r4;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
