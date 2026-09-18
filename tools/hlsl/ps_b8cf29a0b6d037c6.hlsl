// ps_b8cf29a0b6d037c6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
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

    r3.xy = (float2(0.0, 1.0) == 0.0) ? r0.yy : 0.5;
    r2.xz = r0.xy + UniformVector_1.xy;
    r2.yw = UniformVector_2.yx - 0.5;
    r0.xy = r2.yw + r0.yx;
    r2.y = 0.5;
    r3.w = dot(r0.xy, UniformVector_4.yx) + 0.5;
    r3.z = dot(r0.xy, UniformVector_3.yx) + 0.5;
    r2.y = tex2D(Texture2D_2, r2.yy).x;
    r2.w = tex2D(Texture2D_0, r3.zw).x;
    r2.z = tex2D(Texture2D_0, r2.xz).x;
    r2.x = tex2D(Texture2D_1, r3.yx).x;
    ps = 3.0 * r2.x;
    r2.z = r2.w + r2.z;
    r2.x = ps;
    r2.x = r2.x * r2.z;
    ps = 0.5 * r2.x;
    r2.x = ps;
    r2.x = r2.x * r2.y;
    r2.yz = r2.xx * IndividualVelocityScale.xy;
    r2.zw = r2.yz * r1.xy;
    r2.y = dot(r2.zw, r2.zw) + 0.0;
    r2.y = max(r2.y, 1.0);
    ps = rsqrt(abs(r2.y));
    r2.x = r2.x - 0.003921569;
    r2.y = ps;
    r2.yz = r2.wz * r2.yy;
    ps = abs(r2.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.xxxx)) clip(-1.0);
    r2.x = saturate(ps);
    ps = abs(r2.y);
    r2.zw = float2((r2.zy > 0.0));
    r2.y = saturate(ps);
    r2 = r2 * float4(0.49, 0.49, 0.5, 0.5);
    r2.xy = r2.xy + r2.zw;
    r2.xy = max(r2.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r2.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
