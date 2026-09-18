// ps_7f25e5ac31e19a67.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10040500 00000506 00000000 000048A5 001F001F 00000021 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_5 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xz = tex2D(Texture2D_2, r0.xy).xz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.y = 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xz = saturate(r3.xz - UniformScalar_5.xx);
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.x = tex2D(Texture2D_0, r0.xy).x;
    r4.y = tex2D(Texture2D_1, r0.xy).z;
    r4.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.xyz = tex2D(Texture2D_3, r3.xy).xyz;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.yzx * UniformVector_1.yzx;
    r0.w = ps;
    ps = UniformVector_0.x + r0.z;
    r0.w = r0.w * r1.z;
    r1.y = ps;
    ps = UniformVector_0.z + r0.y;
    r1.xw = r0.wz + float2(0.1, -0.5);
    r1.z = ps;
    ps = 5.0 * r1.x;
    r5 = r4 * float4(5e+01, 255.0, 0.875, 0.875);
    r0.z = saturate(ps);
    r3.xyw = r5.xyx * r3.xzx + r1.yzw;
    ps = OpacityOverride.x;
    r0.z = -r0.z + 1.0;
    r4.z = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r1.yzw = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    r4.y = ps;
    r4.xyz = -r4.xyz + 1.0;
    r1.x = float((r4.z >= 0.004));
    r4.xy = r5.zw * r4.xy + 0.125;
    ps = UniformVector_0.y + r0.x;
    r4.x = r4.x * r4.y;
    r3.z = ps;
    r0.xyz = r4.xxx * r1.yzw + ModShadowColor.xyz;
    ps = -r2.w;
    r0.xyz = r3.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
