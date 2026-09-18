// ps_13732e90315d343e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041300 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = r1.z + 0.1;
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r10.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = 0.00022222222 * r5.y;
    r6.xyz = r5.www * -SpotDirection.xyz;
    r2.w = saturate(ps);
    ps = 5.0 * r5.z;
    r5.y = dot(r6.zxy, r2.zxy);
    r2.x = saturate(ps);
    ps = (-0.025) * r2.w;
    r5.zw = r0.wz * UniformVector_1.xy;
    r6.x = ps;
    r8.xy = r10.xy * r6.xx + r5.zw;
    ps = -SpotAngles.x - -r5.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.z = saturate(r5.y * SpotAngles.y);
    r8.w = ps;
    ps = UniformVector_2.x * r0.w;
    r2.yz = r8.yz * r8.wz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r18.zw = -r2.yx + 1.0;
    r18.y = ps;
    r5.zw = r18.zy * UniformVector_2.yx;
    r5.y = r5.w * r8.x;
    r13 = tex2D(Texture2D_1, r5.yz);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yw = r0.wz * 6.0;
    r11.z = ps;
    ps = trunc(UniformScalar_1.x);
    r3.xy = r0.wz * UniformVector_6.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = -r0.z + 1.0;
    r11.w = ps;
    r6.w = (r6.z == 0.0) ? r13.x : r13.y;
    ps = UniformVector_2.y * r5.z;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = r11.z;
    r14 = r6.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r7.x) * ps;
    r17.xy = float2((r6.xy >= 0.5));
    r3.z = ps;
    ps = 1.0 / r4.w;
    r12.xy = r14.xy - r6.xy;
    r17.z = ps;
    r5.z = (r14.w == 0.0) ? r13.z : r6.w;
    r6.w = (r14.z == 0.0) ? r13.w : r5.z;
    r11.xy = r12.zw * r17.zz + ScreenPositionScaleBias.wz;
    r6.yz = r12.xy * r17.xy + r6.xy;
    ps = r11.w;
    r6.x = r6.w + 0.25;
    ps = abs(r7.y) * ps;
    r6.xyw = r6.yzx + r6.yzw;
    r3.w = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r15.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r12 = tex2D(Texture2D_1, r6.xy);
    r14 = tex2D(Texture2D_4, r0.xy);
    r3.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r19.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r16.xyw = tex2D(Texture2D_2, r5.yw).xyw;
    r5.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r13.xyz = r8.xyw * 2.0 - 1.0;
    r0.yz = r5.yz * 2.0 - 1.0;
    r11.zw = r16.xy * 2.0 - 1.0;
    r16.xyz = r19.xyz * 2.0 - 1.0;
    r5.z = r16.w * r5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r19.xyz = UniformVector_5.xzy * 2e+01;
    r5.y = float((UniformScalar_4.x >= 1.0));
    r0.x = float((UniformScalar_4.x > 1.0));
    r3.xyz = (-abs(r0.xxx) >= 0.0) ? r3.xyz : 1.0;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r14.www;
    r5.x = saturate(ps);
    r3.xyz = (-abs(r5.yyy) >= 0.0) ? 1.0 : r3.yxz;
    ps = log2(r5.x);
    r14.xyz = r19.xzy * r14.xyz;
    r5.x = ps;
    r5.y = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    ps = r5.y;
    r16.xyz = r16.xyz * UniformVector_4.xyz;
    ps = -r14.x + ps;
    r18.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r0.x = ps;
    r5.y = (r18.x == 0.0) ? r12.x : r12.y;
    r0.x = saturate(r0.x + r14.x);
    r12.xy = -r16.xy * r0.xx + r16.xy;
    ps = rsqrt(abs(r5.w));
    r6.w = saturate(r6.w - r5.z);
    r5.w = ps;
    ps = UniformScalar_5.x * r6.z;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r19.x = ps;
    ps = UniformScalar_5.x * r6.y;
    r8.xyz = r5.www * r1.xyz;
    r19.y = ps;
    ps = UniformScalar_5.x * r3.y;
    r1.yz = r19.yx * r3.xz;
    r5.w = ps;
    ps = r5.w;
    r19 = r11 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r6.x * ps;
    r0.zw = r0.yz + r19.zw;
    r1.x = ps;
    ps = r4.w;
    r11.xyz = r1.xyz + UniformScalar_6.xxx;
    ps = 0.0001 * ps;
    r1.yz = r18.ww * ModShadowGroupColor.xy;
    r1.x = saturate(ps);
    r1.xyw = -r1.yzx + 1.0;
    r18.yz = r19.xy * r1.xy;
    r4 = r18.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r5.y = (r4.y == 0.0) ? r12.z : r5.y;
    ps = r4.z * r4.w;
    r5.w = ps;
    r1.xyz = r5.www * r17.xyz + ModShadowColor.xyz;
    r16.w = (r4.x == 0.0) ? r12.w : r5.y;
    r5.y = max(r16.w, 0.0);
    ps = (-1.0) - -r5.z;
    r5.y = min(r5.y, 0.3);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r5.zw = -r16.zw + 1.0;
    r3.w = ps;
    ps = 3.3333333 * r5.y;
    r11.xyz = r11.xyz * r3.www;
    r5.y = ps;
    r4 = r5.zyyy * r0;
    ps = 2.5 * r5.w;
    r12.z = r16.z + r4.x;
    r3.w = ps;
    ps = r4.y;
    r0.xyz = r6.www * r15.xyz;
    r5.z = ps;
    ps = 1.0 + r5.z;
    r12.xy = r12.xy + r4.zw;
    r6.w = ps;
    r4.xyz = r3.yxz * r6.xyz + r14.xyz;
    r12.xyz = -r13.xyz + r12.xyz;
    r5.z = saturate(r3.w * r6.w - 0.5);
    r6.xy = r12.xy * r5.zz + r13.xy;
    r5.y = r12.z * r5.z - 2.0;
    r3.xyz = r4.xyz - r0.xyz;
    r4.xyz = r3.xyz * r5.zzz + r0.xyz;
    r6.z = r8.w * 2.0 + r5.y;
    r6.xyz = r6.zxy * r1.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r0.xyz = r11.xyz * r5.zzz;
    r5.y = ps;
    r3.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r3.zxy, r10.zxy);
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r10.xyz;
    r5.y = saturate(dot(r8.zxy, r5.wyz));
    ps = log2(r5.y);
    r6.yzw = r4.xyz * r9.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r3.zyx, r8.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.zzz;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
