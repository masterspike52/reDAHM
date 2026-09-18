// ps_7e42fdef5260a257.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003F0 10040E00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 ConstantLighting : register(c20); // float3
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c17); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = r0.xy * UniformScalar_0.xx;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.xy * UniformVector_4.xy;
    r7.w = ps;
    ps = r10.w;
    r8.zw = r0.xy * UniformScalar_7.xx;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r8.xy = r7.zw * abs(r6.xy);
    r0.z = ps;
    ps = r1.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r7.w = saturate(ps);
    r6.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r12.w = tex2D(Texture2D_4, r8.zw).x;
    r11.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r1.xyz = tex2D(Texture2D_0, r1.zw).wxy;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = UniformScalar_6.x;
    r6.x = dot(r5.zxy, r5.zxy);
    ps = -UniformScalar_5.x + ps;
    r0.w = float((UniformScalar_10.x >= 1.0));
    r0.x = ps;
    ps = -UniformScalar_5.x;
    r1.w = float((UniformScalar_10.x > 1.0));
    ps = 1.0 + ps;
    r0.y = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r11.x = r8.z * 2.0 - 1.0;
    r8.zw = r1.yz * 2.0 - 1.0;
    r8.xy = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r14.yz = r9.xy * 0.875;
    r0.y = ps;
    ps = 1.0 / r0.x;
    r0.z = r0.z - r7.w;
    r0.x = ps;
    r7.xyz = (-abs(r1.www) >= 0.0) ? r7.xyz : 1.0;
    r7.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r7.xyz;
    ps = r0.z;
    r1.w = dot(r4.zxy, r4.zxy);
    ps = r0.x * ps;
    r12.xyz = r0.yyy * r2.xyz;
    r0.w = saturate(ps);
    r9.xyz = r0.www * r10.xyz;
    r10.xyz = r11.yzw * r10.xyz - r9.xyz;
    r0.xy = r12.zw + float2(0.1, 0.5);
    ps = 5.0 * r0.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.zw = -r0.zw + 1.0;
    r1.w = ps;
    ps = rsqrt(abs(r6.x));
    r11.w = r0.w * r0.y;
    r0.x = ps;
    ps = OpacityOverride.x;
    r2.xyz = r0.xxx * r5.xyz;
    r0.x = saturate(ps);
    ps = r3.w;
    r4.xyz = r1.www * r4.xyz;
    ps = 0.0001 * ps;
    r0.yz = r0.zz * ModShadowGroupColor.xy;
    r0.w = saturate(ps);
    ps = (-1.0) + r1.x;
    r5 = -r0.wxyz + 1.0;
    r14.x = ps;
    r0.xzw = r14.xyz * r5.xzw + float3(1.0, 0.125, 0.125);
    r0.y = r5.x * UniformScalar_1.x;
    r11.yz = r0.yy * r8.zw + r8.xy;
    r0.x = (r0.y > 0.0) ? r0.x : 1.0;
    ps = r0.z * r0.w;
    r8.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r0.z = ps;
    r1.yzw = r0.zzz * r13.xyz + ModShadowColor.xyz;
    r2.w = (r0.y >= 0.0) ? r0.x : 1.0;
    r0.yzw = r11.xyz * UniformVector_2.zxy;
    r0.x = dot(r0.yzw, r0.yzw);
    ps = rsqrt(abs(r0.x));
    r1.x = float((r5.y >= 0.004));
    r0.x = ps;
    r0.xyz = r0.yzw * r0.xxx;
    r0.w = dot(r0.xyz, r4.zxy);
    r5.xyz = r0.yzx * r0.www;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r0.w = saturate(dot(r12.zxy, r4.zxy));
    ps = log2(r0.w);
    r2.x = dot(r2.zxy, r0.xyz);
    r2.y = ps;
    r11.xyz = r2.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r11.z);
    r4.xyz = r0.xxx * ConstantLighting.xyz;
    r0.w = ps;
    r0.xyz = r11.wxy + float3(-0.5, 0.5, 0.5);
    ps = 5.0000005 * r0.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r4.w = saturate(ps);
    r5.xyz = r4.www * r10.xyz + r9.xyz;
    r5.xyz = r8.xyz * r5.xyz;
    r5.xyz = r5.xyz * r7.xyz;
    ps = ConstantLighting.x * r0.w;
    r5.xyz = r5.xyz * r2.www;
    r6.x = ps;
    ps = abs(r0.y) * abs(r0.y);
    r9.xyz = -r5.xyz + r6.yzw;
    r2.w = ps;
    ps = abs(r0.z) * abs(r0.z);
    r2.xyz = r5.xyz * r2.xyz;
    r0.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r2.xzy * r2.www;
    r6.y = ps;
    ps = ConstantLighting.y * r0.w;
    r8.xyz = r2.xzy * r0.xxx;
    r6.z = ps;
    r0.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r5.xyz = r9.xyz * UniformScalar_11.xxx + r5.xyz;
    r5.xyz = r5.xzy * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.xyz = r8.xyz * UpperSkyColor.xzy + r0.xzy;
    r0.xyz = r7.xzy * LowerSkyColor.xyz + r0.xzy;
    r0.xyz = r6.xyz * r5.xyz + r0.xzy;
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
