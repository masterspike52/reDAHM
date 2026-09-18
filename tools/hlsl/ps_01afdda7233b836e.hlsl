// ps_01afdda7233b836e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10041100 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = ps;
    ps = r13.w;
    r1.xy = r1.xy * UniformVector_5.xy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r7.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r9 = tex2D(Texture2D_2, r0.xy);
    r15.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r17 = tex2D(Texture2D_1, r0.xy);
    r1.xzw = tex2D(Texture2D_3, r1.xy).xyz;
    ps = OpacityOverride.x;
    r0.w = float((UniformScalar_5.x >= 0.0));
    r11.x = saturate(ps);
    ps = r3.w;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r14.xyz = UniformVector_3.xzy * 2e+01;
    r1.y = saturate(ps);
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r7.w = float((UniformScalar_8.x >= 1.0));
    r7.x = ps;
    ps = UniformVector_4.x;
    r8.w = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r16.x = ps;
    ps = UniformVector_4.z;
    r11.yzw = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r0.y = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_4.y;
    r12.xyz = r11.yzw * AmbientColorAndSkyFactor.xyz;
    ps = 2e+01 * ps;
    r6.xyz = r13.xyz * UniformScalar_9.xxx;
    r16.z = ps;
    r10.xyz = (-abs(r0.yyy) >= 0.0) ? r1.xzw : 1.0;
    ps = rsqrt(abs(r0.x));
    r8.xyz = r17.xzy * r17.www;
    r1.z = ps;
    r0.xyz = r15.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r0.x;
    r15.xyz = r9.xzy * r9.www;
    r1.x = ps;
    ps = UniformVector_2.x * r0.y;
    r9.xyz = r1.zzz * r2.xyz;
    r1.z = ps;
    ps = UniformVector_2.y * r0.z;
    r15.xyz = r16.xyz * r15.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r8.w));
    r8.xyz = r14.xyz * r8.xyz;
    r0.y = ps;
    r2.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r10.xyz;
    r6.xyz = r6.xzy * r2.xzy + UniformScalar_10.xxx;
    r14.xyz = (-abs(r7.xxx) >= 0.0) ? r15.xyz : r8.xyz;
    ps = rsqrt(abs(r6.w));
    r0.x = r9.z + 0.1;
    r0.z = ps;
    ps = 5.0 * r0.x;
    r8.xyz = r0.zzz * r4.xyz;
    r0.x = saturate(ps);
    ps = r1.x;
    r10.xyz = r0.yyy * r5.xyz;
    r0.y = ps;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r15.xyz : r14.xyz;
    ps = 1.0 - r0.y;
    r0.z = saturate(dot(r5.zyx, float3(0.59, 0.11, 0.3)));
    r0.w = ps;
    ps = 1.0 - r1.y;
    r4.xyz = r5.xzy + UniformVector_0.xyz;
    r2.w = ps;
    r2.xyz = r2.xyz * r13.xyz + r5.xzy;
    r4.yzw = r12.xyz * r2.xyz + r4.xyz;
    ps = r0.w;
    r0.y = dot(r5.yxz, float3(0.11, 0.3, 0.59));
    ps = r0.z * ps;
    r4.x = r0.y - r5.x;
    r0.y = ps;
    ps = r4.x;
    r0.zw = -r1.zw * r0.zz;
    ps = r5.x + ps;
    r1.yzw = r1.xzw + r0.yzw;
    r0.z = saturate(ps);
    ps = (-1.0) - -r1.y;
    r0.zw = -r0.zx + 1.0;
    r1.x = ps;
    ps = ModShadowGroupColor.x * r0.w;
    r2.xyz = r2.xyz * r11.yzw;
    r11.y = ps;
    ps = ModShadowGroupColor.y * r0.w;
    r1.yzw = r1.xzw * r2.www;
    r11.z = ps;
    ps = 1.0 + r1.y;
    r5.xyz = -r11.yxz + 1.0;
    r1.x = ps;
    r0.xyw = (r2.www > 0.0) ? r1.xzw : float3(1.0, 0.0, 0.0);
    r1.yzw = (r2.www >= 0.0) ? r0.xyw : float3(1.0, 0.0, 0.0);
    r0.x = dot(r1.yzw, r1.yzw);
    ps = rsqrt(abs(r0.x));
    r1.x = float((r5.y >= 0.004));
    r0.x = ps;
    r0.xyw = r1.zwy * r0.xxx;
    ps = -ModShadowColor.x;
    r7.x = dot(r10.zxy, r0.wxy);
    ps = 1.0 + ps;
    r1.z = dot(r0.wxy, r8.zxy);
    r1.y = ps;
    ps = -ModShadowColor.y;
    r10.xyz = r0.xyw * r1.zzz;
    ps = 1.0 + ps;
    r7 = r7.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r1.z = ps;
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = -ModShadowColor.z;
    r5.y = saturate(dot(r9.zxy, r8.zxy));
    r7.xy = r7.xy * r5.xz + 0.125;
    ps = 1.0 + ps;
    r5.xz = r7.zw + 0.5;
    r1.w = ps;
    ps = ConstantLighting.x * r0.w;
    r5.xw = abs(r5.xz) * abs(r5.xz);
    r4.x = ps;
    ps = log2(r5.y);
    r2.w = r7.x * r7.y;
    r0.x = ps;
    r1.yzw = r2.www * r1.yzw + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r5.xyz = r2.xzy * r5.xxx;
    r2.w = ps;
    ps = pow(2.0, r2.w);
    r7.xyz = r2.xzy * r5.www;
    r2.w = ps;
    r4.yzw = r7.xyz * UpperSkyColor.xzy + r4.ywz;
    r5.xyz = r5.xzy * LowerSkyColor.xyz + r4.ywz;
    ps = ConstantLighting.y * r0.w;
    r7.xyz = r2.www * ConstantLighting.xyz;
    r4.y = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r7.xzy * r0.zzz;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r4.xyz * r2.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.yzw;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.x + r3.w;
    r0.xyz = r2.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
