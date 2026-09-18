// ps_e9fa0cbb5ca752f1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10000300 00000004 00000000 00001842 00030003 00000021 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c7); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);

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
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.xz = r0.xy + UniformVector_1.xy;
    r2.yw = UniformVector_2.yx - 0.5;
    r0.w = 0.5;
    r3.xy = r2.yw + r0.yx;
    r0.z = 0.5;
    r2.w = dot(r3.xy, UniformVector_4.yx) + 0.5;
    r2.y = dot(r3.xy, UniformVector_3.yx) + 0.5;
    r0.w = tex2D(Texture2D_2, r0.ww).x;
    r2.y = tex2D(Texture2D_0, r2.yw).x;
    r2.x = tex2D(Texture2D_0, r2.xz).x;
    r0.x = tex2D(Texture2D_1, r0.zy).x;
    ps = 3.0 * r0.x;
    r0.y = r2.y + r2.x;
    r0.x = ps;
    r0.x = r0.x * r0.y;
    ps = 0.5 * r0.x;
    r0.x = ps;
    r0.x = r0.x * r0.w;
    r0.yz = r0.xx * IndividualVelocityScale.xy;
    r0.zw = r0.yz * r1.xy;
    r0.y = dot(r0.zw, r0.zw) + 0.0;
    r0.y = max(r0.y, 1.0);
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x - 0.003921569;
    r0.y = ps;
    r0.yz = r0.wz * r0.yy;
    ps = abs(r0.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = saturate(ps);
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
