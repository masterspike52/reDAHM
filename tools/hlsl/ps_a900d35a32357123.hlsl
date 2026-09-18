// ps_a900d35a32357123.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041100 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r14.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.x = ps;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r10.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 4e+02;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r6.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    ps = -r1.z;
    r9.xyz = r6.www * r4.xyz;
    ps = 1.0 + ps;
    r15.xyz = r6.xyz * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r11.zw = r9.xy * r15.xx;
    r11.y = ps;
    r6.xy = r11.xy - 0.5;
    r7.xw = float2((r11.xy >= 0.5));
    ps = r0.z;
    r6.xy = r6.xy - r11.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xy * r7.xw;
    r7.y = ps;
    ps = r0.w;
    r6 = r11.xzyw + r10.zxwy;
    ps = abs(r8.y) * ps;
    r0.zw = r6.xz + r6.xz;
    r7.z = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r7.yz).xy;
    r11 = tex2D(Texture2D_1, r0.zw);
    r4.xyw = tex2D(Texture2D_2, r1.wz).xwy;
    ps = 0.1 - -r2.z;
    r8.x = saturate(r5.w * 0.0001);
    r6.x = ps;
    r10.x = r9.w * r4.y - 1.0;
    ps = r4.x + r4.x;
    r4.yz = r5.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    ps = r4.w + r4.w;
    r8.y = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r8.w = ps;
    r7.x = (r8.y == 0.0) ? r11.x : r11.y;
    r16 = r8.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r7.x = (r16.y == 0.0) ? r11.z : r7.x;
    r0.w = (r16.x == 0.0) ? r11.w : r7.x;
    ps = 5.0 * r6.x;
    r7.x = max(r0.w, 0.0);
    r0.z = saturate(ps);
    r6.xz = -r0.wz + 1.0;
    ps = ModShadowGroupColor.x * r6.z;
    r7.x = min(r7.x, 0.3);
    r8.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyw = r7.yzx * float3(0.875, 0.875, 3.3333333);
    r8.z = ps;
    r10.yzw = -r8.zyx + 1.0;
    r13.xyz = r7.wxy * r10.xzy + float3(1.0, 0.125, 0.125);
    ps = 1.0 / r5.w;
    r4.x = abs(r13.x) * abs(r13.x);
    r4.w = ps;
    r11.xzw = r4.xyz * r4.xww;
    r0.zw = r11.zw + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r11.y = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_4, r6.yw).xyz;
    r5.xyw = tex2D(Texture2D_0, r6.yw).xyz;
    r17.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.y = dot(r3.zxy, r3.zxy);
    r8.xyz = r1.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = rsqrt(abs(r6.y));
    r1.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r14.xyz = r1.xyz * r14.xyz;
    r6.y = saturate(ps);
    r1.xyw = r17.xyz * 2.0 - 1.0;
    r5.xyz = r5.xyw * 2.0 - 1.0;
    r1.w = r1.w * UniformVector_4.z - r5.z;
    ps = log2(r6.y);
    r17.xyz = r6.zzz * -SpotDirection.xyz;
    r6.y = ps;
    r6.z = dot(r17.zxy, r3.zxy);
    ps = rsqrt(abs(r6.w));
    r6.z = r6.z - SpotAngles.x;
    r6.w = ps;
    ps = SpotAngles.y * r6.z;
    r3.xyz = r6.www * r2.xyz;
    r13.w = saturate(ps);
    ps = 2.5 * r6.x;
    r2.xy = r16.zw + r15.yz;
    r14.w = ps;
    r6.xz = r7.ww * r2.xy - r5.xy;
    r6.xz = r1.xy * UniformVector_4.xy + r6.xz;
    r1.xyz = r14.xyz * r13.xxx - r12.xyz;
    r6.w = saturate(r14.w * r13.x - 0.5);
    r2.xy = r6.xz * r6.ww + r5.xy;
    r6.xz = r13.yw * r13.zw;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    r7.w = r1.w * r6.w - 2.0;
    r5.xyz = r1.xyz * r6.www + r12.xyz;
    r2.z = r5.w * 2.0 + r7.w;
    r1.xw = r11.yx * r11.yx;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r4.xyz = r1.xxx * r4.xyz;
    r7.w = ps;
    ps = r1.w;
    r11.xyw = r2.xyz * r10.www;
    ps = r8.x * ps;
    r11.z = r11.w + 1.0;
    r2.x = ps;
    r2.yzw = (r10.www > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r2.yzw = (r10.www >= 0.0) ? r2.yzw : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.y = dot(r2.wyz, r2.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r4.xzy * r7.www;
    r6.y = ps;
    ps = r1.w;
    r4.xyz = r2.yzw * r6.yyy;
    ps = r8.y * ps;
    r6.y = dot(r4.zxy, r9.zxy);
    r2.y = ps;
    ps = r1.w;
    r10.xyz = r4.xyz * r6.yyy;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = r8.z * ps;
    r6.y = saturate(dot(r3.zxy, r9.zxy));
    r2.z = ps;
    ps = log2(r6.y);
    r2.xyz = r2.xyz * r6.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r0.xyz = r5.xyz * r0.xyz;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r7.w = saturate(dot(r4.zyx, r3.zyx));
    r6.y = ps;
    r6.xyw = r2.xyz * r6.yyy;
    r0.xy = r0.xy * r7.ww + r6.xy;
    r0.z = r0.z * r7.w + r6.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.zzz;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
