// ps_39d1fba3a79935dc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10000400 00000004 00000000 00003484 000F000F 00000021 00003050 0000F151 0000F255 00007356
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy + UniformVector_7.xy;
    r1.xz = r0.yx - 0.5;
    r1.y = dot(r1.xz, UniformVector_3.yx) + 0.5;
    r1.x = dot(r1.xz, UniformVector_2.yx) + 0.5;
    r1.y = tex2D(Texture2D_0, r1.xy).x;
    r1.zw = tex2D(Texture2D_2, r0.zw).xy;
    r4.zw = r0.xy * 4.0 + UniformVector_4.xy;
    ps = 1.0 / r2.w;
    r0.y = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.xz = r0.xx * ScreenPositionScaleBias.xy;
    r0.y = ps;
    r4.xy = r0.zx * r2.yx + ScreenPositionScaleBias.zw;
    r0.x = saturate(r0.y * r3.z);
    ps = log2(r0.x);
    r3.yz = r0.yy * r3.yx;
    r1.x = ps;
    r0.xyz = r1.ywx * float3(0.29999998, 1.2e+02, 0.02);
    ps = (-0.002) + r0.x;
    r3.x = UniformVector_6.x * 3e+01;
    r0.x = ps;
    r3.yz = r3.zy * r0.xx + r4.zw;
    r0.w = tex2D(SceneDepthTexture, r4.yx).x;
    r0.x = tex2D(Texture2D_1, r3.yz).x;
    r1.x = r3.x * r1.z;
    r0.w = r0.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.w;
    r1.y = r1.x * 4.0;
    r0.w = ps;
    ps = pow(2.0, r0.z);
    r1.z = r0.y * UniformVector_6.y;
    r0.y = ps;
    ps = 0.01 + r0.x;
    r0.y = -r0.y + 1.0;
    r1.x = ps;
    ps = UniformVector_1.x * r0.y;
    r0.xz = max(r1.yz, (-255.0));
    r0.y = ps;
    r1.z = r1.x * UniformVector_5.x - r0.y;
    ps = r0.w;
    r1.xy = min(r0.xz, 255.0);
    ps = -r2.w + ps;
    r1.xyz = r1.xyz * float3(0.003921569, 0.003921569, 0.5);
    r0.x = ps;
    ps = r0.y;
    r1.w = float((r0.w != 1.0));
    ps = r1.z + ps;
    r0.zw = min(r1.xy, 0.0);
    r0.y = ps;
    ps = 0.002 * r0.x;
    r0.y = r0.y * UniformVector_6.x;
    r0.x = saturate(ps);
    r0.x = r0.y * r0.x;
    r0.y = (r1.w == 0.0) ? r0.y : r0.x;
    ps = (-0.003921569) - -r0.y;
    r0.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    oC0.zw = abs(r0.zw);
    oC0.xy = max(r1.xy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
