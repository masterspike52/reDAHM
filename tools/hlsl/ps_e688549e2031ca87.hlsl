// ps_e688549e2031ca87.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040F00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c13); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r8.xyz = r8.zxy * 2.0 - 1.0;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    r8.xyz = r8.xyz - r6.xyz;
    r6.xyz = r8.xyz * UniformScalar_0.xxx + r6.xyz;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r6.xyz, r6.xyz);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.xyw = r5.www * r3.xyz;
    r5.z = ps;
    ps = r5.x;
    r6.xyw = r6.yzx * r5.zzz;
    ps = abs(r7.x) * ps;
    r5.z = dot(r6.wxy, r3.wxy);
    r9.x = ps;
    ps = r5.y;
    r8.xyz = r6.yxw * r5.zzz;
    r12.xyz = r8.yxz * 2.0 - r3.xyw;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r12.xyz);
    r9.y = ps;
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r6.z = ps;
    r7.xy = r5.yx * r6.zz + 1.5;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r3.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r10.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r6.z = float((UniformScalar_0.x > UniformScalar_1.x));
    r0.x = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r5.xyz = r15.xyz * r5.xyz;
    r8.w = saturate(ps);
    ps = rsqrt(abs(r9.w));
    r13.xyz = r14.xyz * UniformScalar_6.xxx;
    r0.y = ps;
    r10.xyz = r13.xyz * r10.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.x));
    r0.yzw = r0.yyy * r4.xyz;
    r0.x = ps;
    ps = UniformScalar_7.x;
    r13.xyz = r0.xxx * r1.xyz;
    r1.x = ps;
    r5.xyz = (-abs(r6.zzz) >= 0.0) ? r15.xyz : r5.xyz;
    r5.yzw = (-abs(r5.www) >= 0.0) ? r15.xyz : r5.xyz;
    ps = 0.0001;
    r5.x = r13.z + 0.1;
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r5.x = saturate(r5.x * 5.0);
    r0.x = ps;
    ps = 1.0 - r5.x;
    r1.xyz = r5.yzw - r14.xyz;
    r5.z = ps;
    r5.xyw = r1.xyz * UniformScalar_0.xxx + r14.xyz;
    r4.xyz = r5.xyw * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xyz = r5.xyw * r9.xyz;
    r8.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r3.x = dot(r0.wyz, r6.wxy);
    r8.y = ps;
    r8.z = saturate(r8.z * 2.0 - r3.w);
    ps = ConstantLighting.x * r6.w;
    r9 = r3.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r3.x = ps;
    ps = ConstantLighting.y * r6.w;
    r0.zw = r9.xy + 0.5;
    r3.y = ps;
    ps = abs(r0.z) * abs(r0.z);
    r0.y = saturate(dot(r13.zxy, r12.zxy));
    r0.z = ps;
    ps = abs(r0.w) * abs(r0.w);
    r5 = -r8.wxyz + 1.0;
    r6.z = ps;
    ps = log2(r0.y);
    r8.xyz = r1.xzy * r0.zzz;
    r0.w = ps;
    r0.yz = r9.zw * r5.yz + 0.125;
    ps = log2(abs(r5.w));
    r9.xyz = r1.xzy * r6.zzz;
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r5.w = float((r5.x >= 0.004));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.xw = r0.yx * r0.zw;
    r5.x = ps;
    r0.xyz = r0.xxx * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r5.xyz = r5.xxx * r7.yxz;
    r6.z = ps;
    ps = UniformScalar_5.x * r5.y;
    r7.xyz = r6.zzz * ConstantLighting.xzy;
    r6.z = ps;
    ps = r6.z;
    r5.xy = r5.xz * r4.yz;
    ps = r4.x * ps;
    r5.yz = r5.xy * UniformScalar_5.xx;
    r5.x = ps;
    ps = ConstantLighting.z * r6.w;
    r5.xyz = r10.xyz + r5.xyz;
    r3.z = ps;
    r5.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    r5.xyz = r9.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r8.xyz * LowerSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xyz * r4.xzy + r5.xyz;
    r5.xyz = r3.xyz * r1.xyz + r5.xzy;
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
