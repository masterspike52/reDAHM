// ps_ff9e00e918908e54.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.x = max(UniformScalar_0.x, 0.0001);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.yzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9 = tex2D(Texture2D_0, r0.xy);
    r5.z = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.z));
    r0.w = saturate(-r5.w + 1.0);
    r0.y = ps;
    r4.x = saturate(r0.y * r1.z);
    ps = r1.z;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = r9.w;
    r8.yzw = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    ps = 0.875 * r5.x;
    r6.xy = r9.ww * UniformVector_1.xy;
    r6.z = ps;
    ps = 0.875 * r5.y;
    r4.yzw = r4.yzw * r2.www;
    r6.w = ps;
    ps = 5.0 * r5.z;
    r2.xyw = r8.yzw * r9.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r1.xyz = r0.yyy * r1.zxy;
    r5.y = ps;
    ps = log2(r0.w);
    r0.xyz = r5.yyy * r3.zxy;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r0.yz = -r0.yz;
    r5.x = ps;
    r0.x = r0.x * 2.0 - r0.x;
    r5.xz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r8.yz = r6.zw * r5.xz + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = saturate(dot(r1.yzx, r0.yzx));
    r5.x = ps;
    ps = log2(r5.z);
    r6.z = r2.w * r4.x;
    r8.w = ps;
    ps = pow(2.0, r5.x);
    r0.xw = r8.yx * r8.zw;
    r6.w = ps;
    r5.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r0.xyz = r4.yzw * r6.www;
    r4.y = ps;
    ps = UniformVector_1.z * r5.w;
    r6.xy = r6.xy * r4.yy;
    r2.z = ps;
    r6.xyz = r2.xyz * r4.xxy + r6.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
