// ps_13d217417ace936d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 10040900 00000606 00000000 000050C6 003F003F 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.yzw = -UniformVector_0.xyz + 1.0;
    r0.z = 1.0 / r5.w;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r1.y = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zw * r5.xy + ScreenPositionScaleBias.wz;
    r1.w = dot(r2.zxy, r2.zxy);
    r1.x = 1.0 / ModShadowAccumResolution.x;
    r1.xy = r1.xy * abs(r6.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r5 = tex2D(Texture2D_1, r0.xy);
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.yzw = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r3.x = dot(r4.zxy, r4.zxy);
    r9.xyz = r6.xyz * 2.0 - 1.0;
    r6.xyz = r3.yzw * r5.xyz;
    r1.w = rsqrt(abs(r1.w));
    ps = 0.1 - -r2.z;
    r2.xyz = r1.www * r2.xyz;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r1.w = dot(r9.zxy, r9.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r3.x));
    r2.w = -r0.x + 1.0;
    r0.x = ps;
    r3.zw = -r2.ww * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r1.w));
    r8.xyz = r0.xxx * r4.xyz;
    r0.x = ps;
    r4.xyz = r9.xyz * r0.xxx;
    r0.x = dot(r4.zxy, r8.zxy);
    r9.xyz = r4.xzy * r0.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xzy;
    ps = LightColor.x * r0.y;
    r1.w = saturate(dot(r2.zxy, r8.yxz));
    r3.x = ps;
    ps = log2(r1.w);
    r0.x = saturate(dot(r4.zxy, r2.zxy));
    r7.x = ps;
    ps = LightColor.y * r0.z;
    r4.xyz = r7.xyz * float3(15.0, 0.875, 0.875);
    r3.y = ps;
    ps = pow(2.0, r4.x);
    r2.xyw = r6.xyz * r0.xxx;
    r0.x = ps;
    r3.zw = r4.yz * r3.zw + 0.125;
    ps = r3.z * r3.w;
    r2.z = r0.x * r5.w;
    r0.x = ps;
    r1.xyz = r0.xxx * r1.xyz + ModShadowColor.xyz;
    ps = LightColor.z * r0.w;
    r2.xyz = r2.xyz + r2.zzw;
    r3.z = ps;
    r0.xyz = r3.xyz * r2.xyz;
    r0.xyz = r0.xyz * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
