// vs_589d3a58eccfd8a4.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000168 00210004 00000000 00000000 00002C63 00000001 00000003 00000003 00000290 00100004 00003005 00315006 0000F050 0001F151 00027252 0000101C 0000101A 0000101B
//   vertex element: instruction 4 -> POSITION0
//   vertex element: instruction 5 -> NORMAL0
//   vertex element: instruction 6 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 WMapChannel : register(c10); // float
float4 WMapScale : register(c9); // float2

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
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
    float4 oPos = 0.0;
    float ps = 0.0;

    r3 = In.position0;
    r4.xyz = In.normal0.xyz;
    r0.xz = In.texcoord1.yx;
    r1.x = WMapChannel.x + 0.5;
    r0.y = WMapChannel.x * 0.5;
    ps = 1.0 - r0.x;
    r0.y = floor(r0.y);
    r0.w = ps;
    r0.y = r0.y * (-2.0) + 0.5;
    r0.xz = r0.zw * WMapScale.xy;
    ps = WMapChannel.x + r0.y;
    r1.yw = r0.xz - 0.5;
    r1.z = ps;
    r1.xz = floor(r1.zx);
    r0.yw = r1.yw - r0.xz;
    r1.y = float((r1.z >= 2.0));
    r1.yz = r0.yw * r1.xy + r0.xz;
    r0.xy = r1.yz + r1.yz;
    ps = (-0.5) - -r0.y;
    r2 = r3.wwww * LocalToWorld[3].xwzy;
    r1.x = ps;
    ps = 4.0 * r1.y;
    r0.z = ps;
    ps = (-2.0) * r1.x;
    oPos.x = r0.z - 1.0;
    oPos.y = ps;
    oPos.z = 0.0;
    oPos.w = 1.0;
    r1.xyw = r4.zyx * 0.007843138 - 1.0;
    r2 = r3.zzzz * LocalToWorld[2].xwzy + r2;
    r4.xyz = r1.xxx * LocalToWorld[2].xzy;
    r1.xyz = r1.yyy * LocalToWorld[1].xzy + r4.xyz;
    r2 = r3.yyyy * LocalToWorld[1].xzyw + r2.xzwy;
    o1 = r3.xxxx * LocalToWorld[0] + r2.xzyw;
    o2.xyz = r1.www * LocalToWorld[0].xyz + r1.xzy;
    o0.xy = r0.xy;
    o0.z = 0.0;
    o0.w = 1.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    return Out;
}
