// ps_39adfe1423d7c1c4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040F00 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = UniformVector_2.yx - 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.zw + r0.yx;
    r0.w = ps;
    r1.zw = r0.zw * abs(r6.xy);
    r0.w = dot(r7.xy, UniformVector_4.yx) + 0.5;
    r0.z = dot(r7.xy, UniformVector_3.yx) + 0.5;
    r12.xy = tex2D(Texture2D_2, r0.xy).xy;
    r14.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = OpacityOverride.x - r3.w;
    r1.xy = r0.xy + UniformVector_1.xy;
    r6.w = ps;
    r1.xw = tex2D(Texture2D_1, r1.xy).yx;
    r0.zw = tex2D(Texture2D_1, r0.zw).xy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.y = dot(r2.zxy, r2.zxy);
    r1.z = dot(r4.zxy, r4.zxy);
    r0.x = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r13.z = saturate(ps);
    ps = r1.x;
    r7.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r0.w * ps;
    r8.xyz = r6.xyz * r8.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r10 = r10.xzxy * float4(5e+01, 5.0, 5.0, 5.0);
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r7.w = dot(r9.zxy, r9.zxy);
    r1.z = ps;
    ps = rsqrt(abs(r1.y));
    r15.xyz = r1.zzz * r4.xyz;
    r1.y = ps;
    ps = rsqrt(abs(r7.w));
    r1.xyz = r1.yyy * r2.zxy;
    r2.w = ps;
    ps = 0.1 - -r1.x;
    r2.xyz = r0.xxx * r5.xyz;
    r0.x = ps;
    ps = 5.0 * r0.y;
    r4.xzw = r2.www * r9.zxy;
    r4.y = ps;
    ps = 0.5 * r0.z;
    r9.xyz = r4.xzw * TwoSidedSign.xxx;
    r4.z = ps;
    ps = 5.0 * r0.x;
    r14.x = dot(r2.zxy, r9.xyz);
    r0.y = saturate(ps);
    ps = r4.z;
    r0.x = dot(r9.xyz, r15.zxy);
    ps = r1.w * ps;
    r0.z = -r0.y + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r9.yzx * r0.xxx;
    r13.x = ps;
    r5.xyw = r0.xyw * 2.0 - r15.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r2 = r14.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r13.y = ps;
    ps = r2.y;
    r5.z = max(r10.x, 0.0001);
    r0.x = ps;
    ps = 0.5 + r0.x;
    r0.z = saturate(dot(r1.xyz, r5.wxy));
    r1.x = ps;
    ps = 0.5 + r2.x;
    r0.xyw = -r13.xyz + 1.0;
    r1.y = ps;
    r5.xy = r2.zw * r0.xy + 0.125;
    ps = log2(r0.z);
    r1.xw = abs(r1.xy) * abs(r1.xy);
    r5.w = ps;
    ps = r8.x;
    r4.xy = r4.xy * r12.xy;
    ps = r1.w * ps;
    r1.yz = r5.xz * r5.yw;
    r2.x = ps;
    r0.xyz = r1.yyy * r11.xzy + ModShadowColor.xzy;
    ps = pow(2.0, r1.z);
    r5.xyz = r8.xyz * r1.xxx;
    r9.w = ps;
    ps = r8.y;
    r1.yz = r9.ww * ConstantLighting.xy;
    ps = r1.w * ps;
    r1.yz = r1.yz * r10.zw;
    r2.y = ps;
    ps = r8.z;
    r9 = r9.xxxw * ConstantLighting.xyzz;
    ps = r1.w * ps;
    r1.x = r9.w * r10.y;
    r2.z = ps;
    r1.xyz = r9.zxy * r8.zxy + r1.xyz;
    r1.xyz = r5.zxy * LowerSkyColor.zxy + r1.xyz;
    r1.xyz = r2.yzx * UpperSkyColor.yzx + r1.zxy;
    r2.x = r7.y * r6.y + r1.x;
    r4.zw = r7.zx * r6.zx + r1.yz;
    r1.yzw = r4.xyz + UniformVector_0.xyz;
    r1.x = r1.y + r4.w;
    r2.x = r1.z + r2.x;
    ps = r2.x;
    r0.w = float((r0.w >= 0.004));
    ps = r0.z * ps;
    r0.xy = r1.xw * r0.xy;
    r0.z = ps;
    r6.xyz = r0.xyz - r0.xyz;
    oC0.w = r6.w * r0.w + r3.w;
    r0.xyz = r6.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
