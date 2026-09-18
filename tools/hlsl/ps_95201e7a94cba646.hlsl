// ps_95201e7a94cba646.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
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

    r6.xzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r5.x = r1.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = saturate(ps);
    r10.yzw = r6.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r9.y = ps;
    r4.xy = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    ps = r9.x;
    r5.xyz = r5.xxx * r3.xyz;
    ps = abs(r7.x) * ps;
    r5.w = dot(r10.wyz, r10.wyz);
    r10.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.x = saturate(dot(r5.zxy, r10.wyz));
    r5.w = ps;
    ps = r9.y;
    r11.xyz = r10.yzw * r5.www;
    ps = abs(r7.y) * ps;
    r5.w = dot(r11.zxy, r5.zxy);
    r10.y = ps;
    ps = 1.0 - r6.x;
    r3.xyz = r11.xzy * r5.www;
    r6.w = ps;
    r9.xyz = r3.xyz * 2.0 - r5.xzy;
    ps = 1.0 - r6.y;
    r5 = xe_cube(r9.xzy);
    r1.w = ps;
    ps = 1.0 / abs(r5.z);
    r12.z = r5.w;
    r6.x = ps;
    r12.xy = r5.yx * r6.xx + 1.5;
    r3.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r5.y = tex2D(Texture2D_9, r0.xy).x;
    r7.xyw = tex2D(Texture2D_1, r0.xy).yzx;
    r6.xyw = tex2D(Texture2D_2, r6.ww).yxz;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r12.xyz)).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).yxz;
    r5.xz = tex2D(ModShadowAccumTexture, r10.xy).yx;
    ps = 1.0 - r6.z;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = saturate(ps);
    ps = 0.875 * r5.z;
    r3.w = dot(r1.zxy, r1.zxy);
    r10.x = ps;
    ps = 0.875 * r5.x;
    r5.zw = r14.yz * r0.xz;
    r10.y = ps;
    ps = 0.7 * r0.y;
    r7.yz = r7.xy * r6.xw;
    r5.x = ps;
    ps = 2e+01 * r6.y;
    r7.x = r5.x * r14.x;
    r5.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.x = r5.x * r7.w;
    r6.z = ps;
    ps = rsqrt(abs(r3.w));
    r6.yw = r7.yz * 2e+01;
    r5.x = ps;
    ps = log2(r0.w);
    r1.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = 1e+01 * r5.y;
    r0.xyz = r6.zzz * -SpotDirection.xyz;
    r7.w = ps;
    ps = 0.65 * r5.z;
    r5.y = dot(r0.zxy, r2.zxy);
    r7.y = ps;
    ps = 0.5 * r5.w;
    r6.xyz = r6.xyw + r13.xyz;
    r7.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xyw = r6.xyz * r12.xyz;
    r6.x = ps;
    ps = r7.w;
    r0.z = saturate(dot(r11.zxy, r1.zxy));
    r5.z = ps;
    r5.yw = -r1.ww * ModShadowGroupColor.xy + 1.0;
    r6.yw = r10.xy * r5.yw + 0.125;
    ps = 0.0001;
    r6.z = saturate(dot(r1.zxy, r9.yxz));
    r5.w = ps;
    ps = max(r5.z, r5.w);
    r5.y = r6.y * r6.w;
    r6.y = ps;
    r5.yzw = r5.yyy * r8.xyz + ModShadowColor.xyz;
    ps = log2(r6.z);
    r6.x = saturate(r6.x * SpotAngles.y);
    r6.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xy = r6.xy * r6.xz;
    r5.x = ps;
    ps = pow(2.0, r6.y);
    r1.xyz = r7.xyz + r4.xyz;
    r6.z = ps;
    ps = pow(2.0, r5.x);
    r6.yzw = r1.xyz * r6.zzz;
    r5.x = ps;
    r0.xy = r0.xy * r0.zz + r6.yz;
    r0.z = r0.w * r0.z + r6.w;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r3.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r5.xyz = r6.xzy * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
