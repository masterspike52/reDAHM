// ps_1f41f2c014be885c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10000900 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_18 : register(c13); // float
float4 UniformScalar_19 : register(c14); // float
float4 UniformScalar_20 : register(c15); // float
float4 UniformScalar_21 : register(c16); // float
float4 UniformScalar_22 : register(c17); // float
float4 UniformScalar_23 : register(c18); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UniformVector_9 : register(c11); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D Texture2D_0 : register(s2);
samplerCUBE TextureCube_0 : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xyz = UniformScalar_6.xxx * float3(1.19, 0.973, 1.04);
    r4.xy = r5.yy * r0.xy + UniformVector_3.xy;
    r4.zw = r5.xx * r0.xy + UniformVector_4.xy;
    r5.xy = r5.zz * r0.xy + UniformVector_2.xy;
    r0.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r5.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r4.y = dot(r2.zxy, r2.zxy);
    r4.xz = UniformVector_5.yz * UniformVector_5.yz;
    r4.w = 1.0 / r1.w;
    r7.xyz = r6.xyz * 2.0 + r5.xyz;
    r6.xy = r4.ww * ScreenPositionScaleBias.xy;
    r6.xy = r6.xy * r1.xy + ScreenPositionScaleBias.wz;
    r5.xyz = r7.xyz + r5.xyz;
    r5.xyz = r5.xyz - 3.0;
    r0.xyz = r0.xyz * 2.0 + r5.xyz;
    r5.xyz = r0.xyz * UniformVector_5.xyz;
    r6.zw = r4.xz * r0.yz;
    r4.x = r5.x * r0.x;
    ps = rsqrt(abs(r4.y));
    r4.x = r4.x * UniformVector_5.x;
    r4.z = ps;
    r4.y = dot(r5.yz, r5.yz) + r4.x;
    r4.x = dot(r6.zw, r0.yz) + r4.x;
    ps = rsqrt(abs(r4.x));
    r2.xyz = r4.zzz * r2.xyz;
    r4.x = ps;
    ps = rsqrt(abs(r4.y));
    r4.xzw = r5.xzy * r4.xxx;
    r4.y = ps;
    r4.x = dot(r4.zxw, r2.zxy);
    r4.x = max(r4.x, 0.0);
    ps = 1.0 - r4.x;
    r7.xyz = r5.xyz * r4.yyy;
    r4.y = ps;
    ps = log2(abs(r4.y));
    r4.x = dot(r7.zxy, r7.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r4.y = r4.y * UniformScalar_22.x;
    r4.x = ps;
    ps = pow(2.0, r4.y);
    r7.w = -UniformScalar_23.x + 1.0;
    r4.y = ps;
    r5 = r7.xzyw * r4.xxxy;
    r4.x = dot(r5.yxz, r2.zxy);
    r4.xyz = r5.xzy * r4.xxx;
    r4.xyz = r4.xyz * 2.0 - r2.xyz;
    r4 = xe_cube(r4.xyz);
    ps = 1.0 / abs(r4.z);
    r0.z = r4.w;
    r0.x = ps;
    r0.xy = r4.yx * r0.xx + 1.5;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r4.w = tex2D(SceneDepthTexture, r6.xy).x;
    r4.xyz = tex2D(SceneColorTexture, r6.xy).zxy;
    ps = UniformVector_6.x - r4.y;
    r2.w = dot(UniformVector_8.zxy, UniformVector_8.zxy);
    r8.x = ps;
    r4.w = r4.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = rsqrt(abs(r2.w));
    r0.w = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r2.w = ps;
    ps = UniformVector_6.y - r4.z;
    r6.xyz = r2.www * UniformVector_8.xyz;
    r8.y = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r0.www - r0.xyz;
    r4.w = ps;
    r0.xyz = r9.xyz * UniformScalar_21.xxx + r0.xyz;
    ps = 1.0 / UniformScalar_18.x;
    r0.w = r4.w - r1.w;
    r4.w = ps;
    ps = UniformVector_6.z - r4.x;
    r4.w = saturate(r0.w * r4.w);
    r8.z = ps;
    r5.xyz = r4.www * r8.xyz + r4.yzx;
    r0.xyz = r0.xyz * UniformVector_9.xyz - r5.xyz;
    r4.x = dot(r6.zxy, r7.zxy);
    r4.xyz = r7.xzy * r4.xxx;
    r4.xyz = r4.xyz * 2.0 - r6.xzy;
    r4.x = saturate(dot(r2.zxy, r4.yxz));
    ps = log2(r4.x);
    r4.w = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r4.y = ps;
    ps = UniformScalar_20.x * r4.y;
    r4.x = r5.w + UniformScalar_23.x;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r1.xyz = UniformVector_7.xyz * UniformScalar_19.xxx;
    r4.y = ps;
    r0.xyz = r1.xyz * r4.yyy + r0.xyz;
    r4.xyz = r0.xyz * r4.xxx + r5.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    ps = OpacityOverride.x;
    oC0.xyz = r4.www * r4.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
