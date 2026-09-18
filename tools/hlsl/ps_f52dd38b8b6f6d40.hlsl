// ps_f52dd38b8b6f6d40.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10041000 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r1.wz * 0.5;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r1.wz * UniformVector_5.xy;
    r7.y = ps;
    ps = 1.0 / r5.w;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    r8.x = ps;
    r8.xy = r8.yz * r8.xx + ScreenPositionScaleBias.wz;
    r7.xy = r7.xy * abs(r9.xy);
    r10.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r12.y = tex2D(ShadowTexture, r0.xy).x;
    r9 = tex2D(Texture2D_3, r1.xy);
    r0.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r11.xzw = tex2D(Texture2D_2, r1.xy).xyz;
    r6.zw = tex2D(Texture2D_0, r6.zw).xy;
    r13.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r6.xy).wxy;
    ps = r5.w;
    r1.xyw = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r15.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r11.y = saturate(ps);
    ps = r2.z;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    r12.zw = r7.yz * 2.0 - 1.0;
    ps = (-1.0) + r7.x;
    r13.yw = r13.yx * 0.875;
    r13.x = ps;
    ps = rsqrt(abs(r6.y));
    r14.yz = r6.zw + r6.zw;
    r8.w = ps;
    ps = 1.0 - r6.y;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r1.z = saturate(ps);
    ps = 5.0 * r6.x;
    r6.z = float((UniformScalar_5.x > 1.0));
    r6.y = saturate(ps);
    r7.xyz = r11.wxz * 2.0 - 1.0;
    r6.xzw = (-abs(r6.zzz) >= 0.0) ? r0.xyz : 1.0;
    r0.yzw = (-abs(r7.www) >= 0.0) ? 1.0 : r6.xzw;
    ps = UniformVector_2.z * r7.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    ps = 1.0 - r6.y;
    r7.w = float((r9.w >= 0.5));
    r6.w = ps;
    ps = 1.0 - r7.w;
    r6.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = log2(r1.z);
    r7.x = r7.w * UniformScalar_6.x;
    r6.x = ps;
    r5.xyw = r0.xxx * UniformVector_3.zyx + r7.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r16.xyz = r8.www * -SpotDirection.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r6.y));
    r11.zw = r6.ww * ModShadowGroupColor.xy;
    r7.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r16.zxy, r3.zxy);
    r8.w = ps;
    ps = -SpotAngles.x - -r6.y;
    r9.xyz = r15.xyz * r9.xyz;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r6.yzw = r14.xyz - 1.0;
    r11.x = saturate(ps);
    ps = 0.012 * r6.z;
    r3.xyz = r8.www * r2.xyz;
    r2.x = ps;
    ps = r6.y;
    r4.xyz = r7.xxx * r4.xyz;
    ps = r7.w * ps;
    r6.xyz = -r11.zyw + 1.0;
    r13.z = ps;
    ps = UniformScalar_1.x * r6.y;
    r9.xyz = r9.xyz * r0.yzw;
    r12.x = ps;
    r5.z = r13.z * r6.y + 1.0;
    r11.yzw = r13.xyw * r6.yzx + float3(1.0, 0.125, 0.125);
    r7.x = (r12.x > 0.0) ? r11.y : 1.0;
    r7.x = (r12.x >= 0.0) ? r7.x : 1.0;
    ps = r11.x * r11.x;
    r0.yzw = r12.xxy * r12.zwy;
    r8.w = ps;
    ps = r11.w * r11.z;
    r7.yz = r7.yz + r0.yz;
    r1.z = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r0.www * r10.xyz;
    r0.x = ps;
    r8.xyz = r1.zzz * r8.xyz + ModShadowColor.xyz;
    ps = 0.012 * r6.w;
    r0.xyz = r0.yzw * r0.xxx;
    r2.y = ps;
    r7.yz = r7.yz * UniformVector_2.xy - r2.xy;
    r7.xyz = r7.wyz * r7.xww;
    r2.zw = r2.xy + r7.yz;
    r7.xyw = r9.xyz * r7.xxx;
    r1.z = r7.w * UniformScalar_7.x + r5.x;
    r2.xy = r7.xy * UniformScalar_7.xx + r5.wy;
    r5.xy = r2.zw * r6.yy;
    r5.xyz = (r6.yyy > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.xy = r7.xy * r1.xy;
    r6.x = ps;
    r7.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r7.zxy, r4.zxy);
    r6.xyz = r7.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r6.x);
    r2.z = r7.w * r1.w;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.y = saturate(dot(r7.zxy, r3.zxy));
    r7.x = ps;
    r6.xyz = r2.xyz * r7.xxy;
    r6.xyz = r1.xyz * r7.yyx + r6.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r8.www;
    r6.xyz = r6.xyz * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
