// ps_e9ef6f465408299a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_4, r1.xy);
    r7.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r6.xw = r1.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r6.y = UniformScalar_1.x * UniformVector_2.x;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformVector_2.x * UniformScalar_4.x;
    r0.z = ps;
    ps = 1.0 / r5.w;
    r3.xy = r5.xy * ScreenPositionScaleBias.xy;
    r7.x = ps;
    r3.xy = r3.xy * r7.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = r10.w - 0.5;
    r0.w = ps;
    ps = UniformVector_4.x * r6.y;
    r0.zw = r0.zw * abs(r8.xy);
    r7.x = ps;
    ps = UniformVector_4.x * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r7.z = ps;
    r7 = r7 + r1.xyxy;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r8.z = tex2D(ShadowTexture, r0.xy).x;
    r8.yw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r12 = tex2D(Texture2D_1, r7.xy);
    r9 = tex2D(Texture2D_2, r7.zw);
    r0.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r6.xw).xyz;
    r11.xyz = UniformVector_3.xyz * 2e+01;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r7.z = dot(r4.zxy, r4.zxy);
    ps = r5.w;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r7.x = saturate(ps);
    ps = 5.0 * r6.x;
    r6.z = float((UniformScalar_8.x > 1.0));
    r0.y = saturate(ps);
    r5.xyz = (-abs(r6.zzz) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r10.xyz * UniformScalar_9.xxx;
    r7.w = ps;
    r6.xyz = r0.wxz * 2.0 - 1.0;
    ps = UniformVector_2.x * r6.y;
    r0.xzw = r9.xyz * r9.www;
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r2.xyz = r7.www * r2.xyz;
    r7.z = ps;
    ps = UniformVector_2.y * r6.z;
    r9.xyz = r7.zzz * r4.xyz;
    r7.z = ps;
    r0.xzw = r12.xyz * r12.www + r0.xzw;
    r4.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r5.xyz;
    r1.xyz = r1.xyz * r4.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r6.x;
    r0.xzw = r11.xyz * r0.xzw;
    r7.w = ps;
    r4.xyz = r4.xyz * r10.xyz + r0.xzw;
    ps = r7.w;
    r6.y = dot(r0.wxz, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = 1.0 - r6.x;
    r6.y = r6.y - r0.x;
    r6.z = ps;
    ps = 1.0 - r7.x;
    r0.z = saturate(r6.y + r0.x);
    r1.w = ps;
    ps = r6.z;
    r6.xy = -r7.yz * r0.zz;
    ps = r0.z * ps;
    r0.xw = -r0.yz + 1.0;
    r6.z = ps;
    r5.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r6.xyz = r7.wyz + r6.zxy;
    ps = (-1.0) - -r6.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = r6.wyz * r1.www;
    ps = 1.0 + r6.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r4.xyz * r7.xyz;
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r1.xyz = r1.xyz * r0.www;
    r8.x = ps;
    r6.xyw = r8.xwy * float3(15.0, 0.875, 0.875);
    r8.xy = r6.wy * r5.xy + 0.125;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r7.xy = r7.xy * r6.ww + r6.xy;
    r7.z = r7.z * r6.w + r6.z;
    r6.xw = r8.xz * r8.yz;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r3.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
