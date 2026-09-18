// ps_cbaf1a77d60cac0b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r7 = 0.0;
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
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.w = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r8.xy = r7.xy * 0.875;
    r0.w = saturate(ps);
    r7.xyz = r0.xyz * 2.0 - 1.0;
    ps = 5.0 * r5.z;
    r11.xyz = r10.zzz * UniformVector_3.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r0.xyz = -r4.xyz + r12.xyz;
    r5.z = ps;
    r0.xyz = r0.xyz * UniformScalar_0.xxx + r4.xyz;
    ps = rsqrt(abs(r5.y));
    r4.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r2.yzw = r5.yyy * r1.xyz;
    r1.x = ps;
    r5.yzw = r10.yyy * UniformVector_2.xyz + r11.xyz;
    ps = log2(r0.w);
    r5.x = dot(r7.zxy, r7.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r5.x = ps;
    r5.yzw = r10.xxx * UniformVector_1.xyz + r5.yzw;
    r1.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    r3.xy = r8.xy * r1.xy + 0.125;
    r5.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r5.yzw;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r1.xyz = r7.xyz * r5.xxx;
    r1.w = ps;
    ps = -ModShadowColor.x;
    r6.w = saturate(dot(r1.zxy, r2.wyz));
    ps = 1.0 + ps;
    r5.x = dot(r1.zxy, r4.zxy);
    r2.x = ps;
    r5.yzw = (-abs(r1.www) >= 0.0) ? 1.0 : r5.yzw;
    ps = UniformScalar_5.x * r5.y;
    r7.xyz = r1.xzy * r5.xxx;
    r8.x = ps;
    ps = UniformScalar_5.x * r5.z;
    r1.xyz = r0.xyz * r5.yzw;
    r8.y = ps;
    ps = UniformScalar_5.x * r5.w;
    r1.xyz = r1.xyz * r9.xyz;
    r8.z = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r8.xyz * r0.xyz;
    r5.xyz = r7.xyz * 2.0 - r4.xzy;
    ps = 1.0 + ps;
    r3.w = saturate(dot(r2.wyz, r5.yxz));
    r2.y = ps;
    ps = -ModShadowColor.z;
    r3.z = r3.w * r3.w;
    ps = 1.0 + ps;
    r5.xw = r3.xz * r3.yw;
    r2.z = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xyz * r5.www;
    r5.w = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
