// ps_ccfeb6a7634403d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10000500 00000004 00000000 00003484 000F000F 00000021 00003050 0000F151 0000F255 00007356
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_2 : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

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
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r2.w;
    r1.y = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r4 = r0.xxyy * float4(3.0, 0.08, 0.08, 3.0);
    r5.x = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r4.yz = r4.yz + UniformVector_2.xy;
    r5.y = ps;
    r0.zw = r5.yx * r2.yx + ScreenPositionScaleBias.zw;
    r4.x = tex2D(Texture2D_2, r4.xw).x;
    r4.w = tex2D(Texture2D_2, r0.xy).w;
    r0.w = tex2D(SceneDepthTexture, r0.wz).x;
    r0.z = tex2D(Texture2D_3, r4.yz).x;
    r4.y = r0.z * 0.2 - 0.005;
    ps = rsqrt(abs(r1.y));
    r0.z = ps;
    r1.y = r0.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r1.y;
    r0.zw = r0.zz * r3.xy;
    r1.y = ps;
    r3.w = float((r1.y != 1.0));
    r0.xy = r0.zw * r4.yy + r0.xy;
    r0.xy = r0.xy * 4.0;
    r0.xy = max(r0.xy, (-255.0));
    r4.yz = min(r0.xy, 255.0);
    r0.xzw = r4.wyz * float3(5.0, 0.003921569, 0.003921569);
    ps = r1.y;
    r3.xyz = min(r0.zwx, float3(0.0, 0.0, 1.0));
    ps = -r2.w + ps;
    r0.y = r3.z + r4.x;
    r0.x = ps;
    ps = 0.04 * r0.x;
    r0.y = r0.y * r1.x;
    r1.x = saturate(ps);
    r0.x = r0.y * r1.x;
    r0.y = (r3.w == 0.0) ? r0.y : r0.x;
    ps = (-0.003921569) - -r0.y;
    r0.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.yyyy)) clip(-1.0);
    oC0.zw = abs(r3.xy);
    oC0.xy = max(r0.zw, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
