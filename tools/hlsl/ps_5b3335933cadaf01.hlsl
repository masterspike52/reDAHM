// ps_5b3335933cadaf01.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040D00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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

    r11 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r8.xy = r6.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r6.xy = r0.wz * UniformVector_2.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = (-0.5) + r5.x;
    r6.zw = r6.zw * abs(r7.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r13.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r5.yz).wxy;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r4.z = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r5.z = float((UniformScalar_4.x >= 1.0));
    r4.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r5.w = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    r2.xy = r6.yz * 2.0 - 1.0;
    ps = (-1.0) + r6.x;
    r0.x = float((UniformScalar_4.x > 1.0));
    r6.z = ps;
    ps = 5.0 * r5.x;
    r6.xyw = r12.zxy + float3(-2.0, 0.0, 0.0);
    r5.y = saturate(ps);
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r13.xyz : 1.0;
    r0.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = 1.0 - r5.y;
    r11.xyz = r4.xyw * r11.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r1.w));
    r6.xyw = r6.ywx + r12.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xyz = r5.xxx * r1.xyz;
    r4.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.xyz = r11.xyz * r0.xyz;
    r4.y = ps;
    ps = (-1.0) + r6.x;
    r4.yzw = -r4.zxy + 1.0;
    r5.x = ps;
    r2.zw = r6.wz * r4.yy + 1.0;
    ps = (-1.0) + r6.y;
    r4.x = r4.y * UniformScalar_1.x;
    r5.y = ps;
    r5.xy = r4.xx * r2.xy + r5.xy;
    r2.xy = r5.xy * r4.yy;
    r6 = (r4.xyyy > 0.0) ? r2.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r2 = (r4.xyyy >= 0.0) ? r6 : float4(1.0, 0.0, 0.0, 1.0);
    r5.x = dot(r2.wyz, r2.wyz);
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.xyz * r2.xxx;
    r5.y = ps;
    r6.xyz = r0.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    r2.xyz = r2.yzw * r5.xxx;
    r5.x = dot(r2.zxy, r3.zxy);
    ps = 1.0 - r5.w;
    r11.xyz = r2.xyz * r5.xxx;
    r5.y = saturate(ps);
    r5.xzw = r11.xyz * 2.0 - r3.xyz;
    ps = log2(r5.y);
    r5.x = saturate(dot(r1.zxy, r5.wxz));
    r5.y = ps;
    ps = log2(r5.x);
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r10.z = ps;
    r5.xzw = r10.xzy * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r5.z);
    r0.xyz = r0.xyz * r9.xyz;
    r5.z = ps;
    r5.xw = r5.xw * r4.zw + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r2.zyx, r1.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
