// ps_805aae4cdf960bc0.bin
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

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
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

    ps = 1.0 / r4.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r0.zw = r0.zw * abs(r5.xy);
    r1.w = ps;
    r5.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    r10.xyz = r1.www * r3.xyz;
    r3 = xe_cube(r10.xyz);
    ps = 1.0 / abs(r3.z);
    r4.z = r3.w;
    r1.w = ps;
    r4.xy = r3.yx * r1.ww + 1.5;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r0.xzw = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.xyz = r9.xyz * r0.xzw;
    ps = r1.z;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r9.xyz = r4.xyz * 3e+01;
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = dot(r5.zxy, r5.zxy);
    r0.w = ps;
    ps = 5.0 * r0.x;
    r4.xyz = r0.www * r1.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r0.x = -r0.x + 1.0;
    r0.z = ps;
    r0.xw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r5.xyz = r0.zzz * r5.xyz;
    r0.z = dot(r5.zxy, r10.zxy);
    r1.xyz = r5.xzy * r0.zzz;
    r1.xyz = r1.xyz * 2.0 - r10.xzy;
    ps = 1.0 - r0.y;
    r0.z = saturate(dot(r4.zxy, r1.yxz));
    r0.y = saturate(ps);
    ps = log2(r0.z);
    r1.xyz = r9.xyz * r8.xyz;
    r7.z = ps;
    ps = log2(r0.y);
    r7.xyz = r7.xyz * float3(0.875, 0.875, 15.0);
    r0.y = ps;
    ps = pow(2.0, r7.z);
    r0.y = r0.y * LightColorAndFalloffExponent.w;
    r0.z = ps;
    r0.xw = r7.xy * r0.xw + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r5.zxy, r4.zxy));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r3.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
