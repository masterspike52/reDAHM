// ps_6ff05e95718806d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.xyw = tex2D(Texture2D_0, r5.xy).xyw;
    r9.xw = r0.wz * UniformVector_3.xy;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = r4.w;
    r5.z = r1.z + 0.1;
    r11.yw = r5.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.x = saturate(r5.z * 5.0);
    r5.z = saturate(ps);
    ps = 1.0 / r4.w;
    r5.x = -r5.x + 1.0;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = -r5.xzy + 1.0;
    r6.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r7.xy = r6.xy * abs(r7.xy);
    r8.z = ps;
    r6.xy = r8.xy * r11.xx + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(Texture2D_2, r9.xw).xyz;
    r12.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r10.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r10.z = ps;
    r11.z = r12.z * 2.0 - 1.0;
    r9.xw = r12.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r0.w = saturate(-r0.w + 1.0);
    r1.w = ps;
    r2.xyz = r10.xzy * UniformVector_5.xzy - r10.xzy;
    r2.yzw = r2.xyz * r7.xxx + r10.xzy;
    ps = rsqrt(abs(r6.w));
    r10.xyz = r1.www * r1.xyz;
    r6.w = ps;
    r1.xyz = r6.www * r3.xyz;
    r11.xy = r8.zz * r11.yw + r9.xw;
    r3.xyz = r11.xyz * UniformVector_2.xyz;
    ps = log2(r0.w);
    r6.w = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r6.w = ps;
    r3.xyz = r3.xyz * r6.www;
    r6.w = dot(r3.zxy, r1.zxy);
    ps = -UniformVector_0.x;
    r11.xyz = r3.xzy * r6.www;
    r1.xyz = r11.xyz * 2.0 - r1.xzy;
    ps = 1.0 + ps;
    r1.y = saturate(dot(r10.zxy, r1.yxz));
    r1.x = ps;
    ps = log2(r1.y);
    r6.w = saturate(dot(r3.zxy, r10.zxy));
    r9.x = ps;
    ps = (-1.0) + r5.w;
    r3.yzw = r9.xyz * float3(15.0, 0.875, 0.875);
    r3.x = ps;
    r5.xyw = r3.zwx * r5.xzy + float3(0.125, 0.125, 1.0);
    r5.w = (r8.z > 0.0) ? r5.w : 1.0;
    ps = -UniformVector_0.y;
    r5.x = r5.x * r5.y;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r2.x = (r8.z >= 0.0) ? r5.w : 1.0;
    ps = 1.0 + ps;
    r0.xyz = r2.xwz * r7.xyz;
    r1.y = ps;
    ps = -UniformVector_0.z;
    r0.xyz = r0.xyz * r2.yxx;
    ps = 1.0 + ps;
    r0.xyz = r0.xyz * UniformScalar_5.xxx;
    r1.z = ps;
    r1.xyz = r0.xyz * r1.xyz;
    ps = pow(2.0, r3.y);
    r2.xyz = -r0.xyz + r4.xyz;
    r5.w = ps;
    r0.xyz = r2.xyz * UniformScalar_5.xxx + r0.xyz;
    r0.xyz = r0.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
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
