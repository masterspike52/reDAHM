// ps_1826b9b271f45fa9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10041100 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 LightMapScale : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c16); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    r6.xyz = r6.zxy * 2.0 + float3(-2.0, 0.0, 0.0);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = r6.yzx + float3(-1.0, -1.0, 0.0);
    r10.y = ps;
    r6.xzw = r6.zxy * UniformScalar_0.xxx;
    ps = 1.0 + r6.x;
    r14.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r7.z = dot(r6.yzw, r6.yzw);
    r7.x = ps;
    ps = rsqrt(abs(r7.z));
    r7.xyw = r7.xxx * r4.xyz;
    r7.z = ps;
    ps = r10.x;
    r13.xyz = r6.yzw * r7.zzz;
    ps = abs(r8.x) * ps;
    r6.x = dot(r13.xyz, r7.wxy);
    r0.z = ps;
    ps = r10.y;
    r9.xzw = r13.xzy * r6.xxx;
    r11.xyw = r9.zwx * 2.0 - r7.yxw;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r11.yxw);
    r0.w = ps;
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.z = ps;
    r4.xy = r6.yx * r7.zz + 1.5;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r15.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r0.w = tex2D(Texture2D_4, r1.xy).w;
    r16.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r4.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r6.yzw = tex2D(LightMapTexture, r0.xy).xyz;
    r17 = tex2D(Texture2D_5, r1.xy);
    r7.z = dot(r5.zxy, r5.zxy);
    r9.yzw = UniformScalar_6.xxx * UniformVector_1.yxz;
    r1.x = float((UniformScalar_0.x >= UniformScalar_1.x));
    r1.z = float((UniformScalar_0.x > UniformScalar_1.x));
    ps = OpacityOverride.x;
    r1.y = r17.w * UniformScalar_8.x;
    r6.x = saturate(ps);
    ps = LightMapScale.x * r6.y;
    r1.w = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.xyz = r16.xyz * r4.yzw;
    r1.w = ps;
    ps = LightMapScale.y * r6.z;
    r12.xyz = r1.www * r2.xyz;
    r4.y = ps;
    r0.xyz = (-abs(r1.zzz) >= 0.0) ? r16.xyz : r0.xyz;
    r1.yzw = r17.xyz * UniformScalar_7.xxx + r1.yyy;
    r9.zw = r9.zw * r0.ww + r1.yw;
    r0.w = r9.y * r0.w + r1.z;
    r0.xyz = (-abs(r1.xxx) >= 0.0) ? r16.xyz : r0.xyz;
    ps = LightMapScale.z * r6.w;
    r6.y = r12.z + 0.1;
    r4.z = ps;
    ps = 5.0 * r6.y;
    r0.xyz = r0.xyz - r15.xyz;
    r6.y = saturate(ps);
    r0.xyz = r0.xyz * UniformScalar_0.xxx + r15.xyz;
    r2.xyz = r0.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = rsqrt(abs(r7.z));
    r1.xyz = r4.xyz * r13.xxx;
    r6.z = ps;
    r11.z = max(UniformScalar_9.x, 0.0001);
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r6.y;
    r5.xyz = r6.zzz * r5.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r0.xyz = r0.xyz * r14.xyz;
    r6.w = ps;
    r8.x = dot(r5.zxy, r13.xyz);
    r5.x = saturate(r9.x * 2.0 - r7.w);
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.w = saturate(dot(r12.zxy, r11.wyx));
    ps = ModShadowGroupColor.x * r6.z;
    r6.xy = r8.xy + 0.5;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.xy = abs(r6.yx) * abs(r6.yx);
    r5.z = ps;
    ps = log2(r7.w);
    r5.xyw = -r5.yzx + 1.0;
    r11.w = ps;
    r11.xy = r8.zw * r5.xy + 0.125;
    ps = log2(abs(r5.w));
    r5.xyz = r0.xzy * r6.yyy;
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r8.xyz = r0.xzy * r6.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r9.xy = r11.xz * r11.yw;
    r6.x = ps;
    r7.yzw = r9.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r6.xxx * r10.yxz;
    ps = UniformScalar_5.x * r6.y;
    r7.x = float((r6.w >= 0.004));
    r6.w = ps;
    r6.xyz = r6.wxz * r2.xyz;
    ps = pow(2.0, r9.y);
    r6.yz = r6.yz * UniformScalar_5.xx;
    r6.w = ps;
    ps = r0.w;
    r4.xyz = r4.xzy * r6.www;
    ps = r6.y + ps;
    r9.y = r9.w + r6.z;
    r9.x = ps;
    r6.yzw = r9.zxy + UniformVector_0.xyz;
    r6.x = r6.y + r6.x;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.xzw;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xzy + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r7.ywz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xzy - r6.xzy;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
