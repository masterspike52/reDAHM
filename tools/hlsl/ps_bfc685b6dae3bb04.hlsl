// ps_bfc685b6dae3bb04.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.zw = UniformVector_2.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.yy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.yzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.yzw = tex2D(Texture2D_4, r5.zw).xyz;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.x = tex2D(Texture2D_3, r0.xy).x;
    ps = -UniformVector_0.x;
    r8.z = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = -UniformVector_0.y;
    r1.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    ps = 1.0 + ps;
    r7.w = float((UniformScalar_1.x > UniformScalar_0.x));
    r4.y = ps;
    ps = -UniformVector_0.z;
    r8.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r0.x = r1.z + 0.1;
    r4.z = ps;
    ps = 1.0 - r6.x;
    r5.z = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    ps = 1.0 - r5.z;
    r5.w = dot(r1.zxy, r1.zxy);
    r4.w = saturate(ps);
    ps = 0.875 * r5.x;
    r0.yzw = r12.xyz * UniformVector_1.xyz;
    r9.x = ps;
    ps = 0.875 * r5.y;
    r2.xyz = r9.yzw * r6.xxx;
    r9.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r0.x * 5.0);
    r3.w = ps;
    ps = 1.0 - r5.x;
    r5.yzw = r10.xyz * r11.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r8.x));
    r6.x = saturate(r3.w * r1.z);
    r5.x = ps;
    r8.xyw = (-abs(r7.www) >= 0.0) ? r10.xyz : r5.yzw;
    ps = log2(r4.w);
    r5.yzw = r5.xxx * r3.zxy;
    r5.x = ps;
    ps = -r5.z;
    r3.xyz = r3.www * r1.zxy;
    r5.z = ps;
    r5.y = r5.y * 2.0 - r5.y;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r10.xyz : r8.xyw;
    r8.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r8.xy = r9.xy * r8.xy + 0.125;
    ps = -r5.w;
    r1.xyz = -r0.yzw + r1.xyz;
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.x = saturate(dot(r3.yzx, r5.zwy));
    r5.w = ps;
    r5.xyz = r1.xyz * UniformScalar_1.xxx + r0.yzw;
    r0.yzw = r5.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = log2(r0.x);
    r1 = r2.xzwy * r5.xzzy;
    r8.w = ps;
    r2.xy = r2.ww * r5.xy + r1.xw;
    ps = r1.y + r1.z;
    r1.xw = r8.xz * r8.yw;
    r2.z = ps;
    r5.xyz = r1.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r1.xyz = r2.xyz * r4.xyz;
    r0.x = ps;
    ps = pow(2.0, r5.w);
    r0.xyz = r0.yzw * r0.xxx;
    r5.w = ps;
    r0.xy = r1.xy * r6.xx + r0.xy;
    r0.z = r1.z * r6.x + r0.z;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.yzw;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
