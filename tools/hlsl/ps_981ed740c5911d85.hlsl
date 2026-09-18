// ps_981ed740c5911d85.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10000800 00000004 00000000 00002042 00030003 00000001 0000F050 0000F151
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 BloomScale : register(c5); // float
float4 MinMaxBlurClamp : register(c4); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 PackedParameters : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);

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
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.x = tex2D(SceneDepthTexture, r1.wz).x;
    r4.y = tex2D(SceneDepthTexture, r1.xy).x;
    r4.z = tex2D(SceneDepthTexture, r0.xy).x;
    r4.w = tex2D(SceneDepthTexture, r0.wz).x;
    r5.xyz = tex2D(SceneColorTexture, r0.wz).xyz;
    r6.xyz = tex2D(SceneColorTexture, r0.xy).xyz;
    r3.xyz = tex2D(SceneColorTexture, r1.xy).xyz;
    r1.xyz = tex2D(SceneColorTexture, r1.wz).xyz;
    r0.yzw = float3((r1.zyx > 1.0));
    r2.xyz = float3((r3.zyx > 1.0));
    r7.xyz = float3((r6.xyz > 1.0));
    r8.xyz = float3((r5.xyz > 1.0));
    r4 = r4 * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r0.x = xe_max4(r8.xyzx);
    r1.w = xe_max4(r7.xyzx);
    r2.x = xe_max4(r2.zyxz);
    r0.y = xe_max4(r0.wzyw);
    r0.yzw = (r0.yyy == 0.0) ? 0.0 : r1.xyz;
    r2.xyz = (r2.xxx == 0.0) ? 0.0 : r3.xyz;
    r8.xyz = (r1.www == 0.0) ? 0.0 : r6.xyz;
    r7.xyz = (r0.xxx == 0.0) ? 0.0 : r5.xyz;
    r7.xyz = r8.xyz + r7.xyz;
    r6.w = 1.0 / r4.z;
    r2.yzw = r7.xyz + r2.xyz;
    r5.w = 1.0 / r4.w;
    r5 = r6 + r5;
    r3.w = 1.0 / r4.y;
    r3 = r5 + r3;
    r1.w = 1.0 / r4.x;
    r1 = r3 + r1;
    r1 = r1 * 0.25;
    r0.x = -PackedParameters.x - -r1.w;
    r2.x = (-r0.x > 0.0) ? MinMaxBlurClamp.x : MinMaxBlurClamp.y;
    r0.x = saturate(abs(r0.x) * PackedParameters.y);
    r2.yzw = r2.yzw + r0.yzw;
    r0.x = log2(r0.x);
    ps = PackedParameters.z * r0.x;
    r0.y = BloomScale.x * 0.25;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.yyy * r2.yzw;
    r0.w = ps;
    r0.w = min(r2.x, r0.w);
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0 = r0 * 0.5;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
