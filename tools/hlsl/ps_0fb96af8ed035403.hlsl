// ps_0fb96af8ed035403.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    r8 = tex2D(Texture2D_2, r0.xy).xzyw;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xz = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r8.w;
    r6.xy = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.z = saturate(r4.w * 0.0001);
    r6.w = ps;
    ps = (-0.5) + r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r10.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7 = tex2D(Texture2D_1, r0.xy);
    r11.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyw = tex2D(LightAttenuationTexture, r5.xz).xyz;
    ps = UniformVector_3.x;
    r14.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r0.w = float((UniformScalar_3.x >= 1.0));
    r13.x = ps;
    ps = UniformVector_3.y;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r1.w = dot(r1.zxy, r1.zxy);
    r13.y = ps;
    ps = UniformVector_3.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r5.z = r1.z + 0.1;
    r13.z = ps;
    ps = 1.0 - r5.x;
    r0.x = float((UniformScalar_3.x > 1.0));
    r6.w = saturate(ps);
    ps = r8.z;
    r4.xyw = r4.xyw * r2.www;
    r5.y = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r11.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r12.xyz = r7.xyz * r7.www;
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r7.xyz = r1.www * r1.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r11.xyz = r5.www * r3.xyz;
    r5.x = ps;
    ps = UniformScalar_4.x * r5.y;
    r15.xyz = r5.xxx * -SpotDirection.xyz;
    r5.y = ps;
    ps = UniformScalar_4.x * r8.y;
    r1.xyz = r13.xyz * r12.xyz;
    r5.w = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.yxz;
    ps = log2(r6.w);
    r6.xyz = r6.zxy * UniformVector_2.zxy;
    r5.x = ps;
    ps = 5.0 * r5.z;
    r12.yz = r5.yw * r0.xz;
    r13.w = saturate(ps);
    r3.xyz = r0.yxz * r8.xzy + r1.xyz;
    ps = 1.0 - r6.x;
    r5.w = dot(r1.zxy, float3(0.11, 0.3, 0.59));
    r13.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = dot(r15.zxy, r2.zxy);
    r5.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.w = r5.w - r1.x;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r3.xyz = r3.xyz * r14.xyz;
    r13.y = saturate(ps);
    ps = pow(2.0, r5.z);
    r13.z = saturate(r5.w + r1.x);
    r5.x = ps;
    ps = r13.x * r13.z;
    r2.xyz = r4.xwy * r5.xxx;
    r1.z = ps;
    ps = r13.y * r13.y;
    r5.xz = -r13.zw + 1.0;
    r1.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xy = -r6.yz * r13.zz;
    r4.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.xyz = r6.xyz + r1.zxy;
    r4.y = ps;
    ps = (-1.0) - -r6.x;
    r4.xyz = -r4.xyz + 1.0;
    r6.w = ps;
    ps = UniformScalar_4.x * r0.y;
    r6.xyw = r6.yzw * r4.zzz;
    r5.y = ps;
    ps = r5.y;
    r6.z = r6.w + 1.0;
    r6.xyz = (r4.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r4.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r8.x * ps;
    r5.y = dot(r0.zxy, r0.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r12.xyz + UniformScalar_5.xxx;
    r5.y = ps;
    r0.xyz = r0.xyz * r5.yyy;
    r5.y = dot(r0.zxy, r11.zxy);
    r8.xyz = r0.xyz * r5.yyy;
    r8.xyz = r8.xyz * 2.0 - r11.xyz;
    r5.y = saturate(dot(r7.zxy, r8.zxy));
    ps = log2(r5.y);
    r6.xyz = r6.xyz * r5.xxx;
    r10.x = ps;
    r5.xyz = r10.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r0.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r4.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r6.xy = r3.xy * r5.ww + r6.xy;
    r6.z = r3.z * r5.w + r6.z;
    r6.xyz = r2.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r1.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
