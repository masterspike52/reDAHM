// ps_d73ed8c102924794.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002B8 10040800 00000506 00000000 000048A5 001F001F 00000021 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_15 : register(c12); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy + UniformVector_4.xy;
    r4.xy = r0.xy * 0.08 + UniformVector_1.xy;
    r7.z = tex2D(Texture2D_1, r4.xy).x;
    r4.xyz = tex2D(Texture2D_4, r0.zw).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.xy + UniformVector_5.xy;
    r0.z = ps;
    r6.yzw = tex2D(Texture2D_4, r6.xy).xyz;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r0.w));
    r7.xy = r4.yz * r6.zw;
    r0.w = ps;
    r4.yzw = r7.zxy * float3(0.05, 4.0, 4.0);
    ps = (-0.005) + r4.y;
    r7.xyw = r0.www * r3.xyz;
    r0.w = ps;
    r3.xy = r7.xy * r0.ww + r0.xy;
    r3 = tex2D(Texture2D_2, r3.xy);
    r8 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r8 = -r3 + r8;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r5 = r8.wxyz * UniformScalar_5.xxxx + float4(-0.1, 0.0, 0.0, 0.0);
    r3 = r5 + r3.wxyz;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    r8.w = tex2D(Texture2D_0, r0.xy).z;
    r0.yw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.z = (UniformScalar_6.x > 0.0) ? UniformScalar_15.x : UniformScalar_11.x;
    r0.z = (UniformScalar_6.x >= 0.0) ? r0.z : UniformScalar_11.x;
    ps = rsqrt(abs(r0.x));
    r8.xy = r0.yw * 0.875;
    r0.x = ps;
    r8.z = r0.x * r1.z;
    ps = OpacityOverride.x;
    r0.xy = r8.zw + float2(0.1, -1.0);
    r0.w = saturate(ps);
    ps = 5.0 * r0.x;
    r7.xyz = r0.zzz * UniformVector_2.xyz;
    r0.z = saturate(ps);
    ps = r0.y;
    r1.x = dot(r3.wyz, float3(0.11, 0.3, 0.59));
    ps = r8.w + ps;
    r1.yzw = -r3.yzw + r1.xxx;
    r1.x = ps;
    r3.x = r1.x * 0.5 + 0.5;
    r3.yzw = r1.yzw * 0.8 + r3.yzw;
    r0.xz = -r0.wz + 1.0;
    ps = ModShadowGroupColor.x * r0.z;
    r1.w = max(r7.w, 0.0);
    r1.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3.yzw = r7.xyz * r3.yzw;
    r1.z = ps;
    ps = 1.0 - r1.x;
    r0.w = float((r0.x >= 0.004));
    r7.x = ps;
    ps = 1.0 - r1.z;
    r0.xy = r3.xy * 5.0;
    r7.y = ps;
    ps = 1.0 - r1.w;
    r3.xyz = r0.xxy * r3.zwx;
    r7.z = ps;
    r0.xy = r8.xy * r7.xy + 0.125;
    ps = log2(abs(r7.z));
    r0.x = r0.x * r0.y;
    r6.x = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xw = r6.yx * float2(4.0, 0.75);
    r4.x = r1.x * r4.x;
    r4.xyz = r4.xzw * UniformVector_3.xyz;
    ps = pow(2.0, r1.w);
    r1.xyz = abs(r4.xzy) * abs(r4.xzy);
    r1.w = ps;
    r1.xyz = r1.xyz * r1.xyz + UniformVector_0.xzy;
    r1.xyz = r3.zyx * r1.www + r1.xyz;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xzy;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
