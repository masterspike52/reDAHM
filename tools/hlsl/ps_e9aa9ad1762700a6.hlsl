// ps_e9aa9ad1762700a6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    r5.xz = r5.xz * abs(r7.xy);
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r9.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r10.z = saturate(ps);
    ps = UniformScalar_0.x;
    r0.xyz = r6.xyz * r9.yzw;
    r9.x = ps;
    ps = rsqrt(abs(r5.y));
    r9.yzw = r9.yzw * AmbientColorAndSkyFactor.xyz;
    r5.y = ps;
    r6.xyz = r9.yzw * r6.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r5.yzw = r5.yyy * r1.xyz;
    r6.w = ps;
    ps = 0.0001;
    r1.xyz = r6.www * r3.xyz;
    r9.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.yz = -r1.xy;
    r10.w = ps;
    r3.x = r1.z * 2.0 - r1.z;
    ps = 0.1 - -r5.w;
    r1 = r10.wxyw * float4(-0.5, 0.875, 0.875, 0.5);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.y = saturate(dot(r5.yzw, r3.yzx));
    r5.x = saturate(ps);
    ps = r1.x;
    r5.x = -r5.x + 1.0;
    ps = r4.z * ps;
    r10.xy = r5.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = r1.w;
    r5.xzw = -r10.xyz + 1.0;
    ps = r4.z * ps;
    r1.zw = r1.yz * r5.xz;
    r1.y = ps;
    ps = max(r9.x, r9.y);
    r1 = r1 + float4(0.5, 0.5, 0.125, 0.125);
    r0.w = ps;
    ps = r1.z * r1.w;
    r5.w = float((r5.w >= 0.004));
    r5.x = ps;
    ps = log2(r5.y);
    r1.xy = abs(r1.xy) * abs(r1.xy);
    r1.z = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r3 = r0.xzyw * r1.yyyz;
    ps = pow(2.0, r3.w);
    r1.xyz = r0.xzy * r1.xxx;
    r6.w = ps;
    r6.xyz = r3.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r1.xyz * LowerSkyColor.xzy + r6.xzy;
    r1.xyz = r6.www * ConstantLighting.xzy;
    r6.xyz = r1.xzy * r7.xyz + r6.xzy;
    r6.xyz = r0.xzy * ConstantLighting.xzy + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
