// ps_83f7598a64f38f03.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040B00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.z = saturate(OpacityOverride.x);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6 = tex2D(Texture2D_0, r0.xy);
    ps = -ModShadowColor.x;
    r0.w = max(UniformScalar_0.x, 0.0001);
    ps = 1.0 + ps;
    r7.w = dot(r5.zxy, r5.zxy);
    r10.x = ps;
    ps = -ModShadowColor.y;
    r8.z = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r7.x = dot(r2.zxy, r2.zxy);
    r10.y = ps;
    ps = -ModShadowColor.z;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.xyz = r9.xyz * r6.xyz;
    r10.z = ps;
    ps = rsqrt(abs(r7.x));
    r11.xyw = r6.xyz * AmbientColorAndSkyFactor.xyz;
    r7.x = ps;
    r9.xyz = r11.xyw * r9.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r8.z));
    r7.xyz = r7.xxx * r2.xzy;
    r2.x = ps;
    ps = r6.w;
    r2.xyz = r2.xxx * r4.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r4.yz = -r2.xy;
    r8.z = ps;
    r4.x = r2.z * 2.0 - r2.z;
    ps = 0.1 - -r7.y;
    r2 = r8.zxyz * float4(-0.5, 0.875, 0.875, 0.5);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.z = saturate(dot(r7.xzy, r4.yzx));
    r7.x = saturate(ps);
    ps = r2.x;
    r7.x = -r7.x + 1.0;
    ps = r5.z * ps;
    r11.xy = r7.xx * ModShadowGroupColor.xy;
    r2.x = ps;
    ps = r2.w;
    r7.xyw = -r11.xyz + 1.0;
    ps = r5.z * ps;
    r2.zw = r2.yz * r7.xy;
    r2.y = ps;
    ps = UniformVector_1.x * r6.y;
    r4 = r2 + float4(0.5, 0.5, 0.125, 0.125);
    r2.x = ps;
    ps = r4.z * r4.w;
    r7.x = float((r7.w >= 0.004));
    r7.y = ps;
    ps = log2(r7.z);
    r8.xy = abs(r4.xy) * abs(r4.xy);
    r8.z = ps;
    r7.yzw = r7.yyy * r10.xyz + ModShadowColor.xyz;
    ps = UniformVector_1.z * r6.w;
    r4 = r0.xzyw * r8.yyyz;
    r2.y = ps;
    r5.xyz = r4.xzy * UpperSkyColor.xyz + r9.xyz;
    ps = pow(2.0, r4.w);
    r8.xyz = r0.xzy * r8.xxx;
    r2.z = ps;
    ps = UniformVector_1.y * r6.w;
    r4.xyz = r2.zzz * r1.xzy;
    r2.z = ps;
    r6.xyz = r8.xyz * LowerSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xzy * r2.xzy + r6.xzy;
    r6.xyz = r0.xzy * r1.xzy + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
