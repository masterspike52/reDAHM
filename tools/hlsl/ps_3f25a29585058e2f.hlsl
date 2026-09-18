// ps_3f25a29585058e2f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r5.zxy, r5.zxy);
    r6.z = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r11 = tex2D(Texture2D_1, r0.xy);
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r0.xyz = r7.yzw * r11.xyz;
    r10.z = max(UniformScalar_0.x, 0.0001);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = dot(r2.zxy, r2.zxy);
    r8.xyz = r11.www * UniformVector_1.xzy;
    r12.xyz = r10.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r10.xyw = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r7.x = ps;
    r11.xyz = r10.xyw * r7.yzw + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.x));
    r10.xyw = r7.xxx * r4.xyz;
    r6.x = ps;
    r5.xyz = r6.xxx * r5.xyz;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r12.xyz, r12.xyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r6.yyy * r2.xzy;
    r6.x = ps;
    r4.xyz = r12.xyz * r6.xxx;
    r2.xyz = r4.xxx * r1.xyz;
    ps = OpacityOverride.x;
    r6.y = dot(r5.zxy, r4.xyz);
    r5.z = saturate(ps);
    ps = 0.1 - -r7.y;
    r7.w = dot(r4.xyz, r10.wxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r5.xyw = r4.yzx * r7.www;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r4 = r6.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r5.xyw * 2.0 - r10.xyw;
    ps = ModShadowGroupColor.x * r6.z;
    r7.w = saturate(dot(r7.yxz, r6.wxy));
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xy = r4.xy + 0.5;
    r5.y = ps;
    r6.xyw = -r5.xyz + 1.0;
    r10.xy = r4.zw * r6.xy + 0.125;
    r6.xy = abs(r7.xy) * abs(r7.xy);
    r5.xyz = r0.xzy * r6.xxx;
    ps = log2(r7.w);
    r7.xyz = r0.xzy * r6.yyy;
    r10.w = ps;
    r4.xyz = r7.xyz * UpperSkyColor.xzy + r11.xzy;
    r7.xw = r10.xz * r10.yw;
    r6.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = pow(2.0, r7.w);
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r7.xyz = r1.xyz * r8.xyz + r7.xzy;
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
