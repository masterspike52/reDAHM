// ps_95d0307b1a41b408.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10041000 00000406 00000000 00003484 000F000F 00000001 00003050 0000F156 00007257 0000F358
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale[3] : register(c9); // float3[3]
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c12); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D LightMapTextures_0 : register(s0);
sampler2D LightMapTextures_1 : register(s1);
sampler2D LightMapTextures_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.z = saturate(OpacityOverride.x);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.w = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r4.xy);
    r5.yzw = tex2D(LightMapTextures_1, r0.xy).xyz;
    r1.xyz = tex2D(LightMapTextures_0, r0.xy).zxy;
    r8.yzw = tex2D(LightMapTextures_2, r0.xy).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r4.z;
    r0.y = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 0.875 * r0.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r14.z = ps;
    ps = 0.875 * r0.z;
    r10.xyz = r8.yzw * LightMapScale[2].xyz;
    r14.w = ps;
    ps = LightMapScale[0].x * r1.y;
    r13.xyz = r5.yzw * LightMapScale[1].xyz;
    r7.x = ps;
    ps = LightMapScale[0].y * r1.z;
    r11.xyz = r4.xyz * UniformVector_1.xyz;
    r7.y = ps;
    ps = 0.3333333 * r5.y;
    r16.xyz = r1.yzx * 0.3333333;
    r8.x = ps;
    ps = 0.3333333 * r5.z;
    r9.xyz = r8.yzw * 0.3333333;
    r8.y = ps;
    ps = 0.3333333 * r5.w;
    r9.xyz = r9.xyz * LightMapScale[2].xyz;
    r8.z = ps;
    ps = rsqrt(abs(r0.y));
    r8.xyz = r8.xyz * LightMapScale[1].xyz;
    r0.x = ps;
    ps = LightMapScale[0].z * r1.x;
    r0.xyz = r0.xxx * r2.xyz;
    r7.z = ps;
    r0.z = r0.z * 2.0 - r0.z;
    ps = rsqrt(abs(r2.w));
    r15 = -r0.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r0.y = ps;
    ps = r15.x + r15.z;
    r2.yzw = r16.xyz * LightMapScale[0].xyz;
    r0.x = ps;
    ps = r15.y + r15.z;
    r5.xyz = r0.yyz * float3(-0.5, 0.5, 0.57735026);
    r0.y = ps;
    ps = r15.w;
    r2.x = float((r0.w >= 0.004));
    ps = r5.z + ps;
    r0.xw = saturate(r0.xy + r5.zz);
    r0.z = saturate(ps);
    ps = log2(r0.x);
    r14.xy = r5.xy * r3.zz;
    r0.y = ps;
    ps = log2(r0.z);
    r3 = r14 + float4(0.5, 0.5, 0.125, 0.125);
    r0.z = ps;
    ps = r3.z * r3.w;
    r5.xyz = r2.ywz * UniformVector_1.xzy;
    r0.x = ps;
    ps = log2(r0.w);
    r3.yz = abs(r3.xy) * abs(r3.xy);
    r0.w = ps;
    ps = 16.0 * r0.y;
    r8.xyz = r8.xyz * UniformVector_1.xyz;
    r3.x = ps;
    r2.yzw = r0.xxx * r12.xyz + ModShadowColor.xyz;
    ps = 16.0 * r0.z;
    r0.xy = r11.yx * r3.zz;
    r3.w = ps;
    ps = 16.0 * r0.w;
    r12 = r11.xzyz * r3.yyyz;
    r0.z = ps;
    ps = pow(2.0, r3.x);
    r11.z = r12.w * UpperSkyColor.z;
    r0.w = ps;
    ps = UpperSkyColor.x * r0.y;
    r9.xyz = r9.xyz * UniformVector_1.xyz;
    r11.x = ps;
    ps = pow(2.0, r3.w);
    r3.xyz = r13.xzy * r0.www;
    r0.w = ps;
    ps = pow(2.0, r0.z);
    r7.xyz = r7.xzy * r0.www;
    r0.z = ps;
    ps = UpperSkyColor.y * r0.x;
    r10.xyz = r10.xzy * r0.zzz;
    r11.y = ps;
    r0.xyz = r12.xzy * LowerSkyColor.xyz + r11.xyz;
    r0.xyz = r10.xzy * 0.21952 + r0.xyz;
    r0.xyz = r9.xzy * r4.xzy + r0.xzy;
    r0.xyz = r8.xyz * r4.xyz + r0.xzy;
    r0.xyz = r7.xzy * 0.21952 + r0.xyz;
    r0.xyz = r5.xyz * r4.xzy + r0.xzy;
    r0.xyz = r3.xyz * 0.21952 + r0.xyz;
    r0.xyz = r6.xyz * r4.xyz + r0.xzy;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r0.xyz = r0.xyz * r2.yzw;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r2.x + r1.w;
    r0.xyz = r3.xyz * r2.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
