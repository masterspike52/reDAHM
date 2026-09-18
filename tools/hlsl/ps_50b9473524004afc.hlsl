// ps_50b9473524004afc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10041000 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.zw = r0.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = UniformVector_2.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r7.xy + r0.yx;
    r6.y = ps;
    r7.xy = r6.xy * abs(r8.xy);
    r6.y = dot(r7.zw, UniformVector_4.yx) + 0.5;
    r6.x = dot(r7.zw, UniformVector_3.yx) + 0.5;
    r12.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r15.xyz = tex2D(Texture2D_2, r6.zw).xyz;
    r10.xyw = tex2D(Texture2D_2, r6.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8 = tex2D(Texture2D_1, r0.xy);
    r7.xyz = tex2D(Texture2D_4, r0.xy).yxz;
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r7.w = dot(r5.zxy, r5.zxy);
    r0.x = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r10.z = saturate(ps);
    r11.xyz = r0.wyz * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r13.xyz = r13.xyz + r8.xyz;
    r14.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r16.xyz = r15.xzy * r10.xwy;
    r14.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r12.xw = r16.xy * r10.xw;
    r14.z = ps;
    ps = rsqrt(abs(r0.x));
    r8.xyz = r13.xyz * r6.yzx;
    r6.x = ps;
    ps = rsqrt(abs(r7.w));
    r10.xyw = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r6.xxx * r5.xyz;
    r6.x = ps;
    ps = 5e+01 * r7.y;
    r0.xyz = r6.xxx * r2.zxy;
    r0.w = ps;
    ps = r16.z * r16.z;
    r6.x = dot(r11.xyz, r11.xyz);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r6.yw = r12.xw * r15.xz;
    r6.x = ps;
    ps = 0.1 - -r0.x;
    r5.xyz = r11.xyz * r6.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r5.xxx * r1.xyz;
    r6.x = saturate(ps);
    ps = 5e+01 * r6.y;
    r12.x = dot(r4.zxy, r5.xyz);
    r4.x = ps;
    ps = 2e+02 * r6.z;
    r7.w = dot(r5.xyz, r10.wxy);
    r4.y = ps;
    ps = 1e+03 * r6.w;
    r11.xyz = r5.yzx * r7.www;
    r4.z = ps;
    r6.yzw = r4.xyz * r8.www + UniformVector_0.xyz;
    r4.xyz = r14.xyz * r13.xyz + r6.yzw;
    ps = 1.0 - r6.x;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r11.xyz * 2.0 - r10.xyw;
    ps = ModShadowGroupColor.x * r6.z;
    r7.w = saturate(dot(r0.xyz, r6.wxy));
    r10.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.xy = r5.xy + 0.5;
    r10.y = ps;
    ps = r0.w;
    r6.xyw = -r10.xyz + 1.0;
    r0.z = ps;
    r0.xy = r5.zw * r6.xy + 0.125;
    ps = 0.0001;
    r6.xy = abs(r5.xy) * abs(r5.xy);
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r5.xyz = r8.xzy * r6.xxx;
    r0.z = ps;
    ps = log2(r7.w);
    r10.xyz = r8.xzy * r6.yyy;
    r0.w = ps;
    r4.xyz = r10.xyz * UpperSkyColor.xzy + r4.xzy;
    r0.xw = r0.xz * r0.yw;
    r6.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r0.xyz = r5.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = pow(2.0, r0.w);
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r7.xyz = r1.xyz * r7.yzx + r0.xzy;
    r7.xyz = r2.xyz * r8.xyz + r7.xzy;
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
