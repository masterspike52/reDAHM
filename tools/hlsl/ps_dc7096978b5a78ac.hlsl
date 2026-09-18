// ps_dc7096978b5a78ac.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002B8 10040B00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy + UniformVector_4.xy;
    r5.zw = r0.xy * 0.08 + UniformVector_1.xy;
    r5.w = tex2D(Texture2D_1, r5.zw).x;
    r6.xyz = tex2D(Texture2D_4, r5.xy).yxz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r0.xy + UniformVector_5.xy;
    r11.x = ps;
    r8.yzw = tex2D(Texture2D_4, r5.xy).xyz;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.x));
    r5.yz = r6.xz * r8.zw;
    r5.x = ps;
    r4.yzw = r5.wyz * float3(0.05, 4.0, 4.0);
    ps = (-0.005) + r4.y;
    r5.xyw = r5.xxx * r3.xyz;
    r5.z = ps;
    r3.xy = r5.xy * r5.zz + r0.xy;
    r9 = tex2D(Texture2D_2, r3.xy);
    r3 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r10 = -r9 + r3;
    r11.y = ps;
    r3.xy = r11.xy * abs(r7.xy);
    r7 = r10.wxyz * UniformScalar_5.xxxx + float4(-0.1, 0.0, 0.0, 0.0);
    r9 = r7.yzwx + r9;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.wwww)) clip(-1.0);
    r0.y = tex2D(Texture2D_0, r0.xy).z;
    r0.xz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.z = (UniformScalar_6.x > 0.0) ? UniformScalar_15.x : UniformScalar_11.x;
    r5.z = (UniformScalar_6.x >= 0.0) ? r5.z : UniformScalar_11.x;
    ps = rsqrt(abs(r6.w));
    r7.xy = r0.xz * 0.875;
    r6.w = ps;
    r0.x = r6.w * r1.z;
    ps = OpacityOverride.x;
    r5.xy = r0.xy + float2(0.1, -1.0);
    r7.w = saturate(ps);
    ps = 5.0 * r5.x;
    r1.xyz = r5.zzz * UniformVector_2.xyz;
    r7.z = saturate(ps);
    ps = r5.y;
    r5.z = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    ps = r0.y + ps;
    r10.yzw = -r9.xyz + r5.zzz;
    r10.x = ps;
    r0.x = r10.x * 0.5 + 0.5;
    r0.yzw = r10.yzw * 0.8 + r9.xyz;
    r5.xz = -r7.wz + 1.0;
    ps = ModShadowGroupColor.x * r5.z;
    r6.w = max(r5.w, 0.0);
    r6.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.yzw = r1.xyz * r0.yzw;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r5.w = float((r5.x >= 0.004));
    r1.x = ps;
    ps = 1.0 - r6.z;
    r5.xy = r0.xy * 5.0;
    r1.y = ps;
    ps = 1.0 - r6.w;
    r0.xyz = r5.xxy * r0.zwx;
    r1.z = ps;
    r5.xy = r7.xy * r1.xy + 0.125;
    ps = log2(abs(r1.z));
    r5.x = r5.x * r5.y;
    r8.x = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.xw = r8.yx * float2(4.0, 0.75);
    r4.x = r6.x * r6.y;
    r1.xyz = r4.xzw * UniformVector_3.xyz;
    ps = pow(2.0, r6.w);
    r6.xyz = abs(r1.xzy) * abs(r1.xzy);
    r6.w = ps;
    r6.xyz = r6.xyz * r6.xyz + UniformVector_0.xzy;
    r6.xyz = r0.zyx * r6.www + r6.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
