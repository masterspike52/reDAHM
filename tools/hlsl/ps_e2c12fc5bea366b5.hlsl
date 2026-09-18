// ps_e2c12fc5bea366b5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000300 00000004 00000000 00001042 00030003 00000001 00003050 00003151
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinMaxBlurClamp : register(c4); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 PackedParameters : register(c3); // float4
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D BlurredImage : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;

    r3.xyz = tex2D(SceneColorTexture, r1.xy).xyz;
    r2 = tex2D(BlurredImage, r0.xy);
    r0.x = tex2D(SceneDepthTexture, r1.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r0.z = 1.0 / r0.x;
    r0.x = -PackedParameters.x - -r0.z;
    r0.y = (-r0.x > 0.0) ? MinMaxBlurClamp.x : MinMaxBlurClamp.y;
    r0.x = saturate(abs(r0.x) * PackedParameters.y);
    r0.x = log2(r0.x);
    r0.x = PackedParameters.z * r0.x;
    r0.x = pow(2.0, r0.x);
    r0.y = min(r0.y, r0.x);
    r0.y = saturate(1.0 - r0.y);
    r0.x = r2.w * 2.0 + r0.y;
    r1.xyz = r0.yyy * r3.xyz;
    r1.xyz = r2.xyz * 2.0 + r1.xyz;
    r0.x = max(r0.x, 0.001);
    r0.y = 1.0 / r0.x;
    r0.x = SCENE_COLOR_BIAS_FACTOR.x * r0.y;
    r0.xyw = r0.xxx * r1.xyz;
    oC0 = r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
