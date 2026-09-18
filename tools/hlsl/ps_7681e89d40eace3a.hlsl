// ps_7681e89d40eace3a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040D00 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale : register(c9); // float3
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
sampler2D LightMapTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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
    r7.w = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r5.zxy, r5.zxy);
    r1.w = ps;
    r1.zw = r1.zw * abs(r6.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r8.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1 = tex2D(Texture2D_1, r1.xy);
    r0.xyz = tex2D(LightMapTexture, r0.xy).yzx;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.xyz = r1.xyz * 0.05;
    r8.yzw = r8.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r13.xyz = r1.xyz * UniformVector_1.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r0.w));
    r10.xyz = r7.www * r4.xyz;
    r0.w = ps;
    ps = OpacityOverride.x;
    r9.xyz = r0.www * r5.xyz;
    r9.w = saturate(ps);
    ps = LightMapScale.x * r0.z;
    r0.w = dot(r8.yzw, r8.yzw);
    r8.x = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r13.xyz * r12.xyz;
    r4.w = ps;
    r5.xyz = r6.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r6.xyz = r4.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r4.www * r2.xzy;
    r0.w = ps;
    ps = LightMapScale.y * r0.x;
    r5.xyz = r8.yzw * r0.www;
    r8.y = ps;
    ps = 0.1 - -r1.y;
    r11.x = dot(r9.zxy, r5.xyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.w = dot(r5.xyz, r10.zxy);
    r0.z = saturate(ps);
    ps = LightMapScale.z * r0.y;
    r0.z = -r0.z + 1.0;
    r8.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r5.yzx * r0.www;
    r9.y = ps;
    r10.xyz = r0.xyw * 2.0 - r10.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r2 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r9.z = ps;
    ps = r2.y;
    r5.xyz = r8.xzy * r5.xxx;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r4.w = saturate(dot(r1.yxz, r10.zxy));
    r9.x = ps;
    ps = 0.5 + r2.x;
    r0.xyw = -r9.yzw + 1.0;
    r9.y = ps;
    r0.yz = r2.zw * r0.xy + 0.125;
    ps = log2(r4.w);
    r1.xy = abs(r9.xy) * abs(r9.xy);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r2.x = ps;
    ps = r0.y * r0.z;
    r2.yzw = r4.xzy * r1.yyy;
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r2.yzw * UpperSkyColor.xzy + r6.xzy;
    ps = pow(2.0, r2.x);
    r7.xyz = r4.xzy * r1.xxx;
    r2.x = ps;
    r2.xyz = r8.xzy * r2.xxx;
    r1.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r1.xyz = r2.xyz * r1.www + r1.xzy;
    r1.xyz = r5.xzy * r4.xyz + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
