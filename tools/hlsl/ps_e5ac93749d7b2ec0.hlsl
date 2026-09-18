// ps_e5ac93749d7b2ec0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10040F00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_4, r0.xy);
    r7.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r1.xy = r1.xy * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r0.z = UniformScalar_1.x * UniformVector_2.x;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = UniformVector_2.x * UniformScalar_4.x;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = r14.w - 0.5;
    r1.w = ps;
    ps = UniformVector_4.x * r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r7.x = ps;
    ps = UniformVector_4.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r7.z = ps;
    r6 = r7 + r0.xyxy;
    r11.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r9 = tex2D(Texture2D_1, r6.xy);
    r10 = tex2D(Texture2D_2, r6.zw);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r6.y = saturate(r3.w * 0.0001);
    r1.w = saturate(ps);
    ps = UniformVector_3.x;
    r6.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r6.z = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = UniformVector_3.y;
    r1.x = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r8.y = ps;
    ps = UniformVector_3.z;
    r1.y = float((UniformScalar_8.x > 1.0));
    ps = 2e+01 * ps;
    r12.xyz = r13.xyz * AmbientColorAndSkyFactor.xyz;
    r8.z = ps;
    r15.xyz = (-abs(r1.yyy) >= 0.0) ? r7.xyz : 1.0;
    ps = rsqrt(abs(r1.x));
    r7.xyz = r14.xyz * UniformScalar_9.xxx;
    r7.w = ps;
    r0.xyz = r0.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r0.x;
    r1.xyz = r10.xyz * r10.www;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r10.xyz = r7.www * r4.xyz;
    r4.x = ps;
    r1.xyz = r9.xyz * r9.www + r1.xyz;
    ps = UniformVector_2.x * r0.y;
    r9.xyz = r4.xxx * r2.xyz;
    r6.z = ps;
    r4.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r15.xyz;
    r7.xyz = r7.xzy * r4.xzy + UniformScalar_10.xxx;
    ps = UniformVector_2.y * r0.z;
    r0.x = r9.z + 0.1;
    r6.w = ps;
    ps = 5.0 * r0.x;
    r2.xyz = r8.xyz * r1.xyz;
    r1.y = saturate(ps);
    ps = r6.x;
    r0.z = dot(r2.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    ps = 1.0 - r0.y;
    r8.xyz = r2.xyz + UniformVector_0.xyz;
    r0.x = ps;
    r4.xyz = r4.xyz * r14.xyz + r2.xyz;
    r8.xyz = r12.xyz * r4.xyz + r8.xyz;
    ps = 1.0 - r6.y;
    r0.y = r0.z - r2.x;
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.z = saturate(r0.y + r2.x);
    r0.y = ps;
    ps = r0.x;
    r12.xyz = r0.yyy * r5.xyz;
    ps = r1.z * ps;
    r0.zw = -r1.zy + 1.0;
    r2.x = ps;
    ps = ModShadowGroupColor.x * r0.w;
    r2.yz = -r6.zw * r1.zz;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r0.w;
    r2.yzw = r6.xzw + r2.xyz;
    r1.z = ps;
    ps = (-1.0) - -r2.y;
    r4.xyz = r4.xyz * r13.xyz;
    r2.x = ps;
    ps = 1.0 - r1.y;
    r2.yzw = r2.zwx * r1.xxx;
    r5.x = ps;
    ps = 1.0 - r1.z;
    r2.x = r2.w + 1.0;
    r5.y = ps;
    r0.xyw = (r1.xxx > 0.0) ? r2.xyz : float3(1.0, 0.0, 0.0);
    r2.xyz = (r1.xxx >= 0.0) ? r0.xyw : float3(1.0, 0.0, 0.0);
    ps = 1.0 - r1.w;
    r0.x = dot(r2.xyz, r2.xyz);
    r5.z = ps;
    ps = rsqrt(abs(r0.x));
    r1.x = float((r5.z >= 0.004));
    r0.x = ps;
    r0.xyw = r2.yzx * r0.xxx;
    ps = -ModShadowColor.x;
    r11.x = dot(r12.zxy, r0.wxy);
    ps = 1.0 + ps;
    r1.z = dot(r0.wxy, r10.zxy);
    r1.y = ps;
    ps = -ModShadowColor.y;
    r6.xyz = r0.xyw * r1.zzz;
    ps = 1.0 + ps;
    r2 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r1.z = ps;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    ps = -ModShadowColor.z;
    r4.w = saturate(dot(r9.zxy, r6.zxy));
    r5.xy = r2.zw * r5.xy + 0.125;
    ps = 1.0 + ps;
    r2.xy = r2.xy + 0.5;
    r1.w = ps;
    ps = ConstantLighting.x * r0.w;
    r2.yz = abs(r2.xy) * abs(r2.xy);
    r2.x = ps;
    ps = log2(r4.w);
    r2.w = r5.x * r5.y;
    r0.x = ps;
    r1.yzw = r2.www * r1.yzw + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r6.xyz = r4.xzy * r2.yyy;
    r2.y = ps;
    ps = pow(2.0, r2.y);
    r5.xyz = r4.xzy * r2.zzz;
    r2.y = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r6.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.y * r0.w;
    r6.xyz = r2.yyy * ConstantLighting.xyz;
    r2.y = ps;
    ps = ConstantLighting.z * r0.w;
    r6.xyz = r6.xzy * r0.zzz;
    r2.z = ps;
    r0.xyz = r6.xyz * r7.xyz + r5.xzy;
    r0.xyz = r2.xyz * r4.xyz + r0.xzy;
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
