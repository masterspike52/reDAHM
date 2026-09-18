// ps_7c08be9b4f203693.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040D00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LightMapScale : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy + UniformVector_1.xy;
    r7.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r0.zw = r1.xy + UniformVector_3.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = r1.xy + UniformVector_2.xy;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    ps = rsqrt(abs(r6.x));
    r6.w = dot(r7.zxy, r7.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xxx * r4.xyz;
    r6.w = ps;
    ps = r9.x;
    r13.xyz = r6.www * r7.xyz;
    ps = abs(r8.x) * ps;
    r6.w = dot(r13.zxy, r6.zxy);
    r1.x = ps;
    ps = r9.y;
    r7.xyz = r13.xzy * r6.www;
    r9.xyz = r7.xyz * 2.0 - r6.xzy;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r9.xzy);
    r1.y = ps;
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r11.yzw = tex2D(Texture2D_1, r1.zw).xyz;
    r8.yw = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r1.xyz = tex2D(Texture2D_2, r0.zw).xyz;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r6.w = dot(r2.zxy, r2.zxy);
    r7.x = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r4.yz = AmbientColorAndSkyFactor.yz * 0.21952;
    r8.z = saturate(ps);
    r0.w = r1.x * 6e+01 + r0.x;
    ps = LightMapScale.x * r6.y;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r10.yz = r4.yz * r7.zw;
    r4.y = ps;
    ps = rsqrt(abs(r7.x));
    r12 = r7.yzwy * float4(0.21952, 0.21952, 0.21952, 1.0);
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r5.xyz = r7.xxx * r5.xyz;
    r6.w = ps;
    ps = LightMapScale.z * r6.x;
    r7.xyz = r6.www * r2.xzy;
    r4.z = ps;
    ps = 0.1 - -r7.y;
    r8.x = dot(r5.zxy, r13.zxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.yzw = r4.xzy * r13.zzz;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r5.xyz = r6.ywz * r12.wyz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r8.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r8.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.yw = r2.xy + 0.5;
    r8.y = ps;
    ps = abs(r6.y) * abs(r6.y);
    r6.x = saturate(dot(r7.yxz, r9.yxz));
    r6.y = ps;
    ps = abs(r6.w) * abs(r6.w);
    r7.xyz = -r8.xyz + 1.0;
    r6.z = ps;
    r8.xyz = r12.xzy * r6.yyy;
    ps = r12.x;
    r6.w = float((r7.z >= 0.004));
    r6.y = ps;
    r9.xy = r2.zw * r7.xy + 0.125;
    ps = log2(r6.x);
    r2.xyz = r12.xzy * r6.zzz;
    r11.x = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r7 = r11.yzxw * float4(7e+01, 7e+01, 15.0, 7e+01);
    r10.x = ps;
    r2.xyz = r2.xzy * UpperSkyColor.xyz + r10.xyz;
    ps = r9.x * r9.y;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = ps;
    r6.xyz = r1.www * r6.xyz + ModShadowColor.xyz;
    r2.xyz = r8.xzy * LowerSkyColor.xyz + r2.xyz;
    ps = pow(2.0, r7.z);
    r7.xyw = r7.ywx * UniformScalar_11.xxx;
    r7.z = ps;
    r1.xy = r1.yz * 6e+01 + r7.xy;
    ps = r0.w;
    r4.xyz = r4.xzy * r7.zzz;
    r2.xyz = r5.xzy * float3(0.21952, 1.0, 1.0) + r2.xzy;
    r7.xyz = r4.xzy * 0.21952 + r2.xzy;
    ps = r7.w + ps;
    r0.yz = r1.yx + r0.zy;
    r0.x = ps;
    r0.xyz = r0.xyz + UniformVector_0.xzy;
    r7.xyz = r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
