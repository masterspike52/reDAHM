// ps_e4c88681414e35dc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c9); // float2
float4 SpotDirection : register(c8); // float3
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.z = r1.z + 0.1;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.yzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.w = tex2D(Texture2D_1, r0.xy).x;
    ps = UniformScalar_9.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = 0.0001;
    r1.w = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r6.x = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    ps = 1.0 - r6.x;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = saturate(ps);
    r10.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r5.z = saturate(r5.z * 5.0);
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.xzw = r0.xxx * r1.xyz;
    r1.x = ps;
    ps = 1.0 - r5.w;
    r3.xyz = r1.xxx * r3.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = dot(r10.zxy, r10.zxy);
    r6.x = ps;
    ps = 0.875 * r5.x;
    r11.xyz = r6.xxx * -SpotDirection.xyz;
    r9.x = ps;
    ps = log2(r0.y);
    r1.yzw = r1.xxx * r7.xyz;
    r5.x = ps;
    ps = 0.875 * r5.y;
    r4.xyz = r1.yzw * r4.xyz;
    r9.y = ps;
    ps = 1.0 - r5.z;
    r5.y = dot(r11.zxy, r2.zxy);
    r5.z = ps;
    r2.xy = -r5.zz * ModShadowGroupColor.xy + 1.0;
    r9.xy = r9.xy * r2.xy + 0.125;
    ps = rsqrt(abs(r5.w));
    r1.yzw = r1.xzw * UniformScalar_7.xxx;
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r2.xyz = r10.xyz * r5.zzz;
    r6.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.z = dot(r2.zxy, r3.zxy);
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r5.yzw = r2.xzy * r5.zzz;
    r9.z = saturate(ps);
    r3.xyz = r5.yzw * 2.0 - r3.xzy;
    ps = r1.y;
    r5.xw = r9.xz * r9.yz;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = r7.x * ps;
    r0.y = saturate(dot(r0.wxz, r3.yxz));
    r1.x = ps;
    ps = log2(r0.y);
    r0.x = saturate(dot(r2.zxy, r0.wxz));
    r0.y = ps;
    ps = pow(2.0, r6.x);
    r0 = r4 * r0.xxxy;
    r6.x = ps;
    ps = pow(2.0, r0.w);
    r1.yzw = r1.xwz + UniformScalar_8.xxx;
    r1.x = ps;
    r0.xy = r1.yw * r1.xx + r0.xy;
    r0.z = r1.z * r1.x + r0.z;
    r0.xyz = r0.xyz * r6.xxx;
    r6.xyz = r0.xyz * r6.yzw;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
