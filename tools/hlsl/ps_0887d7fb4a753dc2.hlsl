// ps_0887d7fb4a753dc2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040E00 00000806 00000000 00007108 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 0000F454 0000F556 0000F657 0000F758
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 ConstantLighting : register(c13); // float3
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 texcoord8 : TEXCOORD8; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.texcoord8;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = UniformVector_2.yx - 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r1.zw + r0.yx;
    r0.w = ps;
    r1.zw = r0.zw * abs(r8.xy);
    r0.w = dot(r2.xy, UniformVector_4.yx) + 0.5;
    r0.z = dot(r2.xy, UniformVector_3.yx) + 0.5;
    r12.xy = tex2D(Texture2D_2, r0.xy).xy;
    r2.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r14.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = OpacityOverride.x - r5.w;
    r1.xy = r0.xy + UniformVector_1.xy;
    r3.w = ps;
    r1.xw = tex2D(Texture2D_1, r1.xy).yx;
    r0.zw = tex2D(Texture2D_1, r0.zw).xy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.y = dot(r4.zxy, r4.zxy);
    r1.z = dot(r6.zxy, r6.zxy);
    r0.x = dot(r7.zxy, r7.zxy);
    ps = OpacityOverride.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r13.z = saturate(ps);
    ps = r1.x;
    r8.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r0.w * ps;
    r9.xyz = r3.xyz * r9.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r10 = r10.xzxy * float4(5e+01, 5.0, 5.0, 5.0);
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r2.x = dot(r14.zxy, r14.zxy);
    r1.z = ps;
    ps = rsqrt(abs(r1.y));
    r6.xyz = r1.zzz * r6.xyz;
    r1.y = ps;
    ps = rsqrt(abs(r2.x));
    r1.xyz = r1.yyy * r4.zxy;
    r2.x = ps;
    ps = 0.1 - -r1.x;
    r13.xyw = r0.xxx * r7.xyz;
    r0.x = ps;
    ps = 5.0 * r0.y;
    r4.xzw = r2.xxx * r14.zxy;
    r4.y = ps;
    ps = 0.5 * r0.z;
    r7.xyz = r4.xzw * TwoSidedSign.xxx;
    r4.z = ps;
    ps = 5.0 * r0.x;
    r2.x = dot(r13.wxy, r7.xyz);
    r0.y = saturate(ps);
    ps = r4.z;
    r0.x = dot(r7.xyz, r6.zxy);
    ps = r1.w * ps;
    r0.z = -r0.y + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r7.yzx * r0.xxx;
    r13.x = ps;
    r6.xyw = r0.xyw * 2.0 - r6.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r2 = r2.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r13.y = ps;
    ps = r2.y;
    r6.z = max(r10.x, 0.0001);
    r0.x = ps;
    ps = 0.5 + r0.x;
    r0.z = saturate(dot(r1.xyz, r6.wxy));
    r1.x = ps;
    ps = 0.5 + r2.x;
    r0.xyw = -r13.xyz + 1.0;
    r1.y = ps;
    r6.xy = r2.zw * r0.xy + 0.125;
    ps = log2(r0.z);
    r1.xw = abs(r1.xy) * abs(r1.xy);
    r6.w = ps;
    ps = r9.x;
    r4.xy = r4.xy * r12.xy;
    ps = r1.w * ps;
    r1.yz = r6.xz * r6.yw;
    r2.x = ps;
    r0.xyz = r1.yyy * r11.xzy + ModShadowColor.xzy;
    ps = pow(2.0, r1.z);
    r6.xyz = r9.xyz * r1.xxx;
    r7.w = ps;
    ps = r9.y;
    r1.yz = r7.ww * ConstantLighting.xy;
    ps = r1.w * ps;
    r1.yz = r1.yz * r10.zw;
    r2.y = ps;
    ps = r9.z;
    r7 = r7.xxxw * ConstantLighting.xyzz;
    ps = r1.w * ps;
    r1.x = r7.w * r10.y;
    r2.z = ps;
    r1.xyz = r7.zxy * r9.zxy + r1.xyz;
    r1.xyz = r6.zxy * LowerSkyColor.zxy + r1.xyz;
    r1.xyz = r2.yzx * UpperSkyColor.yzx + r1.zxy;
    r2.x = r8.y * r3.y + r1.x;
    r4.zw = r8.zx * r3.zx + r1.yz;
    r1.yzw = r4.xyz + UniformVector_0.xyz;
    r1.x = r1.y + r4.w;
    r2.x = r1.z + r2.x;
    ps = r2.x;
    r0.w = float((r0.w >= 0.004));
    ps = r0.z * ps;
    r0.xy = r1.xw * r0.xy;
    r0.z = ps;
    r3.xyz = r0.xyz - r0.xyz;
    oC0.w = r3.w * r0.w + r5.w;
    r0.xyz = r3.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
