// ps_be026b1ffd426786.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r8.xy = UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r5.z * r3.z;
    r5.y = ps;
    ps = r5.x;
    r12.xy = r5.zz * -r3.xy;
    ps = abs(r7.x) * ps;
    r6.w = r6.x + r6.x;
    r6.y = ps;
    ps = r5.y;
    r12.z = r6.w - r6.x;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r12.xyz);
    r6.z = ps;
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r3.x = ps;
    r3.xy = r5.yx * r3.xx + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r3.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r6.z = tex2D(Texture2D_2, r0.xy).x;
    r10.xyz = tex2D(Texture2D_3, r8.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r4.zxy, r4.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = dot(r1.zxy, r1.zxy);
    r13.xyz = r9.xyz * r7.xyz - r9.xyz;
    ps = rsqrt(abs(r5.y));
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r1.xyz;
    r3.x = ps;
    r9.xyz = r13.xyz * UniformScalar_0.xxx + r9.xyz;
    r1.xyz = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = 0.1 - -r5.w;
    r10.xyz = r6.zzz * r10.xyz;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r3 = r3.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r6.y = saturate(ps);
    ps = r6.w;
    r3.zw = r3.zw * r4.zz;
    ps = -r6.x + ps;
    r1.w = saturate(dot(r5.wyz, r12.zxy));
    r6.x = saturate(ps);
    ps = OpacityOverride.x;
    r5.xy = -r6.xy + 1.0;
    r6.w = saturate(ps);
    ps = log2(abs(r5.x));
    r6.xy = r5.yy * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = UniformScalar_3.x * r5.y;
    r6 = -r6.wyxz + 1.0;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r3.xy = r3.xy * r6.zy;
    r5.x = ps;
    r5.xyw = r5.xxx * r11.yzx;
    ps = UniformScalar_8.x;
    r4.xyz = r6.www * r9.xyz;
    r6.z = ps;
    ps = 0.0001;
    r6.x = float((r6.x >= 0.004));
    r6.w = ps;
    r4.xyz = r10.xyz * r9.xyz + r4.xyz;
    ps = UniformScalar_4.x * r5.w;
    r5.yz = r5.xy * r1.yz;
    r5.x = ps;
    ps = max(r6.z, r6.w);
    r6.y = r5.x * r1.x;
    r0.w = ps;
    ps = UniformScalar_4.x * r5.y;
    r0.xyz = r4.xyz * r0.xyz;
    r6.z = ps;
    ps = UniformScalar_4.x * r5.z;
    r3 = r3.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    r6.w = ps;
    ps = r3.z * r3.w;
    r3.xy = abs(r3.xy) * abs(r3.xy);
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = log2(r1.w);
    r6.yzw = r6.yzw + UniformVector_0.xyz;
    r3.z = ps;
    r6.yzw = r7.xyz * r4.xyz + r6.yzw;
    r4 = r0.xzyw * r3.yyyz;
    ps = pow(2.0, r4.w);
    r3.xyz = r0.xzy * r3.xxx;
    r5.w = ps;
    r6.yzw = r4.xzy * UpperSkyColor.xyz + r6.yzw;
    r6.yzw = r3.xyz * LowerSkyColor.xzy + r6.ywz;
    r3.xyz = r5.www * ConstantLighting.xzy;
    r6.yzw = r3.xzy * r1.xyz + r6.ywz;
    r6.yzw = r0.xzy * ConstantLighting.xzy + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.ywz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
