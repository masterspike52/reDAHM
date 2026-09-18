// ps_040d0ccc5543bbdc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10041000 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LightMapScale : register(c17); // float3
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
sampler2D LightMapTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r9.xy = UniformVector_2.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = r6.z * r4.z;
    r6.y = ps;
    ps = r6.x;
    r12.xy = r6.zz * -r4.xy;
    ps = abs(r8.x) * ps;
    r0.w = r7.w + r7.w;
    r7.x = ps;
    ps = r6.y;
    r12.z = r0.w - r7.w;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r12.xyz);
    r7.y = ps;
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.z = ps;
    r4.xy = r6.yx * r7.zz + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r9.yzw = tex2D(Texture2D_4, r9.xy).xyz;
    r14.y = tex2D(Texture2D_3, r1.xy).x;
    r4.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r15.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r13.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).yzx;
    ps = OpacityOverride.x;
    r15.x = saturate(ps);
    ps = -ModShadowColor.x;
    r14.z = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r1.z = float((UniformScalar_1.x >= UniformScalar_0.x));
    r8.x = ps;
    ps = -ModShadowColor.y;
    r1.w = float((UniformScalar_1.x > UniformScalar_0.x));
    ps = 1.0 + ps;
    r4.x = dot(r5.zxy, r5.zxy);
    r8.y = ps;
    ps = -ModShadowColor.z;
    r7.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.z = ps;
    ps = LightMapScale.x * r6.z;
    r10.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r1.x = ps;
    ps = LightMapScale.y * r6.x;
    r13.xyz = r13.xyz * UniformVector_1.xyz;
    r1.y = ps;
    ps = rsqrt(abs(r7.x));
    r6.xzw = r15.yzw * r16.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r4.x));
    r7.xyz = r7.xxx * r2.xzy;
    r4.x = ps;
    r6.xzw = (-abs(r1.www) >= 0.0) ? r15.yzw : r6.xzw;
    r2.xyz = (-abs(r1.zzz) >= 0.0) ? r15.yzw : r6.xzw;
    ps = 0.1 - -r7.y;
    r4 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r5.xy = r4.xy * r5.zz;
    r14.x = saturate(ps);
    ps = r0.w;
    r6.xzw = -r13.xyz + r2.xyz;
    r13.xyz = r6.xzw * UniformScalar_1.xxx + r13.xyz;
    r2.xyz = r13.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = -r7.w + ps;
    r6.xz = -r14.yx + 1.0;
    r15.w = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r6.w = saturate(dot(r7.yxz, r12.zxy));
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r12.xyz = r6.xxx * r13.xyz;
    r15.z = ps;
    ps = log2(r6.w);
    r7 = -r15.wxyz + 1.0;
    r9.x = ps;
    ps = LightMapScale.z * r6.y;
    r9 = r14.yyyz * r9.yzwx;
    r1.z = ps;
    r9.xyz = r9.xyz * r13.xyz + r12.xyz;
    ps = pow(2.0, r9.w);
    r6.w = float((r7.y >= 0.004));
    r6.x = ps;
    ps = log2(abs(r7.x));
    r5.zw = r4.zw * r7.zw;
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r4.xyz = r1.xzy * r6.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7 = r5.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    r6.x = ps;
    ps = r7.y * r7.z;
    r0.xyz = r9.xyz * r0.xyz;
    r1.w = ps;
    ps = abs(r7.x) * abs(r7.x);
    r6.xyz = r6.xxx * r11.yxz;
    r0.w = ps;
    r7.xyz = r1.www * r8.xyz + ModShadowColor.xyz;
    ps = abs(r7.w) * abs(r7.w);
    r11.xy = r6.xz * r2.yz;
    r7.w = ps;
    ps = UniformScalar_5.x * r6.y;
    r5.xyz = r0.xzy * r0.www;
    r6.x = ps;
    ps = r6.x;
    r8.xyz = r0.xzy * r7.www;
    ps = r2.x * ps;
    r6.yz = r11.xy * UniformScalar_5.xx;
    r6.x = ps;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    r6.xyz = r10.xyz * r9.xyz + r6.xyz;
    r6.xyz = r8.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xyz * r2.xzy + r6.xyz;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
