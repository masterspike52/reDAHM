// vs_72bcc266bd60522a.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 45 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 000000B4 00710001 00000000 00000000 00008108 00000001 00000002 00000008 00000290 00100003 00305004 0000F050 0001F151 0002F252 0003F353 0004F454 0005F555 0006F656 0007F757 00001006 00001007 00001008 00001009 0000100A 0000100B 0000100C 0000100D
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD7 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleOffsets[8] : register(c5); // float4[8]

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r0.xy = In.texcoord0.xy;
    oPos = r1;
    o0 = r0.xyyx + SampleOffsets[0];
    o1 = r0.xyyx + SampleOffsets[1];
    o2 = r0.xyyx + SampleOffsets[2];
    o3 = r0.xyyx + SampleOffsets[3];
    o4 = r0.xyyx + SampleOffsets[4];
    o5 = r0.xyyx + SampleOffsets[5];
    o6 = r0.xyyx + SampleOffsets[6];
    o7 = r0.xyyx + SampleOffsets[7];

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord4 = o4;
    Out.texcoord5 = o5;
    Out.texcoord6 = o6;
    Out.texcoord7 = o7;
    return Out;
}
