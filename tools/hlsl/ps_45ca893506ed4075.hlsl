// ps_45ca893506ed4075.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002E8 10040F00 0000070A 00000000 000064E7 001F007F 00000001 00003050 0000F151 0000F256 00007357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
sampler2D Texture2D_0 : register(s0);
sampler2D LightMapTextures_0 : register(s1);
sampler2D LightMapTextures_1 : register(s2);
sampler2D LightMapTextures_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xw = r1.xy * 2e+01;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r9.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r6.xyz = tex2D(LightMapTextures_2, r0.xy).xyz;
    r0.xyz = tex2D(LightMapTextures_0, r0.xy).zxy;
    r5.yz = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r1.xyz = tex2D(Texture2D_0, r5.xw).yxz;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r5.x = saturate(ps);
    r7.xyz = r1.yxz * 0.5 + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r14.w = ps;
    ps = 1.0 - r5.x;
    r15.zw = r5.yz * 0.875;
    r5.w = ps;
    ps = LightMapScale[0].x * r0.y;
    r10.xyz = r6.xyz * LightMapScale[2].xyz;
    r11.x = ps;
    ps = LightMapScale[0].y * r0.z;
    r12.xyz = r9.xyz * LightMapScale[1].xyz;
    r11.y = ps;
    ps = LightMapScale[0].z * r0.x;
    r8.yzw = r2.yzx * r1.yxz;
    r11.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyz = r9.zxy * 0.3333333;
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r9.zw = r0.ww * float2(-0.5, 0.5);
    r6.w = ps;
    ps = LightMapScale[1].x * r5.y;
    r6.xyz = r6.zxy * 0.3333333;
    r14.x = ps;
    ps = LightMapScale[2].x * r6.y;
    r3.xyz = r6.www * r3.xyz;
    r9.x = ps;
    ps = LightMapScale[2].y * r6.z;
    r5.w = float((r5.w >= 0.004));
    r9.y = ps;
    ps = LightMapScale[2].z * r6.x;
    r15.xy = r9.zw * r4.zz;
    r9.z = ps;
    ps = LightMapScale[1].y * r5.z;
    r9.xyz = r9.xyz * r1.yxz;
    r14.y = ps;
    r0.w = r3.z * 2.0 - r3.z;
    ps = LightMapScale[1].z * r5.x;
    r3 = -r3.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r14.z = ps;
    ps = r3.x + r3.z;
    r0 = r0.yzxw * float4(0.3333333, 0.3333333, 0.3333333, 0.57735026);
    r4.x = ps;
    ps = r3.y + r3.z;
    r6 = r15 + float4(0.5, 0.5, 0.125, 0.125);
    r4.z = ps;
    ps = r6.z * r6.w;
    r5.z = saturate(r3.w + r0.w);
    r5.x = ps;
    ps = abs(r6.x) * abs(r6.x);
    r3 = r14 * r1.yxzz;
    r4.y = ps;
    ps = abs(r6.y) * abs(r6.y);
    r4.xz = saturate(r4.zx + r0.ww);
    r4.w = ps;
    r6.xyz = r5.xxx * r13.xyz + ModShadowColor.xyz;
    ps = log2(r4.z);
    r5.xy = r8.zy * r4.ww;
    r8.x = ps;
    ps = log2(r5.z);
    r13 = r8.ywzw * r4.yyyw;
    r8.y = ps;
    ps = log2(r4.x);
    r4.z = r13.w * UpperSkyColor.z;
    r8.z = ps;
    ps = UpperSkyColor.x * r5.y;
    r0.xyz = r0.xyz * LightMapScale[0].xyz;
    r4.x = ps;
    ps = UpperSkyColor.y * r5.x;
    r8.xyw = r8.xyz * 16.0;
    r4.y = ps;
    r5.xyz = r13.xzy * LowerSkyColor.xyz + r4.xyz;
    ps = pow(2.0, r8.x);
    r4.xyz = r0.xzy * r1.yzx;
    r6.w = ps;
    ps = pow(2.0, r8.y);
    r0.yzw = r12.xzy * r6.www;
    r6.w = ps;
    ps = pow(2.0, r8.w);
    r8.xyz = r11.xzy * r6.www;
    r6.w = ps;
    ps = AmbientColorAndSkyFactor.x * r1.y;
    r10.xyz = r10.xzy * r6.www;
    r0.x = ps;
    r5.xyz = r10.xzy * 0.21952 + r5.xyz;
    r5.xyz = r9.xzy * r2.yxz + r5.xzy;
    r5.xyz = r3.xyz * r2.yzx + r5.xzy;
    r5.xyz = r8.xzy * 0.21952 + r5.xyz;
    r5.xyz = r4.xyz * r2.yxz + r5.xzy;
    r5.xyz = r0.ywz * 0.21952 + r5.xzy;
    ps = AmbientColorAndSkyFactor.y * r1.x;
    r5.z = r5.z + r3.w;
    r0.y = ps;
    r5.xy = r0.xy * r2.yz + r5.xy;
    r5.xyz = r7.xyz + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
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
