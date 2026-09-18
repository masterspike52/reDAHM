// ps_7a803547e4d85b3a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040D00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = OpacityOverride.x - r3.w;
    r6.xy = r6.xy * abs(r8.xy);
    r8.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).zxy;
    r9.zw = tex2D(Texture2D_1, r0.xy).xy;
    ps = OpacityOverride.x;
    r6.x = dot(r5.zxy, r5.zxy);
    r10.z = saturate(ps);
    ps = r1.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.21952 * ps;
    r7.y = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    r10.xyw = r10.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r11.xyz = r8.xyz * r6.zwy;
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r7.yyy * r4.xyz;
    r6.x = ps;
    ps = r9.w + r9.w;
    r4.yzw = r6.xxx * r5.xyz;
    r9.y = ps;
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r10.xyw, r10.xyw);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.xxx * r2.xzy;
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.x * r6.z;
    r2.xyw = r10.ywx * r6.xxx;
    r4.x = ps;
    ps = 0.1 - -r7.y;
    r12.x = dot(r4.wyz, r2.wxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r0.w = dot(r2.wxy, r0.zxy);
    r6.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r6.w;
    r6.z = -r6.x + 1.0;
    r4.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xyz = r2.xyw * r0.www;
    r10.x = ps;
    r2.xyz = r5.xyz * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r12.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r10.y = ps;
    ps = r0.y;
    r12.xyz = r2.www * r1.xyz;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r7.y = saturate(dot(r7.yxz, r2.zxy));
    r4.z = ps;
    ps = 0.5 + r0.x;
    r2.xyz = -r10.xyz + 1.0;
    r4.w = ps;
    r7.xz = r0.zw * r2.xy + 0.125;
    ps = log2(r7.y);
    r0.xz = abs(r4.wz) * abs(r4.wz);
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.z * r6.y;
    r9.xz = r9.zx * float2(7.0, 15.0);
    r4.z = ps;
    ps = pow(2.0, r9.z);
    r5.xyz = r11.xyz * r0.xxx;
    r7.y = ps;
    ps = 0.21952 * r7.y;
    r0.xy = r9.xy * UniformScalar_3.xx;
    r6.x = ps;
    ps = r7.x * r7.z;
    r9.xyz = r11.xyz * r0.zzz;
    r10.w = ps;
    ps = r7.w * r7.y;
    r10.yz = r6.xx * r1.xy;
    r10.x = ps;
    r6.xyz = r10.www * r13.xzy + ModShadowColor.xzy;
    r7.xyz = r12.zxy * r11.zxy + r10.xyz;
    r7.xyz = r9.zxy * LowerSkyColor.zxy + r7.xyz;
    r7.xyz = r5.yzx * UpperSkyColor.yzx + r7.zxy;
    r6.w = r4.y * r8.y + r7.x;
    r0.zw = r4.zx * r8.zx + r7.yz;
    r7.yzw = r0.xyz + UniformVector_0.xyz;
    r7.x = r7.y + r0.w;
    r0.x = r7.z + r6.w;
    ps = r0.x;
    r6.w = float((r2.z >= 0.004));
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
