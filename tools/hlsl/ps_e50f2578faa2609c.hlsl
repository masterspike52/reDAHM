// ps_e50f2578faa2609c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r10.zw = r0.xy * UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r10.xy = r5.yw * abs(r7.xy);
    r5.y = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_3, r10.zw).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r10.zw).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r6.w = tex2D(Texture2D_2, r0.xy).x;
    r5.xyw = tex2D(LightAttenuationTexture, r5.xy).yxz;
    r0.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    ps = r1.z;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r10.zw = r0.xy * 0.875;
    r5.z = ps;
    ps = UniformVector_2.x * r6.w;
    r0.xyz = r7.xyz + r7.xyz;
    r10.x = ps;
    r7.xyz = r4.xyz * 2.0 - 1.0;
    ps = r6.z + r6.z;
    r6.xy = r6.xy * 4.0;
    r6.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.z = saturate(r5.z * 5.0);
    r0.w = ps;
    ps = 1.0 - r5.z;
    r4.xyz = r0.www * r1.xyz;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xyz = r6.xyz + float3(-2.0, -2.0, -1.0);
    r6.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r1.xyz - r7.xyz;
    r6.y = ps;
    r1.xyz = r1.xyz * UniformScalar_2.xxx + r7.xyz;
    ps = UniformVector_2.y * r6.w;
    r7.xyz = -r6.wxy + 1.0;
    r10.y = ps;
    r7.yz = r10.zw * r7.yz + 0.125;
    ps = UniformVector_2.z * r6.w;
    r5.z = dot(r1.zxy, r1.zxy);
    r10.z = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyz = r7.xxx * r9.xyz;
    r5.z = ps;
    r6.xyz = r10.xyz * r9.xyz + r6.xyz;
    r0.xyz = r6.xyz * r0.xyz - r6.xyz;
    r9.xyz = r1.xyz * r5.zzz;
    ps = rsqrt(abs(r1.w));
    r5.z = dot(r9.zxy, r9.zxy);
    r6.w = ps;
    r6.xyz = r0.xyz * UniformScalar_2.xxx + r6.xyz;
    r1.xyz = r6.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r6.www * r3.xyz;
    r5.z = ps;
    ps = UniformScalar_5.x;
    r3.xyz = r9.xyz * r5.zzz;
    r7.x = ps;
    ps = 0.0001;
    r5.z = dot(r3.zxy, r0.zxy);
    r7.w = ps;
    ps = max(r7.x, r7.w);
    r9.xyz = r3.xzy * r5.zzz;
    r7.x = ps;
    r0.xyz = r9.xyz * 2.0 - r0.xzy;
    ps = LightColor.x * r5.y;
    r5.z = saturate(dot(r4.zxy, r0.yxz));
    r0.x = ps;
    ps = log2(r5.z);
    r2.xyz = r6.zxy * r2.zxy;
    r7.w = ps;
    ps = LightColor.z * r5.w;
    r6.xw = r7.yx * r7.zw;
    r0.y = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r5.z = saturate(dot(r3.zxy, r4.zxy));
    r6.w = ps;
    ps = LightColor.y * r5.x;
    r1.xyz = r1.xyz * r6.www;
    r0.z = ps;
    r5.xy = r2.yz * r5.zz + r1.xy;
    r5.z = r2.x * r5.z + r1.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
