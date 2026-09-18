// ps_5f4feed59c3f64b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r8.zw = r0.xy * UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.yzw = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r8.xy = r6.yz * abs(r5.xy);
    r6.y = ps;
    r0.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_3, r8.zw).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r8.zw).xyz;
    r4.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r1.w = tex2D(Texture2D_2, r0.xy).x;
    r0.xyw = tex2D(LightAttenuationTexture, r0.zw).yxz;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    ps = r1.z;
    r3.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r10.zw = r8.xy * 0.875;
    r0.z = ps;
    ps = UniformVector_2.x * r1.w;
    r4.xyz = r4.xyz + r4.xyz;
    r10.x = ps;
    r5.xyz = r5.xyz * 2.0 - 1.0;
    ps = r6.z + r6.z;
    r8.xy = r6.xy * 4.0;
    r8.z = ps;
    ps = rsqrt(abs(r3.w));
    r0.z = saturate(r0.z * 5.0);
    r3.w = ps;
    ps = 1.0 - r0.z;
    r6.xyz = r3.www * r1.xyz;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r8.xyz = r8.xyz + float3(-2.0, -2.0, -1.0);
    r1.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r8.xyz = r8.xyz - r5.xyz;
    r1.y = ps;
    r5.xyz = r8.xyz * UniformScalar_2.xxx + r5.xyz;
    ps = UniformVector_2.y * r1.w;
    r8.xyz = -r1.wxy + 1.0;
    r10.y = ps;
    r8.yz = r10.zw * r8.yz + 0.125;
    ps = UniformVector_2.z * r1.w;
    r0.z = dot(r5.zxy, r5.zxy);
    r10.z = ps;
    ps = rsqrt(abs(r0.z));
    r1.xyz = r8.xxx * r9.xyz;
    r0.z = ps;
    r1.xyz = r10.xyz * r9.xyz + r1.xyz;
    r4.xyz = r1.xyz * r4.xyz - r1.xyz;
    r9.xyz = r5.xyz * r0.zzz;
    ps = rsqrt(abs(r2.x));
    r0.z = dot(r9.zxy, r9.zxy);
    r1.w = ps;
    r1.xyz = r4.xyz * UniformScalar_2.xxx + r1.xyz;
    r5.xyz = r1.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r0.z));
    r4.xyz = r1.www * r3.xyz;
    r0.z = ps;
    ps = UniformScalar_5.x;
    r3.xyz = r9.xyz * r0.zzz;
    r8.x = ps;
    ps = 0.0001;
    r0.z = dot(r3.zxy, r4.zxy);
    r8.w = ps;
    ps = max(r8.x, r8.w);
    r9.xyz = r3.xzy * r0.zzz;
    r8.x = ps;
    r4.xyz = r9.xyz * 2.0 - r4.xzy;
    ps = LightColor.x * r0.y;
    r0.z = saturate(dot(r6.zxy, r4.yxz));
    r2.x = ps;
    ps = log2(r0.z);
    r4.xyz = r1.zxy * r2.wyz;
    r8.w = ps;
    ps = LightColor.z * r0.w;
    r1.xw = r8.yx * r8.zw;
    r2.y = ps;
    r1.xyz = r1.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r0.z = saturate(dot(r3.zxy, r6.zxy));
    r1.w = ps;
    ps = LightColor.y * r0.x;
    r3.xyz = r5.xyz * r1.www;
    r2.z = ps;
    r0.xy = r4.yz * r0.zz + r3.xy;
    r0.z = r4.x * r0.z + r3.z;
    r0.xyz = r2.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
