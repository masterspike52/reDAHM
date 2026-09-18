// ps_779437ece9c0eef4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040D00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.xy + UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r1.zxy, r1.zxy);
    r6.y = ps;
    r8.xyz = r8.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r0.z = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r0.www * r1.xyz;
    r0.z = ps;
    r13.xyz = r0.zzz * r3.zyx;
    r1.w = saturate(dot(r13.xzy, r8.xzy));
    ps = OpacityOverride.x;
    r0.z = r12.z + 0.1;
    r0.w = saturate(ps);
    ps = r6.x;
    r0.z = saturate(r0.z * 5.0);
    ps = abs(r5.x) * ps;
    r0.zw = -r0.zw + 1.0;
    r1.x = ps;
    ps = r6.y;
    r1.yz = r0.zz * ModShadowGroupColor.xy;
    ps = abs(r5.y) * ps;
    r9.xyz = -r1.wyz + 1.0;
    r1.y = ps;
    r8.xyz = tex2D(Texture2D_2, r9.xx).xyz;
    r3 = tex2D(Texture2D_0, r0.xy);
    r1.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r6.xzw = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r7.xy).xyz;
    ps = ConstantLighting.z;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.21952 * ps;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.w = ps;
    ps = r10.y + r10.y;
    r9.x = r6.x * r10.x;
    r1.z = ps;
    ps = 0.875 * r1.x;
    r0.xyz = -UniformVector_0.zxy + 1.0;
    r11.x = ps;
    ps = 0.875 * r1.y;
    r5.yz = -r13.zy;
    r11.y = ps;
    r5.x = r13.x * 2.0 - r13.x;
    ps = rsqrt(abs(r1.w));
    r1.x = saturate(dot(r12.xyz, r5.yzx));
    r1.y = ps;
    ps = log2(r1.x);
    r5.xyz = r8.xyz + r3.xyz;
    r1.x = ps;
    ps = AmbientColorAndSkyFactor.x * r0.y;
    r1.xyw = r1.xyy * float3(15.0, -0.5, 0.5);
    r6.x = ps;
    ps = pow(2.0, r1.x);
    r4.zw = r1.yw * r4.zz;
    r10.w = ps;
    ps = AmbientColorAndSkyFactor.y * r0.z;
    r4.xy = r11.xy * r9.yz;
    r6.y = ps;
    ps = r5.w;
    r1.xw = r10.zw * float2(1e+02, 0.21952);
    ps = r10.w * ps;
    r4 = r4.zxwy + float4(0.5, 0.125, 0.5, 0.125);
    r10.z = ps;
    ps = r4.y * r4.w;
    r11.xyz = r5.xyz * r0.yzx;
    r4.y = ps;
    ps = abs(r4.x) * abs(r4.x);
    r0.w = float((r0.w >= 0.004));
    r1.y = ps;
    ps = abs(r4.z) * abs(r4.z);
    r9.yz = r1.zx * r6.zw;
    r4.x = ps;
    r3.xyz = r4.yyy * r7.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.x * r1.w;
    r7.xyz = r11.xzy * r4.xxx;
    r10.x = ps;
    ps = ConstantLighting.y * r1.w;
    r4.xyz = r11.xzy * r1.yyy;
    r10.y = ps;
    r1.xyz = r11.xyz * ConstantLighting.xyz + r10.xyz;
    r4.xyz = r4.xzy * LowerSkyColor.xyz + r1.xyz;
    ps = AmbientColorAndSkyFactor.z * r0.x;
    r1.xyz = r9.xyz + UniformVector_0.xyz;
    r6.z = ps;
    r1.xyz = r3.www * r8.xzy + r1.xzy;
    r0.xyz = r7.xzy * UpperSkyColor.xyz + r4.xyz;
    r0.xyz = r6.xzy * r5.xzy + r0.xzy;
    r0.xyz = r1.xyz + r0.xyz;
    ps = -r2.w;
    r0.xyz = r0.xyz * r3.xzy;
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
