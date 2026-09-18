// ps_4a717be687aa5832.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10040700 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.yz = tex2D(Texture2D_2, r0.xy).xz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.y = 0.5;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xz = saturate(r5.yz - UniformScalar_5.xx);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r3.x = tex2D(Texture2D_0, r0.xy).x;
    r3.y = tex2D(Texture2D_1, r0.xy).z;
    r3.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = tex2D(Texture2D_3, r4.xy).xyz;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.yzx * UniformVector_1.yzx;
    r5.w = ps;
    ps = UniformVector_0.x + r5.z;
    r5.w = r5.w * r1.z;
    r6.y = ps;
    ps = UniformVector_0.z + r5.y;
    r6.xw = r5.wz + float2(0.1, -0.5);
    r6.z = ps;
    ps = 5.0 * r6.x;
    r3 = r3 * float4(5e+01, 255.0, 0.875, 0.875);
    r5.z = saturate(ps);
    r0.xyw = r3.xyx * r4.xzx + r6.yzw;
    ps = OpacityOverride.x;
    r5.z = -r5.z + 1.0;
    r1.z = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r1.y = ps;
    r1.xyz = -r1.xyz + 1.0;
    r6.x = float((r1.z >= 0.004));
    r1.xy = r3.zw * r1.xy + 0.125;
    ps = UniformVector_0.y + r5.x;
    r1.x = r1.x * r1.y;
    r0.z = ps;
    r5.xyz = r1.xxx * r6.yzw + ModShadowColor.xyz;
    ps = -r2.w;
    r5.xyz = r0.xzy * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
