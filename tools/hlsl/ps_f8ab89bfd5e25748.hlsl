// ps_f8ab89bfd5e25748.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040E00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c13); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    r6.xyw = r6.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    r7.xyz = r7.xyz - r6.xyw;
    r6.xyw = r7.xyz * UniformScalar_0.xxx + r6.xyw;
    ps = rsqrt(abs(r0.w));
    r0.z = dot(r6.xyw, r6.xyw);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r7.xyw = r0.www * r3.xyz;
    r0.z = ps;
    ps = r9.x;
    r6.xyw = r6.ywx * r0.zzz;
    ps = abs(r5.x) * ps;
    r0.w = dot(r6.wxy, r7.wxy);
    r0.z = ps;
    ps = r9.y;
    r8.xyz = r6.yxw * r0.www;
    r12.xyz = r8.yxz * 2.0 - r7.xyw;
    ps = abs(r5.y) * ps;
    r3 = xe_cube(r12.xyz);
    r0.w = ps;
    ps = 1.0 / abs(r3.z);
    r5.z = r3.w;
    r5.x = ps;
    r5.xy = r3.yx * r5.xx + 1.5;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r10.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r3.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r5.w = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r0.xyz = r14.xyz * r0.xyz;
    r8.w = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r13.xyz = r5.xyz * UniformScalar_6.xxx;
    r6.z = ps;
    r10.xyz = r13.xyz * r10.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.zzz * r4.xyz;
    r4.w = ps;
    ps = UniformScalar_7.x;
    r13.xyz = r4.www * r1.xyz;
    r1.x = ps;
    r0.xyz = (-abs(r3.www) >= 0.0) ? r14.xyz : r0.xyz;
    r0.yzw = (-abs(r0.www) >= 0.0) ? r14.xyz : r0.xyz;
    ps = 0.0001;
    r0.x = r13.z + 0.1;
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r0.x = saturate(r0.x * 5.0);
    r1.x = ps;
    ps = 1.0 - r0.x;
    r1.yzw = r0.yzw - r5.xyz;
    r0.z = ps;
    r0.xyw = r1.yzw * UniformScalar_0.xxx + r5.xyz;
    r5.xyz = r0.xyw * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = ModShadowGroupColor.x * r0.z;
    r3.xyz = r0.xyw * r3.xyz;
    r8.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r9.x = dot(r4.zxy, r6.wxy);
    r8.y = ps;
    r8.z = saturate(r8.z * 2.0 - r7.w);
    ps = ConstantLighting.x * r6.w;
    r9 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.x = ps;
    ps = ConstantLighting.y * r6.w;
    r1.zw = r9.xy + 0.5;
    r4.y = ps;
    ps = abs(r1.z) * abs(r1.z);
    r1.y = saturate(dot(r13.zxy, r12.zxy));
    r1.z = ps;
    ps = abs(r1.w) * abs(r1.w);
    r0 = -r8.wxyz + 1.0;
    r3.w = ps;
    ps = log2(r1.y);
    r8.xyz = r3.xzy * r1.zzz;
    r1.w = ps;
    r1.yz = r9.zw * r0.yz + 0.125;
    ps = log2(abs(r0.w));
    r9.xyz = r3.xzy * r3.www;
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r0.w = float((r0.x >= 0.004));
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1.xw = r1.yx * r1.zw;
    r0.x = ps;
    r1.xyz = r1.xxx * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r0.xyz = r0.xxx * r7.yxz;
    r1.w = ps;
    ps = UniformScalar_5.x * r0.y;
    r7.xyz = r1.www * ConstantLighting.xzy;
    r1.w = ps;
    ps = r1.w;
    r0.xy = r0.xz * r5.yz;
    ps = r5.x * ps;
    r0.yz = r0.xy * UniformScalar_5.xx;
    r0.x = ps;
    ps = ConstantLighting.z * r6.w;
    r0.xyz = r10.xyz + r0.xyz;
    r4.z = ps;
    r0.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    r0.xyz = r9.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r8.xyz * LowerSkyColor.xzy + r0.xzy;
    r0.xyz = r7.xyz * r5.xzy + r0.xyz;
    r0.xyz = r4.xyz * r3.xyz + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
