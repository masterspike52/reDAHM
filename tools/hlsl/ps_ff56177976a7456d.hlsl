// ps_ff56177976a7456d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = ps;
    ps = 1.0 / r4.w;
    r6.xy = UniformVector_1.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.y = tex2D(Texture2D_2, r0.xy).x;
    ps = r1.z;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.w = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = 1.0 - r0.y;
    r1.w = dot(r2.zxy, r2.zxy);
    r10.w = ps;
    r9.xyz = r7.xyw * r6.xyz - r7.xyw;
    ps = rsqrt(abs(r0.w));
    r4.z = saturate(-r1.w + 1.0);
    r3.w = ps;
    ps = rsqrt(abs(r0.z));
    r1.w = saturate(r3.w * r1.z);
    r0.z = ps;
    ps = 0.875 * r4.x;
    r7.z = max(UniformScalar_8.x, 0.0001);
    r8.x = ps;
    ps = 0.875 * r4.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r8.y = ps;
    ps = 5.0 * r0.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r10.xyz = r10.xyz * r0.yyy;
    r2.w = ps;
    r9.xyz = r9.xyz * UniformScalar_0.xxx + r7.xyw;
    ps = log2(r4.z);
    r0.yzw = r0.zzz * r3.zxy;
    r0.x = ps;
    r3.xyz = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = -r0.z;
    r1.xyz = r3.www * r1.zxy;
    r0.z = ps;
    r0.y = r0.y * 2.0 - r0.y;
    r7.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r0.w;
    r4 = r10 * r9.xyzz;
    r0.w = ps;
    r4.xy = r10.ww * r9.xy + r4.xy;
    r7.xy = r8.xy * r7.xy + 0.125;
    r0.y = saturate(dot(r1.yzx, r0.zwy));
    ps = log2(r0.y);
    r4.z = r4.z + r4.w;
    r7.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xy = r7.xz * r7.yw;
    r0.w = ps;
    r0.xyz = r1.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.y);
    r2.xyz = r4.xyz * r2.xyz;
    r1.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r3.xyz * r1.xxx;
    r0.w = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r5.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
