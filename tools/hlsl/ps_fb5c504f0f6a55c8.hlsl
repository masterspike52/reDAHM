// ps_fb5c504f0f6a55c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040D00 0000090A 00000000 00008129 007F01FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A2
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

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r1.xy * UniformScalar_0.xx;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = UniformScalar_1.x * 4.0;
    r0.w = ps;
    ps = 1.0 / r6.w;
    r4.xy = r6.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    r4.xy = r4.xy * r8.zz + ScreenPositionScaleBias.wz;
    ps = r7.z;
    r8.zw = r1.wz * UniformScalar_4.xx;
    ps = r2.x * ps;
    r0.zw = r0.zw * abs(r9.xy);
    r7.z = ps;
    ps = UniformScalar_1.x * r2.y;
    r7.xy = r1.xy * UniformScalar_2.xx;
    r7.w = ps;
    r1.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r4.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r10.xyz = tex2D(Texture2D_6, r8.zw).xyz;
    r1.w = tex2D(Texture2D_2, r2.xy).x;
    r0.xyz = tex2D(Texture2D_4, r8.xy).xyz;
    r13.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r7.yzw = tex2D(Texture2D_3, r7.xy).wxy;
    ps = 0.0001 * r6.w;
    r0.w = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r8.z = dot(r5.zxy, r5.zxy);
    r2.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r2.w = dot(r3.zxy, r3.zxy);
    r2.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r7.x = r3.z + 0.1;
    r2.z = ps;
    r9.xy = r7.zw * 2.0 - 1.0;
    r12.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = r8.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r2.w));
    r13.xyz = -r0.xyz + r13.xyz;
    r7.z = ps;
    ps = 5.0 * r7.x;
    r6.xyz = r7.zzz * r3.xyz;
    r7.x = saturate(ps);
    r0.xyz = r13.xyz * r1.www + r0.xyz;
    ps = 1.0 - r7.x;
    r3.xyz = r12.xyz - r11.xyz;
    r7.z = ps;
    r8.xy = r3.xy * r1.ww + r11.xy;
    r7.x = r3.z * r1.w - 2.0;
    ps = ModShadowGroupColor.x * r7.z;
    r2.xyz = r2.xyz * r0.xyz;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r2.xyz = r2.xyz * r10.xyz;
    r0.z = ps;
    r0.y = r8.w * 2.0 + r7.x;
    ps = (-1.0) + r7.y;
    r7.xzw = -r0.xwz + 1.0;
    r0.x = ps;
    r3.zw = r0.yx * r7.zz + 1.0;
    ps = UniformScalar_3.x * r7.z;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = ps;
    r8.xy = r7.yy * r9.xy + r8.xy;
    ps = -UniformVector_0.x;
    r3.xy = r8.xy * r7.zz;
    r3 = (r7.yzzz > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10 = (r7.yzzz >= 0.0) ? r3 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r8.y = dot(r10.wyz, r10.wyz);
    r8.x = ps;
    ps = rsqrt(abs(r8.z));
    r3.xyz = r2.xyz * r10.xxx;
    r8.z = ps;
    r2.xyz = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r8.y));
    r9.xyz = r8.zzz * r5.xyz;
    r8.y = ps;
    ps = -UniformVector_0.y;
    r5.xyz = r10.yzw * r8.yyy;
    ps = 1.0 + ps;
    r8.z = dot(r5.zxy, r9.zxy);
    r8.y = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r5.xyz * r8.zzz;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r8.w = saturate(dot(r6.zxy, r9.zxy));
    r8.z = ps;
    ps = log2(r8.w);
    r8.xyz = r3.xyz * r8.xyz;
    r4.w = ps;
    r3.xyz = r4.xyw * float3(0.875, 0.875, 15.0);
    r4.xy = r3.xy * r7.xw + 0.125;
    ps = pow(2.0, r3.z);
    r7.w = saturate(dot(r5.zyx, r6.zyx));
    r7.x = ps;
    r7.xyz = r2.xyz * r7.xxx;
    r8.xy = r8.xy * r7.ww + r7.xy;
    r8.z = r8.z * r7.w + r7.z;
    r7.xw = r4.xz * r4.yz;
    r7.xyz = r7.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xyz = r7.www * r1.xyz;
    r8.xyz = r0.xyz * r8.xyz;
    r8.xyz = r8.xzy * LightColor.xzy;
    r7.xyz = r8.xzy * r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
