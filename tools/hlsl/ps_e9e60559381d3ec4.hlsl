// ps_e9e60559381d3ec4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040D00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.wz * 0.5;
    r7.xy = tex2D(Texture2D_0, r6.xy).xy;
    r8.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r10 = tex2D(Texture2D_2, r1.xy);
    ps = 0.1 - -r2.z;
    r8.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((r10.w >= 0.5));
    r6.x = ps;
    r1.xyw = r8.xyz * 2.0 - 1.0;
    r7.xy = r7.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xy = r7.xy * 0.012;
    r6.z = ps;
    ps = 1.0 / r5.w;
    r7.xy = r6.xz * abs(r9.xy);
    r6.x = ps;
    r12.xy = r1.xy * UniformVector_2.xy - r11.xy;
    r6.xz = r12.zw * r6.xx + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r0.z = tex2D(ShadowTexture, r0.xy).x;
    r9.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r13.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = r5.w;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r5.yzw = r13.zxy * r10.zxy;
    r6.z = ps;
    ps = UniformScalar_1.x * r6.w;
    r3.xyz = r6.zzz * r2.xyz;
    r7.w = ps;
    r5.x = r1.w * UniformVector_2.z - 1.0;
    ps = rsqrt(abs(r8.w));
    r6.yz = -r6.wy + 1.0;
    r8.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r10.xyz = r8.www * r4.xyz;
    r0.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5 = r5.zwxy * r6.wwww;
    r0.w = ps;
    r2.xyz = r6.yyy * UniformVector_3.xyz + r7.www;
    r2.xyz = r5.xyw * UniformScalar_2.xxx + r2.xyz;
    r6.yz = r12.xy * r6.ww + r11.xy;
    r0.xyw = -r0.xyw + 1.0;
    ps = 1.0 - r6.x;
    r4.xy = r6.yz * r0.xx;
    r6.y = saturate(ps);
    r4.z = r5.z * r0.x + 1.0;
    r6.xzw = (r0.xxx > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r0.xxx >= 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    ps = log2(r6.y);
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r6.w = r6.y * LightColorAndFalloffExponent.w;
    r6.x = ps;
    r4.xyz = r4.xyz * r6.xxx;
    r6.x = dot(r4.zxy, r10.zxy);
    r6.xyz = r4.xzy * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xzy;
    r6.x = saturate(dot(r3.zxy, r6.yxz));
    ps = log2(r6.x);
    r7.xyw = r5.xyw * r7.xyz;
    r9.x = ps;
    r6.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r0.xy = r6.yz * r0.yw + 0.125;
    ps = pow(2.0, r6.x);
    r7.z = saturate(dot(r4.zxy, r3.zxy));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r7.xy = r7.xy * r7.zz + r6.xy;
    r7.z = r7.w * r7.z + r6.z;
    r0.xy = r0.xz * r0.yz;
    r6.xyz = r0.xxx * r1.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r8.xyz = r0.yyy * r8.xyz;
    r6.w = ps;
    r8.xyz = r8.xzy * r6.www;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
