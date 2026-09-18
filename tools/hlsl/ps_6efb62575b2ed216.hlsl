// ps_6efb62575b2ed216.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 10000400 00000008 00000000 000050A5 0003001F 00000021 0000F050 0000F156 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c7); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_12 : register(c3); // float
float4 UniformScalar_13 : register(c4); // float
float4 UniformScalar_14 : register(c5); // float
float4 UniformScalar_15 : register(c6); // float
sampler2D Texture2D_4 : register(s0);
sampler2D Texture2D_7 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 color0 : COLOR0; // r2
    float4 color1 : COLOR1; // r3
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
    float4 r2 = In.color0;
    float4 r3 = In.color1;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.xz = r0.wz * 3.0;
    r2.y = r4.w * (-0.8) + r2.z;
    r3.w = tex2D(Texture2D_7, r0.xy).w;
    r2.y = tex2D(Texture2D_4, r2.xy).z;
    ps = -r4.w;
    r3.yz = r1.xy * IndividualVelocityScale.xy;
    ps = UniformScalar_13.x + ps;
    r2.x = float((UniformScalar_12.x >= 1.0));
    r2.z = ps;
    r2.x = r2.z * r2.x + r4.w;
    r2.x = -r2.x + r4.z;
    r2.x = max(r2.x, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r2.x = min(r2.x, 1.0);
    r2.z = ps;
    ps = r2.y;
    r2.x = saturate(r2.x * r2.z);
    ps = r4.w * ps;
    r2.x = -r2.x + 1.0;
    r2.y = ps;
    r2.x = r2.y * r2.x;
    r2.x = float((r2.x >= 0.05));
    ps = 1.0 - r2.x;
    r2.x = ps;
    r2.y = (UniformScalar_13.x > 0.0) ? r2.x : 1.0;
    r3.x = (UniformScalar_13.x >= 0.0) ? r2.y : r2.x;
    r2.xyz = r3.xyz * r3.wyz;
    ps = r2.y + r2.z;
    r2.w = ps;
    r2.y = max(r2.w, 1.0);
    ps = rsqrt(abs(r2.y));
    r2.x = r2.x - 0.5;
    r2.y = ps;
    r2.yz = r3.zy * r2.yy;
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
