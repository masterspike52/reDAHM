// ps_41a70ec86fed9e94.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = 1.0 / r4.w;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.w = tex2D(Texture2D_1, r0.xy).x;
    r6.z = dot(r1.zxy, r1.zxy);
    r10.x = UniformScalar_9.x;
    r5.x = r1.z + 0.1;
    r10.y = 0.0001;
    ps = 1.0 - r5.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.z;
    r5.y = dot(r3.zxy, r3.zxy);
    r6.y = saturate(ps);
    r0.yzw = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r10.zw = r9.xy * 0.875;
    r6.w = ps;
    ps = 5.0 * r5.x;
    r5.yzw = r7.xyz * r2.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r9.xyz = r6.www * r3.xyz;
    r6.z = ps;
    ps = 1.0 - r5.x;
    r7.xyz = r6.zzz * r1.xyz;
    r1.w = ps;
    ps = log2(r6.y);
    r0.x = dot(r0.wyz, r0.wyz);
    r5.x = ps;
    ps = rsqrt(abs(r0.x));
    r6.yzw = r6.xxx * r4.yzx;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r6.wyz * r11.xyz;
    r5.x = ps;
    r2.xy = -r1.ww * ModShadowGroupColor.xy + 1.0;
    r3.yz = r10.zw * r2.xy + 0.125;
    ps = pow(2.0, r5.x);
    r2.xzw = r0.yzw * r0.xxx;
    r5.x = ps;
    ps = max(r10.x, r10.y);
    r0.xyz = r5.ywz * r5.xxx;
    r3.x = ps;
    ps = r6.x;
    r5.w = saturate(dot(r2.wxz, r7.zxy));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r5.x = dot(r2.wxz, r9.zxy);
    r2.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r5.xyz = r2.xwz * r5.xxx;
    r2.z = ps;
    r5.xyz = r5.xyz * 2.0 - r9.xzy;
    ps = UniformScalar_7.x * r6.z;
    r5.x = saturate(dot(r7.zxy, r5.yxz));
    r2.w = ps;
    ps = log2(r5.x);
    r2.x = r2.y * r4.x;
    r3.w = ps;
    r6.xy = r3.xy * r3.wz;
    r5.xyz = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r2.xwz + UniformScalar_8.xxx;
    r6.x = ps;
    r6.xyz = r6.ywz * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
