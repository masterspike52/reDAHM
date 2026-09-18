// ps_139a653db5e4459a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.x = r1.z + 0.1;
    r5.y = 1.0 / r4.w;
    r6.xz = r5.yy * ScreenPositionScaleBias.xy;
    r5.z = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r1.zxy, r1.zxy);
    r5.y = 1.0 / ModShadowAccumResolution.x;
    r5.yz = r5.yz * abs(r7.xy);
    r6.xz = r6.xz * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r7.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r5.yz).xy;
    ps = 0.875 * r5.y;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r6.z = saturate(-r5.w + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.z = saturate(r6.w * r1.z);
    r5.w = ps;
    ps = 0.875 * r5.z;
    r0.xyw = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = 5.0 * r5.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r9.xyz = r6.www * r1.zxy;
    r5.x = ps;
    ps = log2(r6.z);
    r1.xyz = r5.xxx * r3.zxy;
    r5.x = ps;
    ps = -r1.y;
    r3.xyz = r5.www * -SpotDirection.xyz;
    r1.y = ps;
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.z;
    r5.y = dot(r3.zxy, r2.zxy);
    r1.z = ps;
    r5.zw = -r5.zz * ModShadowGroupColor.xy + 1.0;
    r6.yz = r6.xy * r5.zw + 0.125;
    ps = -SpotAngles.x - -r5.y;
    r5.w = saturate(dot(r9.yzx, r1.yzx));
    r5.z = ps;
    ps = SpotAngles.y * r5.z;
    r6.x = saturate(ps);
    ps = log2(r5.w);
    r6.xy = r6.xy * r6.xz;
    r7.x = ps;
    r5.yzw = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1 = r7 * float4(15.0, 3.0, 3.0, 3.0);
    r5.x = ps;
    ps = pow(2.0, r1.x);
    r0.xyw = r1.yzw * r0.xyw;
    r6.z = ps;
    ps = pow(2.0, r5.x);
    r6.yzw = r1.yzw * r6.zzz;
    r5.x = ps;
    r0.xy = r0.xy * r0.zz + r6.yz;
    r0.z = r0.w * r0.z + r6.w;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r5.xyz = r6.xzy * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
