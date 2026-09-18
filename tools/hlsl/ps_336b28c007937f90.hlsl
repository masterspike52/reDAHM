// ps_336b28c007937f90.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r0.zw = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.xy).zxy;
    r8.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = UniformScalar_0.x;
    r3.w = dot(r3.zxy, r3.zxy);
    r8.x = ps;
    ps = 0.0001;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r8.w = ps;
    ps = max(r8.x, r8.w);
    r4.w = dot(r1.zxy, r1.zxy);
    r8.x = ps;
    ps = r1.z;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r8.yz = r8.yz * 0.875;
    r1.w = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = 5.0 * r1.w;
    r2.xyz = r9.xyz * UniformVector_2.xyz;
    r1.w = saturate(ps);
    ps = rsqrt(abs(r4.w));
    r2.xyz = r2.xyz * r5.xyz;
    r2.w = ps;
    ps = 1.0 - r1.w;
    r5.xyz = r2.www * r1.xyz;
    r2.w = ps;
    ps = rsqrt(abs(r3.w));
    r1.w = dot(r6.zxy, r6.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.w));
    r1.xyz = r1.xxx * r3.xyz;
    r1.w = ps;
    r3.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    r8.yz = r8.yz * r3.xy + 0.125;
    ps = 1.0 - r0.w;
    r6.xyz = r6.xyz * r1.www;
    r0.w = saturate(ps);
    ps = UniformVector_3.x * r0.y;
    r1.w = dot(r6.zxy, r1.zxy);
    r3.x = ps;
    ps = UniformVector_3.y * r0.z;
    r9.xyz = r6.xzy * r1.www;
    r3.y = ps;
    r1.xyz = r9.xyz * 2.0 - r1.xzy;
    ps = log2(r0.w);
    r1.x = saturate(dot(r5.zxy, r1.yxz));
    r0.w = ps;
    ps = log2(r1.x);
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r8.w = ps;
    ps = UniformVector_3.z * r0.x;
    r1.xw = r8.xy * r8.wz;
    r3.z = ps;
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
