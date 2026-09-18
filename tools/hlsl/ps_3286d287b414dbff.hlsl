// ps_3286d287b414dbff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000408 10040F00 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_13 : register(c11); // float
float4 UniformScalar_14 : register(c12); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_3, r1.xy);
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = r15.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r14.yzw = tex2D(Texture2D_0, r6.xy).xyw;
    r7.yw = r1.wz * UniformVector_5.xy;
    r11.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r6.x = r2.z + 0.1;
    r13.xy = r14.yz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.x = saturate(r6.x * 5.0);
    r6.z = saturate(ps);
    ps = 1.0 / r5.w;
    r6.x = -r6.x + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.xx * ModShadowGroupColor.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yzw = -r6.zxy + 1.0;
    r7.z = ps;
    ps = UniformScalar_1.x * r6.y;
    r7.xz = r7.xz * abs(r9.xy);
    r11.x = ps;
    r8.xy = r11.yz * r13.zz + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r9.y = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r9.w = tex2D(Texture2D_2, r1.xy).x;
    r7.xz = tex2D(ModShadowAccumTexture, r7.xz).xy;
    r12.xyz = tex2D(Texture2D_4, r7.yw).xyz;
    r8.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r9.x = float((UniformScalar_14.x >= 1.0));
    r0.w = float((UniformScalar_14.x > 1.0));
    r7.y = dot(r4.zxy, r4.zxy);
    r8.w = float((UniformScalar_13.x >= 1.0));
    ps = UniformVector_4.x * UniformVector_4.w;
    r1.x = float((UniformScalar_13.x > 1.0));
    r1.y = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r7.w = dot(r2.zxy, r2.zxy);
    r1.z = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r7.w));
    r3.xyz = r1.yzw * r15.xyz;
    r7.w = ps;
    r8.xyz = r8.zxy * 2.0 - 1.0;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r12.xyz : 1.0;
    r1.xyz = (-abs(r8.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = rsqrt(abs(r7.y));
    r12.xyz = r7.www * r2.xyz;
    r7.y = ps;
    ps = UniformVector_2.z * r8.x;
    r2.yzw = r7.yyy * r4.xyz;
    r14.x = ps;
    r4.zw = r14.xw - 1.0;
    r7.yw = r11.xx * r13.xy + r8.yz;
    r4.xy = r7.yw * UniformVector_2.xy;
    r8.xyw = r4.xyz * r6.yyy;
    ps = 1.0 - r6.x;
    r8.z = r8.w + 1.0;
    r7.y = saturate(ps);
    r8.xyz = (r6.yyy > 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r8.xyw = (r6.yyy >= 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    ps = log2(r7.y);
    r6.x = dot(r8.wxy, r8.wxy);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.z = r7.y * LightColorAndFalloffExponent.w;
    r6.x = ps;
    ps = -ModShadowColor.x;
    r8.xyw = r8.xyw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r8.wxy, r2.wyz);
    r2.x = ps;
    ps = -ModShadowColor.y;
    r13.xyz = r8.xyw * r6.xxx;
    r2.yzw = r13.xyz * 2.0 - r2.yzw;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r12.zxy, r2.wyz));
    r2.y = ps;
    ps = log2(r6.x);
    r4.z = r4.w * r6.y;
    r7.y = ps;
    ps = UniformScalar_9.x * r7.y;
    r7.w = saturate(dot(r8.wyx, r12.zyx));
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r8.xyw = r7.xzy * float3(0.875, 0.875, 15.0);
    r6.y = ps;
    ps = -ModShadowColor.z;
    r4.xy = r8.xy * r6.zw;
    ps = 1.0 + ps;
    r6.xzw = r4.xyz + float3(0.125, 0.125, 1.0);
    r2.z = ps;
    r7.x = (r11.x > 0.0) ? r6.w : 1.0;
    ps = UniformScalar_10.x * r6.y;
    r6.x = r6.x * r6.z;
    r6.w = ps;
    r6.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    r9.z = (r11.x >= 0.0) ? r7.x : 1.0;
    r3.w = r6.w * r9.z;
    r1 = r3 * r1.xyzx;
    r1 = r1 * r9.zzzw;
    r0.xyz = r1.xyz * r0.xyz;
    r9.z = (r0.w > 0.0) ? 0.0 : r1.w;
    r7.xyz = -r1.xyz + r10.xyz;
    r7.xyz = r7.xyz * UniformScalar_15.xxx + r1.xyz;
    r8.xy = r9.xy * r9.zy;
    r7.xyz = r7.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    r7.xyz = r7.xyz + r8.xxx;
    ps = pow(2.0, r8.z);
    r1.xyz = r8.yyy * r5.xyz;
    r6.w = ps;
    ps = pow(2.0, r8.w);
    r8.xyz = r1.xzy * r6.www;
    r6.w = ps;
    r7.xyz = r7.xyz * r6.www;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
