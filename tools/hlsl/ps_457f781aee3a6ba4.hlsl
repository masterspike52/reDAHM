// ps_457f781aee3a6ba4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 318 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004F8 10041100 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_5, r1.xy);
    r6.xy = r1.wz * 6.0;
    r6.z = r17.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r10.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = -r1.z + 1.0;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r8.z = ps;
    r13.yz = r10.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r11.y = r6.w * UniformVector_2.y;
    r6.z = ps;
    ps = 0.1 - -r2.z;
    r6.y = r5.w - 4e+02;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.xy = r1.wz * UniformVector_1.xy;
    r13.w = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r10.xyz = r6.zzz * r4.xyz;
    r13.x = saturate(ps);
    ps = r1.w;
    r15.xyz = r13.xyz * float3(-0.025, 0.5, 0.5);
    ps = UniformVector_2.x * ps;
    r11.zw = r10.xy * r15.xx;
    r11.x = ps;
    r6.xy = r11.xy - 0.5;
    r8.xw = float2((r11.xy >= 0.5));
    ps = r8.y;
    r6.xy = r6.xy - r11.xy;
    ps = abs(r9.x) * ps;
    r7.zw = r6.xy * r8.xw;
    r6.z = ps;
    ps = r8.z;
    r7 = r11.zwyx + r7.xywz;
    ps = abs(r9.y) * ps;
    r6.xy = r7.wz + r7.wz;
    r6.w = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r9 = tex2D(Texture2D_1, r6.xy);
    r11.xyz = tex2D(Texture2D_2, r1.wz).xwy;
    ps = 0.0001 * r5.w;
    r6.x = saturate(ps);
    ps = r1.w;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    r12.x = r10.w * r11.y - 1.0;
    ps = UniformVector_7.x * ps;
    r6.y = -r13.w + 1.0;
    r0.z = ps;
    ps = r11.x + r11.x;
    r6.yz = r6.yy * ModShadowGroupColor.xy;
    r11.y = ps;
    ps = r11.z + r11.z;
    r11.x = dot(r8.xww, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    r6.w = (r11.x == 0.0) ? r9.x : r9.y;
    ps = 1.0 - r6.x;
    r16 = r11.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r12.w = ps;
    r6.x = (r16.y == 0.0) ? r9.z : r6.w;
    r6.x = (r16.x == 0.0) ? r9.w : r6.x;
    ps = 1.0 - r6.z;
    r6.w = max(r6.x, 0.0);
    r12.y = ps;
    ps = 1.0 - r6.x;
    r4.x = min(r6.w, 0.3);
    r4.w = ps;
    ps = 1.0 - r6.y;
    r13 = r4.xzyw * float4(3.3333333, 0.875, 0.875, 2.5);
    r12.z = ps;
    r9.xyz = r13.xzy * r12.xzy + float3(1.0, 0.125, 0.125);
    ps = 1.0 / r5.w;
    r8.x = abs(r9.x) * abs(r9.x);
    r8.w = ps;
    ps = r1.z;
    r8.xzw = r8.xyz * r8.xww;
    ps = UniformVector_7.y * ps;
    r6.xy = r8.zw + ScreenPositionScaleBias.wz;
    r0.w = ps;
    r7.w = tex2D(Texture2D_4, r1.xy).x;
    r4.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r5.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r11.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r8.y = tex2D(ShadowTexture, r0.xy).x;
    r14.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r7.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r1.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r1.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.x = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    r3.xyz = r6.yzw * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r1.xyz = r1.xyz * r17.xyz;
    r6.x = saturate(ps);
    r14.xyz = r14.xyz * 2.0 - 1.0;
    ps = log2(r6.x);
    r14.xyz = r14.xyz * UniformVector_4.xyz;
    r6.x = ps;
    ps = -r3.z;
    r2.xyz = r0.www * r2.xyz;
    ps = r14.z + ps;
    r15.xy = r16.zw + r15.yz;
    r13.z = ps;
    r13.xy = r13.xx * r15.xy + r14.xy;
    r6.z = saturate(r13.w * r9.x - 0.5);
    ps = r9.y * r9.z;
    r13.xy = r13.xy - r3.xy;
    r0.w = ps;
    r7.xyz = r0.www * r7.xyz + ModShadowColor.xyz;
    r3.xy = r13.xy * r6.zz + r3.xy;
    r6.y = r13.z * r6.z - 2.0;
    r3.z = r6.w * 2.0 + r6.y;
    r8.xw = r8.yx * r8.yx;
    r11.xyz = r8.xxx * r11.xyz;
    r3.xyw = r3.xyz * r12.www;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.z = r3.w + 1.0;
    r6.y = ps;
    r3.xyz = (r12.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r12.www >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.y);
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r11.xzy * r6.yyy;
    r6.x = ps;
    r3.xyz = r3.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r10.zxy);
    r6.xyw = r3.xyz * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r10.xyz;
    r6.x = saturate(dot(r2.zxy, r6.wxy));
    ps = log2(r6.x);
    r6.w = saturate(dot(r3.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r6.x = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_8.x * r6.y;
    r1.w = ps;
    r1 = r1 * r5.xyzx;
    r2.xyz = r1.xyz * r9.xxx - r4.xyz;
    r1.xyz = r1.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r1.xyz = r1.www * r7.www + r1.xyz;
    r2.xyz = r2.xyz * r6.zzz + r4.xyz;
    r0.xyz = r2.xyz * r0.xyz;
    r1.xyz = r8.www * r1.xyz;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
