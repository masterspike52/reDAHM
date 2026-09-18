// ps_3d795b58f9518f40.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.x = r1.z + 0.1;
    r5.z = 1.0 / r4.w;
    r5.y = dot(r3.zxy, r3.zxy);
    r9.xyz = r6.xyz * 2.0 - 1.0;
    r6.xy = r5.zz * ScreenPositionScaleBias.xy;
    r5.w = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r0.z = dot(r2.zxy, r2.zxy);
    r5.z = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r5.zw * abs(r7.xy);
    r6.w = dot(r9.zxy, r9.zxy);
    r5.y = rsqrt(abs(r5.y));
    ps = 5.0 * r5.x;
    r5.yzw = r5.yyy * r3.xyz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r6.z = saturate(dot(r5.wyz, r9.zxy));
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xy = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    r4.xyz = r9.xyz * r5.xxx;
    ps = 1.0 - r6.x;
    r5.x = dot(r4.zxy, r5.wyz);
    r10.x = ps;
    ps = 1.0 - r6.y;
    r3.xyz = r4.xzy * r5.xxx;
    r10.y = ps;
    r9.xyz = r3.xyz * 2.0 - r5.ywz;
    ps = 1.0 - r6.z;
    r5 = xe_cube(r9.xzy);
    r10.z = ps;
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r11.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r3.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r3.z = tex2D(Texture2D_9, r0.xy).x;
    r13.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_2, r10.zz).yzx;
    r6.xyz = tex2D(Texture2D_8, r0.xy).yxz;
    r0.xyw = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 1.0 - r0.z;
    r0.xyw = r0.xyw * r2.www;
    r0.z = saturate(ps);
    ps = 2e+01 * r5.w;
    r5.xy = r14.yz * r5.xy;
    r5.w = ps;
    ps = 0.7 * r6.y;
    r2.y = r5.w * r14.x;
    r5.w = ps;
    ps = 2e+01 * r5.x;
    r6.yz = r13.yz * r6.xz;
    r2.z = ps;
    ps = 2e+01 * r5.y;
    r6.x = r5.w * r13.x;
    r2.w = ps;
    ps = rsqrt(abs(r5.z));
    r6.yz = r6.yz * float2(0.65, 0.5);
    r6.w = ps;
    ps = log2(r0.z);
    r5.yzw = r3.xyz * float3(0.875, 0.875, 1e+01);
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.xyz = r6.www * r1.xyz;
    r5.x = ps;
    ps = r5.w;
    r6.yzw = r6.xyz + r12.xyz;
    r2.x = ps;
    ps = pow(2.0, r5.x);
    r1.xyz = r2.yzw + r11.xyz;
    r5.x = ps;
    ps = 0.0001;
    r0.xyz = r0.xwy * r5.xxx;
    r2.y = ps;
    r5.xy = r5.yz * r10.xy + 0.125;
    ps = max(r2.x, r2.y);
    r5.w = saturate(dot(r3.zxy, r9.yxz));
    r5.z = ps;
    ps = log2(r5.w);
    r1.xyz = r1.xyz * r8.xyz;
    r5.w = ps;
    r2.xy = r5.xz * r5.yw;
    r5.xyz = r2.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.y);
    r5.w = saturate(dot(r4.zxy, r3.zxy));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
