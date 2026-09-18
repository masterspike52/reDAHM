// ps_34a8ac3f38bc4d11.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10041100 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_15 : register(c18); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D Texture2D_5 : register(s4);
sampler2D Texture2D_6 : register(s5);
sampler2D Texture2D_7 : register(s6);
sampler2D ShadowTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r6.xy = r1.xy * UniformVector_1.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r7.yz = r7.yz * abs(r9.xy);
    r7.w = ps;
    r6.zw = r7.xw * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r7.x = tex2D(ShadowTexture, r0.xy).x;
    r5.xy = tex2D(ModShadowAccumTexture, r7.yz).xy;
    r9.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r13.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r12.xy = tex2D(Texture2D_5, r1.xy).xy;
    r7.w = tex2D(Texture2D_4, r1.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r7.y = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = r2.z;
    r17.xyz = UniformVector_3.xyz * UniformVector_3.www;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    r5.w = r7.w * UniformScalar_9.x + UniformScalar_10.x;
    ps = r12.x + r12.y;
    r15.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r7.w = ps;
    r3.xyz = r13.xzy * 2.0 - 1.0;
    ps = r14.z + r14.z;
    r0.xyz = r0.xyz + r0.xyz;
    r14.z = ps;
    r13.xyz = (-abs(r7.zzz) >= 0.0) ? UniformVector_6.xyz : r15.xyz;
    r16.xyz = (-abs(r7.zzz) >= 0.0) ? UniformVector_4.xyz : r17.xyz;
    ps = rsqrt(abs(r7.y));
    r14.xy = r14.xy * 4.0;
    r7.y = ps;
    ps = rsqrt(abs(r6.w));
    r1.xyz = r7.yyy * r4.xyz;
    r6.w = ps;
    ps = 5.0 * r6.x;
    r2.yzw = r6.www * r2.xyz;
    r6.x = saturate(ps);
    r4.xyz = (-abs(r6.zzz) >= 0.0) ? r17.xyz : r16.xyz;
    r13.xyz = (-abs(r6.zzz) >= 0.0) ? r15.xyz : r13.xyz;
    ps = 1.0 - r6.x;
    r14.xyz = r14.xyz + float3(-2.0, -2.0, -1.0);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r13.xyz = r13.xyz * r12.yyy;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r14.xyz = -r3.xyz + r14.xzy;
    r7.z = ps;
    r7.yzw = -r7.yzw + 1.0;
    r3.xyz = r14.xzy * UniformScalar_2.xxx + r3.xzy;
    ps = UniformScalar_15.x;
    r8.w = dot(r3.zxy, r3.zxy);
    ps = -UniformScalar_14.x + ps;
    r6.xzw = r7.www * r9.xyz;
    r0.w = ps;
    r6.xzw = r13.xyz * r9.xyz + r6.xzw;
    ps = rsqrt(abs(r8.w));
    r4.xyz = r4.xyz * r12.xxx;
    r8.w = ps;
    ps = 1.0 - r6.y;
    r3.xyz = r3.xzy * r8.www;
    r8.w = saturate(ps);
    r6.yzw = r4.xyz * r9.xyz + r6.xzw;
    r0.xyz = r6.yzw * r0.xyz - r6.yzw;
    ps = log2(r8.w);
    r6.x = dot(r3.yxz, r3.yxz);
    r8.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.w = r8.w * LightColorAndFalloffExponent.w;
    r6.x = ps;
    r8.w = r0.w * UniformScalar_2.x + UniformScalar_14.x;
    r0.xyz = r0.xyz * UniformScalar_2.xxx + r6.yzw;
    r3.xyz = r3.xzy * r6.xxx;
    r6.w = saturate(dot(r3.zxy, r2.wyz));
    r6.xyz = r0.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.w = dot(r3.zxy, r1.zxy);
    ps = r8.w;
    r3.xyz = r3.xzy * r0.www;
    r2.x = ps;
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    ps = 0.0001;
    r8.w = saturate(dot(r2.wyz, r1.yxz));
    r2.y = ps;
    ps = log2(r8.w);
    r0.yzw = r0.xyz - UniformVector_2.xyz;
    r5.z = ps;
    ps = max(r2.x, r2.y);
    r1.xyz = r5.xyz * float3(0.875, 0.875, 4e+02);
    r0.x = ps;
    r0 = r0.yzwx * r5.wwwz;
    r7.yz = r1.xy * r7.yz + 0.125;
    r2.xyz = r0.xyz + UniformVector_2.xyz;
    ps = pow(2.0, r1.z);
    r0.xyz = r2.xyz * r11.xyz;
    r8.w = ps;
    r6.xyz = r8.www * UniformScalar_8.xxx + r6.xyz;
    r1.xy = r7.xy * r7.xz;
    ps = pow(2.0, r0.w);
    r2.xyz = r6.xyz * r5.www;
    r7.x = ps;
    r6.xyz = r1.yyy * r10.xyz + ModShadowColor.xyz;
    r7.xyz = r2.xyz * r7.xxx;
    ps = pow(2.0, r7.w);
    r8.xyz = r1.xxx * r8.xyz;
    r7.w = ps;
    r8.xyz = r8.xzy * r7.www;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
