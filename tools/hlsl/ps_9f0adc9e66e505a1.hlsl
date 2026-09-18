// ps_9f0adc9e66e505a1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10000500 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F156 00007257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_4 : register(c5); // float
float4 UniformVector_2 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
sampler2D Texture2D_1 : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

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
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r5.xy = r0.xy * UniformVector_3.xy;
    ps = 0.5 + ps;
    r3.y = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = UniformVector_2.x * r0.w;
    r3.x = -r0.z + 1.0;
    r3.z = ps;
    ps = rsqrt(abs(r3.y));
    r3.x = r3.x * UniformVector_2.y;
    r3.y = ps;
    ps = r0.y;
    r3.yw = r3.yy * float2(-0.05, 1.0);
    ps = 0.5 + ps;
    r2.xyz = r3.wyy * r2.zxy;
    r4.z = ps;
    ps = (-0.5) + r3.z;
    r4.yw = float2((r3.xz >= 0.5));
    r3.y = ps;
    ps = (-0.5) + r3.x;
    r4.xz = r4.xz + r2.yz;
    r3.w = ps;
    r3.yw = r3.yw - r3.zx;
    r3.xy = r3.yw * r4.wy + r3.zx;
    r3.xy = r3.xy + r3.xy;
    r3.w = tex2D(Texture2D_1, r0.xy).w;
    r4.z = tex2D(Texture2D_1, r4.xz).w;
    r4.x = tex2D(Texture2D_3, r5.xy).x;
    r0 = tex2D(Texture2D_2, r3.xy);
    r3.y = max(r2.x, 0.0);
    ps = 1.0 - r3.y;
    r4.y = dot(r4.wyy, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r3.z = (r4.y == 0.0) ? r0.x : r0.y;
    ps = log2(abs(r3.x));
    r3.y = ps;
    ps = UniformScalar_4.x * r3.y;
    r4.xyw = r4.xyy + float3(1.0, -3.0, -2.0);
    r3.x = ps;
    r3.y = (r4.w == 0.0) ? r0.z : r3.z;
    r4.y = (r4.y == 0.0) ? r0.w : r3.y;
    ps = pow(2.0, r3.x);
    r4.w = ps;
    r4.x = r4.x - r4.w;
    r3.xyz = -r4.wyz + 1.0;
    r3.w = r3.z * r3.w + r4.z;
    r4.x = r4.x * r3.x;
    r3.w = r4.x * r3.w;
    r3.x = r3.w * r3.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    ps = r1.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
