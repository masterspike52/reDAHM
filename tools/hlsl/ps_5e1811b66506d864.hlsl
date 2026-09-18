// ps_5e1811b66506d864.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040D00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_5 : register(c7); // float
float4 UniformScalar_6 : register(c8); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r12.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_3, r0.xy).yzx;
    r8.xyz = tex2D(Texture2D_2, r7.xy).xyz;
    r7.w = tex2D(Texture2D_1, r0.xy).x;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r11.z = max(UniformScalar_9.x, 0.0001);
    r9.x = saturate(ps);
    ps = -UniformVector_0.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    ps = -UniformVector_0.y;
    r7.y = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r11.xyw = UniformVector_2.xyz * UniformScalar_5.xxx;
    r9.z = ps;
    ps = -UniformVector_0.z;
    r0.xyz = UniformVector_3.xyz * UniformScalar_6.xxx;
    ps = 1.0 + ps;
    r7.z = dot(r2.zxy, r2.zxy);
    r9.w = ps;
    r13.xyz = r13.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r7.x = -r7.w + 1.0;
    r7.z = ps;
    r0.xyz = r11.xyw * r8.xyz + r0.xyz;
    r8.xyz = r0.xyz * r7.www + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.y));
    r0.xyz = r7.zzz * r2.xzy;
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r7.yzw = r7.xxx * r6.xyz;
    r2.w = ps;
    ps = 0.1 - -r0.y;
    r6.w = dot(r13.xyz, r13.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r7.wyz * r9.yzw;
    r6.w = ps;
    r8.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + r8.xyz;
    ps = 5.0 * r6.x;
    r9.yzw = r2.www * r4.xyz;
    r6.x = saturate(ps);
    ps = r7.x;
    r11.xyw = r0.www * r5.xyz;
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r5.xyz = r13.xyz * r6.www;
    r7.x = ps;
    ps = UniformScalar_7.x * r7.y;
    r4.xyz = r5.xxx * r1.xyz;
    r7.y = ps;
    ps = UniformScalar_7.x * r7.z;
    r12.x = dot(r11.wxy, r5.xyz);
    r7.w = ps;
    ps = r7.x;
    r6.w = dot(r5.xyz, r9.wyz);
    ps = r6.z * ps;
    r11.xyw = r5.yzx * r6.www;
    r7.z = ps;
    ps = 1.0 - r6.x;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r11.xyw * 2.0 - r9.yzw;
    ps = ModShadowGroupColor.x * r6.z;
    r0.w = saturate(dot(r0.yxz, r6.wxy));
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.xy = r5.xy + 0.5;
    r9.z = ps;
    r6.xyw = -r9.yzx + 1.0;
    r11.xy = r5.zw * r6.xy + 0.125;
    ps = r7.z;
    r6.xz = abs(r0.xy) * abs(r0.xy);
    r6.y = ps;
    ps = UniformScalar_8.x + r6.y;
    r9.xyz = r2.xzy * r6.xxx;
    r5.x = ps;
    ps = log2(r0.w);
    r0.xyz = r2.xzy * r6.zzz;
    r11.w = ps;
    r8.xyz = r0.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = UniformScalar_8.x + r7.y;
    r0.xw = r11.xz * r11.yw;
    r5.y = ps;
    r6.xyz = r0.xxx * r10.xyz + ModShadowColor.xyz;
    r0.xyz = r9.xzy * LowerSkyColor.xyz + r8.xzy;
    ps = pow(2.0, r0.w);
    r6.w = float((r6.w >= 0.004));
    r0.w = ps;
    ps = UniformScalar_8.x + r7.w;
    r1.xyz = r0.www * r1.xzy;
    r5.z = ps;
    r7.xyz = r1.xzy * r5.xyz + r0.xyz;
    r7.xyz = r4.xyz * r2.xyz + r7.xyz;
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
