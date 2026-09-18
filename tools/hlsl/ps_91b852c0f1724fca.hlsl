// ps_91b852c0f1724fca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000400 00000008 00000000 000050A5 0003001F 00000021 0000F050 0000F156 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c8); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_0 : register(c3); // float
float4 UniformScalar_1 : register(c4); // float
float4 UniformScalar_7 : register(c5); // float
float4 UniformScalar_8 : register(c6); // float
float4 UniformScalar_9 : register(c7); // float
sampler2D Texture2D_3 : register(s0);

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

    ps = -r4.w;
    r2.xy = r0.wz * 3.0;
    ps = UniformScalar_8.x + ps;
    r2.z = float((UniformScalar_7.x >= 1.0));
    r2.w = ps;
    r2.z = r2.w * r2.z;
    r2.xyz = r4.www * float3(1.0, 0.16, -0.8) + r2.zxy;
    r2.y = tex2D(Texture2D_3, r2.yz).z;
    r3.xy = r1.xy * IndividualVelocityScale.xy;
    r2.x = -r2.x + r4.z;
    r2.x = max(r2.x, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_0.x;
    r2.x = min(r2.x, 1.0);
    r2.z = ps;
    ps = r2.y;
    r2.x = saturate(r2.x * r2.z);
    ps = r4.w * ps;
    r3.w = -r2.x + 1.0;
    r3.z = ps;
    r2.xyz = r3.zxy * r3.wxy;
    ps = r2.y + r2.z;
    r2.x = float((r2.x >= 0.05));
    r2.y = ps;
    r2.y = max(r2.y, 1.0);
    ps = rsqrt(abs(r2.y));
    r2.x = -r2.x + 1.0;
    r2.y = ps;
    r2.z = (UniformScalar_1.x > 0.0) ? r2.x : 1.0;
    r2.x = (UniformScalar_1.x >= 0.0) ? r2.z : r2.x;
    ps = (-0.5) - -r2.x;
    r3.xy = r3.xy * r2.yy;
    r2.y = ps;
    ps = abs(r3.x);
    r2.zw = float2((r3.xy > 0.0));
    r2.x = saturate(ps);
    ps = abs(r3.y);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.yyyy)) clip(-1.0);
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
