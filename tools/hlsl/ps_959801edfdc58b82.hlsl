// ps_959801edfdc58b82.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10041000 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c16); // float3
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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_4, r0.xy);
    ps = UniformVector_4.y;
    r7.xy = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r6.y = UniformScalar_1.x * UniformVector_2.x;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformVector_2.x * UniformScalar_4.x;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r14.w - 0.5;
    r7.w = ps;
    ps = UniformVector_4.x * r6.y;
    r7.zw = r7.zw * abs(r8.xy);
    r9.x = ps;
    ps = UniformVector_4.x * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r9.z = ps;
    ps = OpacityOverride.x;
    r9.y = UniformScalar_2.x * UniformVector_4.y;
    r6.w = saturate(ps);
    r8 = r9 + r0.xyxy;
    r13.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16 = tex2D(Texture2D_1, r8.xy);
    r10 = tex2D(Texture2D_2, r8.zw);
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    ps = -ModShadowColor.x;
    r8.w = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r7.y = saturate(r3.w * 0.0001);
    r9.x = ps;
    ps = UniformVector_3.x;
    r7.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r7.z = dot(r2.zxy, r2.zxy);
    r9.y = ps;
    ps = UniformVector_3.y;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r9.z = ps;
    ps = UniformVector_3.z;
    r0.w = float((UniformScalar_8.x > 1.0));
    ps = 2e+01 * ps;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r9.w = ps;
    r15.xyz = (-abs(r0.www) >= 0.0) ? r8.xyz : 1.0;
    ps = rsqrt(abs(r7.x));
    r8.xyz = r14.xyz * UniformScalar_9.xxx;
    r0.w = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r6.x;
    r11.xyz = r10.xyz * r10.www;
    r7.x = ps;
    ps = rsqrt(abs(r7.z));
    r10.xyz = r0.www * r4.xyz;
    r7.z = ps;
    r4.xyz = r16.xyz * r16.www + r11.xyz;
    ps = UniformVector_2.x * r6.y;
    r11.xyz = r7.zzz * r2.xyz;
    r7.z = ps;
    r15.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r15.xyz;
    r8.xyz = r8.xzy * r15.xzy + UniformScalar_10.xxx;
    ps = UniformVector_2.y * r6.z;
    r6.x = r11.z + 0.1;
    r7.w = ps;
    ps = 5.0 * r6.x;
    r2.xyw = r9.zwy * r4.yzx;
    r9.z = saturate(ps);
    ps = r7.x;
    r6.z = dot(r2.ywx, float3(0.11, 0.3, 0.59));
    r6.y = ps;
    ps = 1.0 - r6.y;
    r4.xyz = r2.wxy + UniformVector_0.xyz;
    r6.x = ps;
    r2.xyz = r15.xyz * r14.xyz + r2.wxy;
    r4.xyz = r12.xyz * r2.xyz + r4.xyz;
    ps = 1.0 - r7.y;
    r6.y = r6.z - r2.w;
    r0.w = ps;
    ps = rsqrt(abs(r8.w));
    r9.w = saturate(r6.y + r2.w);
    r6.y = ps;
    ps = r6.x;
    r5.xyz = r6.yyy * r5.xyz;
    ps = r9.w * ps;
    r6.xz = -r9.wz + 1.0;
    r9.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r9.zw = -r7.zw * r9.ww;
    r6.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.yzw = r7.xzw + r9.yzw;
    r6.z = ps;
    ps = (-1.0) - -r7.y;
    r0.xyz = r2.xyz * r0.xyz;
    r7.x = ps;
    ps = 1.0 - r6.y;
    r7.yzw = r7.zwx * r0.www;
    r2.y = ps;
    ps = 1.0 - r6.z;
    r7.x = r7.w + 1.0;
    r2.z = ps;
    r7.xyz = (r0.www > 0.0) ? r7.xyz : float3(1.0, 0.0, 0.0);
    r7.xyz = (r0.www >= 0.0) ? r7.xyz : float3(1.0, 0.0, 0.0);
    ps = 1.0 - r6.w;
    r7.w = dot(r7.xyz, r7.xyz);
    r2.w = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = float((r2.w >= 0.004));
    r6.y = ps;
    ps = -ModShadowColor.y;
    r7.xyw = r7.yzx * r6.yyy;
    ps = 1.0 + ps;
    r13.x = dot(r5.zxy, r7.wxy);
    r9.y = ps;
    ps = -ModShadowColor.z;
    r6.y = dot(r7.wxy, r10.zxy);
    ps = 1.0 + ps;
    r12.xyz = r7.xyw * r6.yyy;
    r9.z = ps;
    ps = r7.w;
    r5 = r13.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r10.xyz = r12.xyz * 2.0 - r10.xyz;
    ps = r1.x * ps;
    r6.y = saturate(dot(r11.zxy, r10.zxy));
    r2.x = ps;
    r5.xy = r5.xy * r2.yz + 0.125;
    ps = r7.w;
    r2.yz = r5.zw + 0.5;
    ps = r1.y * ps;
    r2.zw = abs(r2.yz) * abs(r2.yz);
    r2.y = ps;
    ps = log2(r6.y);
    r7.z = r5.x * r5.y;
    r6.y = ps;
    r7.xyz = r7.zzz * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r5.xyz = r0.xzy * r2.zzz;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r9.xyz = r0.xzy * r2.www;
    r6.y = ps;
    r4.xyz = r9.xyz * UpperSkyColor.xzy + r4.xzy;
    r4.xyz = r5.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = r7.w;
    r5.xyz = r6.yyy * r1.xyz;
    ps = r1.z * ps;
    r6.xyz = r5.xzy * r6.xxx;
    r2.z = ps;
    r6.xyz = r6.xyz * r8.xyz + r4.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
