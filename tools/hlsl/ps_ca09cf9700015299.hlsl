// ps_ca09cf9700015299.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040E00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
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
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r6.xy = r0.xy * UniformVector_1.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r3.zxy, r3.zxy);
    r8.y = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r8.xy = r8.xy * abs(r5.xy);
    r6.w = ps;
    r4.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r14.z = tex2D(Texture2D_2, r0.xy).x;
    r5.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = max(UniformScalar_5.x, 0.0001);
    ps = r1.z;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r13.xy = r0.xy * 0.875;
    r0.x = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = r5.z + r5.z;
    r14.xy = r5.xy * 4.0;
    r14.w = ps;
    ps = rsqrt(abs(r1.w));
    r0.y = saturate(-r0.z + 1.0);
    r1.w = ps;
    ps = 5.0 * r0.x;
    r11.xyz = r14.zzz * UniformVector_2.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r5.xyz = r1.www * r1.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r9.xyz = r0.www * r3.xyz;
    r0.z = ps;
    ps = log2(r0.y);
    r3.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r1.xyz = r14.xyw + float3(-2.0, -2.0, -1.0);
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.w = dot(r3.zxy, r2.zxy);
    r14.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.xyz = r1.xyz - r6.xyz;
    r14.y = ps;
    r6.xyz = r1.xyz * UniformScalar_2.xxx + r6.xyz;
    ps = r12.x + r12.x;
    r1.xyz = -r14.xyz + 1.0;
    r3.x = ps;
    r1.xy = r13.xy * r1.xy + 0.125;
    ps = r12.y + r12.y;
    r0.x = dot(r6.zxy, r6.zxy);
    r3.y = ps;
    ps = r12.z + r12.z;
    r2.xyz = r1.zzz * r10.xyz;
    r3.z = ps;
    r2.xyz = r11.xyz * r10.xyz + r2.xyz;
    ps = rsqrt(abs(r0.x));
    r0.z = r1.x * r1.y;
    r0.x = ps;
    r1.xyz = r0.zzz * r7.yzw + ModShadowColor.xyz;
    r3.xyz = r2.xyz * r3.xyz - r2.xyz;
    r6.xyz = r6.xyz * r0.xxx;
    ps = -SpotAngles.x - -r0.w;
    r0.x = dot(r6.zxy, r6.zxy);
    r0.z = ps;
    r3.xyz = r3.xyz * UniformScalar_2.xxx + r2.xyz;
    r2.xyz = r3.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r0.x));
    r7.y = saturate(r0.z * SpotAngles.y);
    r0.x = ps;
    r6.xyz = r6.xyz * r0.xxx;
    r0.x = dot(r6.zxy, r9.zxy);
    r0.xzw = r6.xzy * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r9.xzy;
    r0.x = saturate(dot(r5.zxy, r0.zxw));
    ps = log2(r0.x);
    r3.xyz = r3.zxy * r8.zxy;
    r7.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.xz = r7.xy * r7.zy;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r6.zxy, r5.zxy));
    r1.w = ps;
    ps = pow(2.0, r0.y);
    r2.xyz = r2.xyz * r1.www;
    r0.y = ps;
    r2.xy = r3.yz * r0.ww + r2.xy;
    r2.z = r3.x * r0.w + r2.z;
    r2.xyz = r2.xyz * r0.yyy;
    r2.xyz = r2.xyz * r4.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r2.xzy * r0.zzz;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
