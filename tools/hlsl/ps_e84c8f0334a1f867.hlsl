// ps_e84c8f0334a1f867.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040F00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.x = saturate(OpacityOverride.x);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r13.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r14.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyw = tex2D(Texture2D_1, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r5.z = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r5.x = dot(r1.zxy, r1.zxy);
    r8.z = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r0.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r5.w = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r12.z = ps;
    ps = UniformScalar_0.x * r6.y;
    r11.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r6.x = ps;
    ps = UniformScalar_0.x * r6.z;
    r5.y = dot(r10.xwy, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r15.yzw = r14.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r10.xyz = r12.xyz * r10.yyy;
    r5.w = ps;
    r0.xyz = r0.xyz * r10.www + UniformVector_0.xyz;
    r10.xyz = r10.xyz * r6.yzw + r0.xyz;
    ps = rsqrt(abs(r5.x));
    r12.xyz = r5.www * r3.zxy;
    r5.x = ps;
    ps = UniformScalar_0.x * r6.w;
    r0.xyz = r5.xxx * r1.zxy;
    r7.w = ps;
    ps = 0.1 - -r0.x;
    r5.w = dot(r12.xyz, r15.yzw);
    r5.x = ps;
    ps = log2(abs(r5.y));
    r3.y = max(r5.w, 0.0);
    r15.x = ps;
    ps = 5.0 * r5.x;
    r1 = r15.yzxw * float4(0.7, 1.0, 0.1, 1.0);
    r3.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r1.xyw, r1.xyw);
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r5.xz = -r3.yx + float2(0.45, 1.0);
    r5.y = ps;
    ps = 4.0 * r5.x;
    r15.xyz = r15.yzw * float3(0.7, 1.0, 1.0);
    r1.w = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r3.xyz = r5.www * r4.xyz;
    r14.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.xyw = r15.yzx * r5.yyy;
    r14.z = ps;
    ps = ConstantLighting.x * r5.w;
    r13.x = dot(r3.zxy, r5.wxy);
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r5.z = dot(r5.wxy, r12.xyz);
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r4.xyz = r5.xyw * r5.zzz;
    r14.w = ps;
    ps = ConstantLighting.z * r5.w;
    r3 = -r14.xywz + 1.0;
    r1.z = ps;
    ps = r6.x;
    r5.w = float((r3.x >= 0.004));
    r12.xyz = r4.xyz * 2.0 - r12.yzx;
    ps = r3.z * ps;
    r5.xyz = r3.zzz * r6.yzw;
    r3.x = ps;
    ps = r7.w;
    r6 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.yz = r6.zw * r3.yw + 0.125;
    r8.xyz = r5.xyz * r8.xyz - r5.xyz;
    ps = r3.z * ps;
    r4.w = saturate(dot(r0.xyz, r12.zxy));
    r3.y = ps;
    ps = r4.w * r4.w;
    r0.xy = r6.xy + 0.5;
    r4.x = ps;
    ps = abs(r0.x) * abs(r0.x);
    r6.xyz = r5.xyz * UniformVector_3.www;
    r6.w = ps;
    r6.xyz = r6.xyz * UniformVector_3.xyz - r5.xyz;
    r8.xyz = r1.www * r8.xyz + r5.xyz;
    ps = abs(r0.y) * abs(r0.y);
    r8.xyz = r8.xyz * r9.xyz;
    r0.x = ps;
    r5.xyz = r1.www * r6.xyz + r5.xyz;
    r6.xyz = r11.xyz * r5.xyz + r10.xyz;
    ps = r4.x * r4.w;
    r8.xyz = r8.xzy * r0.xxx;
    r1.w = ps;
    ps = r4.y * r4.z;
    r0.xyz = r5.xyz * r9.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    ps = r0.w;
    r4.xyz = r1.www * ConstantLighting.xzy;
    ps = r3.z * ps;
    r7.xyz = r0.xzy * r6.www;
    r3.z = ps;
    r6.xyz = r8.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r7.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xyz * r3.xyz + r6.xyz;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
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
