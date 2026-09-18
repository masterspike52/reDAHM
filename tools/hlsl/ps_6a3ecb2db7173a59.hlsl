// ps_6a3ecb2db7173a59.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.x = dot(r4.zxy, r4.zxy);
    r6.x = 1.0 / r5.w;
    r7.yz = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r6.z = r2.z + 0.1;
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.xy * abs(r8.xy);
    r7.yz = r7.yz * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r7.yz).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r8.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r9.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.yzw = tex2D(Texture2D_2, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.w = saturate(5.0 * r6.z);
    ps = 0.875 * r6.x;
    r6.z = dot(r9.xzy, float3(1.0, 1.0, 1.0));
    r8.x = ps;
    r9.yzw = r8.yzw * 2.0 - 1.0;
    ps = 0.875 * r6.y;
    r0.x = r0.x * r0.x;
    r8.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.xxx * r5.xyz;
    r6.x = ps;
    ps = UniformScalar_0.x * r7.y;
    r11.xyz = r6.xxx * r2.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r7.x));
    r2.xyz = r9.wyz * float3(0.7, 1.0, 1.0);
    r6.x = ps;
    ps = UniformScalar_0.x * r7.z;
    r4.xyz = r6.xxx * r4.xyz;
    r5.y = ps;
    ps = log2(abs(r6.z));
    r6.y = dot(r4.zxy, r9.wyz);
    r9.x = ps;
    ps = r6.y;
    r6.x = dot(r2.xyz, r2.xyz);
    r2.x = ps;
    ps = rsqrt(abs(r6.x));
    r9 = r9.wyzx * float4(0.7, 1.0, 1.0, 0.1);
    r6.x = ps;
    ps = 0.0;
    r9.xyz = r9.yzx * r6.xxx;
    r2.y = ps;
    ps = pow(2.0, r9.w);
    r0.w = saturate(dot(r9.zxy, r11.zxy));
    r6.x = ps;
    ps = 1.0 - r6.w;
    r6.y = dot(r9.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r9.xyz = r9.xzy * r6.yyy;
    r6.x = ps;
    r10.xyz = r9.xyz * 2.0 - r4.xzy;
    ps = max(r2.x, r2.y);
    r4.xyz = r6.xxx * r7.yzw;
    r2.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r9.xyz = r4.xyz * UniformVector_3.www;
    r2.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.w = saturate(dot(r11.zxy, r10.yxz));
    r2.z = ps;
    r6.yzw = r9.xyz * UniformVector_3.xyz - r4.xyz;
    ps = UniformScalar_0.x * r7.w;
    r2.xyz = -r2.yzx + float3(1.0, 1.0, 0.45);
    r5.z = ps;
    r2.xy = r8.xy * r2.xy + 0.125;
    ps = r2.w * r2.w;
    r7.x = saturate(r2.z * 4.0);
    r2.z = ps;
    r6.yzw = r7.xxx * r6.yzw + r4.xyz;
    ps = r2.x * r2.y;
    r7.xyz = r5.xyz * r6.xxx;
    r6.x = ps;
    ps = r2.z * r2.w;
    r1.xyz = r6.yzw * r1.xyz;
    r6.w = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.xyz = r7.xyz * r6.www;
    r7.xy = r1.xy * r0.ww + r7.xy;
    r7.z = r1.z * r0.w + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
