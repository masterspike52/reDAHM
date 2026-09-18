// ps_745e9582c1ad12d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040D00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
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
float4 UniformScalar_5 : register(c7); // float
float4 UniformScalar_6 : register(c8); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c13); // float3
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

    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.xy + UniformVector_1.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r8.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7.xyw = tex2D(Texture2D_3, r0.xy).yzx;
    r0.z = tex2D(Texture2D_1, r0.xy).x;
    r6.xyz = tex2D(Texture2D_2, r2.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.z = max(UniformScalar_9.x, 0.0001);
    ps = OpacityOverride.x;
    r0.x = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = -UniformVector_0.x;
    r0.y = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r0.w = dot(r3.zxy, r3.zxy);
    r13.x = ps;
    ps = -UniformVector_0.y;
    r10.xyz = UniformVector_2.xyz * UniformScalar_5.xxx;
    ps = 1.0 + ps;
    r2.xyz = UniformVector_3.xyz * UniformScalar_6.xxx;
    r13.y = ps;
    r11.xyz = r11.zxy * 2.0 - 1.0;
    r2.xyz = r10.xyz * r6.xyz + r2.xyz;
    ps = rsqrt(abs(r0.w));
    r10.x = -r0.z + 1.0;
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r6.xyz = r0.www * r3.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r4.yzw = r0.yyy * r4.xyz;
    r0.x = ps;
    r12.xyz = r2.xyz * r0.zzz + UniformVector_0.xyz;
    ps = -UniformVector_0.z;
    r2.xyz = r0.xxx * r1.xzy;
    ps = 1.0 + ps;
    r10.yzw = r10.xxx * r7.wxy;
    r13.z = ps;
    ps = 0.1 - -r2.y;
    r0.y = dot(r11.xyz, r11.xyz);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r3.xyz = r10.yzw * r13.xyz;
    r0.y = ps;
    r7.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r12.xyz;
    ps = 5.0 * r0.x;
    r0.yzw = r11.yzx * r0.yyy;
    r0.x = saturate(ps);
    ps = ConstantLighting.x * r0.w;
    r1.yzw = r10.zwx * UniformScalar_7.xxx;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r8.x = dot(r4.wyz, r0.wyz);
    r4.y = ps;
    ps = r1.w;
    r1.x = dot(r0.wyz, r6.zxy);
    ps = r7.w * ps;
    r10.xyz = r0.yzw * r1.xxx;
    r1.x = ps;
    ps = 1.0 - r0.x;
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r0.z = ps;
    r6.xyz = r10.xyz * 2.0 - r6.xyz;
    ps = ModShadowGroupColor.x * r0.z;
    r3.w = saturate(dot(r2.yxz, r6.zxy));
    r5.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r8.xy = r8.xy + 0.5;
    r5.w = ps;
    ps = ConstantLighting.z * r0.w;
    r6.xyz = -r5.ywx + 1.0;
    r4.z = ps;
    r5.xy = r8.zw * r6.xy + 0.125;
    ps = r1.x;
    r0.xz = abs(r8.xy) * abs(r8.xy);
    r0.y = ps;
    ps = UniformScalar_8.x + r0.y;
    r8.xyz = r3.xzy * r0.xxx;
    r6.x = ps;
    ps = log2(r3.w);
    r0.xyz = r3.xzy * r0.zzz;
    r5.w = ps;
    r7.xyz = r0.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = UniformScalar_8.x + r1.y;
    r5.xw = r5.xz * r5.yw;
    r6.y = ps;
    r0.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    ps = pow(2.0, r5.w);
    r0.w = float((r6.z >= 0.004));
    r3.w = ps;
    ps = UniformScalar_8.x + r1.z;
    r7.xyz = r3.www * ConstantLighting.xzy;
    r6.z = ps;
    r1.xyz = r7.xzy * r6.xyz + r5.xyz;
    r1.xyz = r4.xyz * r3.xyz + r1.xyz;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
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
