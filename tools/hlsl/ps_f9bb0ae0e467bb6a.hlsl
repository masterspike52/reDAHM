// ps_f9bb0ae0e467bb6a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 270 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000438 10041000 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_13 : register(c11); // float
float4 UniformScalar_14 : register(c12); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D ShadowTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r1.xy);
    ps = (-0.5) + r11.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r16.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r6.xy = r1.wz * UniformVector_5.xy;
    r13.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r6.z = r2.z + 0.1;
    r15.xy = r16.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.z = saturate(r6.z * 5.0);
    r7.z = saturate(ps);
    ps = 1.0 / r5.w;
    r6.z = -r6.z + 1.0;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r6.zz * ModShadowGroupColor.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -r7.xzy + 1.0;
    r6.w = ps;
    ps = UniformScalar_1.x * r8.y;
    r6.zw = r6.zw * abs(r9.xy);
    r13.x = ps;
    r7.xy = r13.yz * r15.zz + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r9.x = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r0.y = tex2D(Texture2D_2, r1.xy).x;
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r0.xzw = tex2D(Texture2D_4, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r9.y = float((UniformScalar_14.x >= 1.0));
    r1.x = float((UniformScalar_14.x > 1.0));
    r7.w = dot(r4.zxy, r4.zxy);
    r1.y = float((UniformScalar_13.x >= 1.0));
    r1.z = float((UniformScalar_13.x > 1.0));
    r8.w = dot(r2.zxy, r2.zxy);
    r6.y = dot(r3.zxy, r3.zxy);
    r12.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r12.xyz = r12.xyz * r11.xyz;
    ps = rsqrt(abs(r8.w));
    r6.x = saturate(-r6.y + 1.0);
    r8.w = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    r0.xzw = (-abs(r1.zzz) >= 0.0) ? r0.xzw : 1.0;
    r11.xyz = (-abs(r1.yyy) >= 0.0) ? 1.0 : r0.xzw;
    ps = rsqrt(abs(r7.w));
    r14.xyz = r8.www * r2.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r6.y));
    r0.xzw = r7.www * r4.xyz;
    r6.y = ps;
    ps = log2(r6.x);
    r1.yzw = r6.yyy * -SpotDirection.xyz;
    r6.x = ps;
    ps = UniformVector_2.z * r7.x;
    r6.y = dot(r1.wyz, r3.zxy);
    r16.w = ps;
    r4.zw = r16.wz - 1.0;
    r7.xy = r13.xx * r15.xy + r7.yz;
    r4.xy = r7.xy * UniformVector_2.xy;
    r7.xyz = r4.zxy * r8.yyy;
    ps = 1.0 + r7.x;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r8.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r8.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = -SpotAngles.x - -r6.y;
    r7.w = dot(r7.zxy, r7.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r3.w = saturate(r6.y * SpotAngles.y);
    r6.y = ps;
    ps = -ModShadowColor.x;
    r7.xyz = r7.xyz * r6.yyy;
    ps = 1.0 + ps;
    r6.y = dot(r7.zxy, r0.wxz);
    r2.x = ps;
    ps = -ModShadowColor.y;
    r2.yzw = r7.xyz * r6.yyy;
    r0.xzw = r2.yzw * 2.0 - r0.xzw;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r14.zxy, r0.wxz));
    r2.y = ps;
    ps = log2(r6.y);
    r0.w = r4.w * r8.y;
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r8.w = saturate(dot(r7.zyx, r14.zyx));
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r7.xyz = r6.zwy * float3(0.875, 0.875, 15.0);
    r6.y = ps;
    ps = -ModShadowColor.z;
    r0.xz = r7.xy * r8.xz;
    ps = 1.0 + ps;
    r3.xyz = r0.xzw + float3(0.125, 0.125, 1.0);
    r2.z = ps;
    r6.z = (r13.x > 0.0) ? r3.z : 1.0;
    r0.x = (r13.x >= 0.0) ? r6.z : 1.0;
    ps = UniformScalar_10.x * r6.y;
    r7.xy = r3.xw * r3.yw;
    r7.w = ps;
    r6.yzw = r7.xxx * r2.xyz + ModShadowColor.xyz;
    r12.w = r7.w * r0.x;
    r2 = r12 * r11.xyzx;
    r0 = r2 * r0.xxxy;
    r8.xyz = r0.xyz * r1.yzw;
    r9.z = (r1.x > 0.0) ? 0.0 : r0.w;
    r1.xyz = -r0.xyz + r10.xyz;
    r0.xyz = r1.xyz * UniformScalar_15.xxx + r0.xyz;
    r7.xw = r9.xy * r9.xz;
    r0.xyz = r0.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.xyz = r0.xyz + r7.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r0.xyz = r7.xxx * r5.xyz;
    r6.x = ps;
    ps = pow(2.0, r7.z);
    r0.xyz = r0.xzy * r6.xxx;
    r6.x = ps;
    r7.xzw = r1.xyz * r6.xxx;
    r8.xy = r8.xy * r8.ww + r7.xz;
    r8.z = r8.z * r8.w + r7.w;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
