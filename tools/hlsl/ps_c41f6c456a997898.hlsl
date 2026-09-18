// ps_c41f6c456a997898.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040C00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
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
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = 1.0 / r5.w;
    r10.xy = r1.xy * UniformVector_1.xy;
    r7.y = ScreenPositionScaleBias.x * r6.z;
    r6.w = r2.z + 0.1;
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.y = 1.0 / ModShadowAccumResolution.y;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.xy = r6.xy * abs(r8.xy);
    r7.z = ps;
    r7.yz = r7.yz * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_3, r10.xy).xyz;
    r3.xyz = tex2D(LightAttenuationTexture, r7.yz).xyz;
    r5.w = tex2D(Texture2D_2, r1.xy).x;
    r6.z = tex2D(ShadowTexture, r0.xy).x;
    r7.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r1.xy).zxy;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).yx;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = max(UniformScalar_5.x, 0.0001);
    ps = 0.875 * r6.y;
    r0.w = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    r11.yzw = r10.xyz * 2.0 - 1.0;
    ps = r0.x + r0.x;
    r7.yzw = r7.yzw + r7.yzw;
    r12.z = ps;
    ps = r6.z * r6.z;
    r10.xyz = r5.www * UniformVector_2.xyz;
    r0.x = ps;
    ps = 5.0 * r6.w;
    r12.xy = r0.yz * 4.0;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.xxx * r3.xyz;
    r6.w = ps;
    ps = 1.0 - r6.z;
    r3.xyz = r6.www * r2.xyz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r12.xyz + float3(-2.0, -2.0, -1.0);
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r2.xyz - r11.yzw;
    r5.y = ps;
    r2.xyz = r2.xyz * UniformScalar_2.xxx + r11.yzw;
    ps = 0.875 * r6.x;
    r5.xyw = -r5.xyw + 1.0;
    r11.y = ps;
    r5.xy = r11.xy * r5.xy + 0.125;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.x));
    r6.yzw = r5.www * r8.xyz;
    r6.x = ps;
    r6.yzw = r10.xyz * r8.xyz + r6.yzw;
    r7.yzw = r6.yzw * r7.yzw - r6.yzw;
    r8.xyz = r2.xyz * r6.xxx;
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r8.zxy, r8.zxy);
    r7.x = ps;
    r6.yzw = r7.yzw * UniformScalar_2.xxx + r6.yzw;
    r7.yzw = r6.yzw * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r7.xxx * r4.xyz;
    r6.x = ps;
    r4.xyz = r8.xyz * r6.xxx;
    r6.x = dot(r4.zxy, r2.zxy);
    r8.xyz = r4.xzy * r6.xxx;
    r2.xyz = r8.xyz * 2.0 - r2.xzy;
    r6.x = saturate(dot(r3.zxy, r2.yxz));
    ps = log2(r6.x);
    r1.xyz = r6.wyz * r1.zxy;
    r5.w = ps;
    r2.xy = r5.xz * r5.yw;
    r6.xyz = r2.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.y);
    r6.w = saturate(dot(r4.zxy, r3.zxy));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r1.yz * r6.ww + r7.xy;
    r7.z = r1.x * r6.w + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
