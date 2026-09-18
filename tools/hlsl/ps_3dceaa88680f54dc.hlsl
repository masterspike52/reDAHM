// ps_3dceaa88680f54dc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040E00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UniformVector_5 : register(c9); // float4
float4 UpperSkyColor : register(c11); // float3
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
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.xy = r0.xy + UniformVector_2.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = UniformVector_3.yx - 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r6.xy + r0.yx;
    r0.w = ps;
    r5.xy = r0.zw * abs(r5.xy);
    r0.w = dot(r6.xy, UniformVector_5.yx) + 0.5;
    r0.z = dot(r6.xy, UniformVector_4.yx) + 0.5;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r14.xyz = tex2D(Texture2D_2, r2.xy).xyz;
    r9.xyw = tex2D(Texture2D_2, r0.zw).xyz;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.w = dot(r4.zxy, r4.zxy);
    r7.w = dot(r3.zxy, r3.zxy);
    r10.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r9.z = saturate(ps);
    ps = UniformVector_0.x + r2.y;
    r5.xyz = r10.xyz * r0.xyz;
    r7.x = ps;
    ps = UniformVector_0.y + r2.z;
    r0.x = dot(r13.zxy, r13.zxy);
    r7.y = ps;
    ps = UniformVector_0.z + r2.x;
    r0.yzw = r14.xyz * r9.xyw;
    r7.z = ps;
    ps = rsqrt(abs(r7.w));
    r0.yw = r0.yw * r9.xw;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r3.xyz = r7.www * r3.xyz;
    r3.w = ps;
    ps = rsqrt(abs(r5.w));
    r9.xyw = r3.www * r4.xyz;
    r3.w = ps;
    ps = r0.z * r0.z;
    r1.xyz = r3.www * r1.zxy;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r0.yw = r0.yw * r14.xz;
    r0.x = ps;
    ps = 0.1 - -r1.x;
    r4.xyz = r0.xxx * r13.zxy;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    r1.w = saturate(ps);
    ps = UniformVector_1.x * r0.y;
    r11.x = dot(r9.wxy, r4.xyz);
    r13.x = ps;
    ps = UniformVector_1.y * r0.z;
    r0.x = dot(r4.xyz, r3.zxy);
    r13.y = ps;
    ps = UniformVector_1.z * r0.w;
    r0.z = -r1.w + 1.0;
    r13.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r4.yzx * r0.xxx;
    r9.x = ps;
    r7.xyz = r13.xyz * r2.yzx + r7.xyz;
    r7.xyz = r12.xyz * r10.xyz + r7.xyz;
    r10.xyz = r0.xyw * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r3 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r9.y = ps;
    ps = r3.y;
    r4.xyz = r4.xxx * ConstantLighting.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r1.z = saturate(dot(r1.xyz, r10.zxy));
    r1.x = ps;
    ps = 0.5 + r3.x;
    r0.xyw = -r9.xyz + 1.0;
    r1.y = ps;
    r0.yz = r3.zw * r0.xy + 0.125;
    ps = log2(r1.z);
    r1.xy = abs(r1.xy) * abs(r1.xy);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r1.w = ps;
    ps = r0.y * r0.z;
    r3.xyz = r5.xzy * r1.xxx;
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r1.xyz = r5.xzy * r1.yyy;
    r1.w = ps;
    r1.xyz = r1.xyz * UpperSkyColor.xzy + r7.xzy;
    r1.xyz = r3.xzy * LowerSkyColor.xyz + r1.xzy;
    r3.xyz = r1.www * ConstantLighting.xzy;
    r1.xyz = r3.xyz * r6.xzy + r1.xzy;
    r1.xyz = r4.xyz * r5.xyz + r1.xzy;
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
