// ps_075c4fcd3e3be0ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10000800 00000008 00000000 000054C6 000F003F 00000001 00003050 0000F155 00007256 0000F357 0000F4A0 0000F5A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color1 : COLOR1; // r5
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
    float4 r5 = In.color1;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r1.w = dot(r2.zxy, r2.zxy);
    r6 = r4 * 2.0 - 1.0;
    r7.xyz = r5.zxy * 2.0 - 1.0;
    r4.xzw = r0.zxy * 2.0 - 1.0;
    ps = UniformScalar_0.x;
    r0.w = dot(r7.xyz, r7.xyz);
    ps = UniformVector_2.x * ps;
    r0.xyz = r8.xyz + r8.xyz;
    r4.y = ps;
    ps = rsqrt(abs(r1.w));
    r5.x = dot(r6.zxy, r6.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r0.xyz * UniformVector_1.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyz = r6.xyz * r5.xxx;
    r0.w = ps;
    ps = r5.w;
    r6.xyz = r7.xzy * r0.www;
    ps = r2.z * ps;
    r7.xyz = r5.yzx * r6.zyx;
    r5.w = ps;
    r2.xyz = r5.xyz * r6.yxz - r7.xyz;
    ps = r5.w;
    r2.xyz = r2.xyz * r6.www;
    r7.x = ps;
    ps = 0.0;
    r5.w = dot(r2.xyz, r2.xyz);
    r7.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.zxy * r4.xxx;
    r5.w = ps;
    ps = max(r7.x, r7.y);
    r2.xyz = r2.xzy * r5.www;
    r4.x = ps;
    r5.xyz = r2.xzy * r4.www + r5.xyz;
    r5.xyz = r6.xzy * r4.zzz + r5.xyz;
    ps = 1.0 - r4.x;
    r4.w = r5.z * LocalToWorldMatrix[1].z;
    r4.z = ps;
    r4.x = r5.y * LocalToWorldMatrix[0].z + r4.w;
    r4.x = r5.x * LocalToWorldMatrix[2].z + r4.x;
    r4.x = r4.x * 0.5 + 0.5;
    ps = UniformScalar_0.x;
    r5.yz = abs(r4.xz) * abs(r4.xz);
    ps = UniformVector_2.z * ps;
    r5.x = saturate(r5.z * abs(r4.z));
    r4.z = ps;
    r4.x = -r5.x * 2.0 + 3.0;
    ps = UniformScalar_0.x;
    r5.xz = r5.xy * r5.xy;
    ps = UniformVector_2.y * ps;
    r5.y = r5.x * r4.x;
    r4.w = ps;
    r4.yzw = r4.wzy * r5.yyx;
    r4.x = r4.w * r4.x;
    r4.xyz = r0.xyz * r5.zzz + r4.xyz;
    r4.xyz = r4.xzy + r1.xzy;
    ps = UniformScalar_1.x;
    r4.xyz = r4.xyz + UniformVector_0.xzy;
    r4.xyz = r4.xzy * r3.www + r3.xyz;
    ps = OpacityOverride.x * ps;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
