// ps_f8da1909f2bd72a9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_1 : register(c3); // float
sampler2D Texture2D_1 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
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
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.x = r0.x * 5.0 + UniformScalar_1.x;
    r4.y = r4.x * 1.0000007 + 0.5;
    ps = frac(r4.y);
    r4.x = r3.w * 4e+01;
    r3.x = ps;
    r3.x = r3.x * 6.2831855 - 3.1415927;
    ps = sin(r3.x);
    r3.x = ps;
    r3.xy = r3.xx * 0.008 + r0.xy;
    r3.x = tex2D(Texture2D_1, r3.xy).x;
    ps = 1.0 - r3.x;
    r3.y = ps;
    r3.y = r4.x * r3.y;
    r3.y = max(r3.y, (-255.0));
    r3.y = min(r3.y, 255.0);
    r3.xy = r3.xy * float2(7e+01, 0.003921569);
    ps = (-2e+01) + r3.x;
    r4.x = min(r3.y, 0.0);
    r4.y = saturate(ps);
    r3.z = r4.y * r3.w - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.zzzz)) clip(-1.0);
    oC0.zw = abs(r4.xx);
    oC0.xy = max(r3.yy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
