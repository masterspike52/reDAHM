// ps_62a675fd6b0b5361.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r9.yw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10 = tex2D(Texture2D_1, r0.xy);
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.xyz = r7.xyz * r10.xyz;
    r9.z = max(UniformScalar_0.x, 0.0001);
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.xyz = r10.www * UniformVector_1.xzy;
    r0.yzw = r11.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r10.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r0.x = ps;
    r10.xyz = r10.xyz * r7.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r0.xxx * r3.xyz;
    r0.x = ps;
    r3.xyz = r0.xxx * r4.xyz;
    ps = rsqrt(abs(r5.w));
    r0.x = dot(r0.yzw, r0.yzw);
    r3.w = ps;
    ps = rsqrt(abs(r0.x));
    r1.xyz = r3.www * r1.xzy;
    r0.x = ps;
    r0.yzw = r0.zwy * r0.xxx;
    ps = OpacityOverride.x;
    r9.x = dot(r3.zxy, r0.wyz);
    r4.z = saturate(ps);
    ps = 0.1 - -r1.y;
    r1.w = dot(r0.wyz, r7.zxy);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r4.xyw = r0.yzw * r1.www;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r3 = r9.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r0.z = ps;
    r4.xyw = r4.xyw * 2.0 - r7.xyz;
    ps = ModShadowGroupColor.x * r0.z;
    r0.x = saturate(dot(r1.yxz, r4.wxy));
    r4.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3.xy = r3.xy + 0.5;
    r4.y = ps;
    r1.xyz = -r4.zxy + 1.0;
    r9.xy = r3.zw * r1.yz + 0.125;
    r1.yz = abs(r3.xy) * abs(r3.xy);
    ps = ConstantLighting.x * r0.w;
    r7.xyz = r5.xzy * r1.yyy;
    r3.x = ps;
    ps = log2(r0.x);
    r3.yzw = r5.xzy * r1.zzz;
    r9.w = ps;
    r4.xyz = r3.yzw * UpperSkyColor.xzy + r10.xzy;
    ps = ConstantLighting.y * r0.w;
    r3.zw = r9.xz * r9.yw;
    r3.y = ps;
    r1.yzw = r3.zzz * r8.xyz + ModShadowColor.xyz;
    r4.xyz = r7.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = pow(2.0, r3.w);
    r1.x = float((r1.x >= 0.004));
    r0.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.xxx * ConstantLighting.xzy;
    r3.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r4.xzy;
    r0.xyz = r3.xyz * r5.xyz + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.yzw;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
