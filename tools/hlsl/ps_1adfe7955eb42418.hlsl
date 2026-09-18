// ps_1adfe7955eb42418.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040D00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LightMapScale : register(c17); // float3
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
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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

    r9 = tex2D(Texture2D_2, r1.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r1.xy * UniformScalar_0.xx;
    r7.w = ps;
    ps = r9.x;
    r7.xy = r1.wz * UniformVector_4.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    ps = (-0.5) + r6.y;
    r7.zw = r7.zw * abs(r8.xy);
    r6.y = ps;
    ps = 0.0001 * r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r9.x = saturate(ps);
    r11.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.yzw = tex2D(Texture2D_3, r7.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xz).wxy;
    ps = TwoSidedSign.x;
    r0.x = float((UniformScalar_5.x >= 1.0));
    ps = UniformVector_2.z * ps;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.x = dot(r4.zxy, r4.zxy);
    r12.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.z = dot(r5.zxy, r5.zxy);
    r12.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.w = float((UniformScalar_5.x > 1.0));
    r12.z = ps;
    r11.xw = r6.yz * 2.0 - 1.0;
    r7.yzw = (-abs(r0.www) >= 0.0) ? r7.yzw : 1.0;
    r1.xzw = r1.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r8.xyz = r8.xyz * LightMapScale.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r7.x));
    r13.xyz = r12.xyz * r9.yzw;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r12.xyz = r0.zzz * r5.xyz;
    r6.w = ps;
    r1.x = r0.y * r1.x - TwoSidedSign.x;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r7.yzw;
    ps = OpacityOverride.x;
    r7.yzw = r6.www * r2.xyz;
    r2.y = saturate(ps);
    ps = (-1.0) + r6.x;
    r6.w = r7.w + 0.1;
    r1.y = ps;
    ps = r13.x;
    r2.x = saturate(r6.w * 5.0);
    ps = r0.x * ps;
    r6.xz = -r2.xy + 1.0;
    r0.x = ps;
    ps = r13.y;
    r9.yz = r6.xx * ModShadowGroupColor.xy;
    ps = r0.y * ps;
    r9.yzw = -r9.xyz + 1.0;
    r0.y = ps;
    ps = r13.z;
    r9.x = r9.y * UniformScalar_1.x;
    r6.yw = r9.xx * r11.xw + r1.zw;
    ps = r0.z * ps;
    r1.zw = r6.yw * UniformVector_2.xy;
    r0.z = ps;
    r6.y = r1.x * r9.y + TwoSidedSign.x;
    r1.xyz = r1.yzw * r9.yyy + float3(1.0, 0.0, 0.0);
    r1.yzw = (r9.xyy > 0.0) ? r1.xyz : float3(1.0, 0.0, 0.0);
    r6.y = (r9.y > 0.0) ? r6.y : TwoSidedSign.x;
    r1.x = (r9.y >= 0.0) ? r6.y : TwoSidedSign.x;
    r1.yzw = (r9.yyx >= 0.0) ? r1.zwy : float3(0.0, 0.0, 1.0);
    r0.xyz = r0.xyz * r1.www;
    r2.xyz = r0.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r7.x;
    r6.y = dot(r1.xyz, r1.xyz);
    ps = r4.x * ps;
    r0.xyz = r0.xyz * r10.xyz;
    r6.x = ps;
    r5.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.y));
    r6.w = float((r6.z >= 0.004));
    r6.y = ps;
    ps = r7.x;
    r1.xyz = r1.xyz * r6.yyy;
    ps = r4.y * ps;
    r10.xyz = r1.xyz * TwoSidedSign.xxx;
    r6.y = ps;
    ps = r7.x;
    r1.xyz = r8.xzy * r10.xxx;
    ps = r4.z * ps;
    r11.x = dot(r12.zxy, r10.xyz);
    r6.z = ps;
    ps = -ModShadowColor.x;
    r7.x = dot(r10.xyz, r6.zxy);
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * r7.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r10.xyz * 2.0 - r6.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r7.wyz, r6.zxy));
    r7.y = ps;
    r6.yz = r4.zw * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r4.xy + 0.5;
    ps = 1.0 + ps;
    r4.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r4.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r5.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r4.xxx;
    r7.w = ps;
    r4.xyz = r8.xzy * r7.www;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
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
