// ps_1fb0d7415549f05b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10000500 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_33 : register(c6); // float
float4 UniformScalar_34 : register(c7); // float
float4 UniformScalar_35 : register(c8); // float
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r4 = In.color1;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xz = r0.xy * UniformVector_1.xy;
    r4.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r4.x));
    r3.yw = r3.xz + 0.5;
    r4.x = ps;
    r4.xy = r4.xx * float2(0.125, 1.0);
    r4.xyz = r4.xxy * r2.xyz;
    r1.xy = r3.yw + r4.xy;
    r3.yw = r4.yx + r3.zx;
    r0 = r3.xzwy + UniformVector_2.xyxy;
    ps = 0.5 + r3.y;
    r5.xy = r0.xy + r4.xy;
    r1.z = ps;
    r3.xyz = r1.xyz * 1.5 + UniformVector_3.xyy;
    r5.w = tex2D(Texture2D_1, r3.xz).w;
    r4.y = tex2D(Texture2D_0, r0.zw).w;
    r4.x = tex2D(Texture2D_1, r3.xy).w;
    r3.z = tex2D(Texture2D_0, r5.xy).w;
    r3.y = max(r4.z, 0.0);
    r3.xw = -r3.yz + 1.0;
    r3.y = r3.w * r4.x + r3.z;
    r4.x = saturate(r3.y * 7e+01 - 2e+01);
    ps = abs(r3.x) * abs(r3.x);
    r3.w = UniformScalar_33.x - 0.003921569;
    r3.y = ps;
    ps = UniformScalar_35.x * r3.y;
    r5.yz = -r4.xy + 1.0;
    r5.x = ps;
    r3.xy = r5.xz * r5.yw;
    ps = 4.0 * r3.x;
    r3.z = ps;
    ps = r3.y;
    r3.z = max(r3.z, (-255.0));
    ps = r4.y + ps;
    r3.y = min(r3.z, 255.0);
    r3.x = ps;
    r3.xy = r3.xy * float2(7e+01, 0.003921569);
    ps = (-2e+01) + r3.x;
    r3.z = min(r3.y, 0.0);
    r4.x = saturate(ps);
    r3.w = r4.x * UniformScalar_34.x + r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    oC0.zw = abs(r3.zz);
    oC0.xy = max(r3.yy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
