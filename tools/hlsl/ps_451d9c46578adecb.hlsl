// ps_451d9c46578adecb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    r5.y = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r8.xy = UniformVector_2.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r5.z * r3.z;
    r5.y = ps;
    ps = r5.x;
    r13.xy = r5.zz * -r3.xy;
    ps = abs(r7.x) * ps;
    r3.w = r6.w + r6.w;
    r6.x = ps;
    ps = r5.y;
    r13.z = r3.w - r6.w;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r13.xyz);
    r6.y = ps;
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.z = ps;
    r3.xy = r5.yx * r6.zz + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r9.yzw = tex2D(Texture2D_4, r8.xy).xyz;
    r10.z = tex2D(Texture2D_3, r0.xy).x;
    r7.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r3.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r12.x = saturate(ps);
    ps = -ModShadowColor.x;
    r10.w = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r5.x = float((UniformScalar_1.x >= UniformScalar_0.x));
    r8.x = ps;
    ps = -ModShadowColor.y;
    r0.w = float((UniformScalar_1.x > UniformScalar_0.x));
    ps = 1.0 + ps;
    r7.x = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    ps = -ModShadowColor.z;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r8.z = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.yzw = r5.yzw * UniformVector_1.xyz;
    r10.x = ps;
    ps = rsqrt(abs(r0.x));
    r12.yzw = r3.xyz * r12.yzw;
    r0.x = ps;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r0.xxx * r1.xzy;
    r7.x = ps;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r3.xyz : r12.yzw;
    r3.xyz = (-abs(r5.xxx) >= 0.0) ? r3.xyz : r1.xyz;
    ps = 0.1 - -r0.y;
    r1 = r7.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r1.xy = r1.xy * r4.zz;
    r10.y = saturate(ps);
    ps = r3.w;
    r3.xyz = -r5.yzw + r3.xyz;
    r7.xyz = r3.xyz * UniformScalar_1.xxx + r5.yzw;
    r3.xyz = r7.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = -r6.w + ps;
    r5.xz = -r10.zy + 1.0;
    r12.w = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = saturate(dot(r0.yxz, r13.zxy));
    r12.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r4.xyz = r5.xxx * r7.xyz;
    r12.z = ps;
    ps = log2(r5.y);
    r0 = -r12.wxyz + 1.0;
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r5 = r10.wzzz * r9.xzwy;
    r10.y = ps;
    r9.xyz = r5.wyz * r7.xyz + r4.xyz;
    ps = pow(2.0, r5.x);
    r5.w = float((r0.y >= 0.004));
    r5.x = ps;
    ps = log2(abs(r0.x));
    r1.zw = r1.zw * r0.zw;
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r4.xyz = r5.xxx * ConstantLighting.xzy;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r7 = r1 + float4(0.5, 0.5, 0.125, 0.125);
    r5.x = ps;
    ps = r7.z * r7.w;
    r1.xyz = r9.xyz * r6.yzx;
    r6.w = ps;
    ps = abs(r7.x) * abs(r7.x);
    r5.xyz = r5.xxx * r11.yxz;
    r0.w = ps;
    r0.xyz = r6.www * r8.xyz + ModShadowColor.xyz;
    ps = abs(r7.y) * abs(r7.y);
    r10.zw = r5.xz * r3.yz;
    r6.w = ps;
    ps = UniformScalar_5.x * r5.y;
    r7.xyz = r1.xzy * r0.www;
    r5.x = ps;
    ps = r5.x;
    r8.xyz = r1.xzy * r6.www;
    ps = r3.x * ps;
    r5.yz = r10.zw * UniformScalar_5.xx;
    r5.x = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    r10.z = ps;
    r5.xyz = r10.xyz * r9.xyz + r5.xyz;
    r5.xyz = r8.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r7.xyz * LowerSkyColor.xzy + r5.xzy;
    r5.xyz = r4.xzy * r3.xyz + r5.xzy;
    r5.xyz = r1.xzy * ConstantLighting.xzy + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
