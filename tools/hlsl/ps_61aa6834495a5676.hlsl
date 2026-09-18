// ps_61aa6834495a5676.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003C0 10041400 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 LightMapScale : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
samplerCUBE TextureCube_0 : register(s10);
sampler2D LightMapTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    r10.xyz = r6.wzy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r7.w = saturate(OpacityOverride.x);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = dot(r5.zxy, r5.zxy);
    r7.x = ps;
    ps = r7.x;
    r6.x = dot(r4.zxy, r4.zxy);
    ps = abs(r8.x) * ps;
    r14.xyz = r6.yyy * r2.xyz;
    r9.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.y = dot(r10.xzy, r10.xzy);
    r6.x = ps;
    ps = r7.z;
    r6.yzw = r6.xxx * r4.zxy;
    ps = abs(r8.y) * ps;
    r7.x = saturate(dot(r6.yzw, r10.xzy));
    r9.y = ps;
    ps = rsqrt(abs(r7.y));
    r6.x = r14.z + 0.1;
    r7.y = ps;
    ps = 5.0 * r6.x;
    r16.xyz = r10.xzy * r7.yyy;
    r7.z = saturate(ps);
    ps = 1.0 - r7.w;
    r6.x = dot(r16.xyz, r6.yzw);
    r2.w = ps;
    ps = 1.0 - r7.x;
    r2.xyz = r16.yzx * r6.xxx;
    r0.z = ps;
    r13.xyz = r2.xyz * 2.0 - r6.zwy;
    ps = 1.0 - r7.z;
    r6 = xe_cube(r13.xyz);
    r7.z = ps;
    ps = 1.0 / abs(r6.z);
    r7.w = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r10.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r2.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r17.w = tex2D(Texture2D_9, r1.xy).x;
    r18.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r20.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r19.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r11 = tex2D(Texture2D_1, r1.xy);
    r12.yzw = tex2D(Texture2D_2, r0.zz).xyz;
    r17.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyw)).xyz;
    r4.xyz = tex2D(Texture2D_8, r1.xy).yzx;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.875 * r7.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r15.x = ps;
    ps = 0.875 * r7.y;
    r9.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r15.y = ps;
    ps = LightMapScale.x * r6.y;
    r17.yz = r17.yz * r4.xy;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r1 = r11.wwyz * r12.zwzw;
    r4.y = ps;
    r7.xyw = r20.xzy * float3(2e+01, 22.0, 2e+01) + r19.xzy;
    ps = LightMapScale.z * r6.x;
    r6.w = r4.z * 0.7;
    r4.z = ps;
    ps = r6.w;
    r18.xyz = r18.xyz * UniformScalar_3.xxx;
    r6.yw = r18.xz * UniformVector_1.xz + r7.xy;
    ps = r17.x * ps;
    r6.xz = r1.yx * 1.5e+02;
    r17.x = ps;
    r7.x = r18.y * UniformVector_1.y + r7.w;
    ps = r7.x;
    r11.yz = r1.zw * 2e+01;
    ps = r6.z + ps;
    r6.x = r6.w + r6.x;
    r6.z = ps;
    ps = rsqrt(abs(r0.w));
    r17.yzw = r17.yzw * float3(0.65, 0.5, 1e+01);
    r7.x = ps;
    ps = r17.w;
    r7.xyw = r7.xxx * r5.xyz;
    r5.x = ps;
    ps = 0.0001;
    r1.xyz = r4.xzy * r16.xxx;
    r5.y = ps;
    ps = max(r5.x, r5.y);
    r2.xyz = r17.xyz + r2.xyz;
    r5.x = ps;
    ps = r6.y;
    r12.x = dot(r7.wxy, r16.xyz);
    r6.y = ps;
    ps = UniformVector_0.x + r6.y;
    r12 = r12.xxyy * float4(-0.5, 0.5, 1.5e+02, 2e+01);
    r7.y = ps;
    r7.xz = -r7.zz * ModShadowGroupColor.xy + 1.0;
    r5.yz = r15.xy * r7.xz + 0.125;
    ps = UniformVector_0.y + r6.z;
    r4.w = saturate(dot(r14.zxy, r13.zxy));
    r7.z = ps;
    ps = UniformVector_0.z + r6.x;
    r12.xy = r12.xy + 0.5;
    r7.w = ps;
    ps = abs(r12.x) * abs(r12.x);
    r11.xw = r12.wz * r11.xw;
    r1.w = ps;
    ps = abs(r12.y) * abs(r12.y);
    r7.x = r7.y + r11.w;
    r0.w = ps;
    ps = log2(r4.w);
    r6.xyz = r11.xyz + r10.xyz;
    r5.w = ps;
    r7.xyz = r9.xzy * r6.xzy + r7.xwz;
    ps = r5.x * r5.w;
    r6.w = float((r2.w >= 0.004));
    r7.w = ps;
    ps = r5.y * r5.z;
    r0.xyz = r6.xyz * r0.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    r5.xyz = r0.xzy * r1.www;
    ps = pow(2.0, r7.w);
    r8.xyz = r0.xzy * r0.www;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r7.xyz;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r4.xyz * r2.xzy + r7.xzy;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
