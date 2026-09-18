// ps_ecddd19c3fe69263.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    r8.xyz = r8.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r12.xyz = r5.yyy * r1.xyz;
    r5.x = ps;
    r11.xyz = r5.xxx * r3.zyx;
    r1.z = saturate(dot(r11.xzy, r8.xzy));
    ps = OpacityOverride.x;
    r5.x = r12.z + 0.1;
    r5.y = saturate(ps);
    ps = r6.y;
    r5.x = saturate(r5.x * 5.0);
    ps = abs(r7.x) * ps;
    r6.xw = -r5.xy + 1.0;
    r5.x = ps;
    ps = r6.z;
    r1.xy = r6.xx * ModShadowGroupColor.xy;
    ps = abs(r7.y) * ps;
    r3.xyz = -r1.zxy + 1.0;
    r5.y = ps;
    r8.xyz = tex2D(Texture2D_2, r3.xx).xyz;
    r1 = tex2D(Texture2D_0, r0.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r5.zw).xyz;
    ps = ConstantLighting.z;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.21952 * ps;
    r5.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = r9.y + r9.y;
    r7.x = r7.x * r9.x;
    r5.z = ps;
    ps = 0.875 * r5.x;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r10.x = ps;
    ps = 0.875 * r5.y;
    r11.yz = -r11.zy;
    r10.y = ps;
    r11.x = r11.x * 2.0 - r11.x;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(dot(r12.xyz, r11.yzx));
    r5.y = ps;
    ps = log2(r5.x);
    r1.xyz = r8.xyz + r1.xyz;
    r5.x = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.xyw = r5.xyy * float3(15.0, -0.5, 0.5);
    r3.x = ps;
    ps = pow(2.0, r5.x);
    r4.zw = r5.yw * r4.zz;
    r9.w = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r4.xy = r10.xy * r3.yz;
    r3.y = ps;
    ps = r0.w;
    r5.xw = r9.zw * float2(1e+02, 0.21952);
    ps = r9.w * ps;
    r4 = r4 + float4(0.125, 0.125, 0.5, 0.5);
    r10.z = ps;
    ps = r4.x * r4.y;
    r11.xyz = r1.xyz * r6.yzx;
    r3.z = ps;
    ps = abs(r4.z) * abs(r4.z);
    r6.w = float((r6.w >= 0.004));
    r5.y = ps;
    ps = abs(r4.w) * abs(r4.w);
    r7.yz = r5.zx * r7.yz;
    r0.w = ps;
    r0.xyz = r3.zzz * r0.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.x * r5.w;
    r4.xyz = r11.xzy * r0.www;
    r10.x = ps;
    ps = ConstantLighting.y * r5.w;
    r9.xyz = r11.xzy * r5.yyy;
    r10.y = ps;
    r5.xyz = r11.xyz * ConstantLighting.xyz + r10.xyz;
    r5.xyz = r9.xzy * LowerSkyColor.xyz + r5.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
    r3.z = ps;
    r6.xyz = r1.www * r8.xzy + r7.xzy;
    r5.xyz = r4.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r3.xzy * r1.xzy + r5.xzy;
    r5.xyz = r6.xyz + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r0.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
