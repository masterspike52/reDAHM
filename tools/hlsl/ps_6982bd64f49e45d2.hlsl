// ps_6982bd64f49e45d2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10041000 0000090A 00000000 00008929 007F01FF 00000001 00003050 0000F151 0000F252 0000F354 0000F456 0000F557 0000F658 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LightMapScale : register(c16); // float3
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
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
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

    r7.xy = r1.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r1.xy * UniformScalar_0.xx;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = UniformScalar_1.x * 4.0;
    r8.w = ps;
    ps = r7.z;
    r8.xy = r1.wz * UniformScalar_4.xx;
    ps = r2.x * ps;
    r8.zw = r8.zw * abs(r9.xy);
    r7.z = ps;
    ps = UniformScalar_1.x * r2.y;
    r11.x = saturate(r4.w * 0.0001);
    r7.w = ps;
    r13.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r1.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r8.w = tex2D(Texture2D_2, r2.xy).x;
    r8.xyz = tex2D(Texture2D_4, r0.zw).xyz;
    r12.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.zw).zxy;
    r14.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r2.xzw = tex2D(Texture2D_3, r7.xy).wxy;
    r7.yzw = tex2D(LightMapTexture, r0.xy).zxy;
    ps = OpacityOverride.x;
    r11.yzw = UniformVector_1.xyz * UniformVector_1.www;
    r9.w = saturate(ps);
    ps = -UniformVector_0.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r0.z = dot(r6.zxy, r6.zxy);
    r0.x = ps;
    ps = -UniformVector_0.y;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    r2.zw = r2.zw * 2.0 - 1.0;
    r15.xyz = r14.zxy * 2.0 - 1.0;
    r14.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r9.y = r2.x - 1.0;
    r7.x = ps;
    ps = rsqrt(abs(r0.w));
    r16.xyz = -r8.xyz + r12.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r0.www * r5.xyz;
    r0.w = ps;
    r5.xyz = r16.xyz * r8.www + r8.xyz;
    ps = -UniformVector_0.z;
    r8.xyz = r7.xxx * r3.zxy;
    ps = 1.0 + ps;
    r3.xyz = r15.xyz - r14.xyz;
    r0.z = ps;
    r2.xy = r3.yz * r8.ww + r14.yz;
    ps = 0.1 - -r8.x;
    r5.xyz = r11.yzw * r5.xyz;
    r7.x = ps;
    r8.w = r3.x * r8.w - 2.0;
    r9.x = r9.x * 2.0 + r8.w;
    ps = LightMapScale.x * r7.z;
    r9.z = saturate(r7.x * 5.0);
    r3.x = ps;
    ps = LightMapScale.y * r7.w;
    r7.xz = -r9.wz + 1.0;
    r3.y = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r1.yzw = r5.xyz * r1.xyz;
    r11.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r8.w = float((r7.x >= 0.004));
    r11.z = ps;
    ps = LightMapScale.z * r7.y;
    r11.yzw = -r11.xyz + 1.0;
    r3.z = ps;
    r7.xw = r9.xy * r11.yy + 1.0;
    ps = r0.w;
    r11.x = r11.y * UniformScalar_3.x;
    r7.yz = r11.xx * r2.zw + r2.xy;
    ps = r6.x * ps;
    r7.yz = r7.yz * r11.yy;
    r5.x = ps;
    r7 = (r11.xyyy > 0.0) ? r7.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r7 = (r11.xyyy >= 0.0) ? r7 : float4(1.0, 1.0, 0.0, 0.0);
    ps = r0.w;
    r1.x = dot(r7.yzw, r7.yzw);
    ps = r6.y * ps;
    r1.yzw = r1.yzw * r7.xxx;
    r5.y = ps;
    r2.xyz = r1.ywz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r1.x));
    r0.xyz = r1.yzw * r0.xyz;
    r7.x = ps;
    r9.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = r0.w;
    r7.yzw = r7.yzw * r7.xxx;
    ps = r6.z * ps;
    r1.xyz = r3.xzy * r7.yyy;
    r5.z = ps;
    r13.x = dot(r5.zxy, r7.yzw);
    r7.x = dot(r7.yzw, r12.zxy);
    r7.xyz = r7.zwy * r7.xxx;
    r5 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.xyz = r7.xyz * 2.0 - r12.xyz;
    r7.x = saturate(dot(r8.xyz, r7.zxy));
    r7.yz = r5.zw * r11.zw + 0.125;
    r8.xy = r5.xy + 0.5;
    r5.xy = abs(r8.xy) * abs(r8.xy);
    ps = log2(r7.x);
    r7.y = r7.y * r7.z;
    r7.x = ps;
    r7.yzw = r7.yyy * r10.xyz + ModShadowColor.xyz;
    ps = 15.0 * r7.x;
    r8.xyz = r0.xzy * r5.yyy;
    r7.x = ps;
    r8.xyz = r8.xyz * UpperSkyColor.xzy + r9.xzy;
    ps = pow(2.0, r7.x);
    r5.xyz = r0.xzy * r5.xxx;
    r7.x = ps;
    r3.xyz = r3.xzy * r7.xxx;
    r8.xyz = r5.xzy * LowerSkyColor.xyz + r8.xzy;
    r8.xyz = r3.xyz * r2.xyz + r8.xzy;
    r8.xyz = r1.xzy * r0.xyz + r8.xzy;
    ps = -r4.w;
    r7.xyz = r8.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r7.xyz - r7.xyz;
    r0.w = ps;
    oC0.w = r0.w * r8.w + r4.w;
    r7.xyz = r0.xyz * r8.www + r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
