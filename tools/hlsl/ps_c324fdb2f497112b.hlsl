// ps_c324fdb2f497112b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r14.w;
    r5.xz = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r10.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11 = tex2D(Texture2D_2, r0.xy);
    r16 = tex2D(Texture2D_1, r0.xy);
    r6.xyz = tex2D(Texture2D_3, r5.xz).xyz;
    ps = UniformVector_4.x;
    r17.xyz = UniformVector_3.xzy * 2e+01;
    ps = 2e+01 * ps;
    r6.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r13.y = ps;
    ps = UniformVector_4.z;
    r1.w = float((UniformScalar_11.x >= 1.0));
    ps = 2e+01 * ps;
    r0.w = dot(r3.zxy, r3.zxy);
    r13.z = ps;
    ps = UniformVector_4.y;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r5.w = float((UniformScalar_11.x > 1.0));
    r13.w = ps;
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.xyz = r14.xyz * UniformScalar_12.xxx;
    r5.y = ps;
    r15.xyz = (-abs(r5.www) >= 0.0) ? r6.xyz : 1.0;
    ps = 5.0 * r5.y;
    r16.xyz = r16.xzy * r16.www;
    r13.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r6.xyz = r11.xzy * r11.www;
    r3.w = ps;
    r5.yzw = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r9.xyz = r3.www * r1.xyz;
    r0.w = ps;
    ps = 1.0 - r5.x;
    r11.xyz = r0.www * r3.xyz;
    r0.w = saturate(ps);
    ps = UniformVector_2.x * r5.y;
    r6.xyz = r13.yzw * r6.xyz;
    r13.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r17.xyz * r16.xyz;
    r5.x = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r15.xyz;
    ps = log2(r0.w);
    r15.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r0.xyz = r0.xyz * r1.xyz + UniformScalar_13.xxx;
    ps = UniformVector_2.y * r5.z;
    r5.y = dot(r15.zxy, r2.zxy);
    r13.z = ps;
    r2.xyz = (-abs(r6.www) >= 0.0) ? r6.yxz : r3.yxz;
    r6.xyw = (abs(r6.www) > 0.0) ? r3.zyx : r6.zyx;
    r1.xyz = r1.xyz * r14.xyz + r6.wxy;
    ps = UniformVector_2.z * r5.w;
    r6.z = saturate(dot(r2.zxy, float3(0.59, 0.11, 0.3)));
    r13.w = ps;
    ps = r4.w;
    r5.zw = -r13.xw + 1.0;
    ps = 0.0001 * ps;
    r2.yz = r5.zz * ModShadowGroupColor.xy;
    r2.w = saturate(ps);
    ps = r5.w;
    r5.z = dot(r6.ywx, float3(0.11, 0.3, 0.59));
    ps = r6.z * ps;
    r5.z = r5.z - r6.w;
    r3.z = ps;
    ps = r5.z;
    r3.xy = -r13.yz * r6.zz;
    ps = r6.w + ps;
    r6.xyz = r13.wyz + r3.zxy;
    r2.x = saturate(ps);
    ps = (-1.0) - -r6.x;
    r3 = -r2.wxyz + 1.0;
    r6.w = ps;
    r6.xyz = r6.wyz * r3.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r3.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.z = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.z));
    r1.xyz = r1.xyz * r12.xyz;
    r5.z = ps;
    r2.xyz = r6.xyz * r5.zzz;
    r5.z = dot(r2.zxy, r11.zxy);
    r6.xyz = r2.xyz * r5.zzz;
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = saturate(dot(r9.zxy, r6.zxy));
    r5.z = ps;
    ps = log2(r5.w);
    r6.xyz = r0.xyz * r3.yyy;
    r10.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xyz = r10.yzx * float3(0.875, 0.875, 15.0);
    r5.x = ps;
    r0.xy = r0.xy * r3.zw + 0.125;
    ps = pow(2.0, r0.z);
    r5.y = saturate(dot(r2.zyx, r9.zyx));
    r5.w = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.zxy * r5.www;
    r0.z = saturate(ps);
    r6.yz = r1.xy * r5.yy + r6.yz;
    r6.w = r1.z * r5.y + r6.x;
    ps = pow(2.0, r5.z);
    r5.xw = r0.xz * r0.yz;
    r6.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
