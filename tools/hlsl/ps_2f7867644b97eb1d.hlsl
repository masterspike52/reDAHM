// ps_2f7867644b97eb1d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.zz * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.x));
    r6.zw = r5.yz * abs(r7.xy);
    r5.x = ps;
    r9.xyz = r5.xxx * r3.xyz;
    r5 = xe_cube(r9.xyz);
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r1.w = ps;
    r3.xy = r5.yx * r1.ww + 1.5;
    r11.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r6.yzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r7 = tex2D(Texture2D_4, r0.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r1.z;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    r8.yzw = r0.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.w;
    r5.z = r7.x + r7.x;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r4.w = r5.z * r10.x;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = saturate(ps);
    ps = r7.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.zw = r10.yz * r7.yz;
    r5.x = ps;
    ps = 1.0 - r5.y;
    r4.xyz = r0.xyz * r4.xyz;
    r5.y = ps;
    ps = r5.x;
    r0.xyz = r6.yzw * r2.www;
    r6.y = ps;
    ps = rsqrt(abs(r5.w));
    r7.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    ps = 0.0001;
    r10.xyz = r5.xxx * -SpotDirection.xyz;
    r6.z = ps;
    ps = max(r6.y, r6.z);
    r5.z = dot(r8.wyz, r8.wyz);
    r8.x = ps;
    ps = log2(r6.x);
    r1 = r11 * float4(0.875, 0.875, 1.8, 1.5);
    r5.x = ps;
    r6.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r10.zxy, r2.zxy);
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r2.xyz = r8.yzw * r5.zzz;
    r5.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.w = dot(r2.zxy, r9.zxy);
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r10.xyz = r2.xzy * r5.www;
    r8.y = saturate(ps);
    r5.xyw = r10.xyz * 2.0 - r9.xzy;
    ps = pow(2.0, r5.z);
    r5.x = saturate(dot(r7.zxy, r5.yxw));
    r5.y = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xzy * r5.yyy;
    r8.z = ps;
    r5.xw = r8.xy * r8.zy;
    ps = pow(2.0, r5.x);
    r6.w = saturate(dot(r2.zxy, r7.zxy));
    r6.x = ps;
    r1 = r1.zxyw * r6.xyzx;
    r6 = r4 * r6.wwwx;
    ps = r6.x + r6.w;
    r6.y = r6.y + r1.x;
    r6.x = ps;
    ps = r1.w;
    r5.xy = r1.yz + 0.125;
    ps = r6.z + ps;
    r5.y = r5.x * r5.y;
    r6.z = ps;
    r5.xyz = r5.yyy * r3.xyz + ModShadowColor.xyz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
