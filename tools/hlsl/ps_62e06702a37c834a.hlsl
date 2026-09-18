// ps_62e06702a37c834a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 336 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000540 10041200 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c20); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
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
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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

    r8.xy = r1.xy * UniformScalar_0.xx;
    r8.zw = r1.wz * 0.5;
    r13.yzw = tex2D(Texture2D_2, r1.xy).xyz;
    r10 = tex2D(Texture2D_3, r1.xy);
    r11.yz = tex2D(Texture2D_0, r8.zw).xy;
    r8.xyz = tex2D(Texture2D_1, r8.xy).wxy;
    r14.x = saturate(r3.w * 0.0001);
    r6 = r6.yxzw * 2.0 - 1.0;
    r8.w = dot(r4.zxy, r4.zxy);
    r14.yzw = r7.xyz * 2.0 - 1.0;
    ps = (-1.0) + r8.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xy = r8.yz + r8.yz;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.zw = r11.yz + r11.yz;
    r11.y = ps;
    ps = rsqrt(abs(r7.x));
    r15.z = float((r10.w >= 0.5));
    r7.x = ps;
    ps = rsqrt(abs(r8.w));
    r7.y = dot(r14.wyz, r14.wyz);
    r13.x = ps;
    r8.xyz = r13.wyz * 2.0 - 1.0;
    ps = UniformVector_2.z * r8.x;
    r7.z = dot(r6.zyx, r6.zyx);
    r17.w = ps;
    ps = rsqrt(abs(r7.z));
    r18.xyz = r13.xxx * r4.zxy;
    r7.z = ps;
    ps = r18.x;
    r17.xyz = r7.xxx * r2.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r7.y));
    r13.yzw = r6.xzy * r7.zzz;
    r7.y = ps;
    ps = 0.0;
    r16.xyz = r14.ywz * r7.yyy;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r2 = r12.wxyz - 1.0;
    r14.y = ps;
    ps = r2.w;
    r6.yz = r17.zw + float2(0.1, -1.0);
    r6.x = ps;
    ps = 0.012 * r6.x;
    r7.xyz = r13.zwy * r16.zyx;
    r11.z = ps;
    r7.xyz = r13.yzw * r16.yxz - r7.xyz;
    ps = 5.0 * r6.y;
    r12.yzw = r7.xyz * r6.www;
    r14.z = saturate(ps);
    ps = r6.z;
    r7.w = dot(r12.wyz, r12.wyz);
    ps = r15.z * ps;
    r7.xyz = -r14.xyz + 1.0;
    r0.w = ps;
    r6.zw = r0.wz * r7.xx + 1.0;
    ps = 0.012 * r2.x;
    r6.y = r7.x * UniformScalar_1.x;
    r11.w = ps;
    r6.x = (r6.y > 0.0) ? r6.w : 1.0;
    r8.xy = r6.yy * r2.yz + r8.yz;
    r15.xy = r8.xy * UniformVector_2.xy - r11.zw;
    r15.w = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = r1.z;
    r8.xyw = r15.xyz * r15.zzw;
    r0.w = ps;
    ps = r1.w;
    r6.xy = r11.zw + r8.xy;
    ps = UniformVector_5.x * ps;
    r6.xy = r6.xy * r7.xx;
    r12.x = ps;
    r6.xyz = (r7.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r12.ywz * r7.www;
    r6.x = ps;
    ps = r1.z;
    r14.xyz = r6.yzw * r6.xxx;
    ps = UniformVector_5.y * ps;
    r6.x = dot(r14.zxy, r18.xyz);
    r12.y = ps;
    ps = r11.x;
    r6.xyz = r14.xzy * r6.xxx;
    r8.xyz = r6.xyz * 2.0 - r18.yxz;
    ps = abs(r9.x) * ps;
    r6.z = saturate(dot(r17.zxy, r8.yxz));
    r12.z = ps;
    ps = log2(abs(r7.y));
    r6.xyw = r13.wyz * r8.yyy;
    r13.y = ps;
    r6.xyw = r2.xzy * r8.zzz + r6.xyw;
    r6.xyw = r16.yzx * r8.xxx + r6.wyx;
    ps = log2(r6.z);
    r7.xyw = r6.xxx * LocalToWorldMatrix[2].xzy;
    r13.z = ps;
    ps = r11.y;
    r2.xyw = r13.xzy * float3(-0.075, 15.0, 0.0125);
    r0.z = r2.x * r4.x + r1.w;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r7.xyw;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xyz);
    r12.w = ps;
    ps = 1.0 / abs(r6.z);
    r7.w = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyw)).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r12.zw).xy;
    r1.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.xyw = tex2D(Texture2D_4, r0.zw).xyz;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r5.zxy, r5.zxy);
    r9.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = OpacityOverride.x;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r13.w = saturate(ps);
    ps = 6.0 * r7.x;
    r0.x = float((UniformScalar_5.x > 1.0));
    r12.x = ps;
    ps = LightMapScale.x * r6.y;
    r9.xyz = r9.xyz * r10.xyz;
    r12.y = ps;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r1.xyz : 1.0;
    r1.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = LightMapScale.y * r6.z;
    r0.x = -r15.z + 1.0;
    r12.z = ps;
    ps = LightMapScale.z * r6.x;
    r10.xyz = r0.xxx * UniformVector_3.xyz;
    r12.w = ps;
    r0.xyz = r15.zzz * UniformScalar_6.xxx + r10.xzy;
    ps = ModShadowGroupColor.x * r7.z;
    r6.xyz = r9.xyz * r1.xyz;
    r13.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xyz * r8.www;
    r6.w = ps;
    r1.xyz = r6.xyz * UniformScalar_7.xxx + r0.xzy;
    ps = r6.x;
    r5.xyz = r6.www * r5.xyz;
    ps = r8.x * ps;
    r0.xyz = r12.ywz * r14.zzz;
    r8.x = ps;
    ps = r6.y;
    r4.x = dot(r5.zxy, r14.zxy);
    ps = r8.y * ps;
    r9 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.y = ps;
    ps = r6.z;
    r6.xy = r9.xy + 0.5;
    ps = r8.z * ps;
    r6.xy = abs(r6.xy) * abs(r6.xy);
    r8.z = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r4.xyz = r8.xzy * r6.xxx;
    r13.y = ps;
    ps = pow(2.0, r2.y);
    r5.xyz = r8.xzy * r6.yyy;
    r6.x = ps;
    ps = pow(2.0, r2.w);
    r2.xyz = r12.ywz * r6.xxx;
    r13.z = ps;
    ps = 6.0 * r7.y;
    r6 = -r13 + 1.0;
    r12.y = ps;
    ps = 6.0 * r7.w;
    r6.w = float((r6.w >= 0.004));
    r12.z = ps;
    r9.xy = r9.zw * r6.xy + 0.125;
    r6.xyz = r12.xzy * r6.zzz + r11.xzy;
    r7.xyz = r10.xyz * r6.xzy + UniformVector_0.xyz;
    ps = r9.x * r9.y;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r6.xyz = r7.www * r6.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xzy + r7.xzy;
    r7.xyz = r0.xzy * r8.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
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
