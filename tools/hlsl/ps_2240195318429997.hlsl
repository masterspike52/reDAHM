// ps_2240195318429997.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10000500 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
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
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xy = r0.xy + UniformVector_7.xy;
    r4.xy = r0.yx - 0.5;
    r3.w = dot(r4.xy, UniformVector_3.yx) + 0.5;
    r3.z = dot(r4.xy, UniformVector_2.yx) + 0.5;
    r4.y = tex2D(Texture2D_0, r3.zw).x;
    r4.zw = tex2D(Texture2D_2, r3.xy).xy;
    r0.yz = r0.xy * 4.0 + UniformVector_4.xy;
    ps = 1.0 / r1.w;
    r3.y = dot(r2.zxy, r2.zxy);
    r3.x = ps;
    ps = rsqrt(abs(r3.y));
    r3.xz = r3.xx * ScreenPositionScaleBias.xy;
    r3.y = ps;
    r5.xy = r3.zx * r1.yx + ScreenPositionScaleBias.zw;
    r3.x = saturate(r3.y * r2.z);
    ps = log2(r3.x);
    r2.xy = r3.yy * r2.yx;
    r4.x = ps;
    r3.xyz = r4.ywx * float3(0.29999998, 1.2e+02, 0.02);
    ps = (-0.002) + r3.x;
    r0.x = UniformVector_6.x * 3e+01;
    r3.x = ps;
    r0.yz = r2.yx * r3.xx + r0.yz;
    r3.w = tex2D(SceneDepthTexture, r5.yx).x;
    r3.x = tex2D(Texture2D_1, r0.yz).x;
    r4.x = r0.x * r4.z;
    r3.w = r3.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r3.w;
    r4.y = r4.x * 4.0;
    r3.w = ps;
    ps = pow(2.0, r3.z);
    r4.z = r3.y * UniformVector_6.y;
    r3.y = ps;
    ps = 0.01 + r3.x;
    r3.y = -r3.y + 1.0;
    r4.x = ps;
    ps = UniformVector_1.x * r3.y;
    r3.xz = max(r4.yz, (-255.0));
    r3.y = ps;
    r4.z = r4.x * UniformVector_5.x - r3.y;
    ps = r3.w;
    r4.xy = min(r3.xz, 255.0);
    ps = -r1.w + ps;
    r4.xyz = r4.xyz * float3(0.003921569, 0.003921569, 0.5);
    r3.x = ps;
    ps = r3.y;
    r4.w = float((r3.w != 1.0));
    ps = r4.z + ps;
    r3.zw = min(r4.xy, 0.0);
    r3.y = ps;
    ps = 0.002 * r3.x;
    r3.y = r3.y * UniformVector_6.x;
    r3.x = saturate(ps);
    r3.x = r3.y * r3.x;
    r3.y = (r4.w == 0.0) ? r3.y : r3.x;
    ps = (-0.003921569) - -r3.y;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    oC0.zw = abs(r3.zw);
    oC0.xy = max(r4.xy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
