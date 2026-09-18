// ps_082c6ee5aaaf7b23.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10000700 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_17 : register(c13); // float
float4 UniformScalar_18 : register(c14); // float
float4 UniformScalar_19 : register(c15); // float
float4 UniformScalar_20 : register(c16); // float
float4 UniformScalar_21 : register(c17); // float
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
sampler2D Texture2D_0 : register(s0);
samplerCUBE TextureCube_0 : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xyz = UniformScalar_6.xxx * float3(1.19, 0.973, 1.04);
    r4.xy = r5.yy * r0.xy + UniformVector_3.xy;
    r4.zw = r5.xx * r0.xy + UniformVector_4.xy;
    r5.xy = r5.zz * r0.xy + UniformVector_2.xy;
    r5.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r4.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r0.xyz = r0.xyz * 2.0 + r4.xyz;
    r4.xyz = r0.xyz + r4.xyz;
    r4.xyz = r4.xyz - 3.0;
    r0.xyz = r5.xyz * 2.0 + r4.xyz;
    r7.xyz = r0.xyz * UniformVector_5.xyz;
    r4.y = r7.x * r0.x;
    r0.w = dot(UniformVector_8.zxy, UniformVector_8.zxy);
    r5.w = UniformVector_5.x * r4.y;
    r4.x = dot(r7.yz, r7.yz) + r5.w;
    ps = rsqrt(abs(r4.x));
    r4.y = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    r6.xyz = r7.xyz * r4.xxx;
    ps = rsqrt(abs(r4.y));
    r4.x = dot(r6.zxy, r6.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r1.xyz = r4.yyy * r2.xyz;
    r4.x = ps;
    r4.yzw = r6.xzy * r4.xxx;
    r4.x = dot(r4.zyw, r1.zxy);
    r4.xyz = r4.ywz * r4.xxx;
    r4.xyz = r4.xyz * 2.0 - r1.xyz;
    r4 = xe_cube(r4.xyz);
    ps = 1.0 / abs(r4.z);
    r5.z = r4.w;
    r5.x = ps;
    r5.xy = r4.yx * r5.xx + 1.5;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    ps = UniformVector_5.y * UniformVector_5.y;
    r4.y = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    ps = UniformVector_5.z * UniformVector_5.z;
    r2.xyz = r4.yyy - r5.xyz;
    r4.y = ps;
    r5.xyz = r2.xyz * UniformScalar_19.xxx + r5.xyz;
    r5.xyz = r5.xyz * UniformVector_9.xyz - UniformVector_6.xyz;
    ps = rsqrt(abs(r0.w));
    r4.xz = r4.xy * r0.yz;
    r4.y = ps;
    r4.x = dot(r4.xz, r0.yz) + r5.w;
    ps = rsqrt(abs(r4.x));
    r0.xyz = r4.yyy * UniformVector_8.xyz;
    r4.x = ps;
    r4.yzw = r7.xzy * r4.xxx;
    r4.x = dot(r6.zxy, r1.zxy);
    r4.y = dot(r4.zyw, r1.zxy);
    r4.z = dot(r0.zxy, r6.zxy);
    r2.xyz = r6.xzy * r4.zzz;
    r0.xyz = r2.xyz * 2.0 - r0.xzy;
    r4.xy = max(r4.xy, 0.0);
    r4.xz = -r4.yx + 1.0;
    ps = log2(abs(r4.x));
    r4.x = ps;
    ps = log2(abs(r4.z));
    r4.y = saturate(dot(r1.zxy, r0.yxz));
    r4.w = ps;
    ps = log2(r4.y);
    r4.y = ps;
    ps = UniformScalar_18.x * r4.y;
    r0.xyz = UniformVector_7.xyz * UniformScalar_17.xxx;
    r4.z = ps;
    ps = pow(2.0, r4.z);
    r4.xy = r4.xw * UniformScalar_20.xx;
    r4.z = ps;
    r0.xyz = r0.xyz * r4.zzz + r5.xyz;
    ps = pow(2.0, r4.x);
    r4.z = -UniformScalar_21.x + 1.0;
    r4.x = ps;
    ps = pow(2.0, r4.y);
    r5.xyz = UniformVector_0.xyz + UniformVector_6.xyz;
    r4.y = ps;
    r4.xy = r4.zz * r4.xy + UniformScalar_21.xx;
    r5.xyz = r0.xyz * r4.xxx + r5.xyz;
    r5.xyz = r5.xyz * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
