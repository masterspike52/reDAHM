// ps_4e1b288c49cdde2b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041000 0000090A 00000000 00008129 007F01FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
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
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
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

    r7.xy = r1.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.zw = r1.xy * UniformScalar_0.xx;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.x = UniformScalar_1.x * 4.0;
    r0.w = ps;
    ps = 1.0 / r6.w;
    r10.xy = r6.xy * ScreenPositionScaleBias.xy;
    r7.z = ps;
    r10.xy = r10.xy * r7.zz + ScreenPositionScaleBias.wz;
    ps = r8.x;
    r7.zw = r1.wz * UniformScalar_4.xx;
    ps = r2.x * ps;
    r0.zw = r0.zw * abs(r9.xy);
    r8.x = ps;
    ps = UniformScalar_1.x * r2.y;
    r12.z = saturate(r6.w * 0.0001);
    r8.y = ps;
    r1.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r9.y = tex2D(ShadowTexture, r0.xy).x;
    r10.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r13.xyz = tex2D(Texture2D_6, r7.zw).xyz;
    r7.z = tex2D(Texture2D_2, r2.xy).x;
    r16.xyz = tex2D(Texture2D_4, r8.zw).xyz;
    r11.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r8.zw).zxy;
    r14.xyz = tex2D(Texture2D_1, r8.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r7.xy).wxy;
    ps = 0.1 - -r3.z;
    r7.x = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r0.w = dot(r5.zxy, r5.zxy);
    r12.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r7.y = dot(r4.zxy, r4.zxy);
    r12.w = ps;
    r9.xz = r8.yz * 2.0 - 1.0;
    ps = 1.0 - r7.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r7.w = saturate(ps);
    r15.xyz = r14.xyz * 2.0 - 1.0;
    r14.xyz = r0.yzx * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r8.yzw = -r16.xyz + r11.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r1.www * r3.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r7.y));
    r11.xyz = r0.www * r5.xyz;
    r7.y = ps;
    ps = 5.0 * r7.x;
    r5.xyz = r7.yyy * -SpotDirection.xyz;
    r7.y = saturate(ps);
    r8.yzw = r8.yzw * r7.zzz + r16.xyz;
    ps = log2(r7.w);
    r0.yzw = r15.xyz - r14.xyz;
    r7.x = ps;
    r3.xy = r0.yz * r7.zz + r14.xy;
    r7.w = r0.w * r7.z - 2.0;
    ps = 1.0 - r7.y;
    r8.yzw = r12.xyw * r8.yzw;
    r7.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r7.y = dot(r5.zxy, r4.zxy);
    r12.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r0.yzw = r8.yzw * r13.xyz;
    r12.y = ps;
    r7.w = r0.x * 2.0 + r7.w;
    ps = (-1.0) + r8.x;
    r8.yzw = -r12.zxy + 1.0;
    r7.z = ps;
    r3.zw = r7.wz * r8.yy + 1.0;
    ps = UniformScalar_3.x * r8.y;
    r8.x = ps;
    r7.zw = r8.xx * r9.xz + r3.xy;
    ps = -UniformVector_0.x;
    r3.xy = r7.zw * r8.yy;
    r3 = (r8.xyyy > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r4 = (r8.xyyy >= 0.0) ? r3 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r7.z = dot(r4.wyz, r4.wyz);
    r0.x = ps;
    ps = -SpotAngles.x - -r7.y;
    r5.xyz = r0.yzw * r4.xxx;
    r7.y = ps;
    r3.xyz = r5.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r7.z));
    r9.x = saturate(r7.y * SpotAngles.y);
    r7.y = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.yzw * r7.yyy;
    ps = 1.0 + ps;
    r7.y = dot(r4.zxy, r11.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r7.yzw = r4.xyz * r7.yyy;
    r7.yzw = r7.yzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r7.y = saturate(dot(r6.zxy, r7.wyz));
    r0.z = ps;
    ps = log2(r7.y);
    r0.xyz = r5.xyz * r0.xyz;
    r10.x = ps;
    r7.yzw = r10.xyz * float3(15.0, 0.875, 0.875);
    r9.zw = r7.zw * r8.zw + 0.125;
    ps = pow(2.0, r7.y);
    r8.x = saturate(dot(r4.zyx, r6.zyx));
    r7.y = ps;
    r7.yzw = r3.xyz * r7.yyy;
    r0.xy = r0.xy * r8.xx + r7.yz;
    r0.z = r0.z * r8.x + r7.w;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r8.xyz = r9.zxy * r9.wxy;
    r7.w = ps;
    r7.xyz = r8.xxx * r2.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.w);
    r1.xyz = r8.zzz * r1.xyz;
    r7.w = ps;
    r1.xyz = r1.xzy * r7.www;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r8.xyz = r0.xzy * r8.yyy;
    r7.xyz = r8.xzy * r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
