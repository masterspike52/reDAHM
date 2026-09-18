// ps_62df7a77dd4e9c1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040D00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_2, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r1.xy * UniformScalar_0.xx;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r0.zw = r7.xy * r6.xx + ScreenPositionScaleBias.wz;
    ps = r12.w;
    r7.xy = r1.wz * UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    ps = (-0.5) + r6.x;
    r7.zw = r7.zw * abs(r8.xy);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r8.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r0.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r13.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r11.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r6.yz).wxy;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    ps = r5.w;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r11.z = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r1.w = float((UniformScalar_4.x >= 1.0));
    r5.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r1.x = float((UniformScalar_4.x > 1.0));
    r5.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    r3.xy = r7.yz * 2.0 - 1.0;
    ps = (-1.0) + r7.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyw = r11.wxy + float3(-2.0, 0.0, 0.0);
    r6.z = ps;
    ps = 5.0 * r6.x;
    r12.xyz = r5.xyz * r12.xyz;
    r6.y = saturate(ps);
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r13.xyz : 1.0;
    r1.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = 1.0 - r6.y;
    r2.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyw = r7.ywx + r11.xyw;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xyz = r6.xxx * r4.xyz;
    r11.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r1.xyz = r12.xyz * r1.xyz;
    r11.y = ps;
    ps = (-1.0) + r7.x;
    r4.yzw = -r11.zxy + 1.0;
    r6.x = ps;
    r3.zw = r7.wz * r4.yy + 1.0;
    ps = (-1.0) + r7.y;
    r4.x = r4.y * UniformScalar_1.x;
    r6.y = ps;
    r6.xy = r4.xx * r3.xy + r6.xy;
    r3.xy = r6.xy * r4.yy;
    r7 = (r4.xyyy > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r3 = (r4.xyyy >= 0.0) ? r7 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 - r6.w;
    r6.x = dot(r3.wyz, r3.wyz);
    r6.y = saturate(ps);
    ps = log2(r6.y);
    r7.xyz = r1.xyz * r3.xxx;
    r6.y = ps;
    r1.xyz = r7.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.x));
    r6.w = r6.y * LightColorAndFalloffExponent.w;
    r6.x = ps;
    r3.xyz = r3.yzw * r6.xxx;
    r6.x = dot(r3.zxy, r5.zxy);
    r6.xyz = r3.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r5.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r7.xyw = r7.xyz * r10.xyz;
    r0.w = ps;
    r6.xyz = r0.yzw * float3(0.875, 0.875, 15.0);
    r0.yz = r6.xy * r4.zw + 0.125;
    ps = pow(2.0, r6.z);
    r7.z = saturate(dot(r3.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r7.xy = r7.xy * r7.zz + r6.xy;
    r7.z = r7.w * r7.z + r6.z;
    r0.xy = r0.xy * r0.xz;
    r6.xyz = r0.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r0.xyz = r0.xxx * r8.xyz;
    r6.w = ps;
    r0.xyz = r0.xzy * r6.www;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
