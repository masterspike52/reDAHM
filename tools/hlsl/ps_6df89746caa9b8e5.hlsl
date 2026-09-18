// ps_6df89746caa9b8e5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.z = 1.0 / r4.w;
    r6.zw = r0.xy * UniformVector_1.xy;
    r8.x = ScreenPositionScaleBias.x * r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r6.xy * abs(r7.xy);
    r8.y = ScreenPositionScaleBias.y * r5.z;
    r5.zw = r8.xy * r4.xy + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(Texture2D_3, r6.zw).xyz;
    r12.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r7.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r5.w = tex2D(Texture2D_2, r0.xy).x;
    r4.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r7.w = r6.z + r6.z;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.z = saturate(5.0 * r5.y);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = 4.0 * r6.x;
    r8.zw = r8.yz * 0.875;
    r8.y = 4.0 * r6.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r10.x = r4.x + r4.x;
    r7.xyz = r7.xyz + r7.xyz;
    r10.y = r4.y + r4.y;
    ps = r4.w + r4.w;
    r4.xyz = r12.xyz * r2.www;
    r10.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.z = -r5.z + 1.0;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r2.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7 = r7.xzyw - 1.0;
    r5.z = ps;
    ps = UniformVector_2.x * r5.w;
    r6.xyz = -r5.yzw + 1.0;
    r1.x = ps;
    ps = UniformVector_2.y * r5.w;
    r8.zw = r8.zw * r6.xy;
    r1.y = ps;
    ps = UniformVector_2.z * r5.w;
    r6.xyz = r6.zzz * r11.xyz;
    r1.z = ps;
    r6.xyz = r1.xyz * r11.xyz + r6.xyz;
    r1.xyz = r6.xyz * r10.xyz - r6.xyz;
    ps = r7.w - r7.y;
    r8 = r8 + float4(-2.0, -2.0, 0.125, 0.125);
    r1.w = ps;
    ps = r8.z * r8.w;
    r8.xy = r8.xy - r7.xz;
    r5.y = ps;
    r5.yzw = r5.yyy * r9.xyz + ModShadowColor.xyz;
    r8.xy = r8.xy * UniformScalar_2.xx + r7.xz;
    r8.z = r1.w * UniformScalar_2.x + r7.y;
    r1.xyz = r1.xyz * UniformScalar_2.xxx + r6.xyz;
    r6.yzw = r1.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r0.x));
    r6.x = dot(r8.zxy, r8.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r0.xxx * r3.xyz;
    r6.x = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r8.xyz * r6.xxx;
    r6.x = saturate(ps);
    ps = log2(r6.x);
    r5.x = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = r6.x * LightColorAndFalloffExponent.w;
    r5.x = ps;
    ps = UniformScalar_5.x;
    r3.xyz = r3.xyz * r5.xxx;
    r9.x = ps;
    ps = 0.0001;
    r5.x = dot(r3.zxy, r7.zxy);
    r9.y = ps;
    ps = max(r9.x, r9.y);
    r8.xyz = r3.xyz * r5.xxx;
    r4.w = ps;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    ps = pow(2.0, r6.x);
    r5.x = saturate(dot(r2.zxy, r7.zxy));
    r0.x = ps;
    ps = log2(r5.x);
    r1.xyz = r1.zxy * r0.wyz;
    r0.y = ps;
    r0 = r4.xzyw * r0.xxxy;
    ps = pow(2.0, r0.w);
    r5.x = saturate(dot(r3.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.yz * r5.xx + r6.xy;
    r6.z = r1.x * r5.x + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
