// ps_bb3b86270fdb2761.bin
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

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 UniformScalar_7 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
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
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = UniformScalar_7.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 0.0001;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = max(r5.x, r5.y);
    r5.z = r1.z + 0.1;
    r9.x = ps;
    ps = 5.0 * r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = saturate(ps);
    ps = 1.0 - r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = saturate(ps);
    r9.yzw = r9.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r10.xy = r10.xy * 0.875;
    r5.z = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r0.xyz * r7.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.zzz * r3.xyz;
    r5.x = ps;
    ps = r6.w;
    r11.xyz = r5.xxx * -SpotDirection.xyz;
    ps = r1.x * ps;
    r5.z = dot(r9.wyz, r9.wyz);
    r0.x = ps;
    ps = log2(r5.w);
    r5.y = -r5.y + 1.0;
    r5.x = ps;
    r0.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r11.zxy, r2.zxy);
    r5.z = ps;
    r0.zw = r10.xy * r0.yz + 0.125;
    ps = r6.w;
    r2.xyz = r9.yzw * r5.zzz;
    ps = r1.y * ps;
    r5.z = dot(r2.zxy, r3.zxy);
    r0.y = ps;
    ps = r6.w;
    r5.w = r0.z * r0.w;
    r6.xyz = r5.www * r6.xyz + ModShadowColor.xyz;
    ps = r1.z * ps;
    r9.yzw = r2.xzy * r5.zzz;
    r0.z = ps;
    r1.xyz = r9.yzw * 2.0 - r3.xzy;
    ps = -SpotAngles.x - -r5.y;
    r5.z = saturate(dot(r0.zxy, r1.yxz));
    r5.y = ps;
    ps = log2(r5.z);
    r9.y = saturate(r5.y * SpotAngles.y);
    r9.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yz = r9.xy * r9.zy;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.w = saturate(dot(r2.zxy, r0.zxy));
    r6.w = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r6.www * r8.xyz;
    r5.x = ps;
    r0.xy = r7.xy * r5.ww + r0.xy;
    r0.z = r7.z * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xyz * r5.zzz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
