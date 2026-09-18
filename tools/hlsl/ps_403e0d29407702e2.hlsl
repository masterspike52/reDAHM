// ps_403e0d29407702e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040D00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r0.xy + UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xy = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r6.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.zw).xyz;
    r12.yz = tex2D(Texture2D_1, r0.xy).xy;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r11.z = saturate(ps);
    ps = ConstantLighting.z;
    r7.w = dot(r4.zxy, r4.zxy);
    ps = 0.21952 * ps;
    r10.xy = r8.xy * 0.875;
    r1.w = ps;
    ps = rsqrt(abs(r7.w));
    r0.w = dot(r0.zxy, r0.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r11.xyw = r7.www * r4.xyz;
    r4.x = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r4.xxx * r3.xyz;
    r3.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r3.xxx * r1.xzy;
    r0.w = ps;
    ps = 0.1 - -r1.y;
    r0.xyw = r0.www * r0.xyz;
    r0.z = ps;
    ps = ConstantLighting.x * r0.w;
    r3.z = dot(r0.wxy, r4.zxy);
    r8.x = ps;
    ps = ConstantLighting.y * r0.w;
    r0.z = saturate(r0.z * 5.0);
    r8.y = ps;
    ps = 1.0 - r0.z;
    r12.x = dot(r11.wxy, r0.wxy);
    r0.z = ps;
    r3.xy = r12.yz * float2(0.2, 1.2) + UniformVector_0.xy;
    ps = ModShadowGroupColor.x * r0.z;
    r13.xyz = r0.xyw * r3.zzz;
    r11.x = ps;
    r4.xyz = r13.xyz * 2.0 - r4.xyz;
    r3.zw = r12.xx * float2(-0.5, 0.5) + 0.5;
    ps = ModShadowGroupColor.y * r0.z;
    r4.x = saturate(dot(r1.yxz, r4.zxy));
    r11.y = ps;
    ps = ConstantLighting.z * r0.w;
    r1.xyz = -r11.xyz + 1.0;
    r8.z = ps;
    ps = log2(r4.x);
    r0.w = float((r1.z >= 0.004));
    r7.w = ps;
    r1.xy = r10.xy * r1.xy + 0.125;
    ps = abs(r3.z) * abs(r3.z);
    r4 = r7 * float4(1.5, 1.5, 1.5, 15.0);
    r0.x = ps;
    ps = pow(2.0, r4.w);
    r4.xyz = r4.xyz * r6.xyz;
    r1.z = ps;
    ps = 0.21952 * r1.z;
    r4.xyz = r4.xyz * r5.xyz;
    r0.y = ps;
    ps = abs(r3.w) * abs(r3.w);
    r7.xy = r0.yy * ConstantLighting.xy;
    r0.y = ps;
    ps = r1.x * r1.y;
    r5.xyz = r4.xyz * r0.yyy;
    r7.w = ps;
    ps = r1.w * r1.z;
    r6.xyz = r4.xyz * r0.xxx;
    r7.z = ps;
    r1.xyz = r7.www * r9.xyz + ModShadowColor.xyz;
    r0.xyz = r8.xyz * r4.xyz + r7.xyz;
    r0.xyz = r6.xyz * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r5.xyz * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r4.zxy * AmbientColorAndSkyFactor.zxy + r0.zxy;
    ps = UniformVector_0.z + r0.x;
    r3.xy = r3.xy + r0.yz;
    r3.z = ps;
    ps = -r2.w;
    r0.xyz = r3.xyz * r1.xyz;
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
