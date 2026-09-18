// ps_4fae5eafc8e0eda7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040C00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.wz * 0.5;
    r0.zw = tex2D(Texture2D_0, r6.xy).xy;
    r6.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r8 = tex2D(Texture2D_2, r1.xy);
    ps = 0.1 - -r2.z;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = float((r8.w >= 0.5));
    r7.z = ps;
    r6.xyz = r6.yzw * 2.0 - 1.0;
    r0.zw = r0.zw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xw = r0.zw * 0.012;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r0.zw = r7.zw * abs(r9.xy);
    r7.z = ps;
    r12.xy = r6.xy * UniformVector_2.xy - r10.xw;
    r1.xy = r12.zw * r7.zz + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r9.w = tex2D(ShadowTexture, r0.xy).x;
    r10.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r4.zxy, r4.zxy);
    r7.w = dot(r2.zxy, r2.zxy);
    r6.w = dot(r3.zxy, r3.zxy);
    ps = r5.w;
    r9.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = 0.0001 * ps;
    r8.yzw = r9.zxy * r8.zxy;
    r9.x = saturate(ps);
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(-r6.w + 1.0);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r7.www * r2.xyz;
    r6.y = ps;
    r8.x = r6.z * UniformVector_2.z - 1.0;
    ps = log2(r6.x);
    r5.xyz = r6.yyy * -SpotDirection.xyz;
    r6.x = ps;
    ps = UniformScalar_1.x * r7.y;
    r6.zw = -r7.yx + 1.0;
    r7.w = ps;
    ps = rsqrt(abs(r0.w));
    r6.y = dot(r5.zxy, r3.zxy);
    r0.w = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r11.xyz = r0.www * r4.xyz;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r5 = r8.zwxy * r7.yyyy;
    r9.z = ps;
    r8.xyz = r6.zzz * UniformVector_3.xyz + r7.www;
    r8.xyz = r5.xyw * UniformScalar_2.xxx + r8.xyz;
    r6.zw = r12.xy * r7.yy + r10.xw;
    ps = -UniformVector_0.x;
    r4.xyz = -r9.xyz + 1.0;
    ps = 1.0 + ps;
    r7.yz = r6.zw * r4.xx;
    r7.x = ps;
    r7.w = r5.z * r4.x + 1.0;
    r7.yzw = (r4.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r4.xxx >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = -SpotAngles.x - -r6.y;
    r6.z = dot(r7.wyz, r7.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r9.z = saturate(r6.y * SpotAngles.y);
    r6.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r7.yzw * r6.yyy;
    ps = 1.0 + ps;
    r6.y = dot(r3.zxy, r11.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r6.yzw = r3.xzy * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r11.xzy;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r2.zxy, r6.zyw));
    r7.z = ps;
    ps = log2(r6.y);
    r7.yzw = r5.xyw * r7.xyz;
    r10.x = ps;
    r6.yzw = r10.xyz * float3(15.0, 0.875, 0.875);
    r9.xy = r6.zw * r4.yz + 0.125;
    ps = pow(2.0, r6.y);
    r7.x = saturate(dot(r3.zxy, r2.zxy));
    r6.y = ps;
    r6.yzw = r8.xyz * r6.yyy;
    r8.xy = r7.yz * r7.xx + r6.yz;
    r8.z = r7.w * r7.x + r6.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xyz = r9.wxz * r9.wyz;
    r6.w = ps;
    r6.xyz = r7.yyy * r0.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r0.xyz = r7.xxx * r1.xyz;
    r6.w = ps;
    r0.xyz = r0.xzy * r6.www;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.zzz;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
