// ps_4a952594c90c1700.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040C00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
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
sampler2D Texture2D_6 : register(s4);
sampler2D Texture2D_7 : register(s5);
sampler2D Texture2D_8 : register(s6);
sampler2D Texture2D_9 : register(s7);
samplerCUBE TextureCube_0 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r0.z = r1.z + 0.1;
    r1.w = ps;
    ps = 5.0 * r0.z;
    r0.w = dot(r3.zxy, r3.zxy);
    r4.z = saturate(ps);
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r7.zw = r1.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    r4.yw = r7.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = r7.x;
    r2.xyz = r0.www * r3.xyz;
    ps = abs(r5.x) * ps;
    r0.w = dot(r6.zxy, r6.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r0.w));
    r4.x = saturate(dot(r2.zxy, r6.zxy));
    r0.w = ps;
    ps = r7.y;
    r6.xyz = r6.xyz * r0.www;
    ps = abs(r5.y) * ps;
    r0.w = dot(r6.zxy, r2.zxy);
    r10.y = ps;
    ps = 1.0 - r4.z;
    r3.xyz = r6.xzy * r0.www;
    r1.w = ps;
    r9.xyz = r3.xyz * 2.0 - r2.xzy;
    ps = 1.0 - r4.x;
    r2 = xe_cube(r9.xzy);
    r0.w = ps;
    ps = 1.0 / abs(r2.z);
    r7.z = r2.w;
    r3.x = ps;
    r7.xy = r2.yx * r3.xx + 1.5;
    r2.xyz = tex2D(LightAttenuationTexture, r4.yw).xyz;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r5.z = tex2D(Texture2D_9, r0.xy).x;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.ww).xyz;
    r0.xyw = tex2D(Texture2D_8, r0.xy).yxz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r0.z;
    r3.w = dot(r1.zxy, r1.zxy);
    r2.w = saturate(ps);
    ps = 0.7 * r0.y;
    r4.w = r12.x * 2e+01;
    r0.z = ps;
    ps = r4.w;
    r12.xy = r11.yz * r12.yz;
    ps = r11.x * ps;
    r11.yz = r12.xy * 2e+01;
    r11.x = ps;
    ps = r0.z;
    r0.xy = r10.yz * r0.xw;
    ps = r10.x * ps;
    r0.zw = r0.xy * float2(0.65, 0.5);
    r0.y = ps;
    ps = rsqrt(abs(r3.w));
    r10.xyz = r5.xyz * float3(0.875, 0.875, 1e+01);
    r0.x = ps;
    ps = log2(r2.w);
    r5.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = r10.z;
    r4.xyz = r0.yzw + r4.xyz;
    r0.z = ps;
    ps = 0.0001;
    r3.xyz = r11.xyz + r3.xyz;
    r0.w = ps;
    r1.xy = -r1.ww * ModShadowGroupColor.xy + 1.0;
    r1.yz = r10.xy * r1.xy + 0.125;
    ps = max(r0.z, r0.w);
    r0.y = saturate(dot(r5.zxy, r9.yxz));
    r1.x = ps;
    ps = log2(r0.y);
    r3.xyz = r3.xyz * r8.xyz;
    r1.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xw = r1.xy * r1.wz;
    r0.w = ps;
    r0.xyz = r1.www * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r6.zxy, r5.zxy));
    r1.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r4.xyz * r1.xxx;
    r0.w = ps;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r2.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
