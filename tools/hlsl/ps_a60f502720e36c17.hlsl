// ps_a60f502720e36c17.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.w = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r0.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r4.xy = r6.xz * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r4.zw = r6.xy * abs(r5.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r5 = tex2D(Texture2D_1, r0.xy);
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = dot(r3.zxy, r3.zxy);
    r6.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.z;
    r10.xyz = r8.xyz * r2.www;
    r11.xyz = r7.xyz * 2.0 - 1.0;
    ps = 0.1 + ps;
    r7.xyz = r5.xyz * UniformVector_1.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r7.xyz * r6.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r0.www * r1.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r1.xyz = r0.yyy * r3.xyz;
    r0.y = ps;
    ps = 1.0 - r0.z;
    r3.xyz = r0.yyy * -SpotDirection.xyz;
    r0.w = saturate(ps);
    ps = 5.0 * r0.x;
    r0.z = dot(r11.zxy, r11.zxy);
    r0.x = saturate(ps);
    ps = log2(r0.w);
    r0.y = -r0.x + 1.0;
    r0.x = ps;
    r8.xy = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.z));
    r0.y = dot(r3.zxy, r2.zxy);
    r0.z = ps;
    r3.xyz = r11.xyz * r0.zzz;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.w = dot(r3.zxy, r1.zxy);
    r0.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r2.xyz = r3.xzy * r0.www;
    r0.x = ps;
    r1.xyz = r2.xyz * 2.0 - r1.xzy;
    ps = pow(2.0, r0.z);
    r0.y = saturate(dot(r7.zxy, r1.yxz));
    r0.z = ps;
    ps = log2(r0.y);
    r2.xyz = r10.xzy * r0.zzz;
    r9.z = ps;
    ps = SpotAngles.y * r0.x;
    r1.xyz = r9.xzy * float3(0.875, 15.0, 0.875);
    r0.z = saturate(ps);
    r0.xy = r1.xz * r8.xy + 0.125;
    ps = pow(2.0, r1.y);
    r1.x = saturate(dot(r3.zxy, r7.zxy));
    r0.w = ps;
    ps = r0.w;
    r1.xyz = r6.xyz * r1.xxx;
    ps = r5.w * ps;
    r0.xw = r0.xz * r0.yz;
    r1.w = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyw + r1.wwz;
    r1.xyz = r2.xzy * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
