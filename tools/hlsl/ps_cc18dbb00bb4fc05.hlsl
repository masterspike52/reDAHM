// ps_cc18dbb00bb4fc05.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10041200 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 ConstantLighting : register(c22); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c12); // float
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_2 : register(c14); // float
float4 UniformScalar_3 : register(c15); // float
float4 UniformScalar_4 : register(c16); // float
float4 UniformScalar_5 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
float4 UpperSkyColor : register(c19); // float3
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
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r6 = In.color1;
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_3, r0.xy).yzx;
    r15.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r0.w = float((UniformScalar_1.x >= 0.0));
    r15.w = saturate(ps);
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r11.xyz = UniformVector_5.xzy * UniformVector_5.www;
    r7.x = ps;
    ps = -UniformVector_0.x;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.z = dot(r1.zxy, r1.zxy);
    r14.x = ps;
    ps = -UniformVector_0.y;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r0.y = dot(r3.zxy, r3.zxy);
    r14.y = ps;
    r8.xyz = r5.xyz * 2.0 - 1.0;
    r5.yzw = r15.zxy * 2.0 - 1.0;
    ps = -UniformVector_0.z;
    r15.xyz = r6.yyy * UniformVector_3.xzy;
    ps = 1.0 + ps;
    r5.x = dot(r8.zxy, r8.zxy);
    r14.z = ps;
    ps = rsqrt(abs(r0.y));
    r16.xyz = -r9.yzw + r7.yzw;
    r7.y = ps;
    ps = rsqrt(abs(r0.x));
    r17.yzw = r16.xyz * UniformScalar_0.xxx;
    r0.x = ps;
    ps = rsqrt(abs(r6.z));
    r4.xyz = r0.xxx * r4.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.zzz * r1.xzy;
    r0.x = ps;
    r6.xyz = r6.xxx * UniformVector_2.xzy + r15.xyz;
    r6.yzw = r6.www * UniformVector_1.xyz + r6.xzy;
    ps = 0.1 - -r1.y;
    r5.x = dot(r5.yzw, r5.yzw);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r8.xyz * r0.xxx;
    r5.x = ps;
    ps = LocalToWorldMatrix[0].z * r0.x;
    r16.xyz = r7.yyy * r3.zxy;
    r17.x = ps;
    ps = LocalToWorldMatrix[1].z * r0.y;
    r15.z = max(r16.x, 0.0);
    r9.x = ps;
    r6.yzw = (-abs(r7.xxx) >= 0.0) ? 1.0 : r6.yzw;
    ps = 5.0 * r6.x;
    r5.xyw = r5.zwy * r5.xxx;
    r5.z = saturate(ps);
    ps = ConstantLighting.x * r5.w;
    r7.x = dot(r4.zxy, r5.wxy);
    r3.x = ps;
    r6.yzw = (-abs(r0.www) >= 0.0) ? 1.0 : r6.yzw;
    ps = ConstantLighting.y * r5.w;
    r5.z = -r5.z + 1.0;
    r3.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.x = dot(r5.wxy, r16.xyz);
    r15.x = ps;
    ps = UniformScalar_5.x * r6.y;
    r8.xyz = r6.ywz * UniformScalar_2.xxx;
    r4.x = ps;
    ps = UniformScalar_5.x * r6.z;
    r18.xyz = r5.xyw * r6.xxx;
    r4.y = ps;
    ps = UniformScalar_5.x * r6.w;
    r9 = r17 + r9;
    r4.z = ps;
    ps = UniformScalar_3.x * r6.y;
    r4.xyz = r4.xzy * r9.ywz;
    r17.x = ps;
    r7.y = r0.z * LocalToWorldMatrix[2].z + r9.x;
    ps = UniformScalar_3.x * r6.z;
    r0.xyz = r9.yzw * r6.yzw;
    r17.y = ps;
    r16.xyz = r18.xyz * 2.0 - r16.yzx;
    ps = UniformScalar_3.x * r6.w;
    r8.yzw = r8.xyz * r9.ywz;
    r17.z = ps;
    r6.xyz = r17.xyz * r9.yzw + UniformScalar_4.xxx;
    r9.xyz = r6.xzy * UniformVector_4.xzy - r8.yzw;
    ps = ModShadowGroupColor.y * r5.z;
    r1.y = saturate(dot(r1.yxz, r16.zxy));
    r15.y = ps;
    ps = ConstantLighting.z * r5.w;
    r6 = -r15.wxyz + float4(1.0, 1.0, 1.0, 0.55);
    r3.z = ps;
    ps = r6.w;
    r0.xyz = r0.xyz * r14.xyz;
    r5.x = ps;
    ps = 2.2222223 * r5.x;
    r5.w = float((r6.x >= 0.004));
    r1.x = saturate(ps);
    r5.xyz = r7.xxy * float3(-0.5, 0.5, 0.5) + 0.5;
    ps = log2(abs(r5.z));
    r6.xw = abs(r5.xy) * abs(r5.xy);
    r13.x = ps;
    ps = r0.x;
    r7.xyz = r0.xzy * r6.xxx;
    ps = r6.w * ps;
    r5.xyz = r13.yxz * float3(0.875, 0.8, 0.875);
    r8.x = ps;
    r5.xz = r5.xz * r6.yz + 0.125;
    ps = pow(2.0, r5.y);
    r5.x = r5.x * r5.z;
    r1.z = ps;
    r5.xyz = r5.xxx * r12.xyz + ModShadowColor.xyz;
    ps = r0.z;
    r6.xy = r1.xy * r1.zy;
    r9.xyz = r6.xxx * r9.xyz + r8.yzw;
    ps = r6.w * ps;
    r6.y = r6.y * r1.y;
    r8.y = ps;
    ps = r0.y;
    r1.xyz = r6.yyy * ConstantLighting.xzy;
    r9.xyz = r11.xzy * r10.xyz + r9.xzy;
    ps = r6.w * ps;
    r6.xyz = r9.xyz + UniformVector_0.xyz;
    r8.z = ps;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r4.xyz + r6.xzy;
    r6.xyz = r3.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
