// ps_710c99cf0f4db9a7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040C00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r2.y = ps;
    ps = rsqrt(abs(r0.z));
    r6.xy = UniformVector_2.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = r0.z * r3.z;
    r2.z = ps;
    ps = r2.y;
    r12.xy = r0.zz * -r3.xy;
    ps = abs(r5.x) * ps;
    r6.w = r0.w + r0.w;
    r2.x = ps;
    ps = r2.z;
    r12.z = r6.w - r0.w;
    ps = abs(r5.y) * ps;
    r3 = xe_cube(r12.xyz);
    r2.y = ps;
    ps = 1.0 / abs(r3.z);
    r5.z = r3.w;
    r0.z = ps;
    r5.xy = r3.yx * r0.zz + 1.5;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r10.yzw = tex2D(Texture2D_4, r6.xy).xyz;
    r9.z = tex2D(Texture2D_3, r0.xy).x;
    r3.yz = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r11.x = saturate(ps);
    ps = -ModShadowColor.x;
    r9.w = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r3.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    r6.x = ps;
    ps = -ModShadowColor.y;
    r5.w = float((UniformScalar_1.x > UniformScalar_0.x));
    ps = 1.0 + ps;
    r3.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = -ModShadowColor.z;
    r7.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r6.z = ps;
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r5.xyz = r0.xyz * UniformVector_1.xyz;
    r9.x = ps;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r8.xyz * r11.yzw;
    r7.w = ps;
    ps = rsqrt(abs(r3.x));
    r1.xyz = r7.www * r1.xzy;
    r3.x = ps;
    r0.xyz = (-abs(r5.www) >= 0.0) ? r8.xyz : r0.xyz;
    r8.xyz = (-abs(r3.www) >= 0.0) ? r8.xyz : r0.xyz;
    ps = 0.1 - -r1.y;
    r3 = r3.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r3.xy = r3.xy * r4.zz;
    r9.y = saturate(ps);
    ps = r6.w;
    r0.xyz = -r5.xyz + r8.xyz;
    r8.xyz = r0.xyz * UniformScalar_1.xxx + r5.xyz;
    r4.xyz = r8.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = -r0.w + ps;
    r0.xz = -r9.zy + 1.0;
    r11.w = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r0.y = saturate(dot(r1.yxz, r12.zxy));
    r11.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r5.xyz = r0.xxx * r8.xyz;
    r11.z = ps;
    ps = log2(r0.y);
    r1 = -r11.wxyz + 1.0;
    r10.x = ps;
    ps = AmbientColorAndSkyFactor.y * r2.z;
    r0 = r9.wzzz * r10.xzwy;
    r9.y = ps;
    r8.xyz = r0.wyz * r8.xyz + r5.xyz;
    ps = pow(2.0, r0.x);
    r0.w = float((r1.y >= 0.004));
    r0.x = ps;
    ps = log2(abs(r1.x));
    r3.zw = r3.zw * r1.zw;
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r5.xyz = r0.xxx * ConstantLighting.xzy;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1 = r3.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    r0.x = ps;
    ps = r1.y * r1.z;
    r3.xyz = r8.xyz * r2.yzx;
    r4.w = ps;
    ps = abs(r1.x) * abs(r1.x);
    r0.xyz = r0.xxx * r7.yxz;
    r3.w = ps;
    r1.xyz = r4.www * r6.xyz + ModShadowColor.xyz;
    ps = abs(r1.w) * abs(r1.w);
    r9.zw = r0.xz * r4.yz;
    r1.w = ps;
    ps = UniformScalar_5.x * r0.y;
    r6.xyz = r3.xzy * r3.www;
    r0.x = ps;
    ps = r0.x;
    r7.xyz = r3.xzy * r1.www;
    ps = r4.x * ps;
    r0.yz = r9.zw * UniformScalar_5.xx;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    r9.z = ps;
    r0.xyz = r9.xyz * r8.xyz + r0.xyz;
    r0.xyz = r7.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r6.xyz * LowerSkyColor.xzy + r0.xzy;
    r0.xyz = r5.xzy * r4.xyz + r0.xzy;
    r0.xyz = r3.xzy * ConstantLighting.xzy + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xzy * r1.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
