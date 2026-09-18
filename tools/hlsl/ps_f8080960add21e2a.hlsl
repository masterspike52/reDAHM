// ps_f8080960add21e2a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r10.z = saturate(ps);
    ps = UniformScalar_0.x;
    r5.xyz = r7.xyz * r9.yzw;
    r9.x = ps;
    ps = rsqrt(abs(r0.z));
    r9.yzw = r9.yzw * AmbientColorAndSkyFactor.xyz;
    r0.y = ps;
    r7.xyz = r9.yzw * r7.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r0.yzw = r0.yyy * r1.xyz;
    r1.x = ps;
    ps = 0.0001;
    r1.xyz = r1.xxx * r3.xyz;
    r9.y = ps;
    ps = rsqrt(abs(r0.x));
    r3.yz = -r1.xy;
    r10.w = ps;
    r3.x = r1.z * 2.0 - r1.z;
    ps = 0.1 - -r0.w;
    r1 = r10.wxyw * float4(-0.5, 0.875, 0.875, 0.5);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = saturate(dot(r0.yzw, r3.yzx));
    r0.x = saturate(ps);
    ps = r1.x;
    r0.x = -r0.x + 1.0;
    ps = r4.z * ps;
    r10.xy = r0.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = r1.w;
    r0.xzw = -r10.xyz + 1.0;
    ps = r4.z * ps;
    r1.zw = r1.yz * r0.xz;
    r1.y = ps;
    ps = max(r9.x, r9.y);
    r1 = r1 + float4(0.5, 0.5, 0.125, 0.125);
    r5.w = ps;
    ps = r1.z * r1.w;
    r0.w = float((r0.w >= 0.004));
    r0.x = ps;
    ps = log2(r0.y);
    r3.xy = abs(r1.xy) * abs(r1.xy);
    r3.z = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    r1 = r5.xzyw * r3.yyyz;
    ps = pow(2.0, r1.w);
    r3.xyz = r5.xzy * r3.xxx;
    r1.w = ps;
    r1.xyz = r1.xzy * UpperSkyColor.xyz + r7.xyz;
    r1.xyz = r3.xyz * LowerSkyColor.xzy + r1.xzy;
    r3.xyz = r1.www * ConstantLighting.xzy;
    r1.xyz = r3.xzy * r6.xyz + r1.xzy;
    r1.xyz = r5.xzy * ConstantLighting.xzy + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
