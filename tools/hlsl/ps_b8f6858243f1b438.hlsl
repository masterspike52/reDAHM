// ps_b8f6858243f1b438.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040E00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
sampler2D Texture2D_6 : register(s4);
sampler2D Texture2D_7 : register(s5);
sampler2D Texture2D_8 : register(s6);
sampler2D Texture2D_9 : register(s7);
samplerCUBE TextureCube_0 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = ps;
    ps = 1.0 / r5.w;
    r6.x = r2.z + 0.1;
    r6.z = ps;
    r9.xyz = r7.yzw * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.zz * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = rsqrt(abs(r6.y));
    r0.zw = r7.xy * abs(r8.xy);
    r6.y = ps;
    r3.xy = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 - r6.x;
    r4.xyz = r6.yyy * r4.xyz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = dot(r9.zxy, r9.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.x));
    r7.x = saturate(dot(r4.zxy, r9.zxy));
    r6.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r13.xyz = r9.xyz * r6.xxx;
    r7.w = ps;
    ps = 1.0 - r7.x;
    r6.x = dot(r13.zxy, r4.zxy);
    r9.x = ps;
    ps = 1.0 - r7.z;
    r6.xyz = r13.xzy * r6.xxx;
    r9.y = ps;
    r4.yzw = r6.xyz * 2.0 - r4.xzy;
    ps = 1.0 - r7.w;
    r6 = xe_cube(r4.ywz);
    r9.z = ps;
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r4.x = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r6.x = tex2D(Texture2D_9, r1.xy).x;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r5.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r6.yw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.xyz = tex2D(Texture2D_2, r9.xx).yxz;
    r7.xyz = tex2D(Texture2D_8, r1.xy).yxz;
    ps = 0.7 * r7.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = 2e+01 * r0.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = ps;
    ps = 0.875 * r6.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r10.x = ps;
    ps = 0.875 * r6.w;
    r6.yz = r5.yz * r0.xz;
    r10.y = ps;
    ps = r1.w;
    r7.yz = r11.yz * r7.xz;
    ps = r5.x * ps;
    r7.x = r0.w * r11.x;
    r11.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.yz = r7.yz * float2(0.65, 0.5);
    r6.w = ps;
    ps = 2e+01 * r6.y;
    r5.xyz = r6.www * r2.xyz;
    r11.y = ps;
    ps = 2e+01 * r6.z;
    r7.yzw = r7.xyz + r14.xyz;
    r11.z = ps;
    ps = 1e+01 * r6.x;
    r6.w = saturate(dot(r13.zxy, r5.zxy));
    r11.w = ps;
    ps = r11.w;
    r0.xyz = r11.xyz + r12.xyz;
    r2.x = ps;
    r6.xy = r10.xy * r9.yz + 0.125;
    ps = 0.0001;
    r6.x = r6.x * r6.y;
    r2.y = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = max(r2.x, r2.y);
    r7.x = saturate(dot(r5.zxy, r4.zyw));
    r4.y = ps;
    ps = log2(r7.x);
    r1.xyz = r0.xyz * r1.xyz;
    r4.z = ps;
    r0.xw = r4.xy * r4.xz;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xxx * r3.xyz;
    r7.x = ps;
    r7.xyz = r7.ywz * r7.xxx;
    r7.y = r1.z * r6.w + r7.y;
    r7.xz = r1.xy * r6.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
