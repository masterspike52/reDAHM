// ps_7ac9e8b9e9120778.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = OpacityOverride.x - r2.w;
    r5.xy = r5.xy * abs(r7.xy);
    r7.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_2, r0.xy).zxy;
    r8.zw = tex2D(Texture2D_1, r0.xy).xy;
    ps = OpacityOverride.x;
    r5.x = dot(r4.zxy, r4.zxy);
    r9.z = saturate(ps);
    ps = ConstantLighting.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.21952 * ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    r9.xyw = r9.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r7.xyz * r5.zwy;
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r6.yyy * r3.xyz;
    r5.x = ps;
    ps = r8.w + r8.w;
    r3.yzw = r5.xxx * r4.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.x = dot(r9.xyw, r9.xyw);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r6.xxx * r1.xzy;
    r5.x = ps;
    ps = AmbientColorAndSkyFactor.x * r5.z;
    r1.xyw = r9.ywx * r5.xxx;
    r3.x = ps;
    ps = 0.1 - -r6.y;
    r11.x = dot(r3.wyz, r1.wxy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r0.w = dot(r1.wxy, r0.zxy);
    r5.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r5.w;
    r5.z = -r5.x + 1.0;
    r3.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = r1.xyw * r0.www;
    r9.x = ps;
    r1.xyz = r4.xyz * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r0 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r9.y = ps;
    ps = r0.y;
    r11.xyz = r1.www * ConstantLighting.xyz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r6.y = saturate(dot(r6.yxz, r1.zxy));
    r3.z = ps;
    ps = 0.5 + r0.x;
    r1.xyz = -r9.xyz + 1.0;
    r3.w = ps;
    r6.xz = r0.zw * r1.xy + 0.125;
    ps = log2(r6.y);
    r0.xz = abs(r3.wz) * abs(r3.wz);
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.z * r5.y;
    r8.xz = r8.zx * float2(7.0, 15.0);
    r3.z = ps;
    ps = pow(2.0, r8.z);
    r4.xyz = r10.xyz * r0.xxx;
    r6.y = ps;
    ps = 0.21952 * r6.y;
    r0.xy = r8.xy * UniformScalar_3.xx;
    r5.z = ps;
    ps = ConstantLighting.x * r5.z;
    r8.xyz = r10.xyz * r0.zzz;
    r9.y = ps;
    ps = ConstantLighting.y * r5.z;
    r9.xw = r6.wx * r6.yz;
    r9.z = ps;
    r5.xyz = r9.www * r12.xzy + ModShadowColor.xzy;
    r6.xyz = r11.zxy * r10.zxy + r9.xyz;
    r6.xyz = r8.zxy * LowerSkyColor.zxy + r6.xyz;
    r6.xyz = r4.yzx * UpperSkyColor.yzx + r6.zxy;
    r5.w = r3.y * r7.y + r6.x;
    r0.zw = r3.zx * r7.zx + r6.yz;
    r6.yzw = r0.xyz + UniformVector_0.xyz;
    r6.x = r6.y + r0.w;
    r0.x = r6.z + r5.w;
    ps = r0.x;
    r5.w = float((r1.z >= 0.004));
    ps = r5.z * ps;
    r5.xy = r6.xw * r5.xy;
    r5.z = ps;
    r7.xyz = r5.xyz - r5.xyz;
    oC0.w = r7.w * r5.w + r2.w;
    r5.xyz = r7.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
