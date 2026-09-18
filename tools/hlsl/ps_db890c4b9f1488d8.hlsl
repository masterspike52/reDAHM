// ps_db890c4b9f1488d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.xy = r6.yz * abs(r8.xy);
    r6.x = ps;
    r11.xyz = r6.xxx * r4.xyz;
    r6 = xe_cube(r11.xyz);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.x = ps;
    r4.xy = r6.yx * r7.xx + 1.5;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r4.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.x = dot(r5.zxy, r5.zxy);
    r0.xyz = r7.yzw * r10.xyz;
    r6.w = dot(r12.zxy, r12.zxy);
    ps = rsqrt(abs(r6.x));
    r10.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r6.x = ps;
    r10.xyz = r10.xyz * r7.yzw + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.x));
    r6.xyz = r6.xxx * r5.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r2.xzy;
    r6.w = ps;
    r5.xyw = r6.www * r12.zxy;
    r2.xyz = r5.xxx * r1.xyz;
    r9.x = dot(r6.zxy, r5.xyw);
    ps = 0.1 - -r7.y;
    r6.y = dot(r5.xyw, r11.zxy);
    r6.x = ps;
    ps = OpacityOverride.x;
    r6.x = saturate(r6.x * 5.0);
    r5.z = saturate(ps);
    ps = 1.0 - r6.x;
    r5.xyw = r5.ywx * r6.yyy;
    r6.z = ps;
    r11.xyz = r5.xyw * 2.0 - r11.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r9 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.xy = r9.yx + 0.5;
    r5.y = ps;
    ps = abs(r6.y) * abs(r6.y);
    r7.x = saturate(dot(r7.yxz, r11.zxy));
    r7.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r6.yzw = -r5.xyz + 1.0;
    r6.x = ps;
    r5.xyz = r0.xzy * r7.yyy;
    r6.w = float((r6.w >= 0.004));
    r9.xy = r9.zw * r6.yz + 0.125;
    ps = log2(r7.x);
    r6.xyz = r0.xzy * r6.xxx;
    r4.x = ps;
    r4 = r4.yzwx * float4(3e+01, 3e+01, 3e+01, 15.0);
    r7.xyz = r6.xyz * UpperSkyColor.xzy + r10.xzy;
    ps = r9.x * r9.y;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r6.xyz = r7.www * r6.xyz + ModShadowColor.xyz;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    ps = pow(2.0, r4.w);
    r4.xyz = r4.xzy * r8.xzy;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
