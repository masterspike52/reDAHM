// ps_2816a4f9f708c3f4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r8.xy = r0.xy * UniformVector_1.xy;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r5.xy = r5.xy * abs(r7.xy);
    r8.w = ps;
    r4.xy = r8.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r8.xy).xyz;
    r12.z = tex2D(Texture2D_2, r0.xy).x;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r8.xy).xyz;
    r0.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = max(UniformScalar_5.x, 0.0001);
    ps = r1.z;
    r5.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r8.yz = r5.xy * 0.875;
    r5.x = ps;
    r13.xyz = r11.xyz * 2.0 - 1.0;
    ps = r7.z + r7.z;
    r14.xy = r7.xy * 4.0;
    r14.z = ps;
    ps = rsqrt(abs(r6.w));
    r5.y = saturate(-r5.z + 1.0);
    r6.w = ps;
    ps = 5.0 * r5.x;
    r11.xyz = r12.zzz * UniformVector_2.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r7.xyz = r6.www * r1.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.xyz = r5.www * r3.xyz;
    r5.z = ps;
    ps = log2(r5.y);
    r12.xyw = r5.zzz * -SpotDirection.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r1.xyz = r14.xyz + float3(-2.0, -2.0, -1.0);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.w = dot(r12.wxy, r2.zxy);
    r12.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r1.xyz - r13.xyz;
    r12.y = ps;
    r2.xyz = r1.xyz * UniformScalar_2.xxx + r13.xyz;
    ps = r0.x + r0.x;
    r1.yzw = -r12.xzy + 1.0;
    r1.x = ps;
    r8.yz = r8.yz * r1.yw + 0.125;
    ps = r0.y + r0.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r1.y = ps;
    ps = r0.w + r0.w;
    r0.xyz = r1.zzz * r10.xyz;
    r1.z = ps;
    r0.xyz = r11.xyz * r10.xyz + r0.xyz;
    ps = rsqrt(abs(r5.x));
    r5.z = r8.y * r8.z;
    r5.x = ps;
    r6.xyz = r5.zzz * r6.xyz + ModShadowColor.xyz;
    r1.xyz = r0.xyz * r1.xyz - r0.xyz;
    r2.xyz = r2.xyz * r5.xxx;
    ps = -SpotAngles.x - -r5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    r1.xyz = r1.xyz * UniformScalar_2.xxx + r0.xyz;
    r0.xyz = r1.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r5.x));
    r8.y = saturate(r5.z * SpotAngles.y);
    r5.x = ps;
    r2.xyz = r2.xyz * r5.xxx;
    r5.x = dot(r2.zxy, r3.zxy);
    r5.xzw = r2.xzy * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r3.xzy;
    r5.x = saturate(dot(r7.zxy, r5.zxw));
    ps = log2(r5.x);
    r1.xyz = r1.zxy * r9.zxy;
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.xz = r8.xy * r8.zy;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zxy, r7.zxy));
    r6.w = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r0.xyz * r6.www;
    r5.y = ps;
    r0.xy = r1.yz * r5.ww + r0.xy;
    r0.z = r1.x * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.yyy;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xzy * r5.zzz;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
