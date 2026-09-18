// ps_b9184fe8ba33eefd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F156 00007257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_10 : register(c5); // float
float4 UniformScalar_11 : register(c6); // float
float4 UniformScalar_8 : register(c3); // float
float4 UniformScalar_9 : register(c4); // float
sampler2D Texture2D_4 : register(s0);
sampler2D Texture2D_9 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.y = tex2D(Texture2D_9, r0.xy).w;
    ps = UniformScalar_9.x - r4.w;
    r3.xz = r0.wz * 3.0;
    r3.w = ps;
    r3.z = tex2D(Texture2D_4, r3.xz).z;
    r3.x = float((UniformScalar_8.x >= 1.0));
    r3.x = r3.w * r3.x + r4.w;
    r3.x = -r3.x + r4.z;
    r3.x = max(r3.x, UniformScalar_10.x);
    ps = 1.0 / UniformScalar_11.x;
    r3.x = min(r3.x, 1.0);
    r3.w = ps;
    ps = r3.z;
    r3.x = saturate(r3.x * r3.w);
    ps = r4.w * ps;
    r3.x = -r3.x + 1.0;
    r3.z = ps;
    r3.x = r3.z * r3.x;
    r3.x = float((r3.x >= 0.05));
    ps = 1.0 - r3.x;
    r3.x = ps;
    r3.z = (UniformScalar_9.x > 0.0) ? r3.x : 1.0;
    r3.x = (UniformScalar_9.x >= 0.0) ? r3.z : r3.x;
    r3.x = r3.x * r3.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    ps = r1.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
