// ps_0d9798499d44df89.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10041300 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LightMapScale : register(c22); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c12); // float
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_2 : register(c14); // float
float4 UniformScalar_3 : register(c15); // float
float4 UniformScalar_4 : register(c16); // float
float4 UniformScalar_5 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
float4 UpperSkyColor : register(c19); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.x = saturate(OpacityOverride.x);
    r7.x = ps;
    r7.xy = r7.xy * abs(r9.xy);
    r9.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r16.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r14.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r15.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r12.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r11.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r8.w = float((UniformScalar_1.x > 0.0));
    r7.w = ps;
    ps = -ModShadowColor.x;
    r10.xyz = UniformVector_5.xzy * UniformVector_5.www;
    ps = 1.0 + ps;
    r17.xyz = -UniformVector_0.xyz + 1.0;
    r13.x = ps;
    ps = -ModShadowColor.y;
    r8.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r8.y = dot(r4.zxy, r4.zxy);
    r13.y = ps;
    ps = -ModShadowColor.z;
    r8.z = dot(r5.zxy, r5.zxy);
    r1.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 + ps;
    r18.yzw = r11.www * UniformVector_3.xzy;
    r13.z = ps;
    ps = LightMapScale.x * r7.y;
    r6.x = dot(r1.zxy, r1.zxy);
    r12.x = ps;
    r0.xyz = r12.wyz * 2.0 - 1.0;
    ps = LightMapScale.y * r7.z;
    r6.yzw = r11.zzz * UniformVector_2.xzy;
    r12.y = ps;
    ps = rsqrt(abs(r8.z));
    r15.xyz = -r14.xyz + r15.xyz;
    r8.z = ps;
    r14.xyz = r15.xyz * UniformScalar_0.xxx + r14.xyz;
    ps = LightMapScale.z * r7.x;
    r5.xyz = r8.zzz * r5.xyz;
    r12.z = ps;
    r19.yzw = r11.yyy * UniformVector_1.xyz + r6.ywz;
    ps = rsqrt(abs(r8.y));
    r6.y = dot(r0.xyz, r0.xyz);
    r6.z = ps;
    ps = rsqrt(abs(r8.x));
    r4.xyz = r6.zzz * r4.zxy;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r6.zzz * r2.xzy;
    r6.z = ps;
    ps = 0.1 - -r8.y;
    r11.w = max(r4.x, 0.0);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r1.xyz * r6.zzz;
    r6.y = ps;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r1.xyz = r0.xyz * r6.yyy;
    r19.x = ps;
    ps = LocalToWorldMatrix[1].z * r7.y;
    r0.xyz = r12.xzy * r1.xxx;
    r18.x = ps;
    ps = 5.0 * r6.x;
    r6.y = dot(r1.xyz, r4.xyz);
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r15.xyz = r1.yzx * r6.yyy;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r19.xywz + r18;
    r11.y = ps;
    r1.w = r7.z * LocalToWorldMatrix[2].z + r2.x;
    r6.xyw = r15.xyz * 2.0 - r4.yzx;
    r7.xyz = (-abs(r8.www) >= 0.0) ? 1.0 : r2.ywz;
    r7.yzw = (-abs(r7.www) >= 0.0) ? 1.0 : r7.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r2.w = saturate(dot(r8.yxz, r6.wxy));
    r11.z = ps;
    ps = r2.w * r2.w;
    r6 = -r11.wyzx + float4(0.55, 1.0, 1.0, 1.0);
    r2.x = ps;
    ps = r6.x;
    r1.z = dot(r5.zxy, r1.xyz);
    r6.x = ps;
    ps = 2.2222223 * r6.x;
    r15.xyz = r7.ywz * UniformScalar_2.xxx;
    r15.w = saturate(ps);
    ps = UniformScalar_5.x * r7.y;
    r8.xyz = r14.xyz * r7.yzw;
    r1.x = ps;
    ps = UniformScalar_5.x * r7.z;
    r6.w = float((r6.w >= 0.004));
    r1.y = ps;
    r4.xyz = r1.zzw * float3(-0.5, 0.5, 0.5) + 0.5;
    ps = UniformScalar_5.x * r7.w;
    r5.xyz = r7.yzw * UniformScalar_3.xxx;
    r1.z = ps;
    r11.xyz = r5.xyz * r14.xyz + UniformScalar_4.xxx;
    ps = abs(r4.x) * abs(r4.x);
    r1.xyz = r1.xzy * r14.xzy;
    r7.w = ps;
    ps = log2(abs(r4.z));
    r8.xyz = r8.xyz * r17.xyz;
    r16.x = ps;
    ps = abs(r4.y) * abs(r4.y);
    r7.xyz = r16.xyz * float3(0.8, 0.875, 0.875);
    r6.x = ps;
    ps = pow(2.0, r7.x);
    r4.xyz = r8.xzy * r7.www;
    r14.w = ps;
    r2.yz = r7.yz * r6.yz + 0.125;
    ps = r2.x * r2.w;
    r5.xyz = r8.xzy * r6.xxx;
    r8.w = ps;
    ps = r2.y * r2.z;
    r7 = r15 * r14.xzyw;
    r6.x = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r2.xyz = r12.xzy * r8.www;
    r11.xyz = r11.xzy * UniformVector_4.xzy - r7.xyz;
    r7.xyz = r7.www * r11.xyz + r7.xyz;
    r7.xyz = r10.xzy * r9.xyz + r7.xzy;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
    r7.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r8.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
