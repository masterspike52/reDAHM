// ps_90aa5fbd6450fd6c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
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
samplerCUBE TextureCube_0 : register(s3);
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
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = rsqrt(abs(r6.x));
    r0.zw = r0.zw * abs(r5.xy);
    r5.x = ps;
    r10.xyz = r5.xxx * r3.xyz;
    r3 = xe_cube(r10.xyz);
    ps = 1.0 / abs(r3.z);
    r5.z = r3.w;
    r5.x = ps;
    r5.xy = r3.yx * r5.xx + 1.5;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r8.yw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = dot(r1.zxy, r1.zxy);
    r0.z = dot(r4.zxy, r4.zxy);
    r3.xyz = r12.xyz * r5.xyz;
    r0.x = dot(r11.zxy, r11.zxy);
    ps = rsqrt(abs(r0.z));
    r5.xyz = r5.xyz * AmbientColorAndSkyFactor.xyz;
    r0.z = ps;
    r5.xyz = r5.xyz * r12.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.y));
    r4.xyz = r0.zzz * r4.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r1.yzw = r0.yyy * r1.xyz;
    r0.x = ps;
    r0.xyw = r0.xxx * r11.xyz;
    r8.x = dot(r4.zxy, r0.wxy);
    ps = 0.1 - -r1.w;
    r0.z = dot(r0.wxy, r10.zxy);
    r1.x = ps;
    ps = OpacityOverride.x;
    r1.x = saturate(r1.x * 5.0);
    r8.z = saturate(ps);
    ps = 1.0 - r1.x;
    r4.xyz = r0.xyw * r0.zzz;
    r0.z = ps;
    r10.xyz = r4.xyz * 2.0 - r10.xyz;
    ps = ModShadowGroupColor.x * r0.z;
    r4 = r8.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r8.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r4.xy = r4.xy + 0.5;
    r8.y = ps;
    ps = abs(r4.x) * abs(r4.x);
    r0.z = saturate(dot(r1.wyz, r10.zxy));
    r3.w = ps;
    ps = abs(r4.y) * abs(r4.y);
    r1.xyz = -r8.zxy + 1.0;
    r1.w = ps;
    r8.xyz = r3.xzy * r3.www;
    r1.x = float((r1.x >= 0.004));
    r1.yz = r4.zw * r1.yz + 0.125;
    ps = log2(r0.z);
    r4.yzw = r3.xzy * r1.www;
    r6.x = ps;
    ps = ConstantLighting.x * r0.w;
    r6 = r6.yzwx * float4(3e+01, 3e+01, 3e+01, 15.0);
    r4.x = ps;
    r5.xyz = r4.yzw * UpperSkyColor.xzy + r5.xzy;
    ps = ConstantLighting.y * r0.w;
    r0.z = r1.y * r1.z;
    r4.y = ps;
    r1.yzw = r0.zzz * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = pow(2.0, r6.w);
    r6.xyz = r6.xzy * r7.xzy;
    r0.z = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r4.xyz * r3.xyz + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.yzw;
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
