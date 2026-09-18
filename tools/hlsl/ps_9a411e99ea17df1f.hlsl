// ps_9a411e99ea17df1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
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
sampler2D Texture2D_4 : register(s3);
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

    r0.z = dot(r3.zxy, r3.zxy);
    r0.w = 1.0 / r4.w;
    r6.zw = r0.ww * ScreenPositionScaleBias.xy;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.xy * abs(r5.xy);
    r0.z = rsqrt(abs(r0.z));
    r5.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r8.xyz = r0.zzz * r3.xyz;
    r2 = xe_cube(r8.xyz);
    r4.z = r2.w;
    r0.z = 1.0 / abs(r2.z);
    r4.xy = r2.yx * r0.zz + 1.5;
    r2.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r3.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r10 = tex2D(Texture2D_4, r0.xy);
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.x = 0.1 - -r1.z;
    r4.zw = r0.yz * 0.875;
    r1.w = saturate(1.0 - r0.w);
    r6.xyz = r5.xyz * 2.0 - 1.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = saturate(5.0 * r0.x);
    r3.w = dot(r1.zxy, r1.zxy);
    r2.w = r10.x + r10.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = r10.w;
    ps = 5.0 * r0.x;
    r0.zw = r9.yz * r10.yz;
    r0.x = ps;
    ps = 1.0 - r0.y;
    r4.x = r2.w * r9.x;
    r2.w = ps;
    ps = 1.8 * r0.z;
    r3.xyz = r5.xyz * r3.xyz;
    r4.y = ps;
    ps = rsqrt(abs(r3.w));
    r0.y = dot(r6.zxy, r6.zxy);
    r3.w = ps;
    ps = rsqrt(abs(r0.y));
    r5.xyz = r3.www * r1.xyz;
    r0.y = ps;
    r1.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    r1.xy = r4.zw * r1.xy + 0.125;
    ps = r0.x;
    r6.xyz = r6.xyz * r0.yyy;
    r0.x = ps;
    ps = 0.0001;
    r1.z = dot(r6.zxy, r8.zxy);
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r9.xyz = r6.xzy * r1.zzz;
    r1.z = ps;
    r8.xyz = r9.xyz * 2.0 - r8.xzy;
    ps = log2(r1.w);
    r0.x = saturate(dot(r5.zxy, r8.yxz));
    r0.y = ps;
    ps = log2(r0.x);
    r2.w = r0.y * LightColorAndFalloffExponent.w;
    r1.w = ps;
    ps = 1.5 * r0.w;
    r1.xw = r1.zx * r1.wy;
    r4.z = ps;
    r0.xyz = r1.www * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r6.zxy, r5.zxy));
    r0.w = ps;
    ps = pow(2.0, r2.w);
    r1.xyz = r4.xyz * r0.www;
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
