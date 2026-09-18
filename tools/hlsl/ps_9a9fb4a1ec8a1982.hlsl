// ps_9a9fb4a1ec8a1982.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040C00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_5 : register(s2);
sampler2D Texture2D_6 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r8.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyw = tex2D(Texture2D_5, r0.xy).xzy;
    r6.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    ps = r1.z;
    r7.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.w;
    r0.w = dot(r1.zxy, r1.zxy);
    r6.x = saturate(ps);
    ps = 0.4 * r6.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = 0.4 * r6.z;
    r0.xyz = r0.xyz * r9.xwy;
    r4.y = ps;
    r12.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r5.x = saturate(r5.x * 5.0);
    r0.w = ps;
    ps = rsqrt(abs(r7.w));
    r8.xyz = r0.www * r1.xyz;
    r7.w = ps;
    ps = 0.875 * r5.y;
    r11.xyz = r7.www * r3.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r5.w));
    r7.w = dot(r12.zxy, r12.zxy);
    r5.w = ps;
    ps = 0.875 * r5.z;
    r3.xyz = r5.www * -SpotDirection.xyz;
    r1.y = ps;
    ps = 1.0 - r5.x;
    r5.y = dot(r3.zxy, r2.zxy);
    r5.x = ps;
    r5.xz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.zw = r1.xy * r5.xz + 0.125;
    ps = rsqrt(abs(r7.w));
    r5.x = r5.y - SpotAngles.x;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r3.xyz = r12.xyz * r5.yyy;
    r5.y = saturate(ps);
    ps = log2(abs(r9.y));
    r5.x = dot(r3.zxy, r11.zxy);
    r1.y = ps;
    ps = log2(abs(r9.x));
    r12.xyz = r3.xzy * r5.xxx;
    r1.z = ps;
    r9.xyz = r12.xyz * 2.0 - r11.xzy;
    ps = log2(abs(r9.w));
    r5.xw = r5.zy * r5.wy;
    r1.w = ps;
    r5.xyz = r5.xxx * r10.xyz + ModShadowColor.xyz;
    ps = log2(r6.x);
    r7.w = saturate(dot(r8.zxy, r9.yxz));
    r6.x = ps;
    ps = log2(r7.w);
    r6.x = r6.x * LightColorAndFalloffExponent.w;
    r1.x = ps;
    ps = pow(2.0, r6.x);
    r1 = r1 * float4(2e+01, 0.3, 0.3, 0.3);
    r6.x = ps;
    ps = pow(2.0, r1.z);
    r7.xyz = r7.xyz * r2.www;
    r2.x = ps;
    ps = pow(2.0, r1.w);
    r7.xyz = r7.xyz * r6.xxx;
    r2.y = ps;
    ps = pow(2.0, r1.y);
    r7.w = saturate(dot(r3.zxy, r8.zxy));
    r2.z = ps;
    ps = 0.4 * r6.w;
    r2.xyz = saturate(r2.xyz - 0.2);
    r4.z = ps;
    ps = pow(2.0, r1.x);
    r6.yzw = r4.xyz * r2.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r7.ww + r6.xy;
    r6.z = r0.z * r7.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
