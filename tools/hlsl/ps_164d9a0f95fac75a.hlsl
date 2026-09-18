// ps_164d9a0f95fac75a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003A8 10040D00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_2, r0.xy).xzyw;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = ps;
    ps = r7.w;
    r1.xy = r1.xy * UniformVector_4.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.w = saturate(r3.w * 0.0001);
    r1.z = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r1.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    ps = UniformVector_3.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r1.x = float((UniformScalar_3.x >= 1.0));
    r12.x = ps;
    ps = UniformVector_3.y;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r8.w = dot(r4.zxy, r4.zxy);
    r12.y = ps;
    ps = UniformVector_3.z;
    r6.w = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r12.z = ps;
    ps = r7.z;
    r0.z = float((UniformScalar_3.x > 1.0));
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r8.xyz = r6.xyz * AmbientColorAndSkyFactor.xyz;
    r11.x = ps;
    r0.yzw = (-abs(r0.zzz) >= 0.0) ? r1.yzw : 1.0;
    ps = rsqrt(abs(r6.w));
    r1.yzw = r13.xyz * r13.www;
    r6.w = ps;
    r10.xyz = r10.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r13.yzw = r10.xyz * UniformVector_2.zxy;
    r8.w = ps;
    ps = UniformScalar_4.x * r7.y;
    r10.xyz = r6.www * r5.xyz;
    r11.w = ps;
    ps = rsqrt(abs(r0.x));
    r5.xyw = r12.yzx * r1.zwy;
    r0.x = ps;
    r0.yzw = (-abs(r1.xxx) >= 0.0) ? 1.0 : r0.yzw;
    ps = UniformScalar_4.x * r0.y;
    r1.xzw = r0.xxx * r2.xyz;
    r1.y = ps;
    ps = 0.1 - -r1.w;
    r2.xyz = r5.wxy + UniformVector_0.xyz;
    r0.x = ps;
    r12.xyz = r0.yzw * r7.xzy + r5.wxy;
    r8.xyz = r8.xyz * r12.xyz + r2.xyz;
    ps = 5.0 * r0.x;
    r2.zw = r11.xw * r0.zw;
    r13.x = saturate(ps);
    ps = r1.y;
    r0.x = dot(r5.ywx, float3(0.11, 0.3, 0.59));
    ps = r7.x * ps;
    r0.x = r0.x - r5.w;
    r2.y = ps;
    ps = r0.x;
    r5.xyz = r12.xyz * r6.xyz;
    ps = r5.w + ps;
    r0.xz = -r13.yx + 1.0;
    r1.y = saturate(ps);
    ps = OpacityOverride.x;
    r6.yz = -r13.zw * r1.yy;
    r12.x = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r6.x = r0.x * r1.y;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r7.yzw = r13.yzw + r6.xyz;
    r12.z = ps;
    r6 = -r12.wxyz + 1.0;
    ps = r8.w;
    r7.x = r7.y - 1.0;
    ps = r4.x * ps;
    r0.yzw = r7.zwx * r6.xxx;
    r7.x = ps;
    ps = r8.w;
    r0.x = r0.w + 1.0;
    r0.xyz = (r6.xxx > 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    r0.yzw = (r6.xxx >= 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    ps = r4.y * ps;
    r0.x = dot(r0.yzw, r0.yzw);
    r7.y = ps;
    ps = rsqrt(abs(r0.x));
    r2.x = float((r6.y >= 0.004));
    r0.x = ps;
    ps = r8.w;
    r0.xyw = r0.zwy * r0.xxx;
    ps = r4.z * ps;
    r11.x = dot(r10.zxy, r0.wxy);
    r7.z = ps;
    r0.z = dot(r0.wxy, r7.zxy);
    ps = 1.0 - r1.y;
    r10.xyz = r0.xyw * r0.zzz;
    r0.z = ps;
    ps = UniformScalar_5.x + r2.y;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.x = ps;
    r7.xyz = r10.xyz * 2.0 - r7.xyz;
    ps = UniformScalar_5.x + r2.z;
    r1.y = saturate(dot(r1.wxz, r7.zxy));
    r6.y = ps;
    r1.xz = r4.zw * r6.zw + 0.125;
    ps = UniformScalar_5.x + r2.w;
    r4.xy = r4.xy + 0.5;
    r6.z = ps;
    ps = ConstantLighting.x * r0.w;
    r2.zw = abs(r4.xy) * abs(r4.xy);
    r2.y = ps;
    ps = log2(r1.y);
    r1.x = r1.x * r1.z;
    r0.x = ps;
    r1.xyz = r1.xxx * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r5.xzy * r2.zzz;
    r1.w = ps;
    ps = pow(2.0, r1.w);
    r4.xyz = r5.xzy * r2.www;
    r1.w = ps;
    r4.xyz = r4.xyz * UpperSkyColor.xzy + r8.xzy;
    r4.xyz = r7.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = ConstantLighting.y * r0.w;
    r7.xyz = r1.www * ConstantLighting.xyz;
    r2.z = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r7.xzy * r0.zzz;
    r2.w = ps;
    r0.xyz = r7.xyz * r6.xzy + r4.xzy;
    r0.xyz = r2.yzw * r5.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r2.x + r3.w;
    r0.xyz = r1.xyz * r2.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
