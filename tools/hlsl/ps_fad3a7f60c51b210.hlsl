// ps_fad3a7f60c51b210.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040D00 0000070A 00000000 000064E7 001F007F 00000001 00003050 0000F151 0000F256 00007357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D LightMapTextures_0 : register(s2);
sampler2D LightMapTextures_1 : register(s3);
sampler2D LightMapTextures_2 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r9.yzw = tex2D(LightMapTextures_0, r0.xy).xyz;
    r13.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r8.yzw = tex2D(LightMapTextures_2, r0.xy).xyz;
    r12.yz = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r7 = tex2D(Texture2D_1, r1.xy);
    r5.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r11.xyz = r2.yzx * r7.xyz;
    r5.x = ps;
    r6.xyz = r5.xxx * r3.xyz;
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.www * r4.xyz;
    r5.x = ps;
    r5.xyz = r5.zyw * r5.xxx;
    r10.x = saturate(dot(r5.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    r10.z = saturate(dot(r5.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r12.x = dot(r1.zxy, r5.zyx);
    ps = 0.57735026 * r5.z;
    r5.w = dot(r5.zyx, r6.zxy);
    r1.z = ps;
    ps = 0.8164966 * r5.x;
    r3.xyz = r5.yzx * r5.www;
    r1.w = ps;
    r6.xyz = r3.xyz * 2.0 - r6.xzy;
    r5 = r12.yzxx * float4(0.875, 0.875, -0.5, 0.5) + float4(0.125, 0.125, 0.5, 0.5);
    ps = r5.x * r5.y;
    r5.zw = abs(r5.zw) * abs(r5.zw);
    r5.x = ps;
    r0.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    ps = 0.57735026 * r6.y;
    r5.xy = r11.yx * r5.ww;
    r1.x = ps;
    ps = 0.8164966 * r6.z;
    r4 = r11.xzyz * r5.zzzw;
    r1.y = ps;
    r10.yw = saturate(r1.wy + r1.zx);
    r3.yzw = r10.xyz * r10.xyz;
    r13.w = r3.y * r13.x;
    r5.z = saturate(dot(r6.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    r9.x = r3.z * r9.y;
    r12 = r9 * LightMapScale[0].xxyz;
    ps = log2(r5.z);
    r11.x = r12.x * r7.x;
    r9.x = ps;
    ps = r3.w;
    r5.z = saturate(dot(r6.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    ps = r8.y * ps;
    r6 = r13 * LightMapScale[1].xyzx;
    r8.x = ps;
    ps = log2(r5.z);
    r1.x = r6.w * r7.x;
    r9.z = ps;
    ps = OpacityOverride.x;
    r8 = r8 * LightMapScale[2].xxyz;
    r5.z = saturate(ps);
    ps = log2(r10.w);
    r1.w = r8.x * r7.x;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r1.yz = r7.xy * AmbientColorAndSkyFactor.xy;
    r6.w = ps;
    ps = UpperSkyColor.x * r5.y;
    r10.xyz = r9.xyz * 16.0;
    r3.x = ps;
    ps = UpperSkyColor.y * r5.x;
    r9.xy = r6.yz * r3.yy;
    r3.y = ps;
    ps = r4.w;
    r9.zw = r8.zw * r3.ww;
    r5.x = ps;
    ps = pow(2.0, r10.x);
    r11.yz = r12.zw * r3.zz;
    r5.y = ps;
    ps = pow(2.0, r10.y);
    r6.xyz = r6.xzy * r5.yyy;
    r5.y = ps;
    ps = UpperSkyColor.z * r5.x;
    r12.xyz = r12.ywz * r5.yyy;
    r3.z = ps;
    ps = r11.y;
    r5.xyw = r12.xzy * r7.www;
    ps = r7.y * ps;
    r6 = r6.xzyw * r7.wwwz;
    r11.y = ps;
    ps = r11.z;
    r9 = r9 * r7.yzyz;
    ps = r7.z * ps;
    r1 = r1 * r2.yyzy;
    r11.z = ps;
    r5.xyw = r11.xyz * r2.yzx + r5.xyw;
    ps = r5.x;
    r9 = r9 * r2.zxzx;
    ps = r1.x + ps;
    r5.yw = r5.yw + r9.xy;
    r5.x = ps;
    ps = pow(2.0, r10.z);
    r5.xyw = r5.xyw + r6.xyz;
    r0.w = ps;
    ps = r5.x;
    r8.xyz = r8.ywz * r0.www;
    ps = r1.w + ps;
    r5.yw = r5.yw + r9.zw;
    r5.x = ps;
    r5.xyw = r8.yxz * r7.www + r5.wxy;
    r5.xyw = r4.xzy * LowerSkyColor.xyz + r5.ywx;
    ps = 1.0 - r5.z;
    r6.xyz = r5.xyw + r3.xyz;
    r5.x = ps;
    ps = r6.z;
    r5.w = float((r5.x >= 0.004));
    ps = r6.w + ps;
    r5.xy = r6.xy + r1.yz;
    r5.z = ps;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r0.xyz;
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
