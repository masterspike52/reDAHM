// ps_ac0c0d226d87b9e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000114 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c5); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 color0 : COLOR0; // r2
    float4 color2 : COLOR2; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.color0;
    float4 r3 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.x = tex2D(Texture2D_2, r0.xy).x;
    r2.y = tex2D(Texture2D_0, r0.xy).x;
    r2.z = tex2D(Texture2D_1, r0.xy).x;
    r3.yz = r1.xy * IndividualVelocityScale.xy;
    r0.xy = r3.yz * r3.yz;
    r0.zw = r2.yz * float2(5.0, 3e+01);
    r3.xw = r0.zx + r0.wy;
    r2.z = max(r3.w, 1.0);
    r2.y = 0.5;
    ps = rsqrt(abs(r2.z));
    r2.x = saturate(r2.x - UniformScalar_5.x);
    r2.w = ps;
    r2.z = tex2D(Texture2D_3, r2.xy).x;
    r2.z = r2.z * UniformVector_1.x - 0.5;
    r3.xyz = r3.xyz * r2.xww;
    r2.xy = saturate(abs(r3.yz));
    ps = (r3.y > 0.0) ? 1.0 : 0.0;
    r2.w = r2.z + r3.x;
    r2.z = ps;
    ps = (r3.z > 0.0) ? 1.0 : 0.0;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    r2.w = ps;
    r2 = r2 * float4(0.49, 0.49, 0.5, 0.5);
    r2.xy = r2.xy + r2.zw;
    r2.xy = max(r2.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r2.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
