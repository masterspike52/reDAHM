// ps_05dedd6efb9f82dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040E00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LightMapScale : register(c15); // float3
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.xy = UniformVector_1.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = r6.z * r4.z;
    r6.y = ps;
    ps = r6.x;
    r14.xy = r6.zz * -r4.xy;
    ps = abs(r8.x) * ps;
    r0.z = r7.w + r7.w;
    r4.x = ps;
    ps = r6.y;
    r14.z = r0.z - r7.w;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r14.xyz);
    r4.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.z = ps;
    r8.xy = r6.yx * r7.zz + 1.5;
    r8.yzw = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r12.z = tex2D(Texture2D_2, r1.xy).x;
    r13.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r12.xyw = tex2D(Texture2D_1, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    ps = OpacityOverride.x;
    r0.x = saturate(ps);
    ps = UniformScalar_8.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = 0.0001;
    r6.w = dot(r5.zxy, r5.zxy);
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r0.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r7.x = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r1.xyz = r1.xyz * LightMapScale.xyz;
    r11.y = ps;
    r12.xyw = r10.xyz * r12.xyw - r10.xyz;
    ps = rsqrt(abs(r7.x));
    r13.xyz = r12.zzz * r13.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.xzy;
    r9.x = ps;
    r10.xyz = r12.xyw * UniformScalar_0.xxx + r10.xyz;
    r2.xyz = r10.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = 0.1 - -r7.y;
    r9 = r9.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r6.w = ps;
    ps = 5.0 * r6.w;
    r12.w = saturate(r0.z - r7.w);
    r0.y = saturate(ps);
    ps = r9.z;
    r1.w = saturate(dot(r7.yxz, r14.zxy));
    ps = r5.z * ps;
    r7.xy = -r0.xy + 1.0;
    r9.z = ps;
    ps = r9.w;
    r12.xy = r7.yy * ModShadowGroupColor.xy;
    ps = r5.z * ps;
    r12 = -r12.wxyz + 1.0;
    r9.w = ps;
    ps = log2(abs(r12.x));
    r0.xyz = r12.www * r10.xyz;
    r6.w = ps;
    r10.xyz = r13.xyz * r10.xyz + r0.xyz;
    ps = UniformScalar_3.x * r6.w;
    r9.xy = r9.xy * r12.yz;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5 = r9 + float4(0.125, 0.125, 0.5, 0.5);
    r6.w = ps;
    ps = r5.x * r5.y;
    r7.x = float((r7.x >= 0.004));
    r7.y = ps;
    ps = abs(r5.z) * abs(r5.z);
    r0.xyz = r10.xyz * r6.yzx;
    r8.x = ps;
    ps = abs(r5.w) * abs(r5.w);
    r6.yzw = r6.www * r8.zwy;
    r8.y = ps;
    r7.yzw = r7.yyy * r4.xyz + ModShadowColor.xyz;
    ps = UniformScalar_4.x * r6.w;
    r6.yz = r6.yz * r2.yz;
    r6.w = ps;
    ps = log2(r1.w);
    r4.x = r6.w * r2.x;
    r8.z = ps;
    ps = UniformScalar_4.x * r6.y;
    r5.xyz = r0.xzy * r8.xxx;
    r4.y = ps;
    ps = UniformScalar_4.x * r6.z;
    r8 = r0.xzyw * r8.yyyz;
    r4.z = ps;
    ps = pow(2.0, r8.w);
    r9.xyz = r4.xyz + UniformVector_0.xyz;
    r6.w = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r4.xyz = r1.xzy * r6.www;
    r11.z = ps;
    r6.xyz = r11.xyz * r10.xyz + r9.xyz;
    r6.xyz = r8.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xyz * r2.xzy + r6.xyz;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xzy - r6.xzy;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
