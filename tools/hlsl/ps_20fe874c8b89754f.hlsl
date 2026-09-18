// ps_20fe874c8b89754f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10041200 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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

    r16 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r7.z = ps;
    r6.zw = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r7.w = ps;
    ps = r4.w;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = r16.w - 0.5;
    r6.x = ps;
    ps = 0.00022222222 * r5.y;
    r9.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.x;
    r3.x = r0.w * UniformVector_2.x;
    r5.y = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r9.xy * r5.yy;
    r3.y = ps;
    r5.xy = r3.xy - 0.5;
    r7.xy = float2((r3.xy >= 0.5));
    ps = r7.z;
    r5.xy = r5.xy - r3.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r5.xy * r7.xy;
    r5.z = ps;
    ps = r7.w;
    r17 = r3 + r10.zwxy;
    ps = abs(r8.y) * ps;
    r5.xy = r17.xy + r17.xy;
    r5.w = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r18 = tex2D(Texture2D_1, r5.xy);
    r5.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r6.zw).xyw;
    r12.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r3.xyw = tex2D(Texture2D_0, r17.zw).xyz;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    r13.x = r8.z * r12.z - 1.0;
    ps = r8.x + r8.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.z = ps;
    ps = r8.y + r8.y;
    r7.zw = r12.xy + r12.xy;
    r14.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = 0.0001 * r4.w;
    r17.xy = r0.wz * UniformVector_7.xy;
    r6.z = saturate(ps);
    ps = UniformVector_4.x * r5.y;
    r6.xz = -r6.zy + 1.0;
    r15.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r7.y = dot(r7.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r5.w = (r7.y == 0.0) ? r18.x : r18.y;
    ps = ModShadowGroupColor.y * r6.z;
    r8 = r7.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r7.z = ps;
    r5.w = (r8.y == 0.0) ? r18.z : r5.w;
    r7.w = (r8.x == 0.0) ? r18.w : r5.w;
    ps = 1.0 - r7.x;
    r5.w = max(r7.w, 0.0);
    r6.z = ps;
    ps = 1.0 - r7.z;
    r10.x = min(r5.w, 0.3);
    r6.w = ps;
    ps = 1.0 - r7.w;
    r10.xyw = r10.yzx * float3(0.875, 0.875, 3.3333333);
    r6.y = ps;
    ps = UniformVector_4.y * r5.z;
    r14.xy = r10.xy * r6.zw;
    r15.y = ps;
    ps = UniformVector_4.z * r5.x;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r15.z = ps;
    r13.yz = r14.zw * 0.5 + r8.zw;
    r5.xy = r10.ww * r13.yz + r15.xy;
    ps = 1.0 / r4.w;
    r12.xy = r5.xy - r11.xy;
    r5.x = ps;
    r5.xy = r12.zw * r5.xx + ScreenPositionScaleBias.wz;
    r4.z = tex2D(Texture2D_4, r0.xy).x;
    r7.xyz = tex2D(Texture2D_7, r17.zw).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.yzw = tex2D(Texture2D_6, r17.xy).xyz;
    r17.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.w = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    r3.xyz = r17.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = UniformVector_6.z * UniformVector_6.w;
    r10.xyz = r8.xyz * r2.www;
    r4.w = ps;
    ps = rsqrt(abs(r7.w));
    r4.xyw = r4.xyw * r16.xyz;
    r7.w = ps;
    ps = 1.0 - r5.x;
    r2.xyz = r7.www * r1.xyz;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r8.xyz = r4.xyw * r5.yzw;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.xyw = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.w = -r11.z + r15.z;
    r5.x = ps;
    ps = 2.5 * r6.y;
    r7.w = r14.x * r14.y;
    r8.w = ps;
    r0.xyz = r7.www * r0.xyz + ModShadowColor.xyz;
    r0.w = r10.w * r13.x + 1.0;
    r6.w = saturate(r8.w * r0.w - 0.5);
    r1.xyz = r8.xyz * r0.www - r7.xyz;
    r8.xyz = r1.xyz * r6.www + r7.xyz;
    r7.xy = r12.xy * r6.ww + r11.xy;
    r6.y = r1.w * r6.w - 2.0;
    r7.z = r3.w * 2.0 + r6.y;
    r7.xyz = r7.zxy * r6.xxx;
    ps = 1.0 + r7.x;
    r1.xyz = r10.xzy * r5.xxx;
    r7.w = ps;
    r7.xyz = (r6.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r6.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.x));
    r6.xyz = r8.xyz * r4.xyw;
    r5.x = ps;
    r7.xzw = r7.xyz * r5.xxx;
    r5.x = dot(r7.wxz, r9.zxy);
    r4.xyw = r7.xzw * r5.xxx;
    r4.xyw = r4.xyw * 2.0 - r9.xyz;
    ps = UniformScalar_8.x * r5.y;
    r5.x = saturate(dot(r2.zxy, r4.wxy));
    r7.y = ps;
    ps = log2(r5.x);
    r5.w = saturate(dot(r7.wzx, r2.zyx));
    r5.x = ps;
    ps = abs(r0.w) * abs(r0.w);
    r5.y = r5.x * UniformScalar_7.x;
    r7.x = ps;
    ps = pow(2.0, r5.y);
    r5.x = r5.x * 15.0;
    r7.z = ps;
    r4.xy = r7.yx * r7.zx;
    r5.yz = r4.xy * r4.zy;
    r7.xyz = r3.xyz + r5.yyy;
    r7.xyz = r5.zzz * r7.xyz;
    ps = pow(2.0, r5.x);
    r7.xyz = r7.xyz * r6.www;
    r5.x = ps;
    r5.xyz = r7.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
