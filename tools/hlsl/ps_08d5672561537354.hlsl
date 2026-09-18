// ps_08d5672561537354.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.x = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.yz = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r2.x));
    r0.zw = r0.zw * abs(r5.xy);
    r2.x = ps;
    r8.xy = r2.yz * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = r2.xxx * r3.xyz;
    r2 = xe_cube(r7.xyz);
    ps = 1.0 / abs(r2.z);
    r3.z = r2.w;
    r3.x = ps;
    r3.xy = r2.yx * r3.xx + 1.5;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r2.xyz = tex2D(LightAttenuationTexture, r8.xy).zxy;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r4.xyz = r8.xyz * r4.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r1.w));
    r0.z = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = 5.0 * r0.w;
    r1.yzw = r1.www * r1.xyz;
    r0.w = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r0.w = -r0.w + 1.0;
    r0.z = ps;
    r8.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r0.x;
    r3.yzw = r0.zzz * r3.xyz;
    r8.z = ps;
    ps = 0.875 * r0.y;
    r0.z = dot(r3.wyz, r7.zxy);
    r8.w = ps;
    r0.xy = r8.zw * r8.xy + 0.125;
    ps = r0.x * r0.y;
    r8.xyz = r3.ywz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xyz * 2.0 - r7.xzy;
    ps = LightColor.x * r2.y;
    r1.x = saturate(dot(r1.wyz, r7.yxz));
    r3.x = ps;
    ps = log2(r1.x);
    r0.w = saturate(dot(r3.wyz, r1.wyz));
    r6.x = ps;
    ps = LightColor.z * r2.x;
    r1 = r6 * float4(15.0, 3e+01, 3e+01, 3e+01);
    r3.y = ps;
    ps = pow(2.0, r1.x);
    r1.yzw = r1.yzw * r5.xyz;
    r1.x = ps;
    ps = LightColor.y * r2.z;
    r1.xyz = r1.yzw * r1.xxx;
    r3.z = ps;
    r1.xy = r4.xy * r0.ww + r1.xy;
    r1.z = r4.z * r0.w + r1.z;
    r1.xyz = r3.xzy * r1.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
