// ps_6f5a29aa3c76e2fb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r8.xy = r6.yz * abs(r7.xy);
    r5.x = ps;
    r8.zw = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    r10.xyz = r5.xxx * r3.xyz;
    r5 = xe_cube(r10.xyz);
    ps = 1.0 / abs(r5.z);
    r6.w = r5.w;
    r6.y = ps;
    r6.yz = r5.yx * r6.yy + 1.5;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.yzw)).xyz;
    r7.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = r1.z;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r3.xyz = r3.xyz * r0.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r9.xyz * r2.www;
    r3.w = ps;
    ps = 1.0 - r6.x;
    r1.w = dot(r6.wyz, r6.wyz);
    r5.w = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r5.x = saturate(r5.x * 5.0);
    r6.x = ps;
    ps = 1.0 - r5.x;
    r9.xyz = r6.xxx * r1.xyz;
    r0.w = ps;
    ps = log2(r5.w);
    r1.xyz = r3.www * -SpotDirection.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r1.w));
    r5.w = dot(r1.zxy, r2.zxy);
    r6.x = ps;
    r1.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r5.y;
    r6.xyz = r6.xxx * r6.yzw;
    r1.z = ps;
    ps = 0.875 * r5.z;
    r6.w = saturate(dot(r6.zxy, r9.zxy));
    r1.w = ps;
    r1.yz = r1.zw * r1.xy + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = dot(r6.zxy, r10.zxy);
    r5.y = ps;
    ps = -SpotAngles.x - -r5.w;
    r6.xyz = r6.xzy * r5.zzz;
    r5.x = ps;
    r6.xyz = r6.xyz * 2.0 - r10.xzy;
    ps = SpotAngles.y * r5.x;
    r6.x = saturate(dot(r9.zxy, r6.yxz));
    r1.x = saturate(ps);
    ps = pow(2.0, r5.y);
    r5.xw = r1.yx * r1.zx;
    r6.y = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = log2(r6.x);
    r0.xyz = r0.xzy * r6.yyy;
    r7.x = ps;
    r1 = r7.yzwx * float4(3e+01, 3e+01, 3e+01, 15.0);
    ps = pow(2.0, r1.w);
    r1.xyz = r1.xyz * r4.xyz;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r3.xy * r6.ww + r6.xy;
    r6.z = r3.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
