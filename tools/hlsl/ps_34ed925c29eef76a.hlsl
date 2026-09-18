// ps_34ed925c29eef76a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r6.xy = r0.xy * UniformVector_1.xy;
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r5.xy = r5.xy * abs(r7.xy);
    r6.w = ps;
    r5.zw = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r5.w = tex2D(Texture2D_2, r0.xy).x;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = -ModShadowColor.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = -ModShadowColor.y;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = r1.z + 0.1;
    r6.y = ps;
    ps = r9.z + r9.z;
    r6.z = dot(r2.zxy, r2.zxy);
    r13.w = ps;
    ps = 5.0 * r5.x;
    r10.xy = r9.xy * 4.0;
    r5.x = saturate(ps);
    ps = 0.875 * r5.y;
    r7.xyz = r7.xyz + r7.xyz;
    r10.z = ps;
    ps = 0.875 * r5.z;
    r13.xyz = r8.xyz + r8.xyz;
    r10.w = ps;
    ps = UniformVector_2.x * r5.w;
    r9.xyz = r4.xyz * r2.www;
    r12.x = ps;
    ps = rsqrt(abs(r0.w));
    r5.y = saturate(-r6.z + 1.0);
    r5.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r5.zzz * r1.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r6.z));
    r8.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = log2(r5.y);
    r3.xyz = r5.zzz * -SpotDirection.xyz;
    r5.y = ps;
    ps = 1.0 - r5.w;
    r1 = r13 - 1.0;
    r6.w = ps;
    ps = 1.0 - r5.x;
    r5.z = dot(r3.zxy, r2.zxy);
    r6.z = ps;
    ps = UniformVector_2.y * r5.w;
    r2.xyz = r6.www * r11.xyz;
    r12.y = ps;
    r6.zw = -r6.zz * ModShadowGroupColor.xy + 1.0;
    ps = UniformVector_2.z * r5.w;
    r10.zw = r10.zw * r6.zw;
    r12.z = ps;
    r3.xyz = r12.xyz * r11.xyz + r2.xyz;
    r7.xyz = r3.xyz * r7.xyz - r3.xyz;
    ps = r1.w - r1.z;
    r2 = r10 + float4(-2.0, -2.0, 0.125, 0.125);
    r7.w = ps;
    r1.z = r7.w * UniformScalar_2.x + r1.z;
    ps = -ModShadowColor.z;
    r5.xw = r2.xy - r1.xy;
    r7.xyz = r7.xyz * UniformScalar_2.xxx + r3.xyz;
    ps = 1.0 + ps;
    r6.w = r2.z * r2.w;
    r6.z = ps;
    r6.xyz = r6.www * r6.xyz + ModShadowColor.xyz;
    r2.xyz = r7.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r1.xy = r5.xw * UniformScalar_2.xx + r1.xy;
    ps = -SpotAngles.x - -r5.z;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r5.x * SpotAngles.y);
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r3.xyz = r1.xyz * r5.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.y = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r9.xzy * r5.zzz;
    r5.y = ps;
    r3.xyz = r3.xyz * r5.yyy;
    ps = UniformScalar_5.x;
    r5.y = dot(r3.zxy, r8.zxy);
    r5.z = ps;
    ps = 0.0001;
    r9.xyz = r3.xyz * r5.yyy;
    r5.w = ps;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = max(r5.z, r5.w);
    r5.y = saturate(dot(r4.zxy, r8.zxy));
    r5.z = ps;
    ps = log2(r5.y);
    r0.xyz = r7.xyz * r0.xyz;
    r5.w = ps;
    r5.xy = r5.xz * r5.xw;
    ps = pow(2.0, r5.y);
    r6.w = saturate(dot(r3.zyx, r4.zyx));
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
