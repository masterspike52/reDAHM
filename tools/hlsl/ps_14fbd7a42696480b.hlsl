// ps_14fbd7a42696480b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040F00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.x = r1.z + 0.1;
    r5.z = 1.0 / r4.w;
    r10.xyz = r6.xyz * 2.0 - 1.0;
    ps = ScreenPositionScaleBias.x * r5.z;
    r5.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r14.xy = r6.yz * abs(r7.xy);
    r6.y = ps;
    r8.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.y));
    r6.w = dot(r10.zxy, r10.zxy);
    r5.y = ps;
    ps = 5.0 * r5.x;
    r5.yzw = r5.yyy * r3.xyz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r6.z = saturate(dot(r5.wyz, r10.zxy));
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xy = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    r12.xyz = r10.xyz * r5.xxx;
    ps = 1.0 - r6.x;
    r5.x = dot(r12.zxy, r5.wyz);
    r10.x = ps;
    ps = 1.0 - r6.y;
    r3.xyz = r12.xzy * r5.xxx;
    r10.y = ps;
    r7.xyz = r3.xyz * 2.0 - r5.ywz;
    ps = 1.0 - r6.z;
    r5 = xe_cube(r7.xzy);
    r10.z = ps;
    ps = 1.0 / abs(r5.z);
    r6.w = r5.w;
    r6.x = ps;
    r6.yz = r5.yx * r6.xx + 1.5;
    r3.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r6.x = tex2D(Texture2D_9, r0.xy).x;
    r4.yzw = tex2D(Texture2D_1, r0.xy).yzx;
    r11.yzw = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.yzw)).xyz;
    r6.yzw = tex2D(Texture2D_8, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_2, r10.zz).yxz;
    r5.xz = tex2D(ModShadowAccumTexture, r14.xy).xy;
    ps = 0.7 * r6.y;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r4.x = r5.w * r8.x;
    r5.w = ps;
    ps = 0.875 * r5.x;
    r0.w = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = 0.875 * r5.z;
    r14.xyz = r11.yzw * r2.www;
    r11.y = ps;
    ps = 1.0 - r5.y;
    r6.yz = r8.yz * r6.zw;
    r5.x = saturate(ps);
    ps = 2e+01 * r0.y;
    r4.yz = r4.yz * r0.xz;
    r5.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.x = r5.y * r4.w;
    r5.y = ps;
    ps = log2(r5.x);
    r0.yz = r4.yz * 2e+01;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r8.xyz = r5.yyy * r1.xyz;
    r6.w = ps;
    ps = 0.65 * r6.y;
    r5.xyz = r5.www * -SpotDirection.xyz;
    r4.y = ps;
    ps = 0.5 * r6.z;
    r5.y = dot(r5.zxy, r2.zxy);
    r4.z = ps;
    ps = pow(2.0, r6.w);
    r5.xzw = r0.xyz + r15.xyz;
    r6.w = ps;
    ps = 1e+01 * r6.x;
    r1.xyz = r14.xzy * r6.www;
    r4.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xyz = r5.xzw * r13.xyz;
    r6.x = ps;
    ps = r4.w;
    r5.w = saturate(dot(r12.zxy, r8.zxy));
    r6.y = ps;
    r5.xy = r11.xy * r10.xy + 0.125;
    ps = 0.0001;
    r5.x = r5.x * r5.y;
    r6.w = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = max(r6.y, r6.w);
    r6.z = saturate(dot(r8.zxy, r7.yxz));
    r6.y = ps;
    ps = log2(r6.z);
    r6.x = saturate(r6.x * SpotAngles.y);
    r6.z = ps;
    r6.xy = r6.xy * r6.xz;
    ps = pow(2.0, r6.y);
    r2.xyz = r4.xyz + r3.xyz;
    r6.z = ps;
    r6.yzw = r2.xyz * r6.zzz;
    r0.xy = r0.xy * r5.ww + r6.yz;
    r0.z = r0.z * r5.w + r6.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
