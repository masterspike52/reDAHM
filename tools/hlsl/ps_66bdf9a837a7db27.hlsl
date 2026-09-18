// ps_66bdf9a837a7db27.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 57 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000E4 10000200 00000004 00000000 00001842 00030003 00000021 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c4); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_5 : register(c3); // float
sampler2D Texture2D_2 : register(s0);
sampler2D Texture2D_3 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.w = tex2D(Texture2D_2, r0.xy).w;
    r0.x = tex2D(Texture2D_3, r0.xy).w;
    r1.xy = r1.xy * IndividualVelocityScale.xy;
    r2.yz = r1.xy * r1.xy;
    r0.x = -r2.w + r0.x;
    r2.x = r0.x * UniformScalar_5.x - 0.1;
    r0.xy = r2.xy + r2.wz;
    r0.z = max(r0.y, 1.0);
    r0.z = rsqrt(abs(r0.z));
    r0.yz = r1.yx * r0.zz;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = saturate(abs(r0.z));
    ps = abs(r0.y);
    r0.zw = float2((r0.zy > 0.0));
    r0.y = saturate(ps);
    r0 = r0 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r0.xy + r0.zw;
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
