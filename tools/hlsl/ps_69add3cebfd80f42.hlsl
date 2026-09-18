// ps_69add3cebfd80f42.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041000 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.x = UniformScalar_1.x * 4.0;
    r6.w = ps;
    ps = r9.x;
    r7.zw = r0.wz * UniformScalar_4.xx;
    ps = r1.x * ps;
    r0.xy = r6.zw * abs(r8.xy);
    r6.z = ps;
    ps = OpacityOverride.x;
    r6.w = r1.y * UniformScalar_1.x;
    r8.z = saturate(ps);
    r11.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r10.xyz = tex2D(Texture2D_6, r7.zw).xyz;
    r0.w = tex2D(Texture2D_2, r1.xy).x;
    r15.xyz = tex2D(Texture2D_4, r7.xy).xyz;
    r1.yzw = tex2D(Texture2D_5, r6.zw).xyz;
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r9.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r6.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    ps = r3.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.w = dot(r2.zxy, r2.zxy);
    r8.y = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r7.z = dot(r5.zxy, r5.zxy);
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r1.x = dot(r4.zxy, r4.zxy);
    r12.y = ps;
    r11.xw = r6.yz * 2.0 - 1.0;
    r14.xyz = r9.zxy * 2.0 - 1.0;
    r13.xyz = r7.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r16.xyz = -r15.xyz + r1.yzw;
    r1.x = ps;
    ps = rsqrt(abs(r7.z));
    r9.xyz = r1.xxx * r4.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r1.xyz = r7.zzz * r5.xyz;
    r6.w = ps;
    r5.xyz = r16.xyz * r0.www + r15.xyz;
    ps = UniformVector_1.z * UniformVector_1.w;
    r7.xyz = r6.www * r2.zxy;
    r12.z = ps;
    ps = (-1.0) + r6.x;
    r2.xyz = r14.xyz - r13.xyz;
    r6.w = ps;
    r4.yz = r2.yz * r0.ww + r13.yz;
    r6.x = r2.x * r0.w - 2.0;
    ps = 0.1 - -r7.x;
    r2.xyz = r12.xyz * r5.xyz;
    r6.y = ps;
    r6.x = r7.w * 2.0 + r6.x;
    ps = r2.x;
    r8.x = saturate(r6.y * 5.0);
    ps = r10.x * ps;
    r6.yz = -r8.yx + 1.0;
    r2.x = ps;
    r4.xw = r6.xw * r6.yy + 1.0;
    ps = UniformScalar_3.x * r6.y;
    r8.xy = r6.zz * ModShadowGroupColor.xy;
    r6.x = ps;
    r4.yz = r6.xx * r11.xw + r4.yz;
    ps = r2.y;
    r8.xyz = -r8.xyz + 1.0;
    ps = r10.y * ps;
    r4.yz = r4.yz * r6.yy;
    r2.y = ps;
    ps = r2.z;
    r7.w = float((r8.z >= 0.004));
    r4 = (r6.xyyy > 0.0) ? r4.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r6 = (r6.xyyy >= 0.0) ? r4 : float4(1.0, 1.0, 0.0, 0.0);
    ps = r10.z * ps;
    r0.w = dot(r6.yzw, r6.yzw);
    r2.z = ps;
    r2.xyz = r2.xyz * r6.xxx;
    r4.xyz = r2.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r2.xyz * r0.xyz;
    r6.x = ps;
    r2.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = -ModShadowColor.x;
    r6.xyw = r6.zwy * r6.xxx;
    ps = 1.0 + ps;
    r11.x = dot(r1.zxy, r6.wxy);
    r5.x = ps;
    ps = -ModShadowColor.y;
    r6.z = dot(r6.wxy, r9.zxy);
    ps = 1.0 + ps;
    r10.xyz = r6.xyw * r6.zzz;
    r5.y = ps;
    ps = -ModShadowColor.z;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r7.x = saturate(dot(r7.xyz, r9.zxy));
    r5.z = ps;
    r7.yz = r1.zw * r8.xy + 0.125;
    ps = ConstantLighting.x * r6.w;
    r1.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r6.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r7.x);
    r6.z = r7.y * r7.z;
    r6.x = ps;
    r7.xyz = r6.zzz * r5.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r5.xyz = r0.xzy * r1.zzz;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r8.xyz = r0.xzy * r1.www;
    r6.z = ps;
    r2.xyz = r8.xyz * UpperSkyColor.xzy + r2.xzy;
    r2.xyz = r5.xzy * LowerSkyColor.xyz + r2.xzy;
    ps = ConstantLighting.z * r6.w;
    r5.xyz = r6.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r6.xyz = r5.xyz * r4.xyz + r2.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
