// ps_4d5237842becfdb1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.wz * UniformVector_3.xy;
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r7.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r6.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.z = dot(r4.zxy, r4.zxy);
    r8.xyz = UniformVector_4.yzx * UniformVector_4.www;
    r5.x = dot(r1.zxy, r1.zxy);
    r0.xy = r0.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r10.z = r0.z - 1.0;
    r5.x = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r9.xyz = r8.xyz * UniformVector_5.yzx - r8.xyz;
    ps = rsqrt(abs(r5.z));
    r10.xy = r10.xy * 0.875;
    r5.w = ps;
    r11.yzw = r9.xyz * r12.xxx + r8.xyz;
    ps = r2.w;
    r9.xyz = r5.xxx * r1.xyz;
    ps = 0.0001 * ps;
    r5.x = r9.z + 0.1;
    r1.z = saturate(ps);
    ps = OpacityOverride.x;
    r5.x = saturate(r5.x * 5.0);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r5.xz = -r5.zx + 1.0;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r8.xyz = r5.yyy * r3.xyz;
    r1.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.w = float((r5.x >= 0.004));
    r1.y = ps;
    r5.xyz = -r1.xzy + 1.0;
    r3.xyz = r10.xyz * r5.xzy + float3(0.125, 0.125, 1.0);
    ps = UniformScalar_1.x * r5.y;
    r10.xyz = UniformVector_0.xyz + UniformScalar_7.xxx;
    r1.z = ps;
    r1.xy = r1.zz * r0.xy + r6.yz;
    r0.w = (r1.z > 0.0) ? r3.z : 1.0;
    ps = r3.x * r3.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r5.xyz = r5.xxx * r13.xyz + ModShadowColor.xyz;
    r11.x = (r1.z >= 0.0) ? r0.w : 1.0;
    ps = UniformVector_2.z * r6.x;
    r1.xy = r1.xy * UniformVector_2.xy;
    r1.z = ps;
    r0.w = dot(r1.zxy, r1.zxy);
    r6.xyz = r11.xyz * r12.xyz;
    r6.xyz = r6.xyz * r11.wxx;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r6.xyz * UniformScalar_5.xxx;
    r0.w = ps;
    ps = r5.w;
    r1.xyz = r1.xyz * r0.www;
    ps = r4.x * ps;
    r0.xyz = r6.xyz * r0.xyz;
    r7.x = ps;
    ps = r5.w;
    r3.xyz = -r6.xyz + r7.yzw;
    ps = r4.y * ps;
    r0.w = dot(r1.zxy, r8.zxy);
    r7.y = ps;
    ps = r5.w;
    r11.xyz = r1.xyz * r0.www;
    r6.xyz = r3.xyz * UniformScalar_5.xxx + r6.xyz;
    r3.xyz = r6.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r8.xyz = r11.xyz * 2.0 - r8.xyz;
    r6.xyz = r6.xyz * UniformScalar_6.xxx + r10.xyz;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    ps = r4.z * ps;
    r5.w = saturate(dot(r9.zxy, r8.zxy));
    r7.z = ps;
    ps = log2(r5.w);
    r4.x = dot(r7.zxy, r1.zxy);
    r4.y = ps;
    r1.xyw = r4.xxy * float3(-0.5, 0.5, 15.0);
    r4.xy = r1.xy + 0.5;
    ps = pow(2.0, r1.w);
    r4.yz = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r1.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.xzy * r4.yyy;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r0.xzy * r4.zzz;
    r4.z = ps;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
