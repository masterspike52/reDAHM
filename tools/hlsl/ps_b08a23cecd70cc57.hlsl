// ps_b08a23cecd70cc57.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r12.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = 0.0001 * r4.w;
    r5.xy = r5.xy * abs(r7.xy);
    r6.z = saturate(ps);
    r6.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = UniformScalar_2.x;
    r8.w = UniformVector_4.y * UniformScalar_5.x;
    ps = UniformVector_4.y * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r8.y = ps;
    ps = UniformVector_2.x;
    r5.x = r1.z + 0.1;
    ps = UniformScalar_4.x * ps;
    r7.xy = r0.wz * UniformVector_5.xy;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r10.xy = r6.xy * 0.875;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r8.xz = r5.yz * UniformVector_4.xx;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r8 = r8 + r0.xyxy;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r9.xyz = -r6.xyz + 1.0;
    r9.w = ps;
    r6.xy = r10.zw * r9.ww + ScreenPositionScaleBias.wz;
    r15 = tex2D(Texture2D_1, r8.xy);
    r4 = tex2D(Texture2D_2, r8.zw);
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_3.x;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r1.w = dot(r1.zxy, r1.zxy);
    r13.x = ps;
    ps = UniformVector_3.y;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r3.w = float((UniformScalar_8.x > 1.0));
    r13.y = ps;
    ps = UniformVector_3.z;
    r14.xyz = r12.xyz * UniformScalar_9.xxx;
    ps = 2e+01 * ps;
    r11.xyz = r7.xyz * r2.www;
    r13.z = ps;
    r2.xyz = (-abs(r3.www) >= 0.0) ? r0.xyz : 1.0;
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r0.xyz = r4.xyz * r4.www;
    r1.w = ps;
    ps = rsqrt(abs(r0.w));
    r4.xyz = r1.www * r1.xyz;
    r0.w = ps;
    ps = 1.0 - r5.x;
    r7.xyz = r0.www * r3.xyz;
    r5.x = saturate(ps);
    r0.xyz = r15.xyz * r15.www + r0.xyz;
    ps = log2(r5.x);
    r5.yzw = r5.ywz * UniformVector_2.xzy;
    r5.x = ps;
    r1.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r2.xyz;
    r2.xyz = r14.xyz * r1.xyz + UniformScalar_10.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyw = r13.yzx * r0.yzx;
    r6.w = ps;
    r1.xyz = r1.xyz * r12.xyz + r0.wxy;
    ps = pow(2.0, r6.w);
    r5.x = dot(r0.ywx, float3(0.11, 0.3, 0.59));
    r6.w = ps;
    ps = r5.x;
    r0.xyz = r11.xzy * r6.www;
    ps = -r0.w + ps;
    r1.xyz = r1.xyz * r8.xyz;
    r5.x = ps;
    r8.w = saturate(r5.x + r0.w);
    ps = 1.0 - r5.z;
    r3.xy = -r5.yw * r8.ww;
    r8.x = ps;
    r8.yz = r10.xy * r9.xy + 0.125;
    r3.zw = r8.xy * r8.wz;
    r6.xyz = r3.www * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r5.zyw + r3.zxy;
    ps = (-1.0) - -r5.x;
    r5.w = ps;
    r5.xyz = r5.wyz * r9.zzz;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r9.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r3.xyz = (r9.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.x));
    r5.y = -r8.w + 1.0;
    r5.x = ps;
    r3.xyz = r3.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r7.zxy);
    r5.xzw = r3.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r7.xyz;
    r5.x = saturate(dot(r4.zxy, r5.wxz));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r5.yyy;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
