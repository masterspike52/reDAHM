// ps_e36165427dff3128.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040D00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

    r10 = tex2D(Texture2D_3, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = r10.w;
    r7.zw = r1.wz * UniformVector_8.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = (-0.5) + r6.y;
    r6.xz = r6.xz * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r12.yz = tex2D(ModShadowAccumTexture, r6.xz).xy;
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_1, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_4, r7.zw).xyz;
    r13.yzw = tex2D(Texture2D_0, r7.xy).xyw;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = UniformVector_7.x * UniformVector_7.w;
    r7.y = float((UniformScalar_19.x >= 1.0));
    r1.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r7.w = float((UniformScalar_19.x > 1.0));
    r1.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r7.x = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    r12.xw = r13.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r7.z = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r7.z));
    r1.xyz = r1.xyz * r10.xyz;
    r7.z = ps;
    r0.xyz = (-abs(r7.www) >= 0.0) ? r0.xyz : 1.0;
    r6.xyw = r6.wxy * 2.0 - 1.0;
    r0.xyz = (-abs(r7.yyy) >= 0.0) ? 1.0 : r0.xyz;
    ps = rsqrt(abs(r6.z));
    r1.yzw = r1.xyz * r0.xyz;
    r6.z = ps;
    ps = UniformVector_2.z;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    ps = (-1.0) * ps;
    r8.xyz = r8.xyz * LightMapScale.xyz;
    r7.y = ps;
    ps = UniformVector_2.z * r6.x;
    r5.xyz = r6.zzz * r5.xyz;
    r6.z = ps;
    ps = r7.y;
    r10.xyz = r7.zzz * r2.xyz;
    ps = r6.x * ps;
    r11.xyz = r7.xxx * r4.zxy;
    r6.x = ps;
    r13.x = (r11.x >= 0.0) ? r6.z : r6.x;
    ps = OpacityOverride.x;
    r6.x = r10.z + 0.1;
    r6.z = saturate(ps);
    ps = r3.w;
    r6.x = saturate(r6.x * 5.0);
    ps = 0.0001 * ps;
    r6.xz = -r6.zx + 1.0;
    r7.x = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r2.xy = r13.xw - 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.x = float((r6.x >= 0.004));
    r7.z = ps;
    r7.yzw = -r7.xyz + 1.0;
    r2.xw = r2.xy * r7.yy + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r7.x = ps;
    r6.xy = r7.xx * r12.xw + r6.yw;
    r6.xy = r6.xy * UniformVector_2.xy;
    r2.yz = r6.xy * r7.yy;
    r6 = (r7.xyyy > 0.0) ? r2.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r6 = (r7.xyyy >= 0.0) ? r6 : float4(1.0, 1.0, 0.0, 0.0);
    r1.x = dot(r6.yzw, r6.yzw);
    r1.yzw = r1.yzw * r6.xxx;
    r2.xyz = r1.ywz * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r1.x));
    r0.yzw = r1.yzw * r0.yzw;
    r6.x = ps;
    r4.xyz = r0.yzw * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.yzw = r6.xyz * TwoSidedSign.xxx;
    r1.xyz = r8.xzy * r6.yyy;
    r12.x = dot(r5.zxy, r6.yzw);
    r6.x = dot(r6.yzw, r11.xyz);
    r6.xyz = r6.zwy * r6.xxx;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r6.xyz * 2.0 - r11.yzx;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r6.yz = r5.zw * r7.zw + 0.125;
    r7.xy = r5.xy + 0.5;
    r7.xw = abs(r7.yx) * abs(r7.yx);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r6.yzw = r6.yyy * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r5.xyz = r0.ywz * r7.xxx;
    r6.x = ps;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r4.xzy;
    ps = pow(2.0, r6.x);
    r5.xyz = r0.ywz * r7.www;
    r6.x = ps;
    r4.xyz = r8.xzy * r6.xxx;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r4.xyz * r2.xyz + r7.xzy;
    r7.xyz = r1.xzy * r0.yzw + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r0.x + r3.w;
    r6.xyz = r7.xyz * r0.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
