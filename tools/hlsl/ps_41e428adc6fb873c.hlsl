// ps_41e428adc6fb873c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040E00 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r0.xy * UniformScalar_0.xx;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.zw = r1.xy * UniformVector_3.xy;
    r7.y = ps;
    r1.xy = r7.xy * abs(r6.xy);
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r1.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r1.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.zw).xyw;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.z = dot(r5.zxy, r5.zxy);
    r7.xyz = UniformVector_4.yzx * UniformVector_4.www;
    r0.x = dot(r2.zxy, r2.zxy);
    r14.xy = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r10.z = r8.z - 1.0;
    r0.x = ps;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    r8.xyz = r7.xyz * UniformVector_5.yzx - r7.xyz;
    ps = rsqrt(abs(r0.z));
    r10.xy = r9.xy * 0.875;
    r0.w = ps;
    r7.yzw = r8.xyz * r11.xxx + r7.xyz;
    ps = r3.w;
    r9.xyz = r0.xxx * r2.xyz;
    ps = 0.0001 * ps;
    r0.x = r9.z + 0.1;
    r2.z = saturate(ps);
    ps = OpacityOverride.x;
    r0.x = saturate(r0.x * 5.0);
    r0.z = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r0.xz = -r0.zx + 1.0;
    r0.y = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r8.xyz = r0.yyy * r4.xyz;
    r2.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.w = float((r0.x >= 0.004));
    r2.y = ps;
    r0.xyz = -r2.xzy + 1.0;
    r13.xyz = r10.xyz * r0.xzy + float3(0.125, 0.125, 1.0);
    ps = UniformScalar_1.x * r0.y;
    r10.xyz = UniformVector_0.xyz + UniformScalar_7.xxx;
    r4.z = ps;
    r4.xy = r4.zz * r14.xy + r1.yz;
    r2.w = (r4.z > 0.0) ? r13.z : 1.0;
    ps = r13.x * r13.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    r0.xyz = r0.xxx * r12.xyz + ModShadowColor.xyz;
    r7.x = (r4.z >= 0.0) ? r2.w : 1.0;
    ps = UniformVector_2.z * r1.x;
    r4.xy = r4.xy * UniformVector_2.xy;
    r4.z = ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r1.xyz = r7.xyz * r11.xyz;
    r1.xyz = r1.xyz * r7.wxx;
    ps = rsqrt(abs(r2.w));
    r1.xyz = r1.xyz * UniformScalar_5.xxx;
    r2.w = ps;
    ps = r0.w;
    r4.xyz = r4.xyz * r2.www;
    ps = r5.x * ps;
    r2.xyz = r1.xyz * r2.xyz;
    r7.x = ps;
    ps = r0.w;
    r6.xyz = -r1.xyz + r6.xyz;
    ps = r5.y * ps;
    r2.w = dot(r4.zxy, r8.zxy);
    r7.y = ps;
    ps = r0.w;
    r11.xyz = r4.xyz * r2.www;
    r1.xyz = r6.xyz * UniformScalar_5.xxx + r1.xyz;
    r6.xyz = r1.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r8.xyz = r11.xyz * 2.0 - r8.xyz;
    r1.xyz = r1.xyz * UniformScalar_6.xxx + r10.xyz;
    r1.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + r1.xyz;
    ps = r5.z * ps;
    r0.w = saturate(dot(r9.zxy, r8.zxy));
    r7.z = ps;
    ps = log2(r0.w);
    r5.x = dot(r7.zxy, r4.zxy);
    r5.y = ps;
    r4.xyw = r5.xxy * float3(-0.5, 0.5, 15.0);
    r5.xy = r4.xy + 0.5;
    ps = pow(2.0, r4.w);
    r5.yz = abs(r5.xy) * abs(r5.xy);
    r0.w = ps;
    ps = ConstantLighting.x * r0.w;
    r4.xyz = r4.zzz * ConstantLighting.xyz;
    r5.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r2.xzy * r5.yyy;
    r5.y = ps;
    ps = ConstantLighting.y * r0.w;
    r8.xyz = r2.xzy * r5.zzz;
    r5.z = ps;
    r1.xyz = r8.xyz * UpperSkyColor.xzy + r1.xzy;
    r1.xyz = r7.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r5.xyz * r6.xyz + r1.xzy;
    r1.xyz = r4.xyz * r2.xyz + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r3.w;
    r0.xyz = r2.xyz * r1.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
