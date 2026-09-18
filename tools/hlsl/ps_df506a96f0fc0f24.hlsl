// ps_df506a96f0fc0f24.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10040D00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_19 : register(c10); // float
float4 UniformScalar_20 : register(c11); // float
float4 UniformScalar_21 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_7 : register(c6); // float4
float4 UniformVector_8 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
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

    r8 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r5.w = ps;
    ps = r8.w;
    r6.zw = r0.wz * UniformVector_8.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r5.xw = r5.xw * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r5.xyw = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_4, r6.zw).xyz;
    r13.yzw = tex2D(Texture2D_0, r6.xy).xyw;
    ps = UniformVector_7.x * UniformVector_7.w;
    r6.y = float((UniformScalar_19.x >= 1.0));
    r7.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r6.w = float((UniformScalar_19.x > 1.0));
    r7.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.z = ps;
    r11.xw = r13.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r6.z = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = r7.xyz * r8.xyz;
    r6.z = ps;
    r0.xyz = (-abs(r6.www) >= 0.0) ? r0.xyz : 1.0;
    r5.xyw = r5.wxy * 2.0 - 1.0;
    r0.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r0.xyz;
    ps = rsqrt(abs(r5.z));
    r12.xyz = r7.xyz * r0.xyz;
    r5.z = ps;
    ps = UniformVector_2.z;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = (-1.0) * ps;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformVector_2.z * r5.x;
    r10.xyz = r5.zzz * r4.xyz;
    r5.z = ps;
    ps = r6.y;
    r9.xyz = r6.zzz * r1.xyz;
    ps = r5.x * ps;
    r8.xyz = r6.xxx * r3.zxy;
    r5.x = ps;
    r13.x = (r8.x >= 0.0) ? r5.z : r5.x;
    ps = OpacityOverride.x;
    r5.x = r9.z + 0.1;
    r5.z = saturate(ps);
    ps = r2.w;
    r5.x = saturate(r5.x * 5.0);
    ps = 0.0001 * ps;
    r5.xz = -r5.zx + 1.0;
    r6.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r1.xy = r13.xw - 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.x = float((r5.x >= 0.004));
    r6.z = ps;
    r6.yzw = -r6.xyz + 1.0;
    r1.xw = r1.xy * r6.yy + 1.0;
    ps = UniformScalar_1.x * r6.y;
    r6.x = ps;
    r5.xy = r6.xx * r11.xw + r5.yw;
    r5.xy = r5.xy * UniformVector_2.xy;
    r1.yz = r5.xy * r6.yy;
    r5 = (r6.xyyy > 0.0) ? r1.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r5 = (r6.xyyy >= 0.0) ? r5 : float4(1.0, 1.0, 0.0, 0.0);
    r1.x = dot(r5.yzw, r5.yzw);
    r1.yzw = r12.xyz * r5.xxx;
    r4.xyz = r1.ywz * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r1.x));
    r0.yzw = r1.yzw * r0.yzw;
    r5.x = ps;
    r3.xyz = r0.yzw * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyw = r5.yzx * TwoSidedSign.xxx;
    r11.x = dot(r10.zxy, r5.wxy);
    r5.z = dot(r5.wxy, r8.xyz);
    r10.xyz = r5.xyw * r5.zzz;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.yzx;
    r3.w = saturate(dot(r9.zxy, r8.zxy));
    r6.xy = r1.zw * r6.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r6.zw = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r6.zw) * abs(r6.zw);
    r1.y = ps;
    ps = log2(r3.w);
    r5.z = r6.x * r6.y;
    r5.x = ps;
    r6.xyz = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.ywz * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.ywz * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.yzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.x + r2.w;
    r5.xyz = r6.xyz * r0.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
