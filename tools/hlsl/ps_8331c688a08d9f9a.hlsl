// ps_8331c688a08d9f9a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040E00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_5 : register(s5);
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.xyw = tex2D(Texture2D_1, r6.xy).xyw;
    r7.xy = r1.wz * 0.5;
    r7.zw = r1.wz * UniformVector_5.xy;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r6.z = r2.z + 0.1;
    r13.xy = r6.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.x = saturate(r6.z * 5.0);
    r8.x = saturate(ps);
    ps = 1.0 / r5.w;
    r6.x = -r6.x + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.yz = r6.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -r8.yxz + 1.0;
    r6.y = ps;
    ps = UniformScalar_1.x * r8.y;
    r6.xy = r6.xy * abs(r9.xy);
    r12.x = ps;
    r0.zw = r12.yz * r13.zz + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r11.w = tex2D(ShadowTexture, r0.xy).x;
    r5.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r9.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r14 = tex2D(Texture2D_3, r1.xy);
    r7.yz = tex2D(Texture2D_0, r7.xy).xy;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).yx;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r1.y = float((UniformScalar_5.x > 1.0));
    r7.x = dot(r2.zxy, r2.zxy);
    r11.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = (-1.0) + r6.w;
    r6.z = dot(r3.zxy, r3.zxy);
    r3.x = ps;
    ps = 1.0 - r6.z;
    r6.w = dot(r4.zxy, r4.zxy);
    r1.x = saturate(ps);
    ps = 0.875 * r6.x;
    r7.yz = r7.yz + r7.yz;
    r3.y = ps;
    ps = rsqrt(abs(r6.w));
    r11.xyz = r11.xyz * r14.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r7.x));
    r7.w = float((r14.w >= 0.5));
    r7.x = ps;
    r6.xzw = r9.zxy * 2.0 - 1.0;
    r1.yzw = (-abs(r1.yyy) >= 0.0) ? r5.xyz : 1.0;
    r9.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r1.yzw;
    ps = UniformVector_2.z * r6.x;
    r2.xyz = r7.xxx * r2.xyz;
    r7.x = ps;
    ps = 1.0 - r7.w;
    r5.xyz = r8.www * r4.xyz;
    r0.w = ps;
    ps = log2(r1.x);
    r8.w = r7.w * UniformScalar_6.x;
    r6.x = ps;
    r1.xyz = r0.www * UniformVector_3.xyz + r8.www;
    ps = 0.875 * r6.y;
    r7.xyz = r7.yxz - 1.0;
    r3.w = ps;
    ps = 0.012 * r7.x;
    r4.xyz = r11.xyz * r9.xyz;
    r9.x = ps;
    ps = 0.012 * r7.z;
    r3.z = r7.y * r7.w;
    r9.y = ps;
    r9.z = r3.z * r8.y + 1.0;
    r11.xyz = r3.xyw * r8.yzx + float3(1.0, 0.125, 0.125);
    r6.y = (r12.x > 0.0) ? r11.x : 1.0;
    r6.zw = r12.xx * r13.xy + r6.zw;
    r7.xy = r6.zw * UniformVector_2.xy - r9.xy;
    r7.z = (r12.x >= 0.0) ? r6.y : 1.0;
    r6.yz = r11.zw * r11.yw;
    r0.xyz = r6.yyy * r0.xyz + ModShadowColor.xyz;
    r3.xyz = r6.zzz * r10.xyz;
    r6.yzw = r7.wxy * r7.zww;
    ps = -UniformVector_0.x;
    r6.zw = r9.xy + r6.zw;
    ps = 1.0 + ps;
    r4.xyz = r4.xyz * r6.yyy;
    r6.y = ps;
    r1.xyz = r4.xyz * UniformScalar_7.xxx + r1.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r9.xy = r6.zw * r8.yy;
    r6.z = ps;
    r7.xyz = (r8.yyy > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r8.xyz = (r8.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.z);
    r6.x = dot(r8.zxy, r8.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r3.xzy * r6.zzz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r8.xyz * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r3.zxy, r5.zxy);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r3.xyz * r6.xxx;
    r8.xyz = r8.xyz * 2.0 - r5.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.zxy, r8.zxy));
    r6.w = ps;
    ps = log2(r6.x);
    r8.xyz = r4.xyz * r6.yzw;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r3.zxy, r2.zxy));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r8.xy * r6.ww + r6.xy;
    r6.z = r8.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
