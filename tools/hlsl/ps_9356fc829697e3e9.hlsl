// ps_9356fc829697e3e9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040D00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r5.z = ps;
    ps = r8.w;
    r6.zw = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r5.xz = r5.xz * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r5.xzw = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r6.zw).xyz;
    r0.xyw = tex2D(Texture2D_0, r6.xy).xyw;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = dot(r4.zxy, r4.zxy);
    r5.y = dot(r1.zxy, r1.zxy);
    r11.xw = r0.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r6.z = float((UniformScalar_5.x > 1.0));
    r5.y = ps;
    r0.xyz = (-abs(r6.zzz) >= 0.0) ? r7.xyz : 1.0;
    r5.xzw = r5.wxz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r13.y = r0.w - 1.0;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r10.xyz = r6.yyy * r4.xyz;
    r0.w = ps;
    r4.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.x = float((UniformScalar_5.x >= 1.0));
    r7.y = saturate(ps);
    ps = TwoSidedSign.x;
    r4.xyz = r4.xyz * r8.xyz;
    ps = UniformVector_2.z * ps;
    r8.xyz = r0.www * r3.xyz;
    r0.w = ps;
    r13.x = r0.w * r5.x - TwoSidedSign.x;
    r0.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r0.xyz;
    ps = r2.w;
    r9.xyz = r5.yyy * r1.xyz;
    ps = 0.0001 * ps;
    r5.y = r9.z + 0.1;
    r1.x = saturate(ps);
    ps = r4.x;
    r7.x = saturate(r5.y * 5.0);
    ps = r0.x * ps;
    r5.xy = -r7.xy + 1.0;
    r0.x = ps;
    ps = r4.y;
    r1.yz = r5.xx * ModShadowGroupColor.xy;
    ps = r0.y * ps;
    r7.yzw = -r1.xyz + 1.0;
    r0.y = ps;
    ps = r4.z;
    r7.x = r7.y * UniformScalar_1.x;
    r5.zw = r7.xx * r11.xw + r5.zw;
    ps = r0.z * ps;
    r13.zw = r5.zw * UniformVector_2.xy;
    r0.z = ps;
    r5.z = r13.x * r7.y + TwoSidedSign.x;
    r1.xyz = r13.yzw * r7.yyy + float3(1.0, 0.0, 0.0);
    r1.yzw = (r7.xyy > 0.0) ? r1.xyz : float3(1.0, 0.0, 0.0);
    r5.z = (r7.y > 0.0) ? r5.z : TwoSidedSign.x;
    r1.x = (r7.y >= 0.0) ? r5.z : TwoSidedSign.x;
    r1.yzw = (r7.yyx >= 0.0) ? r1.zwy : float3(0.0, 0.0, 1.0);
    r0.xyz = r0.xyz * r1.www;
    r4.xyz = r0.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r5.x = dot(r1.xyz, r1.xyz);
    r0.xyz = r0.xyz * r12.xyz;
    r3.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.x));
    r6.x = float((r5.y >= 0.004));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xyw = r5.yzx * TwoSidedSign.xxx;
    r11.x = dot(r10.zxy, r5.wxy);
    r5.z = dot(r5.wxy, r8.zxy);
    r10.xyz = r5.xyw * r5.zzz;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    r0.w = saturate(dot(r9.zxy, r8.zxy));
    r7.xy = r1.zw * r7.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r0.w);
    r5.z = r7.x * r7.y;
    r5.x = ps;
    r6.yzw = r5.zzz * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.xzy * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.xzy * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
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
