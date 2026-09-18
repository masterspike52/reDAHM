// ps_7cc09409155a5f78.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10000400 00000004 00000000 00003884 000F000F 00000001 00003050 0000F151 0000F252 0000F353
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FogDistanceScale : register(c3); // float4
float4 FogExtinctionDistance : register(c4); // float4
float4 FogInScattering[4] : register(c5); // float3[4]
float4 FogStartDistance : register(c9); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
sampler2D SceneDepthTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.x = tex2D(SceneDepthTexture, r0.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r4.x = ps;
    ps = r4.x;
    r0 = r4.xxxx - FogStartDistance.wzyx;
    ps = r1.z * ps;
    r4 = max(r0, 0.0);
    r0.x = ps;
    r0.y = float((0.001 >= abs(r0.x)));
    r0.w = (-abs(r0.y) >= 0.0) ? r0.x : 0.001;
    ps = 1.0 / r0.w;
    r0.xyz = r4.xyz * FogDistanceScale.wzy;
    r0.w = ps;
    r3 = saturate(r0.wwww * r3.wzyx);
    r1 = saturate(r0.wwww * r2.wzyx);
    r1 = r3 - r1;
    r0.xyw = r0.xyz * abs(r1.xyz);
    ps = pow(2.0, r0.x);
    r0.z = abs(r1.w) * FogDistanceScale.x;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1 = abs(r1) * r4;
    r0.y = ps;
    ps = pow(2.0, r0.w);
    r0.z = r0.z * r4.w;
    r0.w = ps;
    ps = pow(2.0, r0.z);
    r1 = float4((FogExtinctionDistance.wzyx > r1));
    r0.z = ps;
    r0 = r1.xywz * r0;
    ps = r0.x * r0.y;
    r1 = r0.wyzx - 1.0;
    r3.x = ps;
    ps = r0.x;
    r3.y = r3.x * r0.w;
    ps = r1.y * ps;
    r0.xy = r3.xy * r1.xz;
    r2.w = ps;
    ps = r3.y;
    r2.xyz = r0.yyy * FogInScattering[0].xyz;
    r2.xyz = r0.xxx * FogInScattering[1].xzy + r2.xzy;
    r1.xyz = r2.www * FogInScattering[2].xzy + r2.xyz;
    r1.xyz = r1.www * FogInScattering[3].xzy + r1.xyz;
    ps = r0.z * ps;
    oC0.xyz = r1.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
