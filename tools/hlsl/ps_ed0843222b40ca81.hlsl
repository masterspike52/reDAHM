// ps_ed0843222b40ca81.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10041000 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy + UniformVector_1.xy;
    r6.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r8.xy = r0.xy + UniformVector_3.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r0.xy + UniformVector_2.xy;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r5.x));
    r5.w = dot(r6.zxy, r6.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.xxx * r3.xyz;
    r5.w = ps;
    ps = r8.z;
    r16.xyz = r5.www * r6.xyz;
    ps = abs(r7.x) * ps;
    r5.w = dot(r16.zxy, r5.zxy);
    r0.x = ps;
    ps = r8.w;
    r6.xyz = r16.xzy * r5.www;
    r13.xyz = r6.xyz * 2.0 - r5.xzy;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r13.xzy);
    r0.y = ps;
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r12.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r15.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r8.xyz = tex2D(Texture2D_2, r8.xy).xyz;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    ps = OpacityOverride.x;
    r11.x = ConstantLighting.z * 0.21952;
    r11.w = saturate(ps);
    ps = -ModShadowColor.x;
    r7.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    ps = 1.0 + ps;
    r5.x = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = -ModShadowColor.y;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    r0.w = r8.x * 6e+01 + r0.x;
    ps = rsqrt(abs(r5.y));
    r9.xyz = r3.xyz * 0.21952;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r4.xyz;
    r5.x = ps;
    ps = -ModShadowColor.z;
    r14.xyz = r5.xxx * r1.xyz;
    ps = 1.0 + ps;
    r5.x = r14.z + 0.1;
    r6.z = ps;
    ps = 5.0 * r5.x;
    r10.xyz = r16.zzz * ConstantLighting.xyz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r15.x = dot(r5.wyz, r16.zxy);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1 = r15.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r11.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r4.xy = r1.xy + 0.5;
    r11.z = ps;
    ps = abs(r4.x) * abs(r4.x);
    r5.z = saturate(dot(r14.zxy, r13.yxz));
    r6.w = ps;
    ps = log2(r5.z);
    r5.xyw = -r11.yzw + 1.0;
    r12.w = ps;
    r11.yz = r1.zw * r5.xy + 0.125;
    ps = abs(r4.y) * abs(r4.y);
    r1 = r12 * float4(7e+01, 7e+01, 7e+01, 15.0);
    r5.z = ps;
    ps = pow(2.0, r1.w);
    r4.xyz = r1.xyz * UniformScalar_11.xxx;
    r11.w = ps;
    ps = r0.w;
    r1.xyz = r9.xzy * r5.zzz;
    r5.xy = r8.yz * 6e+01 + r4.yz;
    ps = r4.x + ps;
    r5.z = r11.w * 0.21952;
    r0.x = ps;
    ps = ConstantLighting.x * r5.z;
    r4.xyz = r9.xzy * r6.www;
    r8.x = ps;
    ps = r11.x * r11.w;
    r5.w = float((r5.w >= 0.004));
    r8.z = ps;
    ps = r11.y * r11.z;
    r0.yz = r5.yx + r0.zy;
    r8.w = ps;
    r6.xyz = r8.www * r6.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.y * r5.z;
    r0.xyz = r0.xyz + UniformVector_0.xzy;
    r8.y = ps;
    r5.xyz = r10.xyz * r9.xyz + r8.xyz;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xyz;
    r5.xyz = r1.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r7.xzy * r3.xzy + r5.xzy;
    r5.xyz = r0.xyz + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xzy;
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
