// ps_00a8f024ff7cdc7c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040B00 0000090A 00000000 00008929 003F01FF 00000001 0000F050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r0.w * UniformVector_2.x;
    r7.x = ps;
    ps = 1.0 / r5.w;
    r6.x = -r0.z + 1.0;
    r6.w = ps;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r6.ww * ScreenPositionScaleBias.xy;
    r7.y = ps;
    r5.xy = r7.zw * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.z));
    r5.zw = r7.xy * abs(r9.xy);
    r6.w = ps;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.z));
    r8.xyw = r6.www * r2.xyz;
    r6.z = ps;
    ps = UniformVector_2.y * r6.x;
    r7.xyz = r6.zzz * r4.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.y;
    r1.xy = r8.xy * -r7.xy;
    r1.z = ps;
    ps = (-0.5) + r6.x;
    r4.zw = float2((r6.yx >= 0.5));
    r1.w = ps;
    r1.zw = r1.zw - r6.yx;
    r1.zw = r1.zw * r4.zw + r6.yx;
    r6.xyz = r1.zwx + r1.zwy;
    r1.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r11 = tex2D(Texture2D_2, r6.xy);
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r9 = tex2D(Texture2D_1, r0.xy);
    r6.x = dot(r3.zxy, r3.zxy);
    r0.y = -r9.w + 1.0;
    ps = 1.0 - r6.x;
    r0.x = r9.w * UniformScalar_0.x;
    r7.w = saturate(ps);
    r10.xyz = r0.yyy * UniformVector_1.xyz + r0.xxx;
    ps = log2(r7.w);
    r5.xyz = r5.xyz * r3.www;
    r6.x = ps;
    r7.x = r7.z * 2.0 - r7.z;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = pow(2.0, r7.y);
    r6.w = saturate(r6.w * r2.z);
    r0.w = ps;
    ps = r2.z;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r2.x = dot(r4.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r1.w = (r2.x == 0.0) ? r11.x : r11.y;
    ps = 5.0 * r6.x;
    r2.xy = r2.xx + float2(-3.0, -2.0);
    r6.x = saturate(ps);
    r1.w = (r2.y == 0.0) ? r11.z : r1.w;
    r6.y = (r2.x == 0.0) ? r11.w : r1.w;
    r8.w = saturate(r8.w * r7.x + r6.z);
    r4.zw = -r6.xy + 1.0;
    r2.xy = -r4.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r8.w);
    r6.xyz = r4.wxy * float3(2.5, 0.875, 0.875);
    r8.w = ps;
    r8 = r8 * float4(0.5, 0.5, 0.5, 15.0);
    r4.xy = r6.yz * r2.xy + 0.125;
    r2.xyz = r8.xyz * r9.www;
    r3.xyz = r2.xyz * UniformScalar_1.xxx + r10.xyz;
    r2.xyz = r9.xyz * 2e+01 + r2.xyz;
    ps = r4.x * r4.y;
    r8.xyz = r5.xzy * r0.www;
    r0.w = ps;
    r7.xyz = r0.www * r7.yzw + ModShadowColor.xyz;
    ps = (-0.5) + r6.x;
    r2.xyz = r2.xyz - r1.xyz;
    r7.w = saturate(ps);
    ps = pow(2.0, r8.w);
    r3.xyz = r3.xyz * r7.www;
    r6.x = ps;
    r6.xyz = r3.xyz * r6.xxx;
    r1.xyz = r2.xyz * r7.www + r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
