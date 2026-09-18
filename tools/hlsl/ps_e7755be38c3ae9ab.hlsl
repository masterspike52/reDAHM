// ps_e7755be38c3ae9ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040E00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.x = saturate(OpacityOverride.x);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    ps = UniformVector_3.x * UniformVector_3.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.z = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.x = dot(r1.zxy, r1.zxy);
    r8.z = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r14.yzw = UniformVector_2.xyz * UniformVector_2.www;
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r0.w = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r12.z = ps;
    ps = UniformScalar_0.x * r5.y;
    r11.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r5.x = ps;
    ps = UniformScalar_0.x * r5.z;
    r0.y = dot(r10.xzy, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r13.yzw = r13.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r12.xyz * r10.yyy;
    r0.w = ps;
    r10.xyz = r14.yzw * r10.zzz + UniformVector_0.xyz;
    r10.xyz = r12.xyz * r5.yzw + r10.xyz;
    ps = rsqrt(abs(r0.x));
    r12.xyz = r0.www * r3.zxy;
    r0.x = ps;
    ps = UniformScalar_0.x * r5.w;
    r1.xyz = r0.xxx * r1.zxy;
    r1.w = ps;
    ps = 0.1 - -r1.x;
    r0.w = dot(r12.xyz, r13.yzw);
    r0.x = ps;
    ps = log2(abs(r0.y));
    r7.w = max(r0.w, 0.0);
    r13.x = ps;
    ps = 5.0 * r0.x;
    r3 = r13 * float4(0.1, 0.7, 1.0, 1.0);
    r7.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r0.y = dot(r3.yzw, r3.yzw);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r0.xz = -r7.wx + float2(0.45, 1.0);
    r0.y = ps;
    ps = 4.0 * r0.x;
    r13.xyz = r13.yzw * float3(0.7, 1.0, 1.0);
    r8.w = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r4.xyz = r0.www * r4.xyz;
    r14.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.xyw = r13.yzx * r0.yyy;
    r14.z = ps;
    ps = ConstantLighting.x * r0.w;
    r7.x = dot(r4.zxy, r0.wxy);
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r0.z = dot(r0.wxy, r12.xyz);
    r4.y = ps;
    ps = pow(2.0, r3.x);
    r13.xyz = r0.xyw * r0.zzz;
    r14.w = ps;
    ps = ConstantLighting.z * r0.w;
    r3 = -r14 + 1.0;
    r4.z = ps;
    ps = r5.x;
    r0.w = float((r3.x >= 0.004));
    r13.xyz = r13.xyz * 2.0 - r12.yzx;
    ps = r3.w * ps;
    r0.xyz = r3.www * r5.yzw;
    r5.x = ps;
    ps = r1.w;
    r12 = r7.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.yz = r12.zw * r3.yz + 0.125;
    r8.xyz = r0.xyz * r8.xyz - r0.xyz;
    ps = r3.w * ps;
    r7.w = saturate(dot(r1.xyz, r13.zxy));
    r5.y = ps;
    ps = r7.w * r7.w;
    r3.xy = r12.xy + 0.5;
    r7.x = ps;
    ps = abs(r3.x) * abs(r3.x);
    r1.xyz = r0.xyz * UniformVector_3.www;
    r1.w = ps;
    r1.xyz = r1.xyz * UniformVector_3.xyz - r0.xyz;
    r8.xyz = r8.www * r8.xyz + r0.xyz;
    ps = abs(r3.y) * abs(r3.y);
    r8.xyz = r8.xyz * r9.xyz;
    r4.w = ps;
    r0.xyz = r8.www * r1.xyz + r0.xyz;
    r1.xyz = r11.xyz * r0.xyz + r10.xyz;
    ps = r7.x * r7.w;
    r8.xyz = r8.xzy * r4.www;
    r4.w = ps;
    ps = r7.y * r7.z;
    r3.xyz = r0.xyz * r9.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    ps = r6.w;
    r6.xyz = r4.www * ConstantLighting.xzy;
    ps = r3.w * ps;
    r7.xyz = r3.xzy * r1.www;
    r5.z = ps;
    r1.xyz = r8.xzy * UpperSkyColor.xyz + r1.xyz;
    r1.xyz = r7.xyz * LowerSkyColor.xzy + r1.xzy;
    r1.xyz = r6.xyz * r5.xyz + r1.xyz;
    r1.xyz = r4.xyz * r3.xyz + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
