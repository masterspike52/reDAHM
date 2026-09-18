// ps_196e89951342b10b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 360 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005A0 10041300 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 LightMapScale : register(c28); // float3
float4 LowerSkyColor : register(c26); // float3
float4 ModShadowAccumResolution : register(c31); // float2
float4 ModShadowColor : register(c29); // float3
float4 ModShadowGroupColor : register(c30); // float3
float4 OpacityOverride : register(c24); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_17 : register(c17); // float
float4 UniformScalar_19 : register(c18); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_20 : register(c19); // float
float4 UniformScalar_21 : register(c20); // float
float4 UniformScalar_22 : register(c21); // float
float4 UniformScalar_23 : register(c22); // float
float4 UniformScalar_24 : register(c23); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UpperSkyColor : register(c25); // float3
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r6.xyw = tex2D(Texture2D_1, r1.xy).xyz;
    r1.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r17.xyz = UniformVector_3.xyz - UniformVector_4.xyz;
    r14.xyz = UniformVector_7.xyz - UniformVector_6.xyz;
    ps = UniformVector_2.x * UniformVector_2.x;
    r9.xyz = UniformVector_4.xyz - UniformVector_5.xyz;
    r0.z = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r7.z = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = UniformScalar_22.x;
    r11.yzw = r1.yzw * UniformVector_8.xyz;
    ps = -UniformScalar_21.x + ps;
    r15.xyz = r1.yzw * UniformScalar_17.xxx;
    r10.w = ps;
    ps = r6.w + r6.w;
    r6.z = dot(r1.zwy, float3(0.59, 0.11, 0.3));
    r1.x = ps;
    ps = 4.0 * r6.x;
    r1.y = dot(r1.zyw, float3(0.59, 0.3, 0.11));
    r16.z = ps;
    ps = 4.0 * r6.y;
    r10.xyz = r10.xyz + r10.xyz;
    r16.w = ps;
    r12.xyz = r10.xyz * 0.7 + 0.3;
    ps = rsqrt(abs(r7.z));
    r6.x = UniformScalar_19.x + r1.y;
    r6.y = ps;
    ps = 5.0 * r6.z;
    r6.w = dot(r13.zxy, float3(1.0, 1.0, 1.0));
    r16.x = ps;
    ps = 1.0 * r6.z;
    r1.yzw = r6.yyy * r2.xyz;
    r16.y = ps;
    ps = frac(r6.x);
    r16.xy = r16.yx * UniformScalar_15.xx;
    r9.w = ps;
    r2.xyz = r16.yyy * r9.xyz + UniformVector_5.xyz;
    ps = r1.w;
    r9.xyz = r7.xyw + r7.xyw;
    r6.x = ps;
    ps = 0.1 + r6.x;
    r6.z = float((r16.x >= 0.2));
    r6.x = ps;
    ps = (-1.0) + r1.x;
    r2.w = float((r16.x > 0.2));
    r6.y = ps;
    ps = 5.0 * r6.x;
    r7.xyz = r16.xzw + float3(-0.2, -2.0, -2.0);
    r6.x = saturate(ps);
    ps = 1.25 * r7.x;
    r9 = r9 + float4(-1.0, -1.0, -1.0, -0.5);
    r11.x = ps;
    ps = abs(r9.w) + abs(r9.w);
    r19.w = r6.y - r9.z;
    r6.y = ps;
    ps = r7.y;
    r18.xy = -r9.xy - 2.0;
    ps = -r9.x + ps;
    r16.xy = r18.xy + r16.zw;
    r16.z = ps;
    r14.xyz = r14.xyz * r6.yyy + UniformVector_6.xyz;
    r17.xyz = r11.xxx * r17.xyz + UniformVector_4.xyz;
    r17.xyz = (r2.www > 0.0) ? r17.xyz : UniformVector_4.xyz;
    ps = r7.z;
    r14.xyz = r14.xyz * UniformScalar_20.xxx;
    ps = -r9.y + ps;
    r14.xyz = r14.xzy * r13.zzz;
    r16.w = ps;
    r2.xyz = (r6.zzz > 0.0) ? r17.xyz : r2.xyz;
    r9 = r16 * UniformScalar_0.xxxx + r9.xyxy;
    ps = 1.0 - r6.w;
    r2.xyz = r2.xyz * UniformScalar_16.xxx;
    r7.y = ps;
    ps = 1.0 - r6.x;
    r14.xyz = r14.xyz * r13.zzz;
    r7.z = ps;
    r6.xyz = r15.xyz * r13.yyy + r14.xzy;
    r18.xyz = r2.xzy * r13.xxx + r6.xzy;
    r19.xyz = r12.xzy * r18.xyz - r18.xyz;
    r6.x = r19.w * UniformScalar_0.x - 2.0;
    r11.x = r7.w * 2.0 + r6.x;
    ps = r9.z;
    r6 = r11 * r7.yyyy;
    ps = r7.y * ps;
    r7.w = r6.x + 1.0;
    r7.x = ps;
    r10.xyz = r6.yzw * r10.xyz - r6.yzw;
    r16.xyz = r10.xyz * UniformScalar_0.xxx + r6.yzw;
    r2.x = r10.w * UniformScalar_0.x + UniformScalar_21.x;
    ps = UniformScalar_23.x * r7.y;
    r6 = r7.xywy * UniformVector_2.xxzy;
    r2.z = ps;
    ps = r6.z * r6.z;
    r10.xy = r0.zw * r7.yw;
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = r10.x * r9.z;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xyw = r6.yww * r9.xyw;
    r0.w = ps;
    ps = r15.w * r15.w;
    r9.yzw = r16.xyz * r2.xxx;
    r2.w = ps;
    r2.x = dot(r10.yz, r7.wx) + r2.w;
    r9.x = r10.z * r7.x + r2.w;
    ps = rsqrt(abs(r2.x));
    r9 = r9.xywz + r2.yzzz;
    r10.z = ps;
    ps = rsqrt(abs(r9.x));
    r6.y = dot(r4.zxy, r4.zxy);
    r10.w = ps;
    ps = r15.w;
    r0.zw = r0.zw * abs(r8.xy);
    ps = r10.w * ps;
    r17.xyz = r6.zxz * r10.zww;
    r17.w = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r17.zyw, r17.zyw);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r12.yzw = r6.yyy * r4.xyz;
    r6.x = ps;
    r2.xyz = r17.ywz * r6.xxx;
    r6.x = dot(r2.zxy, r12.wyz);
    r6.xyz = r2.xzy * r6.xxx;
    r14.xyz = r6.xzy * 2.0 - r12.yzw;
    r6 = xe_cube(r14.xyz);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r2.w = ps;
    r8.xy = r6.yx * r2.ww + 1.5;
    r4.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = OpacityOverride.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r15.w = saturate(ps);
    ps = UniformScalar_24.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r4.z = ps;
    ps = 0.0001;
    r0.w = dot(r5.zxy, r5.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r0.w));
    r6.w = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    ps = max(r4.z, r4.w);
    r5.xyz = r0.www * r5.xyz;
    r12.x = ps;
    ps = LightMapScale.x * r6.y;
    r13.xyz = r6.www - r8.xyz;
    r10.x = ps;
    r13.xyz = r13.xyz * 0.8 + r8.xyz;
    r8.xyz = r19.xyz * UniformScalar_0.xxx + r18.xyz;
    ps = LightMapScale.y * r6.z;
    r0.xyz = r16.xyz * r0.xyz;
    r10.y = ps;
    ps = LightMapScale.z * r6.x;
    r16.xy = r15.xy * r10.zz;
    r10.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r16.z = r17.x;
    r15.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.x = dot(r16.xyz, r12.yzw);
    r15.y = ps;
    ps = r10.x;
    r15.z = max(r6.x, 0.0);
    ps = r2.z * ps;
    r4.z = dot(r5.zxy, r2.zxy);
    r2.x = ps;
    ps = r10.z;
    r6 = -r15.xzyw + 1.0;
    ps = r2.z * ps;
    r6.w = float((r6.w >= 0.004));
    r2.y = ps;
    ps = log2(abs(r6.y));
    r4 = r4.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.y = ps;
    r12.yz = r4.xy * r6.xz + 0.125;
    ps = UniformScalar_2.x * r6.y;
    r4.xy = r4.zw + 0.5;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r4.xw = abs(r4.xy) * abs(r4.xy);
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r6.z = saturate(dot(r1.wyz, r14.zxy));
    r6.x = ps;
    ps = log2(r6.z);
    r4.xyz = r0.xzy * r4.xxx;
    r12.w = ps;
    ps = r12.x * r12.w;
    r5.xyz = r0.xzy * r4.www;
    r0.w = ps;
    ps = r12.y * r12.z;
    r1.xyz = r6.xxx * r13.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r7.xyz = r1.xzy * r7.yyy;
    r7.w = ps;
    ps = r10.y;
    r1.xyz = r10.xzy * r7.www;
    r7.xyz = r7.xyz * UniformScalar_4.xxx + r8.xyz;
    ps = r2.z * ps;
    r7.xyz = r7.xzy + UniformVector_0.xyz;
    r2.z = ps;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r9.yzw + r7.xzy;
    r7.xyz = r2.xzy * r0.xyz + r7.xzy;
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
