// ps_36e484a5327c06eb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040F00 00000406 00000000 00003484 000F000F 00000001 00003050 0000F156 00007257 0000F358
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale[3] : register(c8); // float3[3]
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c11); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = saturate(OpacityOverride.x);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r4.xy = r5.xy * abs(r4.xy);
    r7.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r6.xyz = tex2D(LightMapTextures_0, r0.xy).xyz;
    r0.xyz = tex2D(LightMapTextures_2, r0.xy).zxy;
    r8.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r5.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 - r0.w;
    r15.xy = r8.xy * 0.875;
    r5.w = ps;
    ps = LightMapScale[2].x * r0.y;
    r0.w = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = LightMapScale[2].y * r0.z;
    r12.xyz = r6.xyz * LightMapScale[0].xyz;
    r11.y = ps;
    ps = LightMapScale[2].z * r0.x;
    r13.xyz = r7.xyz * LightMapScale[1].xyz;
    r11.z = ps;
    ps = rsqrt(abs(r0.w));
    r9.xyz = r0.yzx * 0.07317333;
    r2.w = ps;
    ps = rsqrt(abs(r6.w));
    r8.xyz = r7.xyz * 0.07317333;
    r0.z = ps;
    ps = (-0.5) * r0.z;
    r0.xyw = r6.yxz * 0.07317333;
    r6.x = ps;
    ps = 0.5 * r0.z;
    r2.xyz = r2.www * r2.xyz;
    r6.y = ps;
    ps = LightMapScale[0].x * r0.y;
    r15.zw = r6.xy * r3.zz;
    r6.x = ps;
    r4.w = r2.z * 2.0 - r2.z;
    ps = LightMapScale[0].y * r0.x;
    r14 = -r2.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r6.y = ps;
    ps = r14.x + r14.z;
    r7 = r4.wxyz * float4(0.57735026, 0.21952, 0.21952, 0.21952);
    r3.x = ps;
    ps = r14.y + r14.z;
    r2 = r15 + float4(0.125, 0.125, 0.5, 0.5);
    r3.z = ps;
    ps = r2.x * r2.y;
    r0.z = saturate(r14.w + r7.x);
    r0.x = ps;
    ps = abs(r2.z) * abs(r2.z);
    r8.xyz = r8.xyz * LightMapScale[1].xyz;
    r3.y = ps;
    ps = abs(r2.w) * abs(r2.w);
    r3.xz = saturate(r3.zx + r7.xx);
    r3.w = ps;
    r2.yzw = r0.xxx * r10.xyz + ModShadowColor.xyz;
    ps = log2(r3.z);
    r0.xy = r7.zy * r3.ww;
    r7.x = ps;
    ps = log2(r0.z);
    r10 = r7.ywzw * r3.yyyw;
    r7.y = ps;
    ps = log2(r3.x);
    r3.z = r10.w * UpperSkyColor.z;
    r7.z = ps;
    ps = UpperSkyColor.x * r0.y;
    r9.xyz = r9.xyz * LightMapScale[2].xyz;
    r3.x = ps;
    ps = UpperSkyColor.y * r0.x;
    r7.xyw = r7.xyz * 16.0;
    r3.y = ps;
    r10.xyz = r10.xzy * LowerSkyColor.xyz + r3.xyz;
    ps = pow(2.0, r7.x);
    r2.x = float((r5.w >= 0.004));
    r0.z = ps;
    ps = pow(2.0, r7.y);
    r3.xyz = r13.xzy * r0.zzz;
    r0.z = ps;
    ps = pow(2.0, r7.w);
    r7.xyz = r12.xzy * r0.zzz;
    r0.z = ps;
    ps = LightMapScale[0].z * r0.w;
    r11.xyz = r11.xzy * r0.zzz;
    r6.z = ps;
    r0.xyz = r11.xzy * 0.21952 + r10.xyz;
    r0.xyz = r9.xzy * r4.xzy + r0.xzy;
    r0.xyz = r8.xyz * r4.xyz + r0.xzy;
    r0.xyz = r7.xzy * 0.21952 + r0.xyz;
    r0.xyz = r6.xzy * r4.xzy + r0.xzy;
    r0.xyz = r3.xyz * 0.21952 + r0.xyz;
    r0.xyz = r5.xyz * r4.xyz + r0.xzy;
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
