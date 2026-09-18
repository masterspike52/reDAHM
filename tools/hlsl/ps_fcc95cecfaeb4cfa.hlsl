// ps_fcc95cecfaeb4cfa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040F00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_6 : register(c4); // float
float4 UniformScalar_7 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c7); // float3
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
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r15.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_3, r0.xy).yxz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = dot(r2.zxy, r2.zxy);
    ps = OpacityOverride.x;
    r0.x = dot(r4.zxy, r4.zxy);
    r14.z = saturate(ps);
    r13.xyz = r11.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r11.xyz = r10.xyz * r6.yxw;
    r0.x = ps;
    ps = rsqrt(abs(r6.z));
    r4.yzw = r0.xxx * r4.xyz;
    r6.z = ps;
    ps = UniformScalar_7.x;
    r14.xyw = r6.zzz * r5.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r7.w));
    r6.z = dot(r13.zxy, r13.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r7.www * r2.xzy;
    r6.z = ps;
    ps = 0.0001;
    r13.xyz = r13.xyz * r6.zzz;
    r5.y = ps;
    ps = 0.1 - -r0.y;
    r15.x = dot(r14.wxy, r13.zxy);
    r6.z = ps;
    ps = 5.0 * r6.z;
    r7.w = dot(r13.zxy, r4.wyz);
    r6.z = saturate(ps);
    ps = max(r5.x, r5.y);
    r6.z = -r6.z + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r13.xzy * r7.www;
    r14.x = ps;
    r4.yzw = r2.xyz * 2.0 - r4.ywz;
    ps = ModShadowGroupColor.y * r6.z;
    r2 = r15.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r14.y = ps;
    ps = r2.x;
    r0.x = saturate(dot(r0.yxz, r4.zyw));
    r6.z = ps;
    ps = 0.5 + r6.z;
    r4.yzw = -r14.xyz + 1.0;
    r0.y = ps;
    ps = 0.5 + r2.y;
    r7.w = float((r4.w >= 0.004));
    r0.z = ps;
    r4.yz = r2.zw * r4.yz + 0.125;
    ps = 0.8 * r7.x;
    r2.yz = abs(r0.yz) * abs(r0.yz);
    r2.x = ps;
    ps = log2(r0.x);
    r5.xyz = r11.yzx * r2.yyy;
    r4.w = ps;
    ps = 0.8 * r7.y;
    r0.xw = r4.yx * r4.zw;
    r2.y = ps;
    r0.xyz = r0.xxx * r12.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r12.xyz = r11.yzx * r2.zzz;
    r13.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r2.zw = r13.ww * r1.yz;
    r4.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.x;
    r1 = r13.zzzw * r1.xyzx;
    r4.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r11.xyz = r1.xyz * r11.xyz;
    r4.z = ps;
    r6.xyz = r12.zyx * LowerSkyColor.xzy + r11.xzy;
    r6.xyz = r5.zxy * UpperSkyColor.xyz + r6.xzy;
    r6.xyz = r4.zyx * r10.zyx + r6.zyx;
    r6.z = r1.w * r9.x + r6.z;
    r6.xy = r2.zw * r9.yz + r6.yx;
    ps = 0.8 * r7.z;
    r6.xy = r6.xy + UniformVector_0.yz;
    r2.z = ps;
    r6.xyz = r2.yzx * UniformScalar_6.xxx + r6.xyz;
    r6.yzw = r8.xyz * 2.0 + r6.zxy;
    ps = UniformVector_0.x + r6.y;
    r6.x = ps;
    ps = -r3.w;
    r6.xyz = r6.xzw * r0.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
