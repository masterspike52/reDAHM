// ps_4487af1bfda27cf7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040E00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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

    r6.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r1.xy + UniformVector_1.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = dot(r2.zxy, r2.zxy);
    r7.y = ps;
    r6.xyz = r6.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r6.w = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r13.yzw = r7.zzz * r2.xyz;
    r6.w = ps;
    r12.xyz = r6.www * r4.zyx;
    ps = r7.x;
    r6.z = saturate(dot(r12.xzy, r6.xzy));
    ps = abs(r8.x) * ps;
    r6.x = r13.w + 0.1;
    r6.y = ps;
    ps = r7.y;
    r6.x = saturate(r6.x * 5.0);
    ps = abs(r8.y) * ps;
    r6.xw = -r6.zx + 1.0;
    r6.z = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r7.xyz = tex2D(Texture2D_2, r6.xx).xyz;
    r2 = tex2D(Texture2D_0, r1.xy).xywz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r10.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_4, r0.zw).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r0.w = dot(r5.zxy, r5.zxy);
    r13.x = saturate(ps);
    ps = r14.y + r14.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r11.x = ps;
    ps = r10.x;
    r9.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r14.x * ps;
    r8.xyz = r7.xyz + r2.xyw;
    r10.x = ps;
    ps = LightMapScale.x * r6.y;
    r0.xyz = r8.xyz * r0.xyz;
    r1.x = ps;
    ps = LightMapScale.y * r6.z;
    r12.yz = -r12.zy;
    r1.y = ps;
    r12.x = r12.x * 2.0 - r12.x;
    ps = rsqrt(abs(r0.w));
    r7.w = saturate(dot(r13.yzw, r12.yzx));
    r11.w = ps;
    ps = log2(r7.w);
    r12 = r11.yzww * float4(0.875, 0.875, -0.5, 0.5);
    r14.w = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r5.xy = r12.zw * r5.zz;
    r13.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r11.yz = r14.zw * float2(1e+02, 15.0);
    r13.z = ps;
    ps = LightMapScale.z * r6.x;
    r2.xyw = -r13.xyz + 1.0;
    r1.z = ps;
    ps = pow(2.0, r11.z);
    r5.zw = r12.xy * r2.yw;
    r7.w = ps;
    ps = r1.x;
    r10.yz = r11.xy * r10.yz;
    ps = r7.w * ps;
    r6.w = float((r2.x >= 0.004));
    r2.x = ps;
    ps = r1.z;
    r6.xyz = r10.xyz + UniformVector_0.xyz;
    ps = r7.w * ps;
    r5 = r5 + float4(0.5, 0.5, 0.125, 0.125);
    r2.y = ps;
    r7.xyz = r2.zzz * r7.xzy + r6.xzy;
    ps = r5.z * r5.w;
    r2.zw = abs(r5.xy) * abs(r5.xy);
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    ps = r1.y;
    r4.xyz = r0.xzy * r2.zzz;
    r7.xyz = r9.xyz * r8.xyz + r7.xzy;
    ps = r7.w * ps;
    r5.xyz = r0.xzy * r2.www;
    r2.z = ps;
    r7.xyz = r5.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r4.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r2.xyz * 0.21952 + r7.xyz;
    r7.xyz = r1.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
