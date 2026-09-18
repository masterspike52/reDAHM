// ps_930f582fa5ef7499.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040C00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
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
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.zw = r0.xy * UniformScalar_0.xx;
    r7.y = ps;
    ps = r8.w;
    r1.xy = r1.xy * UniformVector_4.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = (-0.5) + r0.z;
    r6.xy = r7.xy * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.xzw = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.xzw = tex2D(Texture2D_0, r1.zw).wxy;
    r1.x = dot(r4.zxy, r4.zxy);
    r1.y = dot(r5.zxy, r5.zxy);
    r0.y = dot(r2.zxy, r2.zxy);
    r6.zw = r6.zw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r1.z = float((UniformScalar_5.x > 1.0));
    r0.y = ps;
    r7.xzw = (-abs(r1.zzz) >= 0.0) ? r7.xyz : 1.0;
    r0.xzw = r0.wxz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.y));
    r6.y = r6.x - 1.0;
    r1.y = ps;
    ps = rsqrt(abs(r1.x));
    r10.xyz = r1.yyy * r5.xyz;
    r5.w = ps;
    r5.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r1.yzw = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r1.x = float((UniformScalar_5.x >= 1.0));
    r7.y = saturate(ps);
    ps = TwoSidedSign.x;
    r5.xyz = r5.xyz * r8.xyz;
    ps = UniformVector_2.z * ps;
    r8.xyz = r5.www * r4.xyz;
    r4.x = ps;
    r6.x = r4.x * r0.x - TwoSidedSign.x;
    r4.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r7.xzw;
    ps = r3.w;
    r9.xyz = r0.yyy * r2.xyz;
    ps = 0.0001 * ps;
    r0.y = r9.z + 0.1;
    r2.y = saturate(ps);
    ps = r5.x;
    r7.x = saturate(r0.y * 5.0);
    ps = r4.x * ps;
    r0.xy = -r7.xy + 1.0;
    r2.x = ps;
    ps = r5.y;
    r2.zw = r0.xx * ModShadowGroupColor.xy;
    ps = r4.y * ps;
    r7.yzw = -r2.yzw + 1.0;
    r2.y = ps;
    ps = r5.z;
    r7.x = r7.y * UniformScalar_1.x;
    r0.zw = r7.xx * r6.zw + r0.zw;
    ps = r4.z * ps;
    r6.zw = r0.zw * UniformVector_2.xy;
    r2.z = ps;
    r0.z = r6.x * r7.y + TwoSidedSign.x;
    r4.xyz = r6.yzw * r7.yyy + float3(1.0, 0.0, 0.0);
    r4.yzw = (r7.xyy > 0.0) ? r4.xyz : float3(1.0, 0.0, 0.0);
    r0.z = (r7.y > 0.0) ? r0.z : TwoSidedSign.x;
    r4.x = (r7.y >= 0.0) ? r0.z : TwoSidedSign.x;
    r4.yzw = (r7.yyx >= 0.0) ? r4.zwy : float3(0.0, 0.0, 1.0);
    r2.xyz = r2.xyz * r4.www;
    r6.xyz = r2.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r0.x = dot(r4.xyz, r4.xyz);
    r2.xyz = r2.xyz * r12.xyz;
    r5.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.x));
    r1.x = float((r0.y >= 0.004));
    r0.x = ps;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xyw = r0.yzx * TwoSidedSign.xxx;
    r11.x = dot(r10.zxy, r0.wxy);
    r0.z = dot(r0.wxy, r8.zxy);
    r10.xyz = r0.xyw * r0.zzz;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    r2.w = saturate(dot(r9.zxy, r8.zxy));
    r7.xy = r4.zw * r7.zw + 0.125;
    ps = ConstantLighting.x * r0.w;
    r4.yz = r4.xy + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r4.zw = abs(r4.yz) * abs(r4.yz);
    r4.y = ps;
    ps = log2(r2.w);
    r0.z = r7.x * r7.y;
    r0.x = ps;
    r1.yzw = r0.zzz * r1.yzw + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.xzy * r4.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r8.xyz = r2.xzy * r4.www;
    r0.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
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
