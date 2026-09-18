// ps_e3788d08751be76e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10040D00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r2.zw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.zw = r0.xy + 0.5;
    r11.xy = r0.xy * UniformVector_3.xy;
    r5.y = dot(r1.zxy, r1.zxy);
    r7.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.z = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r9.xyz = r5.yyy * r1.xyz;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r7.zxy, r7.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r2.xxx * r3.xyz;
    r5.y = ps;
    r10.xyz = r7.xyz * r5.yyy;
    r5.y = dot(r10.zxy, r6.zxy);
    ps = -r0.z;
    r5.yzw = r10.xzy * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r6.xzy;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r9.zxy, r5.zyw));
    r5.z = ps;
    ps = log2(r5.y);
    r12.x = r5.z * UniformVector_2.y;
    r2.y = ps;
    ps = r0.w;
    r2 = r2.zwyx * float4(0.875, 0.875, 15.0, -0.05);
    ps = UniformVector_2.x * ps;
    r12.zw = r2.ww * r3.xy;
    r12.y = ps;
    r3 = r12.yxzw + float4(-0.5, -0.5, 0.5, 0.5);
    ps = r11.z;
    r7.xy = float2((r12.xy >= 0.5));
    ps = r12.z + ps;
    r7.zw = r3.zw + r0.xy;
    r5.y = ps;
    ps = r11.w;
    r5.zw = r3.xy - r12.yx;
    r5.zw = r5.zw * r7.yx + r12.yx;
    ps = r12.w + ps;
    r3.xy = r5.zw + r5.zw;
    r5.z = ps;
    r6.w = tex2D(Texture2D_3, r11.xy).x;
    r3 = tex2D(Texture2D_2, r3.xy);
    r5.w = tex2D(Texture2D_1, r7.zw).w;
    r11 = tex2D(Texture2D_1, r0.xy);
    r13.xyz = tex2D(Texture2D_1, r5.yz).xyz;
    ps = 1.0 / r4.w;
    r5.y = r1.z + 0.1;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r12.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r5.x = saturate(ps);
    ps = ScreenPositionScaleBias.x * r5.z;
    r0.xzw = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r1.xyz = r13.xyz * 0.15;
    r7.w = ps;
    r6.xy = r7.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.yzw = r12.xyz * r11.xyz - r1.xyz;
    ps = log2(r5.x);
    r4.x = -r5.w + 1.0;
    r5.x = ps;
    r0.y = max(r6.z, 0.0);
    r5.w = r4.x * r11.w + r5.w;
    r1.xyz = r4.yzw * r11.www + r1.xyz;
    ps = 5.0 * r5.y;
    r4.xyz = r1.xyz * r0.xzw;
    r0.x = saturate(ps);
    r1.xyz = r1.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r5.yz = -r0.yx + 1.0;
    ps = log2(abs(r5.y));
    r0.x = saturate(dot(r10.zxy, r9.zxy));
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r6.z = dot(r7.yxx, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r0.yz = r5.zz * ModShadowGroupColor.xy;
    r5.z = ps;
    ps = pow(2.0, r2.z);
    r2.w = -r5.z + 1.0;
    r5.y = ps;
    r1.xyz = r1.xyz * r5.yyy;
    r1.xy = r4.xy * r0.xx + r1.xy;
    r1.z = r4.z * r0.x + r1.z;
    r5.y = (r6.z == 0.0) ? r3.x : r3.y;
    r4.xyz = r6.zzw + float3(-3.0, -2.0, 1.0);
    r2.z = r4.z - r5.z;
    r5.y = (r4.y == 0.0) ? r3.z : r5.y;
    r0.x = (r4.x == 0.0) ? r3.w : r5.y;
    r0.yzw = -r0.xyz + 1.0;
    r2.xy = r2.xy * r0.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yz = r2.xz * r2.yw;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.w = r5.z * r5.w;
    r0.x = ps;
    r0 = r1 * r0.xxxy;
    ps = (-0.5) - -r0.w;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r5.xyz = r5.yyy * r8.xyz + ModShadowColor.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
