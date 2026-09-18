// ps_a1cad526884eb854.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10040F00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
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

    r13 = tex2D(Texture2D_4, r0.xy);
    r8.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r6.xy = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_2.x * UniformScalar_4.x;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r13.w - 0.5;
    r6.w = ps;
    ps = UniformVector_4.x * r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r8.x = ps;
    ps = UniformVector_4.x * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r8.z = ps;
    r5 = r8 + r0.xyxy;
    r11.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r9 = tex2D(Texture2D_1, r5.xy);
    r8 = tex2D(Texture2D_2, r5.zw);
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r5.w = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r0.y = saturate(r2.w * 0.0001);
    r6.w = saturate(ps);
    ps = UniformVector_3.x;
    r0.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r0.z = dot(r1.zxy, r1.zxy);
    r15.x = ps;
    ps = UniformVector_3.y;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r15.y = ps;
    ps = UniformVector_3.z;
    r6.y = float((UniformScalar_8.x > 1.0));
    ps = 2e+01 * ps;
    r10.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz;
    r15.z = ps;
    r14.xyz = (-abs(r6.yyy) >= 0.0) ? r7.xyz : 1.0;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r13.xyz * UniformScalar_9.xxx;
    r7.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r5.x;
    r6.xyz = r8.xyz * r8.www;
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r8.xyz = r7.www * r3.xyz;
    r0.z = ps;
    r6.xyz = r9.xyz * r9.www + r6.xyz;
    ps = UniformVector_2.x * r5.y;
    r9.xyz = r0.zzz * r1.xyz;
    r0.z = ps;
    r14.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r14.xyz;
    r7.xyz = r7.xzy * r14.xzy + UniformScalar_10.xxx;
    ps = UniformVector_2.y * r5.z;
    r5.x = r9.z + 0.1;
    r0.w = ps;
    ps = 5.0 * r5.x;
    r1.xyw = r15.yzx * r6.yzx;
    r6.y = saturate(ps);
    ps = r0.x;
    r5.z = dot(r1.ywx, float3(0.11, 0.3, 0.59));
    r5.y = ps;
    ps = 1.0 - r5.y;
    r3.xyz = r1.wxy + UniformVector_0.xyz;
    r5.x = ps;
    r1.xyz = r14.xyz * r13.xyz + r1.wxy;
    r3.xyz = r10.xyz * r1.xyz + r3.xyz;
    ps = 1.0 - r0.y;
    r5.y = r5.z - r1.w;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.z = saturate(r5.y + r1.w);
    r5.y = ps;
    ps = r5.x;
    r10.xyz = r5.yyy * r4.xyz;
    ps = r6.z * ps;
    r5.zw = -r6.zy + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r4.yz = -r0.zw * r6.zz;
    r6.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r0.yzw = r0.xzw + r4.xyz;
    r6.z = ps;
    ps = (-1.0) - -r0.y;
    r1.xyz = r1.xyz * r12.xyz;
    r0.x = ps;
    ps = 1.0 - r6.y;
    r0.yzw = r0.zwx * r6.xxx;
    r4.x = ps;
    ps = 1.0 - r6.z;
    r0.x = r0.w + 1.0;
    r4.y = ps;
    r5.xyw = (r6.xxx > 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    r0.xyz = (r6.xxx >= 0.0) ? r5.xyw : float3(1.0, 0.0, 0.0);
    ps = 1.0 - r6.w;
    r5.x = dot(r0.xyz, r0.xyz);
    r4.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = float((r4.z >= 0.004));
    r5.x = ps;
    r5.xyw = r0.yzx * r5.xxx;
    ps = -ModShadowColor.x;
    r11.x = dot(r10.zxy, r5.wxy);
    ps = 1.0 + ps;
    r6.z = dot(r5.wxy, r8.zxy);
    r6.y = ps;
    ps = -ModShadowColor.y;
    r10.xyz = r5.xyw * r6.zzz;
    ps = 1.0 + ps;
    r0 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = -ModShadowColor.z;
    r1.w = saturate(dot(r9.zxy, r8.zxy));
    r4.xy = r0.zw * r4.xy + 0.125;
    ps = 1.0 + ps;
    r0.xy = r0.xy + 0.5;
    r6.w = ps;
    ps = ConstantLighting.x * r5.w;
    r0.yz = abs(r0.xy) * abs(r0.xy);
    r0.x = ps;
    ps = log2(r1.w);
    r0.w = r4.x * r4.y;
    r5.x = ps;
    r6.yzw = r0.www * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r4.xyz = r1.xzy * r0.yyy;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r8.xyz = r1.xzy * r0.zzz;
    r0.y = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r4.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.y * r5.w;
    r4.xyz = r0.yyy * ConstantLighting.xyz;
    r0.y = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r4.xzy * r5.zzz;
    r0.z = ps;
    r5.xyz = r4.xyz * r7.xyz + r3.xzy;
    r5.xyz = r0.xyz * r1.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
