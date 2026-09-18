// ps_23664f382fb4f8ac.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041200 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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

    r18 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r18.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.x = ps;
    r7.xyw = tex2D(Texture2D_2, r6.xy).wyx;
    r10.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r5.w - 4e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    r11.zw = r7.wy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r11.y = saturate(r6.z * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r9.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r15.xyz = r11.yzw * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r11.zw = r9.xy * r15.xx;
    r11.y = ps;
    r6.xz = r11.xy - 0.5;
    r4.xw = float2((r11.xy >= 0.5));
    ps = r6.y;
    r6.xz = r6.xz - r11.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xz * r4.xw;
    r6.z = ps;
    ps = r6.w;
    r10 = r11.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.xy = r10.zw + r10.zw;
    r6.w = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r11 = tex2D(Texture2D_1, r6.xy);
    r6.yzw = tex2D(Texture2D_2, r1.wz).yxw;
    ps = 0.1 - -r2.z;
    r7.w = saturate(r5.w * 0.0001);
    r6.x = ps;
    r7.y = r7.x * r6.w - 1.0;
    ps = 5.0 * r6.x;
    r0.zw = r1.wz * UniformVector_6.xy;
    r7.x = saturate(ps);
    ps = r6.z + r6.z;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    r7.z = ps;
    ps = r6.y + r6.y;
    r6.zw = -r7.wx + 1.0;
    r7.w = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r7.x = dot(r4.xww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r6.x = (r7.x == 0.0) ? r11.x : r11.y;
    ps = ModShadowGroupColor.y * r6.w;
    r16 = r7.xxzw + float4(-3.0, -2.0, -1.0, -1.0);
    r6.w = ps;
    r6.x = (r16.y == 0.0) ? r11.z : r6.x;
    r6.x = (r16.x == 0.0) ? r11.w : r6.x;
    ps = 1.0 - r6.x;
    r7.z = max(r6.x, 0.0);
    r7.x = ps;
    ps = 1.0 - r6.w;
    r4.x = min(r7.z, 0.3);
    r7.z = ps;
    ps = 1.0 - r6.y;
    r4.xyw = r4.yzx * float3(0.875, 0.875, 3.3333333);
    r7.w = ps;
    r14.xyz = r4.wxy * r7.ywz + float3(1.0, 0.125, 0.125);
    ps = 1.0 / r5.w;
    r8.x = abs(r14.x) * abs(r14.x);
    r8.w = ps;
    r11.xzw = r8.xyz * r8.xww;
    r6.xy = r11.zw + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r11.y = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r17.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r0.xyw = tex2D(Texture2D_0, r10.xy).zyx;
    r10.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r5.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.y = dot(r3.zxy, r3.zxy);
    r1.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r5.xyz = r5.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r18.xyz = r1.xyz * r18.xyz;
    r10.xyz = r10.xyz * 2.0 - 1.0;
    r0.yzw = r0.wyx * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(-r6.y + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r6.y));
    r4.xyz = r6.www * r2.xyz;
    r6.y = ps;
    r2.w = r10.z * UniformVector_4.z - r0.w;
    ps = log2(r6.x);
    r1.xyz = r6.yyy * -SpotDirection.xyz;
    r6.x = ps;
    r6.y = dot(r1.zxy, r3.zxy);
    ps = -SpotAngles.x - -r6.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    ps = SpotAngles.y * r6.w;
    r3.xyz = r18.xyz * r17.xyz;
    r14.w = saturate(ps);
    ps = 2.5 * r7.x;
    r2.xy = r16.zw + r15.yz;
    r3.w = ps;
    r7.xy = r4.ww * r2.xy - r0.yz;
    r2.xyz = r3.xyz * r14.xxx - r12.xyz;
    r7.xy = r10.xy * UniformVector_4.xy + r7.xy;
    r0.w = saturate(r3.w * r14.x - 0.5);
    r10.xy = r7.xy * r0.ww + r0.yz;
    r7.xw = r14.yw * r14.zw;
    r7.xyz = r7.xxx * r13.xyz + ModShadowColor.xyz;
    r6.y = r2.w * r0.w - 2.0;
    r3.xyz = r2.xyz * r0.www + r12.xyz;
    r10.z = r0.x * 2.0 + r6.y;
    r2.xz = r11.yx * r11.yx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r8.xyz = r2.xxx * r8.xyz;
    r0.x = ps;
    ps = r2.z;
    r10.xyw = r10.xyz * r6.zzz;
    ps = r5.x * ps;
    r10.z = r10.w + 1.0;
    r2.x = ps;
    r10.xyz = (r6.zzz > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.zzz >= 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r0.x);
    r6.x = dot(r6.wyz, r6.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r8.xzy * r0.xxx;
    r6.x = ps;
    ps = r2.z;
    r6.yzw = r6.yzw * r6.xxx;
    ps = r5.y * ps;
    r6.x = dot(r6.wyz, r9.zxy);
    r2.y = ps;
    ps = r2.z;
    r8.xyz = r6.yzw * r6.xxx;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    ps = r5.z * ps;
    r6.x = saturate(dot(r4.zxy, r8.zxy));
    r2.z = ps;
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r0.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r1.xyz = r3.xyz * r1.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r4.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.www;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
