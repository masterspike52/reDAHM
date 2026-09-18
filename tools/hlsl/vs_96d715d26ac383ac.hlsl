// vs_96d715d26ac383ac.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 66 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000108 00410004 00000000 00000000 000050A5 00000001 00000005 00000005 00000290 00100003 0001A004 00005005 00015006 00225007 0000F050 0001F151 0002F256 0003F3A0 0004F4A2 00001013 00001011 00001014 00001012 00001010
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> COLOR1
//   vertex element: instruction 5 -> TEXCOORD0
//   vertex element: instruction 6 -> TEXCOORD1
//   vertex element: instruction 7 -> TEXCOORD2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;

    r4 = In.position0;
    r2 = In.color1;
    r1.xy = In.texcoord0.xy;
    r1.zw = In.texcoord1.yx;
    r3.xy = In.texcoord2.xy;
    r0 = r4.wwww * LocalToWorld[3];
    r0 = r4.zzzz * LocalToWorld[2] + r0;
    r0 = r4.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r0 = r4.xxxx * LocalToWorld[0].xwyz + r0.xzwy;
    r4 = r0.yyyy * ViewProjectionMatrix[3].xwzy;
    r4 = r0.wwww * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    o4.x = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    o4.yzw = 0.0;
    o1.xy = r3.xy;
    o1.zw = 0.0;
    o3 = r2;
    o0 = r1;
    o2 = r0.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color2 = o4;
    return Out;
}
