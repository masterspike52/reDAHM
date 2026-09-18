// ps_010cf64fb835562a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10041000 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_21 : register(c7); // float
float4 UniformScalar_22 : register(c8); // float
float4 UniformScalar_23 : register(c9); // float
float4 UniformScalar_24 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_8 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
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

    ps = 1.0 / r4.w;
    r14.yz = UniformVector_2.xz * UniformVector_2.xz;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.z = UniformScalar_22.x - UniformScalar_21.x;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r6.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = UniformScalar_24.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = 0.0001;
    r0.w = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    ps = r1.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r10.yz = r0.xy * 0.875;
    r0.y = ps;
    r7.xyw = r6.xwy * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r16.z = ps;
    ps = 1.0 - r0.z;
    r12.xyz = r12.xyz + r12.xyz;
    r0.x = saturate(ps);
    ps = 4.0 * r4.y;
    r13.xyz = r13.xyz * UniformVector_8.xyz;
    r16.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.y = saturate(r0.y * 5.0);
    r1.w = ps;
    ps = 1.0 - r0.y;
    r15.x = dot(r8.zxy, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r1.www * r1.xyz;
    r0.w = ps;
    ps = log2(r0.x);
    r8.xyz = r0.www * r3.xyz;
    r0.x = ps;
    ps = 4.0 * r4.z;
    r15.yw = r0.yy * ModShadowGroupColor.xy;
    r16.y = ps;
    ps = rsqrt(abs(r0.z));
    r1.xyz = r16.yxz + float3(-2.0, -2.0, -1.0);
    r0.y = ps;
    ps = r1.x;
    r4.yzw = r0.yyy * -SpotDirection.xyz;
    ps = -r7.w + ps;
    r0.yzw = -r15.yxw + 1.0;
    r12.w = ps;
    ps = UniformScalar_23.x * r0.z;
    r15.xy = r1.yz - r7.xy;
    r4.x = ps;
    ps = UniformVector_2.y * r0.z;
    r1.xyz = r15.xzy * UniformScalar_0.xxx;
    r1.w = ps;
    ps = UniformScalar_21.x + r1.y;
    r3.yzw = r13.xyz * r0.zzz;
    r3.x = ps;
    r12.xyz = r3.yzw * r12.xyz - r3.yzw;
    ps = r7.x;
    r5.w = r1.z - 2.0;
    r10.x = r6.w * 2.0 + r5.w;
    r7.xyz = r12.xyz * UniformScalar_0.xxx + r3.yzw;
    r14.x = r12.w * UniformScalar_0.x + r7.w;
    ps = r1.x + ps;
    r3.w = r1.w * r14.x;
    r10.w = ps;
    r13.xy = r10.xw * r0.zz + float2(1.0, 0.0);
    r12.yzw = r10.xyz * r0.zyw + float3(1.0, 0.125, 0.125);
    ps = r14.z;
    r1.w = dot(r4.wyz, r2.zxy);
    ps = r12.y * ps;
    r13.zw = r14.xy * r0.zz;
    r12.x = ps;
    ps = r13.w;
    r2.xyz = r7.xyz * r3.xxx;
    ps = r10.w * ps;
    r3.xyz = r13.yxz * UniformVector_2.xzy;
    r1.x = ps;
    ps = r1.x;
    r4.yz = r12.xz * r12.yw;
    r1.xyz = r4.zzz * r11.xyz + ModShadowColor.xyz;
    ps = r0.z * ps;
    r2.w = r3.w * r3.z;
    r0.y = ps;
    r2.w = r0.y * r10.w + r2.w;
    ps = max(r9.x, r9.y);
    r2 = r2 + r4.xxxy;
    r0.z = ps;
    ps = rsqrt(abs(r2.w));
    r0.y = r1.w - SpotAngles.x;
    r0.w = ps;
    ps = -UniformVector_0.x;
    r3.yzw = r3.xyw * r0.www;
    ps = 1.0 + ps;
    r0.w = dot(r3.zyw, r3.zyw);
    r3.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.y = saturate(r0.y * SpotAngles.y);
    r0.w = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r3.yzw * r0.www;
    ps = 1.0 + ps;
    r0.w = dot(r4.yxz, r8.zxy);
    r3.y = ps;
    ps = -UniformVector_0.z;
    r9.xyz = r4.xzy * r0.www;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r0.w = saturate(dot(r6.zxy, r8.zxy));
    r3.z = ps;
    ps = log2(r0.w);
    r3.xyz = r7.xyz * r3.xyz;
    r0.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.yz = r0.yz * r0.yw;
    r0.x = ps;
    ps = pow(2.0, r0.z);
    r0.w = saturate(dot(r4.yxz, r6.zxy));
    r1.w = ps;
    ps = pow(2.0, r0.x);
    r2.xyz = r2.xyz * r1.www;
    r0.x = ps;
    r2.xy = r3.xy * r0.ww + r2.xy;
    r2.z = r3.z * r0.w + r2.z;
    r2.xyz = r2.xyz * r0.xxx;
    r2.xyz = r2.xyz * r5.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r2.xzy * r0.yyy;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
