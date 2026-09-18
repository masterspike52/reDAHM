// ps_86abf8a881e5538e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10041000 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyw = tex2D(Texture2D_1, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    ps = OpacityOverride.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r15.x = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r6.y = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r6.z = dot(r2.zxy, r2.zxy);
    r8.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r6.w = dot(r5.zxy, r5.zxy);
    r8.z = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r0.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r13.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r13.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r12.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r13.z = ps;
    ps = UniformScalar_0.x * r7.y;
    r6.x = dot(r11.xwy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r16.yzw = r15.wyz * 2.0 - 1.0;
    ps = UniformScalar_0.x * r7.z;
    r11.xyz = r13.xyz * r11.yyy;
    r0.w = ps;
    r0.xyz = r0.xyz * r11.www + UniformVector_0.xyz;
    r11.xyz = r11.xyz * r7.yzw + r0.xyz;
    ps = rsqrt(abs(r6.w));
    r15.yzw = r16.yzw * float3(0.7, 1.0, 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r13.xyz = r6.www * r5.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r6.zzz * r2.zxy;
    r6.y = ps;
    ps = UniformScalar_0.x * r7.w;
    r5.yzw = r6.yyy * r4.zxy;
    r5.x = ps;
    ps = log2(abs(r6.x));
    r6.w = dot(r5.yzw, r16.yzw);
    r16.x = ps;
    ps = 0.1 - -r0.x;
    r2 = r16.yzwx * float4(0.7, 1.0, 1.0, 0.1);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.z = dot(r2.xyz, r2.xyz);
    r6.y = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r6.x = max(r6.w, 0.0);
    r6.z = ps;
    ps = 1.0 - r6.y;
    r4.xyz = r15.yzw * r6.zzz;
    r6.z = ps;
    ps = 0.45 - r6.x;
    r2.xyz = r4.xxx * r1.xyz;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r14.x = dot(r13.zxy, r4.xyz);
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.y = dot(r4.xyz, r5.yzw);
    r15.z = ps;
    ps = pow(2.0, r2.w);
    r13.xyz = r4.yzx * r6.yyy;
    r15.w = ps;
    ps = 4.0 * r6.x;
    r4 = -r15.xywz + 1.0;
    r2.w = saturate(ps);
    ps = r7.x;
    r6.w = float((r4.x >= 0.004));
    r13.xyz = r13.xyz * 2.0 - r5.zwy;
    ps = r4.z * ps;
    r6.xyz = r4.zzz * r7.yzw;
    r4.x = ps;
    ps = r5.x;
    r7 = r14.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.yz = r7.zw * r4.yw + 0.125;
    r8.xyz = r6.xyz * r8.xyz - r6.xyz;
    ps = r4.z * ps;
    r5.w = saturate(dot(r0.xyz, r13.zxy));
    r4.y = ps;
    ps = r5.w * r5.w;
    r0.xy = r7.xy + 0.5;
    r5.x = ps;
    ps = abs(r0.x) * abs(r0.x);
    r7.xyz = r6.xyz * UniformVector_3.www;
    r7.w = ps;
    r7.xyz = r7.xyz * UniformVector_3.xyz - r6.xyz;
    r8.xyz = r2.www * r8.xyz + r6.xyz;
    ps = abs(r0.y) * abs(r0.y);
    r8.xyz = r8.xyz * r10.xyz;
    r0.x = ps;
    r6.xyz = r2.www * r7.xyz + r6.xyz;
    r7.xyz = r12.xyz * r6.xyz + r11.xyz;
    ps = r5.x * r5.w;
    r8.xyz = r8.xzy * r0.xxx;
    r2.w = ps;
    ps = r5.y * r5.z;
    r0.xyz = r6.xyz * r10.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    ps = r0.w;
    r1.xyz = r2.www * r1.xzy;
    ps = r4.z * ps;
    r5.xyz = r0.xzy * r7.www;
    r4.z = ps;
    r7.xyz = r8.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xyz;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
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
