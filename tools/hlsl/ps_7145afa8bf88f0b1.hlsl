// ps_7145afa8bf88f0b1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040E00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 LightMapScale : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
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
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r8.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r7 = tex2D(Texture2D_1, r1.xy).wxyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = OpacityOverride.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r8.z = saturate(ps);
    r13.xyz = r8.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r12.xyz = r9.xyz * r7.yzw;
    r0.y = ps;
    r11.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r8.xyw = r0.yyy * r4.xyz;
    r6.w = ps;
    ps = UniformScalar_0.x;
    r1.xyz = r6.www * r5.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r0.x));
    r6.w = dot(r13.xyz, r13.xyz);
    r0.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r0.xxx * r2.xzy;
    r6.w = ps;
    ps = LightMapScale.x * r6.y;
    r2.xyz = r13.xyz * r6.www;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r14.x = dot(r1.zxy, r2.xyz);
    r4.y = ps;
    ps = LightMapScale.z * r6.x;
    r6.w = dot(r2.xyz, r8.wxy);
    r4.z = ps;
    ps = 0.0001;
    r6.xyz = r4.xyz * r2.xxx;
    r5.y = ps;
    ps = 0.1 - -r0.y;
    r1.xyz = r6.xyz * r7.yzw;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r13.xyz = r2.yzx * r6.www;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r2 = r14.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r13.xyz * 2.0 - r8.xyw;
    ps = ModShadowGroupColor.x * r6.z;
    r0.w = saturate(dot(r0.yxz, r6.wxy));
    r8.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r2.xy + 0.5;
    r8.y = ps;
    ps = max(r5.x, r5.y);
    r6.xyw = -r8.xyz + 1.0;
    r0.x = ps;
    r0.yz = r2.zw * r6.xy + 0.125;
    ps = r7.x;
    r6.xz = abs(r2.xy) * abs(r2.xy);
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r8.xyz = r12.xzy * r6.xxx;
    r2.x = ps;
    ps = log2(r0.w);
    r2.yzw = r12.xzy * r6.zzz;
    r0.w = ps;
    r5.xyz = r2.ywz * UpperSkyColor.xyz + r11.xyz;
    ps = UniformVector_1.z * r7.x;
    r0.xw = r0.yx * r0.zw;
    r2.y = ps;
    r6.xyz = r0.xxx * r10.xyz + ModShadowColor.xyz;
    r0.xyz = r8.xyz * LowerSkyColor.xzy + r5.xzy;
    ps = pow(2.0, r0.w);
    r6.w = float((r6.w >= 0.004));
    r0.w = ps;
    ps = UniformVector_1.y * r7.x;
    r4.xyz = r4.xzy * r0.www;
    r2.z = ps;
    r7.xyz = r4.xyz * r2.xyz + r0.xyz;
    r7.xyz = r1.xyz * r9.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
