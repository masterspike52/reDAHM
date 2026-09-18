// ps_f16d40d6343d221f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r1.xy);
    ps = r1.w + r1.w;
    r10.w = -r1.z + 1.0;
    r6.x = ps;
    ps = UniformScalar_8.x;
    r15.xyz = UniformVector_4.xyz * 2e+01;
    ps = 0.05 * ps;
    r9 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r15.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r13.y = ps;
    ps = rsqrt(abs(r6.z));
    r11.xyz = r11.xyz * r11.www;
    r6.z = ps;
    ps = 0.00022222222 * r6.y;
    r14.xyz = r6.zzz * r4.xyz;
    r11.w = saturate(ps);
    ps = r1.z + r1.z;
    r11 = r15 * r11;
    r6.z = ps;
    r10.xy = r14.xy * r11.ww + r1.wz;
    ps = r13.x;
    r10.z = -r10.y + 1.0;
    ps = abs(r8.x) * ps;
    r12.yzw = r10.wxz * UniformVector_1.yxy;
    r0.z = ps;
    ps = UniformVector_1.x * r1.w;
    r1.w = -r7.w + UniformScalar_4.x;
    r12.x = ps;
    ps = r13.y;
    r4 = r12.wzxy - 0.5;
    ps = abs(r8.y) * ps;
    r23 = float4((r12.wzxy >= 0.5));
    r0.w = ps;
    ps = r10.x + r10.x;
    r4 = r4 - r12.wzxy;
    r6.y = ps;
    r4 = r4.yxzw * r23.yxzw + r12.zwxy;
    ps = r10.y + r10.y;
    r4 = r4 + r4;
    r6.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r10 = tex2D(Texture2D_8, r1.xy);
    r15.y = tex2D(ShadowTexture, r0.xy).x;
    r8 = tex2D(Texture2D_2, r6.xz);
    r16.xyz = tex2D(Texture2D_7, r6.yw).xyz;
    r20.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r21 = tex2D(Texture2D_3, r4.zw);
    r22 = tex2D(Texture2D_3, r4.xy);
    r19.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r18 = tex2D(Texture2D_4, r9.xy);
    r9.xyw = tex2D(Texture2D_0, r6.yw).xyz;
    r0.xyz = tex2D(Texture2D_1, r6.xz).xyz;
    r6.z = float((UniformScalar_3.x >= 1.0));
    ps = 1.0 / r5.w;
    r1.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r4.xzw = r0.xyz * 2.0 - 1.0;
    r13.xyz = r9.xyw * 2.0 - 1.0;
    r17.zw = r18.xy * 2.0 - 1.0;
    r6.xy = r19.yz * 2.0 - 1.0;
    r0.xy = r1.yz * r6.ww + ScreenPositionScaleBias.wz;
    r6.w = r1.w * r6.z + r7.w;
    r6.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    ps = -r6.w;
    r6.z = r6.z - r11.x;
    ps = r7.z + ps;
    r15.z = saturate(r6.z + r11.x);
    r6.z = ps;
    ps = r7.w;
    r0.w = dot(r23.zww, float3(1.0, 1.0, 1.0));
    ps = 15.0 * ps;
    r0.z = dot(r23.yxx, float3(1.0, 1.0, 1.0));
    r1.w = saturate(ps);
    r6.w = (r0.z == 0.0) ? r22.x : r22.y;
    ps = 0.0001 * r5.w;
    r1.y = max(r6.z, UniformScalar_5.x);
    r1.x = saturate(ps);
    r6.z = (r0.w == 0.0) ? r21.x : r21.y;
    ps = r2.z;
    r5 = r0.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r6.z = (r5.y == 0.0) ? r21.z : r6.z;
    r6.w = (r5.w == 0.0) ? r22.z : r6.w;
    r17.x = (r5.x == 0.0) ? r22.w : r6.w;
    r0.z = (r5.z == 0.0) ? r21.w : r6.z;
    ps = 0.1 + ps;
    r1.z = max(r0.z, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_6.x;
    r7.xy = min(r1.zy, float2(0.3, 1.0));
    r6.w = ps;
    ps = 5.0 * r6.z;
    r6.w = saturate(r7.y * r6.w);
    r15.w = saturate(ps);
    ps = 0.5 * r6.x;
    r6.z = -r6.w + 1.0;
    r5.x = ps;
    ps = 3.3333333 * r7.x;
    r19.x = r6.z * r7.w;
    r17.y = ps;
    ps = 0.5 * r6.y;
    r6.zw = -r17.xy + 1.0;
    r5.y = ps;
    ps = r1.w;
    r7.xyz = r20.xyz + r20.xyz;
    r6.z = dot(r1.ww, r6.zz) + r17.x;
    ps = r6.w * ps;
    r6.xy = r19.wx * r18.wz;
    r5.z = ps;
    ps = r6.z;
    r5.xyz = r17.zyw + r5.xzy;
    ps = r17.x + ps;
    r0.w = float((r6.y >= 0.05));
    r7.w = ps;
    ps = (-1.0) - -r6.x;
    r17 = r7 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.w = ps;
    r7.y = r5.w * r5.y + 1.0;
    ps = r17.w;
    r7.xw = -r0.zw + 1.0;
    ps = -r6.x + ps;
    r6.yzw = r17.zxy * UniformVector_3.zxy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.y;
    r9.xyz = r6.xxx * r16.xyz;
    r15.x = ps;
    r6.xz = -r6.zw * r15.zz + r6.zw;
    r6.w = (UniformScalar_4.x > 0.0) ? r7.w : 1.0;
    r0.z = (UniformScalar_4.x >= 0.0) ? r6.w : r7.w;
    r5.xy = r5.xy * r5.yz + r6.xz;
    ps = 2.5 * r7.x;
    r4.y = -r9.z + r8.z;
    r7.z = ps;
    ps = r7.y * r7.x;
    r2.w = dot(r2.zxy, r2.zxy);
    r12.z = ps;
    ps = r15.x * r15.z;
    r4.xzw = r4.wxz - r13.zxy;
    r6.x = ps;
    ps = r15.y * r15.y;
    r6.zw = -r15.zw + 1.0;
    r0.w = ps;
    ps = r7.z * r7.y;
    r5.z = r6.y + r6.x;
    r12.w = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r4 = r4.zwxy * r8.wwww;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r7.xyz = r13.xyz + r4.xyz;
    r1.z = ps;
    ps = r4.z;
    r1 = -r1 + 1.0;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r6.yw = r12.wz * r1.ww;
    r7.w = ps;
    ps = (-0.5) + r6.y;
    r5.xyz = -r7.xyz + r5.xyz;
    r1.w = saturate(ps);
    r7.xyz = r5.xyz * r1.www + r7.xyw;
    r7.w = r9.w * 2.0 + r7.z;
    r7.xyz = r7.wxy * r1.xxx;
    ps = 1.0 + r7.x;
    r13.xy = -r9.xy + r8.xy;
    r7.w = ps;
    r7.xyz = (r1.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r1.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r2.w));
    r6.x = dot(r7.zxy, r7.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.yyy * r2.xyz;
    r6.x = ps;
    r5.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r5.zxy, r14.zxy);
    r7.xyz = r5.xyz * r6.xxx;
    r7.xyz = r7.xyz * 2.0 - r14.xyz;
    r6.x = saturate(dot(r4.zxy, r7.zxy));
    ps = log2(r6.x);
    r7.z = r0.z * r10.w;
    r12.z = ps;
    r2.xyw = r12.xyz * float3(0.875, 0.875, 15.0);
    r7.xy = r2.xy * r1.yz;
    r1.xyz = r7.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = dot(r3.zxy, r3.zxy);
    r12.xyz = r10.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = rsqrt(abs(r6.y));
    r6.x = saturate(-r6.y + 1.0);
    r6.y = ps;
    ps = log2(r6.x);
    r14.xyz = r6.yyy * -SpotDirection.xyz;
    r6.x = ps;
    r6.y = dot(r14.zxy, r3.zxy);
    r9.xy = r13.xy * r8.ww + r9.xy;
    r7.xyz = r0.www * r7.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.xyz = r12.xyz * r6.zzz;
    r0.w = ps;
    ps = r9.z;
    r6.x = float((r6.w >= 0.9));
    ps = r4.w + ps;
    r3.xyz = r3.xyz * r1.www;
    r9.z = ps;
    r6.xzw = r11.xyz * r6.xxx + r10.xyz;
    ps = -SpotAngles.x - -r6.y;
    r10.xyz = r6.xzw - r9.xyz;
    r6.x = ps;
    r6.yzw = r10.xyz * r1.www + r9.xyz;
    ps = SpotAngles.y * r6.x;
    r2.xyz = r6.yzw * r8.xyz;
    r1.w = saturate(ps);
    ps = pow(2.0, r2.w);
    r7.w = saturate(dot(r5.zyx, r4.zyx));
    r6.x = ps;
    ps = pow(2.0, r0.w);
    r6.yzw = r3.xyz * r6.xxx;
    r6.x = ps;
    r6.yz = r2.xy * r7.ww + r6.yz;
    r6.w = r2.z * r7.w + r6.w;
    ps = r1.x * r1.y;
    r7.xyz = r7.xzy * r6.xxx;
    r6.x = ps;
    ps = r1.w * r1.w;
    r7.xyz = r7.xzy * r6.yzw;
    r6.w = ps;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r6.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
