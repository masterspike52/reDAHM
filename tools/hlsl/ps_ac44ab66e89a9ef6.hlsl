// ps_ac44ab66e89a9ef6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040E00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r1.w * UniformVector_2.x;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r6.w = -r1.z + 1.0;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r6.y = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r6.y));
    r7.yz = r7.yz * abs(r9.xy);
    r7.w = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.y = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    r0.zw = r8.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.y));
    r8.xyw = r7.www * r2.zyx;
    r6.y = ps;
    ps = UniformVector_2.y * r6.w;
    r4.xyw = r6.yyy * r4.xyz;
    r6.y = ps;
    ps = (-0.5) + r6.x;
    r5.xy = r8.wy * -r4.xy;
    r6.z = ps;
    ps = (-0.5) + r6.y;
    r12.zw = float2((r6.xy >= 0.5));
    r6.w = ps;
    r6.zw = r6.zw - r6.xy;
    r5.zw = r6.zw * r12.zw + r6.xy;
    r6.xyw = r5.zwx + r5.zwy;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r5.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r8.w = tex2D(ShadowTexture, r0.xy).x;
    r0.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r12.xy = tex2D(ModShadowAccumTexture, r7.yz).xy;
    r13 = tex2D(Texture2D_2, r6.xy);
    r10 = tex2D(Texture2D_1, r1.xy);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r7.x;
    r7.z = -r10.w + 1.0;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r7.y = r10.w * UniformScalar_0.x;
    r7.x = ps;
    r11.xyz = r7.zzz * UniformVector_1.xyz + r7.yyy;
    ps = log2(r6.z);
    r14.xyz = r7.xxx * -SpotDirection.xyz;
    r6.y = ps;
    r7.z = r4.w * 2.0 - r4.w;
    ps = r2.z;
    r6.z = dot(r14.zxy, r3.zxy);
    ps = 0.1 + ps;
    r7.x = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r7.y = (r7.x == 0.0) ? r13.x : r13.y;
    ps = 5.0 * r6.x;
    r8.yz = r7.xx + float2(-3.0, -2.0);
    r7.x = saturate(ps);
    r7.y = (r8.z == 0.0) ? r13.z : r7.y;
    r7.y = (r8.y == 0.0) ? r13.w : r7.y;
    r6.x = saturate(r8.x * r7.z + r6.w);
    r12.zw = -r7.xy + 1.0;
    r8.xy = -r12.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r6.x);
    r7.xyz = r12.wxy * float3(2.5, 0.875, 0.875);
    r0.x = ps;
    ps = -SpotAngles.x - -r6.z;
    r0 = r0.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r6.x = ps;
    r8.xy = r7.yz * r8.xy + 0.125;
    ps = SpotAngles.y * r6.x;
    r3.xyz = r0.xyz * r10.www;
    r8.z = saturate(ps);
    r6.xzw = r3.xyz * UniformScalar_1.xxx + r11.xyz;
    r3.xyz = r10.xyz * 2e+01 + r3.xyz;
    r8.xyz = r8.wxz * r8.wyz;
    ps = (-0.5) + r7.x;
    r0.xyz = r3.xyz - r5.xyz;
    r8.w = saturate(ps);
    ps = pow(2.0, r0.w);
    r3.xyz = r6.xzw * r8.www;
    r7.x = ps;
    r6.xzw = r8.yyy * r9.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r7.xyz = r3.xyz * r7.xxx;
    r6.y = ps;
    r3.xyz = r0.xyz * r8.www + r5.xyz;
    ps = pow(2.0, r6.y);
    r0.xyz = r8.xxx * r4.xyz;
    r6.y = ps;
    ps = r7.w;
    r0.xyz = r0.xzy * r6.yyy;
    ps = r2.z * ps;
    r8.xyw = r3.xyz * r1.xyz;
    r6.y = saturate(ps);
    r7.xy = r8.xy * r6.yy + r7.xy;
    r7.z = r8.w * r6.y + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r8.zzz;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
