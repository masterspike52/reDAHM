// ps_8a1758f78dfd897a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040C00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 ConstantLighting : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = max(UniformScalar_0.x, 0.0001);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.xy).yzx;
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r2.x = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = -UniformVector_0.y;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r2.y = dot(r3.zxy, r3.zxy);
    r11.y = ps;
    r10.xyw = r8.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r8.xyz = r6.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r2.y));
    r12.xyz = r5.xyz * UniformVector_2.xyz;
    r2.y = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyw = r2.yyy * r3.xyz;
    r0.w = ps;
    ps = -UniformVector_0.z;
    r6.xyz = r0.www * r4.xyz;
    ps = 1.0 + ps;
    r0.w = dot(r8.xyz, r8.xyz);
    r11.z = ps;
    ps = rsqrt(abs(r2.x));
    r3.xyz = r12.xyz * r11.xyz;
    r2.x = ps;
    r4.yzw = r3.xyz * AmbientColorAndSkyFactor.xyz + r10.xyw;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r2.xxx * r1.xzy;
    r0.w = ps;
    ps = OpacityOverride.x;
    r1.xyw = r8.yzx * r0.www;
    r5.z = saturate(ps);
    ps = UniformVector_3.x * r0.z;
    r7.x = dot(r6.zxy, r1.wxy);
    r6.x = ps;
    ps = 0.1 - -r2.y;
    r0.w = dot(r1.wxy, r5.wxy);
    r0.z = ps;
    ps = 5.0 * r0.z;
    r6.yzw = r1.xyw * r0.www;
    r0.w = saturate(ps);
    ps = 1.0 - r0.w;
    r7 = r7.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r0.z = ps;
    r5.xyw = r6.yzw * 2.0 - r5.xyw;
    ps = ModShadowGroupColor.x * r0.z;
    r0.w = saturate(dot(r2.yxz, r5.wxy));
    r5.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r6.zw = r7.xy + 0.5;
    r5.y = ps;
    ps = UniformVector_3.y * r0.x;
    r5.xyw = -r5.xyz + 1.0;
    r6.y = ps;
    r10.xy = r7.zw * r5.xy + 0.125;
    ps = UniformVector_3.z * r0.y;
    r5.xy = abs(r6.zw) * abs(r6.zw);
    r6.z = ps;
    ps = ConstantLighting.x * r1.w;
    r8.xyz = r3.xzy * r5.xxx;
    r4.x = ps;
    ps = log2(r0.w);
    r0.xyz = r3.xzy * r5.yyy;
    r10.w = ps;
    r7.xyz = r0.xyz * UpperSkyColor.xzy + r4.ywz;
    ps = ConstantLighting.y * r1.w;
    r4.zw = r10.xz * r10.yw;
    r4.y = ps;
    r0.xyz = r4.zzz * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    ps = pow(2.0, r4.w);
    r0.w = float((r5.w >= 0.004));
    r1.z = ps;
    ps = ConstantLighting.z * r1.w;
    r7.xyz = r1.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r1.xyz = r7.xyz * r6.xzy + r5.xzy;
    r1.xyz = r4.xyz * r3.xyz + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
