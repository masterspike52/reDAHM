// ps_d0ee436d2c4e259c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r1.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.z + 1.0;
    r7.z = ps;
    r0.zw = r1.wz * 6.0;
    r7.xy = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r7.w = ps;
    ps = r2.z;
    r10.xy = r1.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r2.w));
    r6.w = r14.x - 0.5;
    r2.w = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r2.www * r4.xyz;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.y;
    r11.x = r1.w * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r11.zw = r9.xy * r6.ww;
    r11.y = ps;
    r4.xy = r11.xy - 0.5;
    r6.zw = float2((r11.xy >= 0.5));
    ps = r7.z;
    r4.xy = r4.xy - r11.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r4.xy * r6.zw;
    r4.x = ps;
    ps = r7.w;
    r15 = r11.zwxy + r10;
    ps = abs(r8.y) * ps;
    r7.zw = r15.zw + r15.zw;
    r4.y = ps;
    r18.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r17 = tex2D(Texture2D_1, r7.zw);
    r7.xyw = tex2D(Texture2D_3, r7.xy).xyw;
    r11.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r8.xyz = tex2D(Texture2D_2, r1.wz).wxy;
    r10.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r12.xyz = r4.xyw * 2.0 - 1.0;
    r10.xyw = r10.xyz * 2.0 - 1.0;
    ps = r11.x + r11.x;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r16.x = ps;
    ps = r11.y + r11.y;
    r16.zw = r7.xy + r7.xy;
    r16.y = ps;
    ps = r8.y + r8.y;
    r16 = r16 - 1.0;
    r19.y = ps;
    ps = r8.z + r8.z;
    r19.x = dot(r6.zww, float3(1.0, 1.0, 1.0));
    r19.z = ps;
    r6.z = (r19.x == 0.0) ? r17.x : r17.y;
    r19 = r19.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r0.zw = r16.xy * 0.5 + r19.zw;
    r6.z = (r19.y == 0.0) ? r17.z : r6.z;
    r6.z = (r19.x == 0.0) ? r17.w : r6.z;
    ps = r5.w;
    r6.w = max(r6.z, 0.0);
    ps = 0.0001 * ps;
    r6.xz = -r6.zx + 1.0;
    r17.x = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r18.x = min(r6.w, 0.3);
    r17.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyz = r18.xyz * float3(3.3333333, 0.875, 0.875);
    r17.z = ps;
    r8.yzw = -r17.zyx + 1.0;
    ps = 1.0 / r5.w;
    r6.z = r8.w * UniformScalar_1.x;
    r6.y = ps;
    r6.zw = r6.zz * r16.zw + r10.xy;
    r6.zw = r6.zw * UniformVector_4.xy - r12.xy;
    r13.xy = r7.xx * r0.zw + r6.zw;
    r6.yz = r13.zw * r6.yy + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r14.x = tex2D(ShadowTexture, r0.xy).x;
    r5.xyz = tex2D(Texture2D_5, r15.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = dot(r2.zxy, r2.zxy);
    r4.xyz = r15.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r6.y));
    r6.z = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    r8.x = r11.w * r8.x - 1.0;
    ps = 1.0 - r6.z;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = saturate(ps);
    r10.w = r10.w * UniformVector_4.z - r12.z;
    ps = log2(r6.y);
    r7.w = r7.w - 1.0;
    r6.y = ps;
    ps = 2.5 * r6.x;
    r0.xyz = r0.xyz * r14.yzw;
    r0.w = ps;
    r7 = r7.yzwx * r8.zywx + float4(0.125, 0.125, 1.0, 1.0);
    ps = abs(r7.w) * abs(r7.w);
    r3.xyz = r6.www * r2.xyz;
    r14.y = ps;
    ps = r7.x * r7.y;
    r0.xyz = r0.xyz * r7.zzz;
    r6.x = ps;
    r7.xyz = r6.xxx * r10.xyz + ModShadowColor.xyz;
    r10.xyz = r0.xyz * r7.www - r5.xyz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r6.xz = r14.xy * r14.xy;
    r6.y = ps;
    r0.w = saturate(r0.w * r7.w - 0.5);
    r2.xy = r13.xy * r0.ww + r12.xy;
    ps = pow(2.0, r6.y);
    r0.xyz = r6.xxx * r11.xyz;
    r7.w = ps;
    r5.xyz = r10.xyz * r0.www + r5.xyz;
    r6.y = r10.w * r0.w - 2.0;
    r2.z = r4.w * 2.0 + r6.y;
    ps = r6.z * r6.z;
    r2.xyw = r2.xyz * r8.www;
    r6.x = ps;
    ps = r6.x;
    r2.z = r2.w + 1.0;
    r6.yzw = (r8.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.yzw = (r8.www >= 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    ps = r4.x * ps;
    r6.y = dot(r2.wyz, r2.wyz);
    r2.x = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r5.xyz * r1.xyz;
    r6.y = ps;
    ps = r6.x;
    r6.yzw = r2.yzw * r6.yyy;
    ps = r4.y * ps;
    r1.w = dot(r6.wyz, r9.zxy);
    r2.y = ps;
    ps = r6.x;
    r5.xyz = r6.yzw * r1.www;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = r4.z * ps;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    r2.z = ps;
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r0.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r0.xyz = r0.xzy * r7.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
