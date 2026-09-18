// ps_bb0dc1435ea1cf57.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F156 00007257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r4.w;
    r3.xy = r0.wz * 3.0;
    ps = UniformScalar_8.x + ps;
    r3.z = float((UniformScalar_7.x >= 1.0));
    r3.w = ps;
    r3.z = r3.w * r3.z;
    r3.xyz = r4.www * float3(1.0, 0.16, -0.8) + r3.zxy;
    r3.y = tex2D(Texture2D_3, r3.yz).z;
    r3.x = -r3.x + r4.z;
    r3.x = max(r3.x, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r3.x = min(r3.x, 1.0);
    r3.z = ps;
    ps = r3.y;
    r3.x = saturate(r3.x * r3.z);
    ps = r4.w * ps;
    r3.x = -r3.x + 1.0;
    r3.y = ps;
    r3.x = r3.y * r3.x;
    r3.x = float((r3.x >= 0.05));
    ps = 1.0 - r3.x;
    r3.x = ps;
    r3.y = (UniformScalar_0.x > 0.0) ? r3.x : 1.0;
    r3.x = (UniformScalar_0.x >= 0.0) ? r3.y : r3.x;
    ps = (-0.5) - -r3.x;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    ps = r1.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
