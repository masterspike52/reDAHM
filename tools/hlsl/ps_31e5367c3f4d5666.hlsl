// ps_31e5367c3f4d5666.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 333 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000534 10041200 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_6 : register(c14); // float
float4 UniformScalar_7 : register(c15); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c17); // float3
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
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xy = r0.xy * UniformScalar_0.xx;
    r8.zw = r0.wz * 0.5;
    r12.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r10 = tex2D(Texture2D_3, r0.xy);
    r13.zw = tex2D(Texture2D_0, r8.zw).xy;
    r8.xyz = tex2D(Texture2D_1, r8.xy).wxy;
    r16.x = saturate(r3.w * 0.0001);
    r6 = r6.yxzw * 2.0 - 1.0;
    r8.w = dot(r4.zxy, r4.zxy);
    r11.xyz = r7.xyz * 2.0 - 1.0;
    ps = (-1.0) + r8.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xy = r8.yz + r8.yz;
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.zw = r13.zw + r13.zw;
    r14.w = ps;
    ps = rsqrt(abs(r7.x));
    r15.z = float((r10.w >= 0.5));
    r7.x = ps;
    ps = rsqrt(abs(r8.w));
    r7.y = dot(r11.zxy, r11.zxy);
    r12.x = ps;
    r8.xyz = r12.wyz * 2.0 - 1.0;
    ps = UniformVector_2.z * r8.x;
    r7.z = dot(r6.zyx, r6.zyx);
    r17.w = ps;
    ps = rsqrt(abs(r7.z));
    r18.xyz = r12.xxx * r4.zxy;
    r7.z = ps;
    ps = r18.x;
    r17.xyz = r7.xxx * r2.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r7.y));
    r12.yzw = r6.xzy * r7.zzz;
    r7.y = ps;
    ps = 0.0;
    r11.xyz = r11.xzy * r7.yyy;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r2 = r13.wxyz - 1.0;
    r16.y = ps;
    ps = r2.w;
    r6.yz = r17.zw + float2(0.1, -1.0);
    r6.x = ps;
    ps = 0.012 * r6.x;
    r7.xyz = r12.zwy * r11.zyx;
    r14.x = ps;
    r7.xyz = r12.yzw * r11.yxz - r7.xyz;
    ps = 5.0 * r6.y;
    r13.xyz = r7.xyz * r6.www;
    r16.z = saturate(ps);
    ps = r6.z;
    r7.w = dot(r13.zxy, r13.zxy);
    ps = r15.z * ps;
    r7.xyz = -r16.xyz + 1.0;
    r15.y = ps;
    r6.zw = r15.yx * r7.xx + 1.0;
    ps = 0.012 * r2.x;
    r6.y = r7.x * UniformScalar_1.x;
    r14.y = ps;
    r6.x = (r6.y > 0.0) ? r6.w : 1.0;
    r8.xy = r6.yy * r2.yz + r8.yz;
    r15.xy = r8.xy * UniformVector_2.xy - r14.xy;
    r15.w = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = r0.z;
    r2.xyz = r15.xyz * r15.zzw;
    r8.y = ps;
    ps = r0.w;
    r6.xy = r14.xy + r2.xy;
    ps = UniformVector_5.x * ps;
    r6.xy = r6.xy * r7.xx;
    r14.x = ps;
    r6.xyz = (r7.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r16.xyz = r13.xzy * r7.www;
    r6.x = ps;
    ps = r0.z;
    r13.xyz = r6.yzw * r6.xxx;
    ps = UniformVector_5.y * ps;
    r6.x = dot(r13.zxy, r18.xyz);
    r14.y = ps;
    ps = r14.z;
    r6.xyz = r13.xzy * r6.xxx;
    r2.xyw = r6.xyz * 2.0 - r18.yxz;
    ps = abs(r9.x) * ps;
    r6.z = saturate(dot(r17.zxy, r2.yxw));
    r8.z = ps;
    ps = log2(abs(r7.y));
    r6.xyw = r12.wyz * r2.yyy;
    r12.y = ps;
    r6.xyw = r16.xzy * r2.www + r6.xyw;
    r6.xyw = r11.yzx * r2.xxx + r6.wyx;
    ps = log2(r6.z);
    r11.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r12.z = ps;
    ps = r14.w;
    r12.xyz = r12.xyz * float3(-0.075, 0.0125, 15.0);
    r8.x = r12.x * r4.x + r0.w;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r11.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xyz);
    r8.w = ps;
    ps = 1.0 / abs(r6.z);
    r0.z = r6.w;
    r7.w = ps;
    r0.xy = r6.yx * r7.ww + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r8.zw = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r0.xyz = tex2D(Texture2D_5, r14.xy).xyz;
    r6.xyw = tex2D(Texture2D_4, r8.xy).xyz;
    ps = OpacityOverride.x;
    r4.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r14.w = saturate(ps);
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r8.y = dot(r5.zxy, r5.zxy);
    r8.x = ps;
    ps = -UniformVector_0.y;
    r6.z = float((UniformScalar_5.x >= 1.0));
    ps = 1.0 + ps;
    r0.w = float((UniformScalar_5.x > 1.0));
    r7.w = ps;
    ps = -UniformVector_0.z;
    r14.xyz = r4.xyz * r10.xyz;
    r0.xyz = (-abs(r0.www) >= 0.0) ? r0.xyz : 1.0;
    r4.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = 1.0 + ps;
    r0.x = -r15.z + 1.0;
    r6.z = ps;
    ps = 6.0 * r6.x;
    r10.xyz = r0.xxx * UniformVector_3.xyz;
    r12.x = ps;
    r0.xyz = r15.zzz * UniformScalar_6.xxx + r10.xzy;
    ps = ModShadowGroupColor.x * r7.z;
    r4.xyz = r14.xyz * r4.xyz;
    r14.x = ps;
    ps = rsqrt(abs(r8.y));
    r4.xyz = r4.xyz * r2.zzz;
    r8.y = ps;
    r2.xyz = r4.xyz * UniformScalar_7.xxx + r0.xzy;
    ps = r4.x;
    r5.xyz = r8.yyy * r5.xyz;
    ps = r8.x * ps;
    r0.xyz = r13.zzz * r1.xyz;
    r8.x = ps;
    ps = r4.y;
    r8.y = dot(r5.zxy, r13.zxy);
    ps = r7.w * ps;
    r13 = r8.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    r8.y = ps;
    ps = r4.z;
    r8.zw = r13.xy + 0.5;
    ps = r6.z * ps;
    r4.xw = abs(r8.zw) * abs(r8.zw);
    r8.z = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r4.xyz = r8.xzy * r4.xxx;
    r14.y = ps;
    ps = pow(2.0, r12.z);
    r5.xyz = r8.xzy * r4.www;
    r6.z = ps;
    ps = pow(2.0, r12.y);
    r1.xyz = r6.zzz * r1.xzy;
    r14.z = ps;
    ps = 6.0 * r6.y;
    r7 = -r14.wxyz + 1.0;
    r12.y = ps;
    ps = 6.0 * r6.w;
    r7.x = float((r7.x >= 0.004));
    r12.z = ps;
    r6.xy = r13.zw * r7.yz + 0.125;
    r7.yzw = r12.xzy * r7.www + r11.xzy;
    r7.yzw = r10.xyz * r7.ywz + UniformVector_0.xyz;
    ps = r6.x * r6.y;
    r6.x = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r7.yzw = r8.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    r7.yzw = r5.xyz * UpperSkyColor.xzy + r7.ywz;
    r7.yzw = r4.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r1.xyz * r2.xzy + r7.ywz;
    r7.yzw = r0.xyz * r8.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.ywz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xzy - r6.xzy;
    r8.w = ps;
    oC0.w = r8.w * r7.x + r3.w;
    r6.xyz = r8.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
