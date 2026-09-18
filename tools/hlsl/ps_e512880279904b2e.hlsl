// ps_e512880279904b2e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040C00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r3.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r6.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = max(UniformScalar_7.x, 0.0001);
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r0.y = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r0.w = dot(r1.zxy, r1.zxy);
    r2.w = saturate(ps);
    r11.xyz = r11.xyz * 2.0 - 1.0;
    r2.xyz = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r8.yz = r8.yz * 0.875;
    r0.w = ps;
    ps = 5.0 * r0.z;
    r12.xyz = r10.xyz * r5.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r5.xyz = r0.www * r1.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r0.yzw = r0.yyy * r3.xyz;
    r1.w = ps;
    r1.xyz = (-abs(r6.www) >= 0.0) ? r10.xyz : r12.xyz;
    ps = log2(r2.w);
    r3.xyz = r11.xyz - r2.xyz;
    r0.x = ps;
    r1.xyz = (-abs(r3.www) >= 0.0) ? r10.xyz : r1.xyz;
    r2.xyz = r3.xyz * UniformScalar_0.xxx + r2.xyz;
    r3.xy = -r1.ww * ModShadowGroupColor.xy + 1.0;
    r8.yz = r8.yz * r3.xy + 0.125;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r1.w));
    r1.xyz = r1.xyz - r6.xyz;
    r1.w = ps;
    r1.xyz = r1.xyz * UniformScalar_0.xxx + r6.xyz;
    r3.xyz = r1.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    r6.xyz = r2.xyz * r1.www;
    r1.w = dot(r6.zxy, r0.wyz);
    r2.xyz = r6.xzy * r1.www;
    r0.yzw = r2.xyz * 2.0 - r0.ywz;
    r0.y = saturate(dot(r5.zxy, r0.zyw));
    ps = log2(r0.y);
    r2.xyz = r1.xyz * r9.xyz;
    r8.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xw = r8.xy * r8.wz;
    r0.w = ps;
    r0.xyz = r1.www * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r6.zxy, r5.zxy));
    r1.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r3.xyz * r1.xxx;
    r0.w = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
