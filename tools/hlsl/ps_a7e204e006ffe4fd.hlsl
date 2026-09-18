// ps_a7e204e006ffe4fd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002B8 10000C00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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

    r9.w = tex2D(Texture2D_1, r0.xy).y;
    r6.xyw = tex2D(Texture2D_2, r0.xy).yzx;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = r5.zxy * 2.0 - 1.0;
    r4 = r4.xywz * 2.0 - 1.0;
    ps = 1.0 / r1.w;
    r0.xyz = UniformScalar_0.xxx * UniformVector_1.xzy;
    r5.x = ps;
    r7.xyz = UniformScalar_1.xxx * UniformVector_2.xyz - r0.xzy;
    r10.xy = r5.xx * ScreenPositionScaleBias.xy;
    ps = r8.x + r8.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    ps = r8.y + r8.y;
    r5.y = dot(r4.wxy, r4.wxy);
    r12.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r6.wxy * r11.xyz;
    r5.z = ps;
    r5.x = dot(r6.zy, float2(0.11, 0.59)) + 0.0;
    ps = rsqrt(abs(r5.y));
    r5.z = r5.z * r2.z;
    r5.y = ps;
    r1.xy = r10.xy * r1.xy + ScreenPositionScaleBias.wz;
    r12.w = dot(r1.yx, float2(0.5, 0.5)) + UniformScalar_4.x;
    ps = r5.z;
    r0.w = dot(r9.xyz, r9.xyz);
    r2.x = ps;
    ps = rsqrt(abs(r0.w));
    r5.yzw = r4.xyw * r5.yyy;
    r0.w = ps;
    ps = 0.0;
    r10.yzw = r9.xzy * r0.www;
    r2.y = ps;
    ps = max(r2.x, r2.y);
    r1.xyz = r5.zwy * r10.wzy;
    r0.w = ps;
    ps = r8.w + r8.w;
    r8.xyz = -r0.www + float3(0.39999998, 0.3, 1.0);
    r12.z = ps;
    r9.xyz = r5.yzw * r10.zyw - r1.xyz;
    r2 = r12 + float4(-1.0, -1.0, -1.0, 1.0);
    r1.yz = saturate(r8.xy * float2(10.000004, 9.999998));
    r4.xy = -r1.yz * 2.0 + 3.0;
    r4.w = r2.w * 12.000009 + 0.5;
    r9.xyz = r9.xyz * r4.zzz;
    r4.z = dot(r9.xyz, r9.xyz);
    ps = frac(r4.w);
    r5.yzw = r5.wyz * r2.zzz;
    r11.w = ps;
    ps = rsqrt(abs(r4.z));
    r2.zw = r11.xw * float2(0.3, 6.2831855);
    r4.z = ps;
    ps = r2.z;
    r9.xyz = r9.xzy * r4.zzz;
    ps = r6.w * ps;
    r9.xyz = r9.xzy * r2.yyy;
    r10.x = ps;
    r10.yzw = r10.ywz * r2.xxx + r9.xyz;
    r5 = r10 + r5;
    ps = LocalToWorldMatrix[1].z * r5.w;
    r9.xyz = r5.xxx - r6.xzy;
    r4.z = ps;
    r4.z = r5.z * LocalToWorldMatrix[0].z + r4.z;
    r8.w = r5.y * LocalToWorldMatrix[2].z + r4.z;
    r5 = r9 * float4(0.8, 0.8, 0.8, 4.0);
    r6.xyz = r6.xzy + r5.xyz;
    ps = r6.z;
    r2.xy = r8.zw * float2(0.2, 0.5);
    ps = r5.w + ps;
    r5.xyz = r2.xwy + float3(0.8, -3.1415927, 0.5);
    r6.w = ps;
    ps = abs(r5.z) * abs(r5.z);
    r6.xyz = r0.xyz * r6.xyw;
    r1.x = ps;
    r1.yzw = r1.xyz * r1.xyz;
    ps = sin(r5.y);
    r4.xy = r1.zw * r4.xy;
    r1.x = ps;
    ps = 1.0 - r4.y;
    r4.zw = r1.yx * float2(3.0, 0.5);
    r4.y = ps;
    ps = 0.5 + r4.w;
    r6.xyz = r4.zzz * r6.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r4.zzz + r0.xzy;
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
