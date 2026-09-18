// ps_f118c78221289634.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10041000 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D LightMapTexture : register(s6);
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

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xy = r6.yz * abs(r8.xy);
    r6.x = ps;
    r15.xyz = r6.xxx * r4.zxy;
    r6 = xe_cube(r15.yzx);
    ps = 1.0 / abs(r6.z);
    r9.z = r6.w;
    r7.x = ps;
    r9.xy = r6.yx * r7.xx + 1.5;
    r13.xyw = tex2D(Texture2D_2, r15.xx).xyz;
    r7.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r14 = tex2D(Texture2D_1, r1.xy);
    r9.xyw = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).yzx;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r0.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r1 = tex2D(Texture2D_4, r1.xy).yzwx;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r11.xy = r0.xy * 0.875;
    r13.z = saturate(ps);
    ps = LightMapScale.x * r6.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r12.x = ps;
    ps = LightMapScale.y * r6.z;
    r0.xy = r9.xy * r1.xy;
    r12.y = ps;
    ps = LightMapScale.z * r6.x;
    r0.z = r14.w + UniformVector_0.y;
    r12.z = ps;
    r16.xyz = r4.zxy * 2.0 - 1.0;
    ps = 2e+02 * r7.x;
    r4.xyz = r8.xyz * r14.xyz;
    r6.y = ps;
    ps = r1.z;
    r7.xy = r13.yw * r7.yz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.y = r6.y * r13.x;
    r6.w = ps;
    ps = rsqrt(abs(r0.w));
    r6.xz = r7.yx * 2e+02;
    r7.x = ps;
    ps = r6.w;
    r7.xyz = r7.xxx * r2.zxy;
    r11.z = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r16.xyz, r16.xyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r1.z = r0.z + r6.z;
    r6.w = ps;
    ps = UniformVector_0.x + r6.y;
    r13.xyw = r7.www * r5.xyz;
    r0.z = ps;
    ps = UniformVector_0.z + r6.x;
    r2.xyz = r16.xyz * r6.www;
    r0.w = ps;
    r1.xy = r14.ww * float2(0.5, 1.25) + r0.zw;
    ps = 0.0001;
    r5.xyz = r12.xyz * r2.xxx;
    r11.w = ps;
    ps = 0.1 - -r7.x;
    r0.z = dot(r13.wxy, r2.xyz);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.y = dot(r2.xyz, r15.xyz);
    r6.x = saturate(ps);
    ps = max(r11.z, r11.w);
    r6.z = -r6.x + 1.0;
    r4.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r2.yzx * r6.yyy;
    r13.x = ps;
    r2.xyz = r6.xyw * 2.0 - r15.yzx;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r0.zyxz * float4(0.5, 1.5, 1.8, -0.5);
    r13.y = ps;
    ps = r0.w;
    r9.xyz = r5.xyz * r14.xyz;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r6.w = saturate(dot(r7.xyz, r2.zxy));
    r7.x = ps;
    ps = 0.5 + r0.x;
    r6.xyz = -r13.xyz + 1.0;
    r7.y = ps;
    r11.yz = r11.xy * r6.xy + 0.125;
    ps = log2(r6.w);
    r7.xy = abs(r7.xy) * abs(r7.xy);
    r7.z = ps;
    r5 = r4.xzyw * r7.xxxz;
    ps = pow(2.0, r5.w);
    r6.w = float((r6.z >= 0.004));
    r6.x = ps;
    ps = r1.w + r1.w;
    r6.xyz = r12.zyx * r6.xxx;
    r11.w = ps;
    ps = r6.z;
    r2.xyz = r4.xzy * r7.yyy;
    ps = r9.w * ps;
    r7.yz = r6.xy * r0.yz;
    r11.x = ps;
    r7.xw = r11.xy * r11.wz;
    r6.xyz = r7.www * r10.xyz + ModShadowColor.xyz;
    r7.xyz = r9.xzy * r8.xzy + r7.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r7.xyz;
    r7.xyz = r2.xyz * UpperSkyColor.xzy + r7.xyz;
    r7.xyz = r4.xzy * AmbientColorAndSkyFactor.xzy + r7.xyz;
    r7.xyz = r7.xyz + r1.xyz;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
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
