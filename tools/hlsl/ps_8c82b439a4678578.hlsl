// ps_8c82b439a4678578.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10041200 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 UniformScalar_11 : register(c6); // float
float4 UniformScalar_15 : register(c7); // float
float4 UniformScalar_8 : register(c5); // float
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r6.yw = r0.xy + UniformVector_1.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xzy + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r6.xz = r6.xz * abs(r8.xy);
    r7.y = ps;
    r5.zw = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r15.xyw = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r13.xyw = tex2D(Texture2D_3, r6.yw).xyz;
    r16.x = tex2D(Texture2D_2, r0.xy).w;
    r12.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r16.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r6.y = tex2D(Texture2D_4, r0.xy).w;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r6.xz).xy;
    r6.x = dot(r3.zxy, r3.zxy);
    r11.xyz = r7.xyz * 2.0 - 1.0;
    r8.xyz = r6.yyy * float3(0.2, 3.0, 0.5);
    ps = 1.0 - r5.x;
    r0.xyz = r16.zyw * UniformScalar_8.xxx;
    r6.y = saturate(ps);
    r10.xy = r12.yz * UniformScalar_11.xx + r0.xz;
    ps = rsqrt(abs(r5.x));
    r7.xw = r16.xw * 0.5;
    r6.w = ps;
    ps = log2(r6.y);
    r14.xzw = r8.zxy * r13.wxy;
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r15.z = r7.x * r14.x;
    r6.x = ps;
    r18 = r16.xyxz * float4(0.2, 0.2, 3.0, 3.0);
    ps = rsqrt(abs(r5.y));
    r14.xy = r18.yw * r13.xy;
    r6.y = ps;
    ps = r1.z;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r17.xyz = r15.xyw * r2.www;
    r5.y = ps;
    ps = 0.875 * r5.z;
    r1.xyz = r6.yyy * r1.xyz;
    r10.z = ps;
    ps = 0.875 * r5.w;
    r6.xyz = r6.xxx * r3.xyz;
    r10.w = ps;
    ps = 5.0 * r5.y;
    r3.xyz = r6.www * -SpotDirection.xyz;
    r5.y = saturate(ps);
    ps = 1.0 - r5.y;
    r5.z = dot(r11.zxy, r11.zxy);
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r15.xy = r18.xz * r14.zw;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r3.zxy, r2.zxy);
    r5.z = ps;
    r7.yz = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r3.xy = r10.zw * r7.yz + 0.125;
    ps = pow(2.0, r5.x);
    r11.xyz = r11.xyz * r5.zzz;
    r5.x = ps;
    r7.xyz = r17.xzy * r5.xxx;
    r5.xzw = r16.xxx * r13.xyw + r15.xyz;
    ps = r7.w;
    r6.w = dot(r11.zxy, r6.zxy);
    ps = r13.w * ps;
    r13.xyz = r11.xzy * r6.www;
    r14.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r2.xyw = r5.xzw + r14.xyz;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r0.w = r2.y + r10.x;
    r3.z = saturate(ps);
    r6.yzw = r13.xyz * 2.0 - r6.xzy;
    r2.xyz = r12.xyz * UniformScalar_11.xxx + r2.xyw;
    ps = r2.w;
    r6.x = saturate(dot(r11.zxy, r1.zxy));
    ps = r10.y + ps;
    r5.xw = r3.xz * r3.yz;
    r7.w = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = r7.w;
    r0.xyz = r2.xyz + r0.yxz;
    ps = r4.z + ps;
    r6.y = saturate(dot(r1.zxy, r6.zyw));
    r6.z = ps;
    ps = r6.y * r6.y;
    r2 = r0 + r4.xyzy;
    r1.w = ps;
    ps = r6.z;
    r0.xyz = r2.xyz * UniformScalar_15.xxx;
    ps = r9.y * ps;
    r1.xy = r2.xw * r9.xz;
    r1.z = ps;
    r6 = r1 * r6.xxxy;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
