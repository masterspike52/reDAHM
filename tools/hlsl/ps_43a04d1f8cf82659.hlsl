// ps_43a04d1f8cf82659.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040E00 0000060A 00000000 000054C6 000F003F 00000001 00003050 0000F156 00007257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.w = saturate(OpacityOverride.x);
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.w = dot(r3.zxy, r3.zxy);
    r4.y = ps;
    r5.xy = r4.xy * abs(r6.xy);
    r8.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r7.xyz = tex2D(LightMapTextures_0, r0.xy).xyz;
    r4.xyz = tex2D(LightMapTextures_2, r0.xy).zxy;
    r9.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 - r4.w;
    r14.xy = r9.xy * 0.875;
    r5.x = ps;
    ps = LightMapScale[2].x * r4.y;
    r4.w = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = LightMapScale[2].y * r4.z;
    r12.xyz = r7.xyz * LightMapScale[0].xyz;
    r11.y = ps;
    ps = LightMapScale[2].z * r4.x;
    r13.xyz = r8.xyz * LightMapScale[1].xyz;
    r11.z = ps;
    ps = rsqrt(abs(r4.w));
    r9.xyz = r4.yzx * 0.07317333;
    r0.w = ps;
    ps = rsqrt(abs(r2.w));
    r8.xyz = r8.xyz * 0.07317333;
    r4.z = ps;
    ps = (-0.5) * r4.z;
    r4.xyw = r7.yxz * 0.07317333;
    r7.x = ps;
    ps = 0.5 * r4.z;
    r2.xyz = r0.www * r2.xyz;
    r7.y = ps;
    ps = LightMapScale[0].x * r4.y;
    r14.zw = r7.xy * r3.zz;
    r3.x = ps;
    r0.w = r2.z * 2.0 - r2.z;
    ps = LightMapScale[0].y * r4.x;
    r10 = -r2.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r3.y = ps;
    ps = r10.x + r10.z;
    r7 = r0.wxyz * float4(0.57735026, 0.21952, 0.21952, 0.21952);
    r3.z = ps;
    ps = r10.y + r10.z;
    r2 = r14 + float4(0.125, 0.125, 0.5, 0.5);
    r3.w = ps;
    ps = r2.x * r2.y;
    r4.z = saturate(r10.w + r7.x);
    r4.x = ps;
    ps = abs(r2.z) * abs(r2.z);
    r8.xyz = r8.xyz * LightMapScale[1].xyz;
    r2.y = ps;
    ps = abs(r2.w) * abs(r2.w);
    r2.xz = saturate(r3.wz + r7.xx);
    r2.w = ps;
    r5.yzw = r4.xxx * r5.yzw + ModShadowColor.xyz;
    ps = log2(r2.z);
    r4.xy = r7.zy * r2.ww;
    r7.x = ps;
    ps = log2(r4.z);
    r10 = r7.ywzw * r2.yyyw;
    r7.y = ps;
    ps = log2(r2.x);
    r2.z = r10.w * UpperSkyColor.z;
    r7.z = ps;
    ps = UpperSkyColor.x * r4.y;
    r9.xyz = r9.xyz * LightMapScale[2].xyz;
    r2.x = ps;
    ps = UpperSkyColor.y * r4.x;
    r7.xyw = r7.xyz * 16.0;
    r2.y = ps;
    r10.xyz = r10.xzy * LowerSkyColor.xyz + r2.xyz;
    ps = pow(2.0, r7.x);
    r5.x = float((r5.x >= 0.004));
    r4.z = ps;
    ps = pow(2.0, r7.y);
    r2.xyz = r13.xzy * r4.zzz;
    r4.z = ps;
    ps = pow(2.0, r7.w);
    r7.xyz = r12.xzy * r4.zzz;
    r4.z = ps;
    ps = LightMapScale[0].z * r4.w;
    r11.xyz = r11.xzy * r4.zzz;
    r3.z = ps;
    r4.xyz = r11.xzy * 0.21952 + r10.xyz;
    r4.xyz = r9.xzy * r0.xzy + r4.xzy;
    r4.xyz = r8.xyz * r0.xyz + r4.xzy;
    r4.xyz = r7.xzy * 0.21952 + r4.xyz;
    r4.xyz = r3.xzy * r0.xzy + r4.xzy;
    r4.xyz = r2.xyz * 0.21952 + r4.xyz;
    r4.xyz = r6.xyz * r0.xyz + r4.xzy;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r4.xyz = r4.xyz * r5.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r4.xyz - r4.xyz;
    r0.w = ps;
    oC0.w = r0.w * r5.x + r1.w;
    r4.xyz = r0.xyz * r5.xxx + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
