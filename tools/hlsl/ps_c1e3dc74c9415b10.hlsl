// ps_c1e3dc74c9415b10.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040F00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 ConstantLighting : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy + UniformVector_1.xy;
    r8.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r6.xy = r0.xy + UniformVector_3.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.xy + UniformVector_2.xy;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = dot(r8.zxy, r8.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.xxx * r3.xyz;
    r0.w = ps;
    ps = r7.z;
    r15.xyz = r0.www * r8.xyz;
    ps = abs(r5.x) * ps;
    r0.w = dot(r15.zxy, r0.zxy);
    r6.z = ps;
    ps = r7.w;
    r3.xyz = r15.xzy * r0.www;
    r13.xyz = r3.xyz * 2.0 - r0.xzy;
    ps = abs(r5.y) * ps;
    r0 = xe_cube(r13.xzy);
    r6.w = ps;
    ps = 1.0 / abs(r0.z);
    r3.z = r0.w;
    r3.x = ps;
    r3.xy = r0.yx * r3.xx + 1.5;
    r8.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(Texture2D_2, r6.xy).xyz;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    ps = OpacityOverride.x;
    r12.x = ConstantLighting.z * 0.21952;
    r12.w = saturate(ps);
    ps = -ModShadowColor.x;
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    ps = 1.0 + ps;
    r0.x = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = -ModShadowColor.y;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.y = dot(r4.zxy, r4.zxy);
    r11.y = ps;
    r3.w = r7.x * 6e+01 + r3.x;
    ps = rsqrt(abs(r0.y));
    r9.xyz = r5.xyz * 0.21952;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r0.yzw = r0.yyy * r4.xyz;
    r0.x = ps;
    ps = -ModShadowColor.z;
    r4.xyz = r0.xxx * r1.xyz;
    ps = 1.0 + ps;
    r0.x = r4.z + 0.1;
    r11.z = ps;
    ps = 5.0 * r0.x;
    r10.xyz = r15.zzz * ConstantLighting.xyz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r14.x = dot(r0.wyz, r15.zxy);
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r1 = r14.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r12.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.xy = r1.xy + 0.5;
    r12.z = ps;
    ps = abs(r1.x) * abs(r1.x);
    r0.z = saturate(dot(r4.zxy, r13.yxz));
    r1.x = ps;
    ps = log2(r0.z);
    r0.xyw = -r12.yzw + 1.0;
    r8.w = ps;
    r12.yz = r1.zw * r0.xy + 0.125;
    ps = abs(r1.y) * abs(r1.y);
    r4 = r8 * float4(7e+01, 7e+01, 7e+01, 15.0);
    r0.z = ps;
    ps = pow(2.0, r4.w);
    r1.yzw = r4.xyz * UniformScalar_11.xxx;
    r12.w = ps;
    ps = r3.w;
    r4.xyz = r9.xzy * r0.zzz;
    r0.xy = r7.yz * 6e+01 + r1.zw;
    ps = r1.y + ps;
    r0.z = r12.w * 0.21952;
    r3.x = ps;
    ps = ConstantLighting.x * r0.z;
    r7.xyz = r9.xzy * r1.xxx;
    r8.x = ps;
    ps = r12.x * r12.w;
    r0.w = float((r0.w >= 0.004));
    r8.z = ps;
    ps = r12.y * r12.z;
    r3.yz = r0.yx + r3.zy;
    r8.w = ps;
    r1.xyz = r8.www * r11.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.y * r0.z;
    r3.xyz = r3.xyz + UniformVector_0.xzy;
    r8.y = ps;
    r0.xyz = r10.xyz * r9.xyz + r8.xyz;
    r0.xyz = r7.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r4.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r6.xzy * r5.xzy + r0.xzy;
    r0.xyz = r3.xyz + r0.xyz;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.xzy;
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
