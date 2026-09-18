// ps_c23f1bbad45ec2ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.xy * UniformScalar_0.xx;
    r9.y = ps;
    ps = r8.w;
    r7.zw = r0.xy * UniformScalar_7.xx;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = UniformScalar_6.x - UniformScalar_5.x;
    r9.x = ps;
    ps = (-0.5) + r0.z;
    r6.xy = r9.xy * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r9.x = tex2D(Texture2D_4, r7.zw).x;
    r9.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.xyz = tex2D(Texture2D_0, r7.xy).xyw;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = r1.y;
    r1.z = -UniformScalar_5.x + 1.0;
    r2.w = saturate(ps);
    ps = r2.z;
    r0.zw = r1.xy * UniformVector_4.xy;
    ps = 0.1 + ps;
    r1.x = dot(r2.zxy, r2.zxy);
    r1.y = ps;
    r7.z = r6.z * 2.0 - 1.0;
    r11.xy = r12.xy * 2.0 - 1.0;
    r7.xy = r6.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r6.w = saturate(r1.y * 5.0);
    r1.y = ps;
    ps = 1.0 / r1.w;
    r1.z = r1.z - r2.w;
    r1.x = ps;
    ps = r1.z;
    r6.x = dot(r4.zxy, r4.zxy);
    ps = r1.x * ps;
    r10.xyz = r1.yyy * r2.xyz;
    r6.z = saturate(ps);
    ps = r5.w;
    r1.xw = -r6.wz + 1.0;
    ps = 0.0001 * ps;
    r2.yz = r1.xx * ModShadowGroupColor.xy;
    r2.x = saturate(ps);
    r1.xyz = -r2.yxz + 1.0;
    ps = UniformScalar_1.x * r1.y;
    r4.w = ps;
    r7.xy = r4.ww * r11.xy + r7.xy;
    r7.xyz = r7.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r6.x));
    r2.w = dot(r7.zxy, r7.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r2.xxx * r4.xyz;
    r2.w = ps;
    r11.xyz = r7.xyz * r2.www;
    r2.w = dot(r11.zxy, r2.zxy);
    r4.xyz = r11.xzy * r2.www;
    r2.xyz = r4.xyz * 2.0 - r2.xzy;
    r2.x = saturate(dot(r10.zxy, r2.yxz));
    ps = log2(r2.x);
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r9.y = ps;
    r2.xyw = r9.zwy * float3(0.875, 0.875, 15.0);
    r9.yz = r2.xy * r1.xz;
    r9.xyz = r9.xyz + float3(0.5, 0.125, 0.125);
    r12.w = r1.w * r9.x;
    ps = 1.0 / r5.w;
    r7.xy = r12.zw + float2(-1.0, -0.5);
    r1.w = ps;
    r4.xy = r7.zw * r1.ww + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_5, r0.zw).xyz;
    ps = UniformVector_3.x * UniformVector_3.w;
    r1.w = float((UniformScalar_10.x >= 1.0));
    r6.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = 1.0 - r0.x;
    r3.x = float((UniformScalar_10.x > 1.0));
    r0.x = saturate(ps);
    r0.yzw = (-abs(r3.xxx) >= 0.0) ? r0.yzw : 1.0;
    r4.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r0.yzw;
    ps = log2(r0.x);
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r3.yzw = r6.zzz * r8.xyz;
    r6.z = ps;
    r8.xyz = r12.xyz * r8.xyz - r3.yzw;
    ps = -UniformVector_0.x;
    r1.w = saturate(dot(r11.zxy, r10.zxy));
    ps = 1.0 + ps;
    r5.w = r9.y * r9.z;
    r3.x = ps;
    r0.yzw = r5.www * r0.yzw + ModShadowColor.xyz;
    ps = -UniformVector_0.y;
    r5.w = saturate(r7.y * 5.0000005);
    r3.yzw = r5.www * r8.xyz + r3.yzw;
    r1.x = r7.x * r1.y + 1.0;
    r1.x = (r4.w > 0.0) ? r1.x : 1.0;
    ps = 1.0 + ps;
    r6.xyz = r6.xyz * r3.yzw;
    r3.y = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r6.xyz * r4.xyz;
    r1.x = (r4.w >= 0.0) ? r1.x : 1.0;
    ps = 1.0 + ps;
    r4.xyz = r4.xyz * r1.xxx;
    r3.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r3.xyz = r4.xyz * r3.xyz;
    r0.x = ps;
    ps = pow(2.0, r2.w);
    r5.xyz = -r4.xyz + r5.xyz;
    r1.x = ps;
    r4.xyz = r5.xyz * UniformScalar_11.xxx + r4.xyz;
    r4.xyz = r4.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = pow(2.0, r0.x);
    r1.xyz = r4.xyz * r1.xxx;
    r0.x = ps;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.xxx;
    r1.xyz = r1.xyz * r2.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.yzw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
