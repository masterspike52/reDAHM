// ps_6c5c6946c0cfd070.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040D00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_19 : register(c10); // float
float4 UniformScalar_20 : register(c11); // float
float4 UniformScalar_21 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_7 : register(c6); // float4
float4 UniformVector_8 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r1.xy);
    ps = (-0.5) + r11.w;
    r7.x = UniformVector_2.z * (-1.0);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r9.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r6.xy = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r1.wz * UniformVector_8.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.yz = r5.xy * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r1.xyz = r9.zxy * 2.0 - 1.0;
    ps = 1.0 / r5.w;
    r9.xy = r0.zw * abs(r8.xy);
    r1.w = ps;
    r7.xyw = r7.yzx * r1.wwx;
    r0.zw = r7.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.z = tex2D(ShadowTexture, r0.xy).x;
    r0.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r13.xyz = tex2D(Texture2D_4, r6.zw).xyz;
    r12.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    ps = r5.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = saturate(ps);
    ps = r2.z;
    r4.w = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r5.w = float((UniformScalar_19.x >= 1.0));
    r6.z = ps;
    ps = UniformVector_7.x * UniformVector_7.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r2.w = float((UniformScalar_19.x > 1.0));
    r5.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    r6.xw = r12.xy * 2.0 - 1.0;
    r3.xyz = (-abs(r2.www) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r6.z = saturate(r6.z * 5.0);
    r0.w = ps;
    ps = UniformVector_2.z * r1.x;
    r5.xyz = r5.xyz * r11.xyz;
    r2.w = ps;
    r3.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r3.xyz;
    ps = rsqrt(abs(r4.w));
    r6.z = -r6.z + 1.0;
    r3.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r11.xyz = r3.www * r4.zxy;
    r7.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.xyz = r5.xyz * r3.xyz;
    r7.y = ps;
    r12.w = (r11.x >= 0.0) ? r2.w : r7.w;
    r7.yzw = -r7.zxy + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r4.xy = r12.zw - 1.0;
    r7.x = ps;
    r4.zw = r4.yx * r7.yy + 1.0;
    r6.xz = r7.xx * r6.xw + r1.yz;
    ps = 1.0 - r6.y;
    r6.xz = r6.xz * UniformVector_2.xy;
    r6.y = saturate(ps);
    ps = r0.w;
    r4.xy = r6.xz * r7.yy;
    r1 = (r7.xyyy > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r5 = (r7.xyyy >= 0.0) ? r1 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r2.x * ps;
    r6.x = dot(r5.wyz, r5.wyz);
    r4.x = ps;
    ps = log2(r6.y);
    r1.xyz = r3.xyz * r5.xxx;
    r6.y = ps;
    r3.xyz = r1.xyz * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r6.x));
    r6.w = r6.y * LightColorAndFalloffExponent.w;
    r6.x = ps;
    ps = r0.w;
    r6.xyz = r5.yzw * r6.xxx;
    ps = r2.y * ps;
    r5.xyz = r6.xyz * TwoSidedSign.xxx;
    r4.y = ps;
    ps = r0.w;
    r6.x = dot(r5.zxy, r11.xyz);
    ps = r2.z * ps;
    r6.xyz = r5.xzy * r6.xxx;
    r4.z = ps;
    r6.xyz = r6.xyz * 2.0 - r11.yxz;
    r6.x = saturate(dot(r4.zxy, r6.yxz));
    ps = log2(r6.x);
    r1.xyz = r1.xyz * r10.xyz;
    r0.w = ps;
    r6.xyz = r0.xyw * float3(0.875, 0.875, 15.0);
    r0.xy = r6.xy * r7.zw + 0.125;
    ps = pow(2.0, r6.z);
    r7.z = saturate(dot(r5.zxy, r4.zxy));
    r6.x = ps;
    r6.xyz = r3.xyz * r6.xxx;
    r7.xy = r1.xy * r7.zz + r6.xy;
    r7.z = r1.z * r7.z + r6.z;
    r0.xy = r0.xz * r0.yz;
    r6.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r0.xyz = r0.yyy * r8.xyz;
    r6.w = ps;
    r0.xyz = r0.xzy * r6.www;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
