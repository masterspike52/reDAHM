// ps_69467b28e4305e0b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10041000 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
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
sampler2D ModShadowAccumTexture : register(s7);

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

    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    r5.xyz = r5.zxy * 2.0 + float3(-2.0, 0.0, 0.0);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = r5.yzx + float3(-1.0, -1.0, 0.0);
    r9.y = ps;
    r5.xzw = r5.zxy * UniformScalar_0.xxx;
    ps = 1.0 + r5.x;
    r9.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r5.yzw, r5.yzw);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r3.xyz = r6.yyy * r3.zyx;
    r6.x = ps;
    ps = r9.x;
    r6.xyw = r5.zwy * r6.xxx;
    ps = abs(r7.x) * ps;
    r5.x = dot(r6.wxy, r3.xzy);
    r10.x = ps;
    ps = r9.y;
    r8.xyw = r6.yxw * r5.xxx;
    r9.xyz = r8.xyw * 2.0 - r3.yzx;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r9.yxz);
    r10.y = ps;
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r6.z = ps;
    r7.xy = r5.yx * r6.zz + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.z = tex2D(Texture2D_4, r0.xy).w;
    r14.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15 = tex2D(Texture2D_5, r0.xy);
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r3.z = max(UniformScalar_9.x, 0.0001);
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r10.xzw = UniformScalar_6.xxx * UniformVector_1.yxz;
    r5.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    ps = r15.w;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r16.xyz = r14.xyz * r12.xyz;
    r5.x = ps;
    ps = UniformScalar_8.x * r5.y;
    r12.xyz = r5.xxx * r1.xyz;
    r0.w = ps;
    r5.xyz = (-abs(r9.www) >= 0.0) ? r14.xyz : r16.xyz;
    r1.xyz = r15.xyz * UniformScalar_7.xxx + r0.www;
    r10.zw = r10.zw * r6.zz + r1.xz;
    r0.w = r10.x * r6.z + r1.y;
    r1.xyz = (-abs(r5.www) >= 0.0) ? r14.xyz : r5.xyz;
    ps = OpacityOverride.x;
    r5.x = r12.z + 0.1;
    r5.y = saturate(ps);
    ps = 5.0 * r5.x;
    r5.z = dot(r4.zxy, r4.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r1.xyz = r1.xyz - r7.xyz;
    r5.z = ps;
    r1.xyz = r1.xyz * UniformScalar_0.xxx + r7.xyz;
    r7.xyz = r1.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = 1.0 - r5.x;
    r4.xyz = r5.zzz * r4.xyz;
    r5.z = ps;
    ps = 1.0 - r5.y;
    r1.xyz = r1.xyz * r13.xyz;
    r5.w = ps;
    r8.x = dot(r4.zxy, r6.wxy);
    r3.x = saturate(r8.w * 2.0 - r3.x);
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = saturate(dot(r12.zxy, r9.zyx));
    ps = ModShadowGroupColor.x * r5.z;
    r5.xy = r8.xy + 0.5;
    r3.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.xy = abs(r5.yx) * abs(r5.yx);
    r3.w = ps;
    ps = log2(r6.z);
    r4.xyz = -r3.xyw + 1.0;
    r3.w = ps;
    r3.xy = r8.zw * r4.yz + 0.125;
    ps = log2(abs(r4.x));
    r8.xyz = r1.xzy * r5.yyy;
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r9.xyz = r1.xzy * r5.xxx;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r3.xy = r3.xz * r3.yw;
    r5.x = ps;
    r0.xyz = r3.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r5.xxx * r11.yxz;
    ps = UniformScalar_5.x * r5.y;
    r6.z = float((r5.w >= 0.004));
    r5.w = ps;
    ps = ConstantLighting.x * r6.w;
    r5.xyz = r5.wxz * r7.xyz;
    r3.x = ps;
    ps = pow(2.0, r3.y);
    r5.yz = r5.yz * UniformScalar_5.xx;
    r5.w = ps;
    ps = r0.w;
    r4.xyz = r5.www * ConstantLighting.xzy;
    ps = r5.y + ps;
    r10.y = r10.w + r5.z;
    r10.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5.yzw = r10.zxy + UniformVector_0.xyz;
    r3.y = ps;
    ps = ConstantLighting.z * r6.w;
    r5.x = r5.y + r5.x;
    r3.z = ps;
    r5.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz + r5.xzw;
    r5.xyz = r9.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r8.xyz * LowerSkyColor.xzy + r5.xzy;
    r5.xyz = r4.xyz * r7.xzy + r5.xyz;
    r5.xyz = r3.xyz * r1.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r0.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.z + r2.w;
    r5.xyz = r0.xyz * r6.zzz + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
