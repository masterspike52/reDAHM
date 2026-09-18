// ps_1f949f6870125a19.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10041100 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
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

    r7 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = ps;
    ps = r7.w;
    r8.xy = r1.xy * UniformVector_5.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r1.z = ps;
    ps = (-0.5) + r0.z;
    r1.xy = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r10 = tex2D(Texture2D_2, r0.xy);
    r14 = tex2D(Texture2D_1, r0.xy);
    r1.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r8.xy).xyz;
    ps = OpacityOverride.x;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    r12.w = saturate(ps);
    ps = UniformVector_4.x;
    r1.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r8.w = float((UniformScalar_11.x >= 1.0));
    r17.x = ps;
    ps = UniformVector_4.z;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r17.y = ps;
    ps = UniformVector_4.y;
    r0.y = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r17.z = ps;
    ps = r3.w;
    r6.w = float((UniformScalar_11.x > 1.0));
    ps = 0.0001 * ps;
    r8.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz;
    r0.z = saturate(ps);
    r6.xyz = (-abs(r6.www) >= 0.0) ? r6.xyz : 1.0;
    r13.xyz = r1.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r14.xyz = r14.xzy * r14.www;
    r0.y = ps;
    ps = rsqrt(abs(r0.w));
    r16.xyz = r10.xzy * r10.www;
    r6.w = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r0.yyy * r5.xyz;
    r0.x = ps;
    ps = r7.x;
    r1.xyz = r0.xxx * r2.xzy;
    r0.y = ps;
    ps = UniformScalar_12.x * r0.y;
    r2.xyz = r17.xyz * r16.xyz;
    r5.x = ps;
    ps = UniformScalar_12.x * r7.y;
    r0.xyw = r15.xyz * r14.xyz;
    r5.y = ps;
    ps = UniformScalar_12.x * r7.z;
    r13.yzw = r13.xyz * UniformVector_2.zxy;
    r5.z = ps;
    r14.xyz = (-abs(r8.www) >= 0.0) ? 1.0 : r6.xyz;
    r6.xyz = r5.xzy * r14.xzy + UniformScalar_13.xxx;
    r2.xyw = (-abs(r1.www) >= 0.0) ? r2.yzx : r0.ywx;
    ps = 0.1 - -r1.y;
    r0.w = dot(r2.xwy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = 5.0 * r0.x;
    r5.xyz = r2.wyx + UniformVector_0.xyz;
    r13.x = saturate(ps);
    r7.xyz = r14.xyz * r7.xyz + r2.wyx;
    r8.xyz = r8.xyz * r7.xyz + r5.xyz;
    ps = r0.w;
    r0.y = saturate(dot(r2.yxw, float3(0.59, 0.11, 0.3)));
    ps = -r2.w + ps;
    r5.yz = -r13.zw * r0.yy;
    r0.x = ps;
    ps = r0.x;
    r2.xyz = r7.xyz * r12.xyz;
    ps = r2.w + ps;
    r0.xw = -r13.yx + 1.0;
    r12.x = saturate(ps);
    ps = ModShadowGroupColor.x * r0.w;
    r5.x = r0.x * r0.y;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r0.w;
    r7.yzw = r13.yzw + r5.xyz;
    r12.z = ps;
    ps = 1.0 - r0.z;
    r5 = -r12.wyzx + 1.0;
    r0.w = ps;
    ps = r6.w;
    r7.x = r7.y - 1.0;
    ps = r4.x * ps;
    r12.yzw = r7.zwx * r0.www;
    r7.x = ps;
    ps = r6.w;
    r12.x = r12.w + 1.0;
    r0.xyz = (r0.www > 0.0) ? r12.xyz : float3(1.0, 0.0, 0.0);
    r0.yzw = (r0.www >= 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    ps = r4.y * ps;
    r0.x = dot(r0.yzw, r0.yzw);
    r7.y = ps;
    ps = rsqrt(abs(r0.x));
    r1.w = float((r5.x >= 0.004));
    r0.x = ps;
    ps = r6.w;
    r0.xyw = r0.zwy * r0.xxx;
    ps = r4.z * ps;
    r11.x = dot(r10.zxy, r0.wxy);
    r7.z = ps;
    r0.z = dot(r0.wxy, r7.zxy);
    r10.xyz = r0.xyw * r0.zzz;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.xyz = r10.xyz * 2.0 - r7.xyz;
    r1.x = saturate(dot(r1.yxz, r7.zxy));
    r1.yz = r4.zw * r5.yz + 0.125;
    r4.xy = r4.xy + 0.5;
    ps = ConstantLighting.x * r0.w;
    r4.yz = abs(r4.xy) * abs(r4.xy);
    r4.x = ps;
    ps = log2(r1.x);
    r0.z = r1.y * r1.z;
    r0.x = ps;
    r1.xyz = r0.zzz * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.xzy * r4.yyy;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r4.yzw = r2.xzy * r4.zzz;
    r0.z = ps;
    r4.yzw = r4.yzw * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r4.ywz;
    ps = ConstantLighting.y * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xyz;
    r4.y = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r7.xzy * r5.www;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r4.xyz * r2.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r3.w;
    r0.xyz = r2.xyz * r1.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
