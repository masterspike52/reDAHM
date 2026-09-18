// ps_4e1666ced3b47696.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10040E00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_5, r0.xy);
    r6.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = -r1.y + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r6.y * UniformVector_2.y;
    r7.y = ps;
    ps = r13.w;
    r7.zw = r1.xy * 6.0;
    r6.z = ps;
    ps = (-0.5) + r6.z;
    r7.xy = r7.xy * abs(r8.xy);
    r6.z = ps;
    ps = (-0.5) + r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r0.z = ps;
    ps = (-0.5) + r6.y;
    r6.zw = float2((r6.xy >= 0.5));
    r0.w = ps;
    r0.zw = r0.zw - r6.xy;
    r6.xy = r0.zw * r6.zw + r6.xy;
    r6.xy = r6.xy + r6.xy;
    r14 = tex2D(Texture2D_1, r6.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9.xyz = tex2D(Texture2D_2, r7.zw).xyw;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r8.w = saturate(r5.w * 0.0001);
    ps = r2.z;
    r0.zw = r1.xy * UniformVector_7.xy;
    ps = 0.1 + ps;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_1.xy;
    r10.z = r9.z * r8.z - 1.0;
    ps = (-4e+02) + ps;
    r11.zw = r9.xy + r9.xy;
    r6.y = ps;
    ps = 0.875 * r7.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r7.z));
    r1.yz = r8.xy + r8.xy;
    r7.x = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r7.xxx * r4.xyz;
    r7.w = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r1.x = dot(r6.zww, float3(1.0, 1.0, 1.0));
    r7.x = saturate(ps);
    r6.x = (r1.x == 0.0) ? r14.x : r14.y;
    ps = 1.0 - r7.w;
    r1 = r1.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.z = ps;
    r6.x = (r1.y == 0.0) ? r14.z : r6.x;
    r8.z = (r1.x == 0.0) ? r14.w : r6.x;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = max(r8.z, 0.0);
    r8.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.z = min(r6.x, 0.3);
    r8.y = ps;
    ps = 0.875 * r7.y;
    r8 = -r8 + 1.0;
    r11.y = ps;
    ps = r8.z;
    r11.xy = r11.xy * r8.xy;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r6.yw = r7.xz * float2(-0.025, 3.3333333);
    r9.w = ps;
    r7.xy = r9.xy * r6.yy + r10.xy;
    r11 = r11 + float4(0.125, 0.125, -1.0, -1.0);
    r10.xy = r11.zw * 0.5 + r1.zw;
    r4.w = r6.w * r10.z + 1.0;
    ps = 1.0 / r5.w;
    r12.x = abs(r4.w) * abs(r4.w);
    r12.w = ps;
    r6.xyz = r12.yzx * r12.wwx;
    r7.zw = r6.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r1.w = tex2D(Texture2D_4, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r5.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = dot(r2.zxy, r2.zxy);
    r14.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.xyz = r7.xyw * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r8.xyz = r14.xyz * r13.xyz;
    r0.w = saturate(ps);
    r3.xyz = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r2.w));
    r3.xyz = r3.xyz * UniformVector_4.xyz;
    r2.w = ps;
    ps = log2(r0.w);
    r2.xyz = r2.www * r2.xyz;
    r6.x = ps;
    ps = -r7.z;
    r0.w = r11.x * r11.y;
    r0.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    r10.xy = r6.ww * r10.xy + r3.xy;
    r6.w = saturate(r9.w * r4.w - 0.5);
    ps = r3.z + ps;
    r3.xy = r10.xy - r7.xy;
    r3.z = ps;
    r7.xy = r3.xy * r6.ww + r7.xy;
    r7.z = r3.z * r6.w - 2.0;
    r7.z = r7.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r8.www;
    ps = 1.0 + r7.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r8.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r8.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.y));
    r0.w = r6.z * r6.z;
    r6.y = ps;
    r7.xyz = r7.xyz * r6.yyy;
    r6.y = dot(r7.zxy, r9.zxy);
    r10.xyz = r7.xyz * r6.yyy;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    r6.y = saturate(dot(r2.zxy, r9.zxy));
    ps = log2(r6.y);
    r7.x = saturate(dot(r7.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r7.y = ps;
    ps = pow(2.0, r7.y);
    r6.z = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_8.x * r6.y;
    r8.w = ps;
    r2 = r8 * r5.xyzx;
    r7.yzw = r2.xyz * r4.www - r4.xyz;
    r2.xyz = r2.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r2.xyz = r2.www * r1.www + r2.xyz;
    r7.yzw = r7.yzw * r6.www + r4.xyz;
    r7.yzw = r7.yzw * r3.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r0.www * r2.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.z);
    r2.xyz = r2.xyz * r6.www;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r2.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r7.yz * r7.xx + r6.yz;
    r6.w = r7.w * r7.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r1.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
