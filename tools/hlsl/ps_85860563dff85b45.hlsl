// ps_85860563dff85b45.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040D00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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

    r8 = tex2D(Texture2D_2, r0.xy).xzyw;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = r8.w - 0.5;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    r5.yz = r5.yz * abs(r7.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.yw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    ps = r1.z;
    r6.xy = r0.wz * UniformVector_4.xy;
    ps = 0.1 + ps;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = 5.0 * r5.z;
    r7.z = saturate(r4.w * 0.0001);
    r5.z = saturate(ps);
    ps = 0.875 * r5.y;
    r5.z = -r5.z + 1.0;
    r12.x = ps;
    ps = 0.875 * r5.w;
    r7.xy = r5.zz * ModShadowGroupColor.xy;
    r12.y = ps;
    ps = 1.0 / r4.w;
    r10.xyz = -r7.xyz + 1.0;
    r10.w = ps;
    r5.yz = r12.zw * r10.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r9.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0 = tex2D(Texture2D_1, r0.xy);
    r7.xzw = -ModShadowColor.xyz + 1.0;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r13.xyz = UniformVector_3.xyz * 2e+01;
    r1.w = float((UniformScalar_3.x >= 1.0));
    r6.w = dot(r3.zxy, r3.zxy);
    ps = 1.0 - r5.x;
    r3.w = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = r8.z;
    r5.z = float((UniformScalar_3.x > 1.0));
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r0.xyw = r0.xyz * r0.www;
    r0.z = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r5.yzw = (-abs(r5.zzz) >= 0.0) ? r9.xyz : 1.0;
    ps = rsqrt(abs(r3.w));
    r2.xyz = r4.xyz * r2.www;
    r2.w = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r2.www * r1.xyz;
    r6.w = ps;
    ps = UniformScalar_4.x * r8.y;
    r9.xyz = r6.www * r3.xyz;
    r6.w = ps;
    r5.yzw = (-abs(r1.www) >= 0.0) ? 1.0 : r5.yzw;
    ps = log2(r5.x);
    r6.xyz = r6.zxy * UniformVector_2.zxy;
    r5.x = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r13.xyz * r0.xyw;
    r0.y = ps;
    r3.xyz = r5.yzw * r8.xzy + r1.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.x = dot(r1.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.x = r0.x - r1.x;
    r5.x = ps;
    ps = r0.x;
    r3.xyz = r3.xyz * r11.xyz;
    ps = r1.x + ps;
    r2.xyz = r2.xzy * r5.xxx;
    r0.x = saturate(ps);
    ps = r0.z;
    r11.xy = -r6.yz * r0.xx;
    r0.zw = r12.xy * r10.xy + 0.125;
    ps = r5.z * ps;
    r11.zw = r0.yz * r0.xw;
    r7.y = ps;
    r1.xyz = r11.www * r7.xzw + ModShadowColor.xyz;
    ps = r6.w;
    r6.xyz = r6.yzx + r11.xyz;
    ps = r5.w * ps;
    r6.w = r6.z - 1.0;
    r7.z = ps;
    ps = UniformScalar_4.x * r5.y;
    r6.xyw = r6.xyw * r10.zzz;
    r5.x = ps;
    ps = r5.x;
    r6.z = r6.w + 1.0;
    r5.xyz = (r10.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r8.x * ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r7.xyz + UniformScalar_5.xxx;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r9.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = 1.0 - r0.x;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    r5.y = ps;
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r6.xyz * r5.xxx;
    r5.xy = r3.xy * r5.ww + r5.xy;
    r5.z = r3.z * r5.w + r5.z;
    r5.xyz = r2.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
