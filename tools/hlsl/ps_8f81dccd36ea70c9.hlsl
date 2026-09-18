// ps_8f81dccd36ea70c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041000 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
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
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    r9.xyz = r9.xyz - r7.xyz;
    r9.xyz = r9.xyz * UniformScalar_0.xxx + r7.xyz;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r9.xyz, r9.xyz);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyw = r6.www * r4.xyz;
    r6.z = ps;
    ps = r6.x;
    r14.xyz = r9.xyz * r6.zzz;
    ps = abs(r8.x) * ps;
    r6.z = dot(r14.xyz, r7.wxy);
    r9.x = ps;
    ps = r6.y;
    r4.xyw = r14.zyx * r6.zzz;
    r12.xyz = r4.yxw * 2.0 - r7.xyw;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r12.xyz);
    r9.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.z = ps;
    r8.xy = r6.yx * r7.zz + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r9.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = float((UniformScalar_0.x >= UniformScalar_1.x));
    r0.x = float((UniformScalar_0.x > UniformScalar_1.x));
    r0.y = dot(r2.zxy, r2.zxy);
    r15.xyz = r10.xyz * r15.xyz;
    ps = rsqrt(abs(r9.w));
    r16.xyz = r8.xyz * UniformScalar_6.xxx;
    r0.z = ps;
    r9.xyz = r16.xyz * r9.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.y));
    r5.xyz = r0.zzz * r5.xyz;
    r0.y = ps;
    ps = OpacityOverride.x;
    r0.yzw = r0.yyy * r2.xyz;
    r8.w = saturate(ps);
    r2.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : r15.xyz;
    r10.xyz = (-abs(r6.xxx) >= 0.0) ? r10.xyz : r2.xyz;
    ps = UniformScalar_7.x;
    r6.x = r0.w + 0.1;
    r2.x = ps;
    ps = 0.0001;
    r6.x = saturate(r6.x * 5.0);
    r2.y = ps;
    ps = 1.0 - r6.x;
    r10.xyz = r10.xyz - r8.xyz;
    r6.x = ps;
    r10.yzw = r10.xyz * UniformScalar_0.xxx + r8.xyz;
    r4.xyz = r10.yzw * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = max(r2.x, r2.y);
    r8.xy = r6.xx * ModShadowGroupColor.xy;
    r10.x = ps;
    ps = r10.y;
    r2.xyz = r14.xxx * r1.xyz;
    ps = r6.y * ps;
    r13.x = dot(r5.zxy, r14.xyz);
    r0.x = ps;
    r8.z = saturate(r4.w * 2.0 - r7.w);
    ps = r10.z;
    r5 = r13.xyzx * float4(-0.5, 0.875, 0.875, 0.5);
    ps = r6.z * ps;
    r7.w = saturate(dot(r0.wyz, r12.zxy));
    r0.y = ps;
    ps = r10.w;
    r0.zw = r5.xw + 0.5;
    ps = r6.w * ps;
    r5.xw = abs(r0.zw) * abs(r0.zw);
    r0.z = ps;
    ps = log2(r7.w);
    r6 = -r8 + 1.0;
    r10.w = ps;
    r10.yz = r5.yz * r6.xy + 0.125;
    ps = log2(abs(r6.z));
    r5.xyz = r0.xzy * r5.xxx;
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r8.xyz = r0.xzy * r5.www;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r10.xy = r10.xy * r10.wz;
    r7.w = ps;
    r7.xyz = r10.yyy * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r7.www * r11.yxz;
    ps = UniformScalar_5.x * r6.y;
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    ps = pow(2.0, r10.x);
    r6.xy = r6.xz * r4.yz;
    r6.z = ps;
    ps = r7.w;
    r1.xyz = r6.zzz * r1.xzy;
    ps = r4.x * ps;
    r6.yz = r6.xy * UniformScalar_5.xx;
    r6.x = ps;
    r6.xyz = r9.xyz + r6.xyz;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r8.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r1.xyz * r4.xzy + r6.xyz;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
