// ps_a244e4b20535f67e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
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
    r5.x = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r11.yw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r11.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r8.x = ps;
    r5.yzw = r5.wyz * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r0.y = dot(r7.zxy, float3(0.5, 0.5, 0.5));
    r8.y = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r0.yyy - r7.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r0.xxx * r3.xyz;
    r5.x = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r4.xyz = r5.xxx * r4.xyz;
    r8.z = ps;
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.yzw, r5.yzw);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r6.www * r1.xzy;
    r5.x = ps;
    ps = 0.1 - -r0.y;
    r5.yzw = r5.zwy * r5.xxx;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.x = dot(r4.zxy, r5.wyz);
    r5.x = saturate(ps);
    ps = ConstantLighting.x * r5.w;
    r6.w = dot(r5.wyz, r3.zxy);
    r1.x = ps;
    ps = 1.0 - r5.x;
    r1.yzw = r5.yzw * r6.www;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4 = r11.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r11.x = ps;
    r1.yzw = r1.yzw * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r0.z = saturate(dot(r0.yxz, r1.wyz));
    r11.y = ps;
    ps = ConstantLighting.y * r5.w;
    r3.xyz = -r11.xyz + 1.0;
    r1.y = ps;
    ps = ConstantLighting.z * r5.w;
    r0.xy = r4.xy + 0.5;
    r1.z = ps;
    ps = abs(r0.x) * abs(r0.x);
    r6.w = float((r3.z >= 0.004));
    r1.w = ps;
    r5.xy = r4.zw * r3.xy + 0.125;
    ps = log2(r0.z);
    r5.x = r5.x * r5.y;
    r9.w = ps;
    r5.xyz = r5.xxx * r10.xyz + ModShadowColor.xyz;
    ps = abs(r0.y) * abs(r0.y);
    r3 = r9 * float4(0.5, 0.5, 0.5, 15.0);
    r0.w = ps;
    ps = pow(2.0, r3.w);
    r0.xyz = r3.xyz + r7.xyz;
    r5.w = ps;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = ConstantLighting.x * r5.w;
    r0.xyz = r0.xyz * r6.yzx;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r0.xzy * r1.www;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r6.xyz = r0.xzy * r0.www;
    r3.z = ps;
    r6.xyz = r6.xzy * UpperSkyColor.xyz + r8.xyz;
    r6.xyz = r4.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r3.xzy * r7.zzz + r6.xzy;
    r6.xyz = r1.xzy * r0.xzy + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
