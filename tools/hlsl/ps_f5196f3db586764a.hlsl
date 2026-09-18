// ps_f5196f3db586764a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040E00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.xy + UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r11.xyz = tex2D(Texture2D_2, r6.zw).xyz;
    r12.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r14.yz = tex2D(Texture2D_1, r6.zw).xy;
    r8.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).yx;
    ps = OpacityOverride.x;
    r6.w = r1.z * 0.21952;
    r13.z = saturate(ps);
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r7.x = dot(r2.zxy, r2.zxy);
    r10.x = ps;
    ps = -UniformVector_0.y;
    r7.y = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r7.z = dot(r5.zxy, r5.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r7.z));
    r6.x = dot(r8.zxy, r8.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r0.xyz = r7.zzz * r5.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r4.xyz = r7.yyy * r4.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.xxx * r2.xzy;
    r6.x = ps;
    ps = -UniformVector_0.z;
    r2.yzw = r6.xxx * r8.zxy;
    ps = 1.0 + ps;
    r8.xyz = r2.yyy * r1.xyz;
    r10.z = ps;
    ps = 0.1 - -r7.y;
    r7.w = dot(r2.yzw, r4.zxy);
    r6.x = ps;
    ps = 0.875 * r6.z;
    r6.x = saturate(r6.x * 5.0);
    r2.x = ps;
    ps = 1.0 - r6.x;
    r14.x = dot(r0.zxy, r2.yzw);
    r6.z = ps;
    r0.xy = r14.yz * float2(0.2, 1.2) + UniformVector_0.xy;
    ps = ModShadowGroupColor.x * r6.z;
    r2.yzw = r2.zwy * r7.www;
    r13.x = ps;
    r2.yzw = r2.yzw * 2.0 - r4.xyz;
    r0.zw = r14.xx * float2(-0.5, 0.5) + 0.5;
    ps = ModShadowGroupColor.y * r6.z;
    r6.x = saturate(dot(r7.yxz, r2.wyz));
    r13.y = ps;
    ps = 0.875 * r6.y;
    r7.xyz = -r13.zxy + 1.0;
    r2.y = ps;
    ps = log2(r6.x);
    r7.x = float((r7.x >= 0.004));
    r12.w = ps;
    r6.xy = r2.xy * r7.yz + 0.125;
    ps = abs(r0.z) * abs(r0.z);
    r2 = r12 * float4(1.5, 1.5, 1.5, 15.0);
    r7.y = ps;
    ps = pow(2.0, r2.w);
    r2.xyz = r2.xyz * r11.xyz;
    r6.z = ps;
    ps = 0.21952 * r6.z;
    r2.xyz = r2.xyz * r10.xyz;
    r7.z = ps;
    ps = abs(r0.w) * abs(r0.w);
    r5.xy = r7.zz * r1.xy;
    r7.z = ps;
    ps = r6.x * r6.y;
    r1.xyz = r2.xyz * r7.zzz;
    r5.w = ps;
    ps = r6.w * r6.z;
    r4.xyz = r2.xyz * r7.yyy;
    r5.z = ps;
    r7.yzw = r5.www * r9.xyz + ModShadowColor.xyz;
    r6.xyz = r8.xyz * r2.xyz + r5.xyz;
    r6.xyz = r4.xyz * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r1.xyz * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r2.zxy * AmbientColorAndSkyFactor.zxy + r6.zxy;
    ps = UniformVector_0.z + r6.x;
    r0.xy = r0.xy + r6.yz;
    r0.z = ps;
    ps = -r3.w;
    r6.xyz = r0.xyz * r7.yzw;
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
