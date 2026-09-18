// ps_d05698fb389594f8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 57 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000E4 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
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

    r3.yz = r0.xy * 0.05 + UniformVector_1.xy;
    r4.z = tex2D(Texture2D_0, r3.yz).x;
    r4.x = dot(r2.zxy, r2.zxy);
    r3.yz = r4.zz * float2(32.0, 0.4);
    r4.x = rsqrt(abs(r4.x));
    r4.yw = r4.xx * r2.xy;
    r4.x = (-0.005) + r3.z;
    r4.xy = r4.yw * r4.xx + r0.xy;
    r4.y = tex2D(Texture2D_2, r4.xy).x;
    r4.x = max(r3.y, (-255.0));
    r4.x = min(r4.x, 255.0);
    r4.xy = r4.xy * float2(0.003921569, 8.0);
    r4.w = r4.y * r4.z;
    r4.z = min(r4.x, 0.0);
    r3.x = r4.w * r3.x - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    oC0.zw = abs(r4.zz);
    oC0.xy = max(r4.xx, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
