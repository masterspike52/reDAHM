// ps_f8fb6084944724e7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002D0 10000C00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color1 : COLOR1; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xy = r0.xy * 1e+01 + UniformVector_1.xy;
    r6.x = tex2D(Texture2D_1, r0.xy).y;
    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r12.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.w = dot(r2.zxy, r2.zxy);
    r8 = r4 * 2.0 - 1.0;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    r0.xyz = UniformScalar_5.xxx * UniformVector_2.xzy;
    r7.xyz = UniformScalar_6.xxx * UniformVector_3.xyz - r0.xzy;
    ps = 1.0 / r1.w;
    r4.y = dot(r5.xyz, r5.xyz);
    r4.z = ps;
    ps = ScreenPositionScaleBias.x * r4.z;
    r5.w = dot(r8.zxy, r8.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r0.w));
    r11.xyz = r12.yzw * r11.xyz;
    r4.x = ps;
    ps = ScreenPositionScaleBias.y * r4.z;
    r4.x = r4.x * r2.z;
    r12.y = ps;
    r4.zw = r12.xy * r1.xy + ScreenPositionScaleBias.wz;
    r4.w = dot(r4.wz, float2(0.5, 0.5)) + UniformScalar_8.x;
    ps = r4.x;
    r1.xyz = r11.xzy * r9.xzy;
    r4.x = ps;
    ps = rsqrt(abs(r5.w));
    r11.xyz = r1.xzy * r6.yzw;
    r4.z = ps;
    ps = rsqrt(abs(r4.y));
    r9.xyz = r8.xyz * r4.zzz;
    r4.y = ps;
    ps = 0.0;
    r8.xyz = r5.xzy * r4.yyy;
    r4.y = ps;
    ps = max(r4.x, r4.y);
    r5.xyz = r9.yzx * r8.zyx;
    r4.x = ps;
    ps = r10.x + r10.x;
    r1.xyz = -r4.xxx + float3(0.39999998, 0.3, 1.0);
    r4.x = ps;
    ps = r10.y + r10.y;
    r4.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r4.y = ps;
    ps = r10.z + r10.z;
    r6.yzw = r4.zzz - r11.xzy;
    r4.z = ps;
    r4 = r4.zywx + float4(-1.0, -1.0, 1.0, -1.0);
    r10.xyz = r9.xyz * r8.yxz - r5.xyz;
    r2.yz = saturate(r1.xy * float2(10.000004, 9.999998));
    r5.zw = -r2.yz * 2.0 + 3.0;
    r10.xyz = r10.xyz * r8.www;
    r5.x = r4.z * 12.000009 + 0.5;
    r6 = r6.yzwx * float4(0.8, 0.8, 0.8, 4.0);
    r5.y = dot(r10.xyz, r10.xyz);
    ps = rsqrt(abs(r5.y));
    r6.xyz = r11.xzy + r6.xyz;
    r5.y = ps;
    ps = r6.z;
    r9.xyz = r9.zxy * r4.xxx;
    ps = r6.w + ps;
    r10.xyz = r10.xzy * r5.yyy;
    r6.w = ps;
    r4.xyz = r10.xzy * r4.yyy + r9.xyz;
    r4.xyz = r8.yzx * r4.www + r4.zyx;
    ps = frac(r5.x);
    r4.w = r4.x * LocalToWorldMatrix[1].z;
    r4.x = ps;
    r4.y = r4.y * LocalToWorldMatrix[0].z + r4.w;
    r4.y = r4.z * LocalToWorldMatrix[2].z + r4.y;
    r4.xz = r4.yx * float2(0.5, 6.2831855) + float2(0.5, -3.1415927);
    ps = abs(r4.x) * abs(r4.x);
    r6.xyz = r0.xyz * r6.xyw;
    r2.x = ps;
    ps = sin(r4.z);
    r4.xyw = r2.yzx * r2.yzx;
    r1.w = ps;
    r5.xy = r1.zw * float2(0.2, 0.5) + float2(0.8, 0.5);
    r0.xyz = r7.xyz * r5.yyy + r0.xzy;
    ps = 3.0 * r4.w;
    r4.xy = r4.xy * r5.zw;
    r4.z = ps;
    ps = 1.0 - r4.y;
    r6.xyz = r4.zzz * r6.xzy;
    r4.y = ps;
    ps = OpacityOverride.x * r4.y;
    r0.xyz = r0.xzy - r6.xzy;
    r4.w = ps;
    r4.xyz = r4.xxx * r0.xyz + r6.xzy;
    ps = r4.w;
    r4.xyz = r4.xyz + UniformVector_0.xzy;
    r4.xyz = r4.xzy * r3.www + r3.xyz;
    ps = r5.x * ps;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
