// ps_86267b4ad6a47e84.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r9.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    ps = OpacityOverride.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r7.z = saturate(ps);
    ps = ConstantLighting.z;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = 0.21952 * ps;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r11.x = ps;
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    r0.yzw = r7.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r8.xyz = r5.xyz * r2.yzx;
    r6.y = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r6.yyy * r3.xyz;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r2.z;
    r4.xyz = r0.xxx * r4.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r5.w));
    r0.x = dot(r0.yzw, r0.yzw);
    r3.w = ps;
    ps = rsqrt(abs(r0.x));
    r1.xyz = r3.www * r1.zxy;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r0.xyw = r0.zwy * r0.xxx;
    r6.z = ps;
    ps = 0.1 - -r1.x;
    r9.y = dot(r4.zxy, r0.wxy);
    r0.z = ps;
    ps = 5.0 * r0.z;
    r1.w = dot(r0.wxy, r3.zxy);
    r0.z = saturate(ps);
    ps = ConstantLighting.x * r0.w;
    r0.z = -r0.z + 1.0;
    r9.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r4.xyz = r0.xyw * r1.www;
    r7.x = ps;
    r4.xyz = r4.xyz * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r3 = r9.yyzw * float4(0.5, -0.5, 0.875, 0.875);
    r7.y = ps;
    ps = r3.y;
    r0.z = saturate(dot(r1.xyz, r4.zxy));
    r0.x = ps;
    ps = 0.5 + r0.x;
    r4.xyz = -r7.xyz + 1.0;
    r1.y = ps;
    ps = 0.5 + r3.x;
    r1.x = float((r4.z >= 0.004));
    r1.z = ps;
    r11.yz = r3.zw * r4.xy + 0.125;
    ps = log2(r0.z);
    r1.yz = abs(r1.yz) * abs(r1.yz);
    r0.z = ps;
    ps = ConstantLighting.y * r0.w;
    r0.z = r0.z * 15.0;
    r9.y = ps;
    ps = pow(2.0, r0.z);
    r3.xyz = r8.xzy * r1.zzz;
    r11.w = ps;
    ps = ConstantLighting.z * r0.w;
    r0.z = r11.w * 0.21952;
    r9.z = ps;
    ps = ConstantLighting.x * r0.z;
    r4.xyz = r8.xzy * r1.yyy;
    r7.x = ps;
    ps = ConstantLighting.y * r0.z;
    r7.zw = r11.xy * r11.wz;
    r7.y = ps;
    r0.xyz = r7.www * r10.xyz + ModShadowColor.xyz;
    r1.yzw = r9.xyz * r8.xyz + r7.xyz;
    r1.yzw = r4.xzy * LowerSkyColor.xyz + r1.yzw;
    r1.yzw = r3.xzy * UpperSkyColor.xyz + r1.yzw;
    r1.yzw = r6.xyz * r5.xyz + r1.yzw;
    r1.yzw = r1.yzw + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r1.yzw * r0.xyz;
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
