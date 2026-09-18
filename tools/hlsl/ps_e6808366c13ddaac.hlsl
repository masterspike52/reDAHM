// ps_e6808366c13ddaac.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * 0.2 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = saturate(OpacityOverride.x);
    r5.z = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r8.w = tex2D(Texture2D_1, r5.xy).w;
    r6.xyz = tex2D(Texture2D_2, r0.xy).zxy;
    ps = -ModShadowColor.x;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    ps = -ModShadowColor.y;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    ps = -ModShadowColor.z;
    r0.xyz = r8.xyz * r6.yzx;
    ps = 1.0 + ps;
    r5.y = dot(r10.xxxx, r8.wwww);
    r7.w = ps;
    ps = rsqrt(abs(r5.z));
    r12.zw = r10.yw * r8.ww;
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.xzw = r5.xxx * r3.zxy;
    r9.x = ps;
    r7.x = r5.x * 2.0 - r5.x;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r6.w = r1.z + 0.1;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r5.x = saturate(r6.w * 5.0);
    r9.z = ps;
    ps = 1.0 - r5.x;
    r12.xy = r1.xy * -r5.zw;
    r6.w = ps;
    ps = rsqrt(abs(r0.w));
    r5.xzw = r12.wzx + r12.wzy;
    r11.x = ps;
    r5.z = dot(r10.yy, r8.ww) + r5.z;
    r5.x = dot(r10.ww, r8.ww) + r5.x;
    r5.w = saturate(r1.z * r7.x + r5.w);
    ps = log2(r5.w);
    r10.xy = r6.ww * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = 15.0 * r5.w;
    r3 = r11.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r5.w = ps;
    ps = UniformVector_0.x + r5.y;
    r3.zw = r3.zw * r4.zz;
    r1.x = ps;
    ps = UniformVector_0.y + r5.z;
    r4.xyz = -r10.xyz + 1.0;
    r1.y = ps;
    ps = UniformVector_0.z + r5.x;
    r6.w = float((r4.z >= 0.004));
    r1.z = ps;
    r1.xyz = r9.xyz * r8.xyz + r1.xyz;
    ps = pow(2.0, r5.w);
    r3.xy = r3.xy * r4.xy;
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r4 = r3 + float4(0.125, 0.125, 0.5, 0.5);
    r3.x = ps;
    ps = r4.x * r4.y;
    r3.yz = abs(r4.zw) * abs(r4.zw);
    r5.x = ps;
    r5.xyz = r5.xxx * r7.yzw + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r0.xzy * r3.yyy;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r7.xyz = r0.xzy * r3.zzz;
    r3.z = ps;
    r1.xyz = r7.xzy * UpperSkyColor.xyz + r1.xyz;
    r1.xyz = r4.xyz * LowerSkyColor.xzy + r1.xzy;
    r6.xyz = r3.xzy * r6.yzx + r1.xzy;
    r6.xyz = r0.xzy * ConstantLighting.xzy + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
