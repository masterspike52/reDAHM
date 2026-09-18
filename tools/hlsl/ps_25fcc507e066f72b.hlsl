// ps_25fcc507e066f72b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000500 00000004 00000000 00004CC6 003F003F 00000021 00003050 00003151 0000F252 0000F353 0000F455 00007556
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_1 : register(c3); // float
sampler2D Texture2D_1 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.z = r0.x * 5.0 + UniformScalar_1.x;
    r0.z = r0.z * 1.0000007 + 0.5;
    r0.z = frac(r0.z);
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r0.z = sin(r0.z);
    r0.xy = r0.zz * 0.008 + r0.xy;
    r0.y = tex2D(Texture2D_1, r0.xy).x;
    r0.x = 1.0 - r0.y;
    r0.x = (-8.0) * r0.x;
    r0.x = max(r0.x, (-255.0));
    r0.x = min(r0.x, 255.0);
    r0.xy = r0.yx * float2(7e+01, 0.003921569);
    ps = (-2e+01) + r0.x;
    r0.z = min(r0.y, 0.0);
    r0.x = saturate(ps);
    ps = (-0.003921569) - -r0.x;
    r0.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    oC0.zw = abs(r0.zz);
    oC0.xy = max(r0.yy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
