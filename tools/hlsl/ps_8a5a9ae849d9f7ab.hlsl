// ps_8a5a9ae849d9f7ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10000500 00000004 00000000 00002C84 000F000F 00000021 00003050 00003151 0000F256 00007357
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 - r1.y;
    r0.w = r1.x * UniformVector_2.x;
    r0.z = ps;
    ps = r0.x;
    r5.xy = r0.xy * UniformVector_3.xy;
    ps = 0.5 + ps;
    r1.y = dot(r3.zxy, r3.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.y));
    r0.z = r0.z * UniformVector_2.y;
    r1.y = ps;
    ps = r0.y;
    r1.yz = r1.yy * float2(-0.05, 1.0);
    ps = 0.5 + ps;
    r4.xyz = r1.zyy * r3.zxy;
    r1.z = ps;
    ps = (-0.5) + r0.w;
    r1.yw = float2((r0.zw >= 0.5));
    r3.x = ps;
    ps = (-0.5) + r0.z;
    r1.xz = r1.xz + r4.yz;
    r3.y = ps;
    r3.xy = r3.xy - r0.wz;
    r0.zw = r3.xy * r1.wy + r0.wz;
    r3.xy = r0.zw + r0.zw;
    r0.w = tex2D(Texture2D_1, r0.xy).w;
    r1.z = tex2D(Texture2D_1, r1.xz).w;
    r1.x = tex2D(Texture2D_3, r5.xy).x;
    r3 = tex2D(Texture2D_2, r3.xy);
    r0.y = max(r4.x, 0.0);
    ps = 1.0 - r0.y;
    r1.y = dot(r1.wyy, float3(1.0, 1.0, 1.0));
    r0.x = ps;
    r0.z = (r1.y == 0.0) ? r3.x : r3.y;
    ps = log2(abs(r0.x));
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r1.xyw = r1.xyy + float3(1.0, -3.0, -2.0);
    r0.x = ps;
    r0.y = (r1.w == 0.0) ? r3.z : r0.z;
    r1.y = (r1.y == 0.0) ? r3.w : r0.y;
    ps = pow(2.0, r0.x);
    r1.w = ps;
    r1.x = r1.x - r1.w;
    r0.xyz = -r1.wyz + 1.0;
    r0.w = r0.z * r0.w + r1.z;
    r1.x = r1.x * r0.x;
    r0.w = r1.x * r0.w;
    r0.x = r0.w * r0.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    ps = r2.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
