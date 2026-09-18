// ps_0713259ed5e2188d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040C00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 ConstantLighting : register(c15); // float3
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.zw = UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r6.x * r3.z;
    r6.z = ps;
    ps = r6.y;
    r12.xy = r6.xx * -r3.xy;
    ps = abs(r5.x) * ps;
    r7.w = r6.w + r6.w;
    r6.x = ps;
    ps = r6.z;
    r12.w = r7.w - r6.w;
    ps = abs(r5.y) * ps;
    r3 = xe_cube(r12.xyw);
    r6.y = ps;
    ps = 1.0 / abs(r3.z);
    r5.z = r3.w;
    r5.x = ps;
    r5.xy = r3.yx * r5.xx + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.z = tex2D(Texture2D_2, r0.xy).x;
    r10.xyz = tex2D(Texture2D_3, r0.zw).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r4.zxy, r4.zxy);
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = dot(r1.zxy, r1.zxy);
    r6.xyz = r5.xyz * r6.xyz - r5.xyz;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r0.yzw = r0.yyy * r1.xyz;
    r9.x = ps;
    r6.xyz = r6.xyz * UniformScalar_0.xxx + r5.xyz;
    r5.xyz = r6.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = 0.1 - -r0.w;
    r10.xyz = r12.zzz * r10.xyz;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r9 = r9.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r1.y = saturate(ps);
    ps = r7.w;
    r9.zw = r9.zw * r4.zz;
    ps = -r6.w + ps;
    r4.z = saturate(dot(r0.wyz, r12.wxy));
    r1.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.xy = -r1.xy + 1.0;
    r12.w = saturate(ps);
    ps = log2(abs(r0.x));
    r12.xy = r0.yy * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = UniformScalar_3.x * r0.y;
    r1 = -r12.wyxz + 1.0;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r9.xy = r9.xy * r1.zy;
    r0.x = ps;
    r0.xyw = r0.xxx * r11.yzx;
    ps = UniformScalar_8.x;
    r4.xyw = r1.www * r6.xyz;
    r1.z = ps;
    ps = 0.0001;
    r1.x = float((r1.x >= 0.004));
    r1.w = ps;
    r6.xyz = r10.xyz * r6.xyz + r4.xyw;
    ps = UniformScalar_4.x * r0.w;
    r0.yz = r0.xy * r5.yz;
    r0.x = ps;
    ps = max(r1.z, r1.w);
    r1.y = r0.x * r5.x;
    r3.w = ps;
    ps = UniformScalar_4.x * r0.y;
    r3.xyz = r6.xyz * r3.xyz;
    r1.z = ps;
    ps = UniformScalar_4.x * r0.z;
    r9 = r9 + float4(0.125, 0.125, 0.5, 0.5);
    r1.w = ps;
    ps = r9.x * r9.y;
    r4.xy = abs(r9.zw) * abs(r9.zw);
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = log2(r4.z);
    r1.yzw = r1.yzw + UniformVector_0.xyz;
    r4.z = ps;
    r1.yzw = r7.xyz * r6.xyz + r1.yzw;
    r6 = r3.xzyw * r4.yyyz;
    ps = pow(2.0, r6.w);
    r4.xyz = r3.xzy * r4.xxx;
    r0.w = ps;
    r1.yzw = r6.xzy * UpperSkyColor.xyz + r1.yzw;
    r1.yzw = r4.xyz * LowerSkyColor.xzy + r1.ywz;
    r4.xyz = r0.www * ConstantLighting.xzy;
    r1.yzw = r4.xzy * r5.xyz + r1.ywz;
    r1.yzw = r3.xzy * ConstantLighting.xzy + r1.ywz;
    ps = -r2.w;
    r0.xyz = r1.ywz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xzy - r0.xzy;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
