// ps_2b202cf5f02b5c09.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040F00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UpperSkyColor : register(c10); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = UniformVector_2.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r7.xy + r0.yx;
    r6.y = ps;
    r7.xy = r6.xy * abs(r8.xy);
    r6.y = dot(r7.zw, UniformVector_4.yx) + 0.5;
    r6.x = dot(r7.zw, UniformVector_3.yx) + 0.5;
    r13.xy = tex2D(Texture2D_2, r0.xy).xy;
    r15.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r14.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = OpacityOverride.x - r3.w;
    r6.zw = r0.xy + UniformVector_1.xy;
    r8.w = ps;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xw = tex2D(Texture2D_1, r6.zw).yx;
    r6.zw = tex2D(Texture2D_1, r6.xy).xy;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = dot(r2.zxy, r2.zxy);
    r7.z = dot(r4.zxy, r4.zxy);
    r6.x = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r14.z = saturate(ps);
    ps = r7.x;
    r9.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r6.w * ps;
    r10.xyz = r8.xyz * r0.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r11 = r11.xzxy * float4(5e+01, 5.0, 5.0, 5.0);
    r6.x = ps;
    ps = rsqrt(abs(r7.z));
    r0.w = dot(r14.wxy, r14.wxy);
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r0.xyz = r7.zzz * r4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r7.yyy * r2.zxy;
    r0.w = ps;
    ps = 0.1 - -r7.x;
    r4.xyz = r6.xxx * r5.xyz;
    r6.x = ps;
    ps = 5.0 * r6.y;
    r2.xzw = r0.www * r14.wxy;
    r2.y = ps;
    ps = 0.5 * r6.z;
    r5.xyz = r2.xzw * TwoSidedSign.xxx;
    r2.z = ps;
    ps = 5.0 * r6.x;
    r15.x = dot(r4.zxy, r5.xyz);
    r6.y = saturate(ps);
    ps = r2.z;
    r6.x = dot(r5.xyz, r0.zxy);
    ps = r7.w * ps;
    r6.z = -r6.y + 1.0;
    r2.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r5.yzx * r6.xxx;
    r14.x = ps;
    r4.xyw = r6.xyw * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r15.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r14.y = ps;
    ps = r0.y;
    r4.z = max(r11.x, 0.0001);
    r6.x = ps;
    ps = 0.5 + r6.x;
    r6.z = saturate(dot(r7.xyz, r4.wxy));
    r7.x = ps;
    ps = 0.5 + r0.x;
    r6.xyw = -r14.xyz + 1.0;
    r7.y = ps;
    r4.xy = r0.zw * r6.xy + 0.125;
    ps = log2(r6.z);
    r7.xw = abs(r7.xy) * abs(r7.xy);
    r4.w = ps;
    ps = r10.x;
    r2.xy = r2.xy * r13.xy;
    ps = r7.w * ps;
    r7.yz = r4.xz * r4.yw;
    r0.x = ps;
    r6.xyz = r7.yyy * r12.xzy + ModShadowColor.xzy;
    ps = pow(2.0, r7.z);
    r4.xyz = r10.xyz * r7.xxx;
    r5.w = ps;
    ps = r10.y;
    r7.yz = r5.ww * r1.xy;
    ps = r7.w * ps;
    r7.yz = r7.yz * r11.zw;
    r0.y = ps;
    ps = r10.z;
    r1 = r5.xxxw * r1.xyzz;
    ps = r7.w * ps;
    r7.x = r1.w * r11.y;
    r0.z = ps;
    r7.xyz = r1.zxy * r10.zxy + r7.xyz;
    r7.xyz = r4.zxy * LowerSkyColor.zxy + r7.xyz;
    r7.xyz = r0.yzx * UpperSkyColor.yzx + r7.zxy;
    r0.x = r9.y * r8.y + r7.x;
    r2.zw = r9.zx * r8.zx + r7.yz;
    r7.yzw = r2.xyz + UniformVector_0.xyz;
    r7.x = r7.y + r2.w;
    r0.x = r7.z + r0.x;
    ps = r0.x;
    r6.w = float((r6.w >= 0.004));
    ps = r6.z * ps;
    r6.xy = r7.xw * r6.xy;
    r6.z = ps;
    r8.xyz = r6.xyz - r6.xyz;
    oC0.w = r8.w * r6.w + r3.w;
    r6.xyz = r8.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
