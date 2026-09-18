// ps_8c792ba196600248.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040C00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LightMapScale : register(c15); // float3
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c12); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r1.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r1.xy * UniformScalar_0.xx;
    r7.y = ps;
    ps = r9.x;
    r0.zw = r1.wz * UniformVector_2.xy;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r7.xy = r7.xy * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r12.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r0.zw).xyz;
    r11.xyz = tex2D(Texture2D_1, r6.xz).xyw;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = OpacityOverride.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.w = saturate(ps);
    ps = r3.w;
    r1.w = float((UniformScalar_4.x >= 1.0));
    ps = 0.0001 * ps;
    r0.w = dot(r5.zxy, r5.zxy);
    r9.x = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r8.z = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r10.w = float((UniformScalar_4.x > 1.0));
    r10.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r10.z = ps;
    r8.xy = r11.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r7.w = r11.z - 1.0;
    r6.w = ps;
    r1.xyz = (-abs(r10.www) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r8.z));
    r9.yzw = r10.xyz * r9.yzw;
    r8.z = ps;
    r7.xyz = r7.xyz * 2.0 + float3(0.0, 0.0, -2.0);
    ps = rsqrt(abs(r0.w));
    r11.xyz = r8.zzz * r4.xyz;
    r0.w = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = LightMapScale.x * r6.y;
    r10.xyz = r6.www * r2.xyz;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r6.w = r10.z + 0.1;
    r4.y = ps;
    ps = LightMapScale.z * r6.x;
    r8.z = saturate(r6.w * 5.0);
    r4.z = ps;
    ps = (-1.0) + r7.x;
    r6.xz = -r8.wz + 1.0;
    r2.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r1.xyz = r9.yzw * r1.xyz;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.w = float((r6.x >= 0.004));
    r9.z = ps;
    ps = (-1.0) + r7.y;
    r9.yzw = -r9.xyz + 1.0;
    r2.y = ps;
    r7.xw = r7.zw * r9.yy + 1.0;
    ps = r0.w;
    r9.x = r9.y * UniformScalar_1.x;
    r6.xy = r9.xx * r8.xy + r2.xy;
    ps = r5.x * ps;
    r7.yz = r6.xy * r9.yy;
    r6.x = ps;
    r7 = (r9.xyyy > 0.0) ? r7.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r7 = (r9.yyyx >= 0.0) ? r7.yzwx : float4(1.0, 0.0, 0.0, 1.0);
    ps = r0.w;
    r6.z = dot(r7.xyz, r7.xyz);
    ps = r5.y * ps;
    r1.xyz = r1.xyz * r7.www;
    r6.y = ps;
    r2.xyz = r1.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r1.xyz * r0.xyz;
    r6.z = ps;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = r0.w;
    r7.xyz = r7.xyz * r6.zzz;
    ps = r5.z * ps;
    r1.xyz = r4.xzy * r7.xxx;
    r6.z = ps;
    r12.x = dot(r6.zxy, r7.xyz);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.xyz, r11.zxy);
    ps = 1.0 + ps;
    r6.xyz = r7.yzx * r6.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r7.y = ps;
    r6.yz = r5.zw * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.xy + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
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
