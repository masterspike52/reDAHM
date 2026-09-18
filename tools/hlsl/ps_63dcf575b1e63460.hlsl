// ps_63dcf575b1e63460.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040E00 00000A0A 00000000 0000914A 007F03FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A1 0000F9A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
//   interpolator: r9 <-> COLOR2 (flags 0xF)
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
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color1 : COLOR1; // r8
    float4 color2 : COLOR2; // r9
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color1;
    float4 r9 = In.color2;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = r1.w * UniformVector_2.x;
    r8.z = ps;
    ps = 1.0 / r6.w;
    r7.w = -r1.z + 1.0;
    r7.z = ps;
    ps = ScreenPositionScaleBias.x * r7.z;
    r7.y = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.x = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r7.y));
    r8.yz = r8.yz * abs(r10.xy);
    r8.w = ps;
    ps = ScreenPositionScaleBias.y * r7.z;
    r7.y = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    r0.zw = r9.xy * r6.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.y));
    r9.xyw = r8.www * r3.zyx;
    r7.y = ps;
    ps = UniformVector_2.y * r7.w;
    r2.xyw = r7.yyy * r5.xyz;
    r7.y = ps;
    ps = (-0.5) + r7.x;
    r5.xy = r9.wy * -r2.xy;
    r7.z = ps;
    ps = (-0.5) + r7.y;
    r12.zw = float2((r7.xy >= 0.5));
    r7.w = ps;
    r7.zw = r7.zw - r7.xy;
    r5.zw = r7.zw * r12.zw + r7.xy;
    r7.xyw = r5.zwx + r5.zwy;
    r5.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r2.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r9.w = tex2D(ShadowTexture, r0.xy).x;
    r0.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r12.xy = tex2D(ModShadowAccumTexture, r8.yz).xy;
    r13 = tex2D(Texture2D_2, r7.xy);
    r10 = tex2D(Texture2D_1, r1.xy);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r8.x;
    r8.z = -r10.w + 1.0;
    r7.z = saturate(ps);
    ps = rsqrt(abs(r8.x));
    r8.y = r10.w * UniformScalar_0.x;
    r8.x = ps;
    r11.xyz = r8.zzz * UniformVector_1.xyz + r8.yyy;
    ps = log2(r7.z);
    r14.xyz = r8.xxx * -SpotDirection.xyz;
    r7.y = ps;
    r8.z = r2.w * 2.0 - r2.w;
    ps = r3.z;
    r7.z = dot(r14.zxy, r4.zxy);
    ps = 0.1 + ps;
    r8.x = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r8.y = (r8.x == 0.0) ? r13.x : r13.y;
    ps = 5.0 * r7.x;
    r9.yz = r8.xx + float2(-3.0, -2.0);
    r8.x = saturate(ps);
    r8.y = (r9.z == 0.0) ? r13.z : r8.y;
    r8.y = (r9.y == 0.0) ? r13.w : r8.y;
    r7.x = saturate(r9.x * r8.z + r7.w);
    r12.zw = -r8.xy + 1.0;
    r9.xy = -r12.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r7.x);
    r8.xyz = r12.wxy * float3(2.5, 0.875, 0.875);
    r0.x = ps;
    ps = -SpotAngles.x - -r7.z;
    r0 = r0.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r7.x = ps;
    r9.xy = r8.yz * r9.xy + 0.125;
    ps = SpotAngles.y * r7.x;
    r4.xyz = r0.xyz * r10.www;
    r9.z = saturate(ps);
    r7.xzw = r4.xyz * UniformScalar_1.xxx + r11.xyz;
    r4.xyz = r10.xyz * 2e+01 + r4.xyz;
    r9.xyz = r9.wxz * r9.wyz;
    ps = (-0.5) + r8.x;
    r0.xyz = r4.xyz - r2.xyz;
    r9.w = saturate(ps);
    ps = pow(2.0, r0.w);
    r4.xyz = r7.xzw * r9.www;
    r8.x = ps;
    r7.xzw = r9.yyy * r6.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r7.y;
    r8.xyz = r4.xyz * r8.xxx;
    r7.y = ps;
    r2.xyz = r0.xyz * r9.www + r2.xyz;
    ps = pow(2.0, r7.y);
    r0.xyz = r9.xxx * r5.xyz;
    r7.y = ps;
    ps = r8.w;
    r0.xyz = r0.xzy * r7.yyy;
    ps = r3.z * ps;
    r9.xyw = r2.xyz * r1.xyz;
    r7.y = saturate(ps);
    r8.xy = r9.xy * r7.yy + r8.xy;
    r8.z = r9.w * r7.y + r8.z;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r8.xyz = r8.xzy * r9.zzz;
    r7.xyz = r8.xzy * r7.xzw;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
