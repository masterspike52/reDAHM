// ps_b3931ba461dc6c56.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040F00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r7.yz = r6.yz * abs(r8.xy);
    r6.x = ps;
    r14.xyz = r6.xxx * r4.xyz;
    r6 = xe_cube(r14.xyz);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.w = ps;
    r4.xy = r6.yx * r7.ww + 1.5;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r11.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r7.yz).xy;
    r15.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = OpacityOverride.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r9.w = saturate(ps);
    ps = -ModShadowColor.x;
    r7.y = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r7.y));
    r12.xyz = r0.xyz * r15.xyz;
    r7.y = ps;
    r10.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.x));
    r1.xyz = r7.yyy * r5.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.xzy;
    r6.w = ps;
    ps = LightMapScale.x * r6.y;
    r2.xyz = r6.www * r4.zxy;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r13.x = dot(r1.zxy, r2.xyz);
    r4.y = ps;
    ps = LightMapScale.z * r6.x;
    r6.w = dot(r2.xyz, r14.zxy);
    r4.z = ps;
    ps = 0.1 - -r7.y;
    r1.xyz = r4.xyz * r2.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r1.xyz = r1.xzy * r15.xzy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r2.xyz = r2.yzx * r6.www;
    r6.z = ps;
    r6.xyw = r2.xyz * 2.0 - r14.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r2.xy + 0.5;
    r9.z = ps;
    ps = abs(r2.x) * abs(r2.x);
    r6.z = saturate(dot(r7.yxz, r6.wxy));
    r7.y = ps;
    ps = abs(r2.y) * abs(r2.y);
    r6.xyw = -r9.yzw + 1.0;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5.xyz = r12.xzy * r7.yyy;
    ps = 1.0 + ps;
    r6.w = float((r6.w >= 0.004));
    r9.y = ps;
    r6.xy = r2.zw * r6.xy + 0.125;
    ps = log2(r6.z);
    r7.xyz = r12.xzy * r7.xxx;
    r11.w = ps;
    ps = -ModShadowColor.z;
    r2 = r11 * float4(3e+01, 3e+01, 3e+01, 15.0);
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r10.xyz;
    ps = 1.0 + ps;
    r6.x = r6.x * r6.y;
    r9.z = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r7.xzy;
    ps = pow(2.0, r2.w);
    r2.xyz = r2.xzy * r8.xzy;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r7.xyz = r4.xyz * r2.xyz + r7.xyz;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
