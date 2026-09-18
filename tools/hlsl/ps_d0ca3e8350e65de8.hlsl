// ps_d0ca3e8350e65de8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10040800 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_3 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.w = r1.z + 0.1;
    r5.x = 1.0 / r4.w;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r8.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = saturate(1.0 - r5.z);
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = 0.875 * r5.x;
    r6.xyz = r6.xyz * r2.www;
    r0.y = 0.875 * r5.y;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.w * 5.0);
    r5.x = ps;
    ps = 1.0 - r5.y;
    r1.xyz = r3.xyz * r1.xyz;
    r5.w = ps;
    ps = log2(r6.w);
    r3.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = dot(r3.zxy, r2.zxy);
    r5.y = ps;
    r5.xw = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r0.yz = r0.xy * r5.xw + 0.125;
    ps = pow(2.0, r5.y);
    r5.x = r5.z - SpotAngles.x;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r5.yzw = r1.xyz * r5.yyy;
    r0.x = saturate(ps);
    ps = r0.x * r0.x;
    r5.xzw = r6.xyz * r5.yzw;
    r5.y = ps;
    ps = r0.y * r0.z;
    r6.xyz = r5.xzw * LightColorAndFalloffExponent.xyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
