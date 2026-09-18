// ps_85c2bf4b61a9a030.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040A00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 ConstantLighting : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    r5.xy = r0.xy + UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r8.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r9.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    ps = OpacityOverride.x;
    r8.x = ConstantLighting.z * 0.1;
    r5.y = saturate(ps);
    ps = -ModShadowColor.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    r5.xzw = r5.wxz * 2.0 - 2.0;
    ps = rsqrt(abs(r6.w));
    r0.w = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r6.w = dot(r1.zxy, r1.zxy);
    r0.w = ps;
    ps = r0.w;
    r10.xyz = r10.xyz * UniformVector_3.xyz;
    ps = r3.x * ps;
    r7.yzw = r7.yyy * r4.xyz;
    r9.x = ps;
    ps = rsqrt(abs(r6.w));
    r10.xyz = r10.xyz * r9.yzw;
    r6.w = ps;
    ps = r0.w;
    r4.xyz = r6.www * r1.xyz;
    r6.xyz = r6.zxy * 2.0 + r5.xzw;
    ps = r3.y * ps;
    r5.z = dot(r6.xyz, r6.xyz);
    r9.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r4.z + 0.1;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r6.xzw = r6.xyz * r5.zzz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.z = dot(r6.xzw, r6.xzw);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.xw = r5.xx * ModShadowGroupColor.xy;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r0.xyz = r10.xyz * r0.xyz;
    r6.y = ps;
    ps = 1.0 - r5.w;
    r1.xyz = r6.xzw * r5.zzz;
    r6.z = ps;
    ps = 1.0 - r5.y;
    r5.xzw = r1.yzx * TwoSidedSign.xxx;
    r6.w = ps;
    ps = r0.w;
    r6.x = float((r6.w >= 0.004));
    ps = r3.z * ps;
    r8.y = dot(r7.wyz, r5.wxz);
    r9.z = ps;
    ps = -ModShadowColor.y;
    r5.y = dot(r5.wxz, r9.zxy);
    ps = 1.0 + ps;
    r1.xyz = r5.xzw * r5.yyy;
    r7.y = ps;
    r1.xyz = r1.xyz * 2.0 - r9.xyz;
    ps = -ModShadowColor.z;
    r3 = r8.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    r8.yz = r3.zw * r6.yz + 0.125;
    ps = 1.0 + ps;
    r6.zw = r3.xy + 0.5;
    r7.z = ps;
    ps = ConstantLighting.x * r5.w;
    r5.y = saturate(dot(r4.zxy, r1.zxy));
    r6.y = ps;
    ps = log2(r5.y);
    r1.xw = abs(r6.wz) * abs(r6.wz);
    r5.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.y = r5.y * 15.0;
    r6.z = ps;
    ps = pow(2.0, r5.y);
    r1.xyz = r0.xzy * r1.xxx;
    r8.w = ps;
    ps = ConstantLighting.z * r5.w;
    r5.z = r8.w * 0.1;
    r6.w = ps;
    ps = ConstantLighting.x * r5.z;
    r3.xyz = r0.xzy * r1.www;
    r4.x = ps;
    ps = ConstantLighting.y * r5.z;
    r4.zw = r8.xy * r8.wz;
    r4.y = ps;
    r5.xyz = r4.www * r7.xyz + ModShadowColor.xyz;
    r6.yzw = r6.yzw * r0.xyz + r4.xyz;
    r6.yzw = r3.xzy * LowerSkyColor.xyz + r6.yzw;
    r6.yzw = r1.xzy * UpperSkyColor.xyz + r6.yzw;
    r6.yzw = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.yzw;
    r6.yzw = r6.yzw + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
