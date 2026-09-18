// ps_dad31d8bbeec42c4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
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
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.yzw = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.z;
    r1.w = float((UniformScalar_0.x > UniformScalar_1.x));
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = 1.0 - r5.z;
    r3.w = dot(r3.zxy, r3.zxy);
    r0.w = saturate(ps);
    ps = 0.875 * r5.x;
    r4.x = dot(r1.zxy, r1.zxy);
    r9.x = ps;
    ps = 0.875 * r5.y;
    r10.xyz = r9.yzw * r2.www;
    r9.y = ps;
    r14.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.x));
    r13.xyz = r12.xyz * r4.yzw;
    r5.x = ps;
    ps = rsqrt(abs(r3.w));
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = 5.0 * r5.w;
    r7.xzw = r5.xxx * r3.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r3.xyz = r14.xyz - r11.xyz;
    r5.y = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r12.xyz : r13.xyz;
    ps = 1.0 - r5.x;
    r13.xyz = r5.yyy * -SpotDirection.xyz;
    r5.z = ps;
    ps = log2(r0.w);
    r5.y = dot(r13.zxy, r2.zxy);
    r5.x = ps;
    r1.xyz = (-abs(r6.www) >= 0.0) ? r12.xyz : r1.xyz;
    r3.xyz = r3.xyz * UniformScalar_0.xxx + r11.xyz;
    r5.zw = -r5.zz * ModShadowGroupColor.xy + 1.0;
    r2.xy = r9.xy * r5.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r9.xyz = r1.xyz - r8.xyz;
    r5.x = ps;
    ps = UniformScalar_7.x;
    r1.xyz = r10.xzy * r5.xxx;
    r5.z = ps;
    r8.xyz = r9.xyz * UniformScalar_0.xxx + r8.xyz;
    ps = rsqrt(abs(r6.w));
    r5.w = r2.x * r2.y;
    r5.x = ps;
    r6.xyz = r5.www * r6.xyz + ModShadowColor.xyz;
    r2.xyz = r8.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = 0.0001;
    r3.xyz = r3.xyz * r5.xxx;
    r5.w = ps;
    ps = max(r5.z, r5.w);
    r5.x = dot(r3.zxy, r7.wxz);
    r7.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r9.xyz = r3.xzy * r5.xxx;
    r5.x = ps;
    r5.yzw = r9.xyz * 2.0 - r7.xwz;
    ps = SpotAngles.y * r5.x;
    r5.y = saturate(dot(r4.zxy, r5.zyw));
    r7.x = saturate(ps);
    ps = log2(r5.y);
    r0.xyz = r8.xyz * r0.xyz;
    r7.z = ps;
    r5.xy = r7.xy * r7.xz;
    ps = pow(2.0, r5.y);
    r6.w = saturate(dot(r3.zxy, r4.zxy));
    r5.z = ps;
    r5.yzw = r2.xyz * r5.zzz;
    r0.xy = r0.xy * r6.ww + r5.yz;
    r0.z = r0.z * r6.w + r5.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xzy * r5.xxx;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
