// ps_ddc8a689f2f61883.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 45 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000B4 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_2 : register(c3); // float4
sampler2D Texture2D_1 : register(s0);
sampler2D Texture2D_2 : register(s1);

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

    r3.yz = r0.xy + UniformVector_2.xy;
    r3.x = tex2D(Texture2D_1, r0.xy).x;
    r3.yw = tex2D(Texture2D_2, r3.yz).yx;
    r4.xy = r3.wy * 8e+01;
    ps = r3.w + r3.w;
    r3.yz = max(r4.xy, (-255.0));
    r3.w = ps;
    ps = r3.w;
    r3.yz = min(r3.yz, 255.0);
    ps = r3.x * ps;
    r4.xy = r3.yz * 0.003921569;
    r4.z = ps;
    r3.xyz = min(r4.xzy, float3(0.0, 1.0, 0.0));
    ps = (-0.003921569) - -r3.y;
    r3.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    oC0.zw = abs(r3.xz);
    oC0.xy = max(r4.xy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
