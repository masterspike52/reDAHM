// ps_1c88a5bfd8396e08.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10040D00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r6.y = ps;
    ps = r8.w;
    r6.zw = r0.xy * UniformScalar_7.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = UniformScalar_6.x - UniformScalar_5.x;
    r6.x = ps;
    ps = (-0.5) + r5.x;
    r6.xy = r6.xy * abs(r7.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.x = tex2D(Texture2D_4, r6.zw).x;
    r9.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.xyz = tex2D(Texture2D_0, r5.yz).xyw;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = r0.z;
    r5.x = -UniformScalar_5.x + 1.0;
    r5.z = saturate(ps);
    ps = r1.z;
    r6.xy = r0.wz * UniformVector_4.xy;
    ps = 0.1 + ps;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    r7.z = r7.z * 2.0 - 1.0;
    r11.xy = r12.xy * 2.0 - 1.0;
    r7.xy = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r13.y = saturate(r6.z * 5.0);
    r5.y = ps;
    ps = 1.0 / r5.w;
    r5.z = r5.x - r5.z;
    r5.x = ps;
    ps = r5.z;
    r3.w = dot(r3.zxy, r3.zxy);
    ps = r5.x * ps;
    r10.xyz = r5.yyy * r1.xyz;
    r13.x = saturate(ps);
    ps = r4.w;
    r6.zw = -r13.xy + 1.0;
    ps = 0.0001 * ps;
    r5.yz = r6.ww * ModShadowGroupColor.xy;
    r5.x = saturate(ps);
    r5.xyz = -r5.yxz + 1.0;
    ps = UniformScalar_1.x * r5.y;
    r5.w = ps;
    r7.xy = r5.ww * r11.xy + r7.xy;
    r7.xyz = r7.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r3.w));
    r1.w = dot(r7.zxy, r7.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.w));
    r1.xyz = r1.xxx * r3.xyz;
    r1.w = ps;
    r11.xyz = r7.xyz * r1.www;
    r1.w = dot(r11.zxy, r1.zxy);
    r3.xyz = r11.xzy * r1.www;
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    r1.x = saturate(dot(r10.zxy, r1.yxz));
    ps = log2(r1.x);
    r7.zw = r4.xy * ScreenPositionScaleBias.xy;
    r9.y = ps;
    r1.xyw = r9.zwy * float3(0.875, 0.875, 15.0);
    r9.yz = r1.xy * r5.xz;
    r9.xyz = r9.xyz + float3(0.5, 0.125, 0.125);
    r12.w = r6.z * r9.x;
    ps = 1.0 / r4.w;
    r7.xy = r12.zw + float2(-1.0, -0.5);
    r5.x = ps;
    r6.zw = r7.zw * r5.xx + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    ps = UniformVector_3.x * UniformVector_3.w;
    r6.w = float((UniformScalar_10.x >= 1.0));
    r4.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = 1.0 - r5.x;
    r0.x = float((UniformScalar_10.x > 1.0));
    r5.x = saturate(ps);
    r6.xyz = (-abs(r0.xxx) >= 0.0) ? r6.xyz : 1.0;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r6.xyz;
    ps = log2(r5.x);
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.yzw = r13.xxx * r8.xyz;
    r4.z = ps;
    r8.xyz = r12.xyz * r8.xyz - r0.yzw;
    ps = -UniformVector_0.x;
    r6.w = saturate(dot(r11.zxy, r10.zxy));
    ps = 1.0 + ps;
    r2.w = r9.y * r9.z;
    r0.x = ps;
    r6.xyz = r2.www * r6.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.y;
    r2.w = saturate(r7.y * 5.0000005);
    r0.yzw = r2.www * r8.xyz + r0.yzw;
    r5.y = r7.x * r5.y + 1.0;
    r5.y = (r5.w > 0.0) ? r5.y : 1.0;
    ps = 1.0 + ps;
    r4.xyz = r4.xyz * r0.yzw;
    r0.y = ps;
    ps = -UniformVector_0.z;
    r2.xyz = r4.xyz * r2.xyz;
    r5.y = (r5.w >= 0.0) ? r5.y : 1.0;
    ps = 1.0 + ps;
    r2.xyz = r2.xyz * r5.yyy;
    r0.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r2.xyz * r0.xyz;
    r5.x = ps;
    ps = pow(2.0, r1.w);
    r3.xyz = -r2.xyz + r3.xyz;
    r5.y = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = pow(2.0, r5.x);
    r5.yzw = r2.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.ww + r5.yz;
    r5.w = r0.z * r6.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r1.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
