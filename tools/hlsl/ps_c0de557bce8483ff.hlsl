// ps_c0de557bce8483ff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041200 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 ConstantLighting : register(c28); // float3
float4 LowerSkyColor : register(c26); // float3
float4 ModShadowAccumResolution : register(c31); // float2
float4 ModShadowColor : register(c29); // float3
float4 ModShadowGroupColor : register(c30); // float3
float4 OpacityOverride : register(c24); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_17 : register(c17); // float
float4 UniformScalar_19 : register(c18); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_20 : register(c19); // float
float4 UniformScalar_21 : register(c20); // float
float4 UniformScalar_22 : register(c21); // float
float4 UniformScalar_23 : register(c22); // float
float4 UniformScalar_24 : register(c23); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UpperSkyColor : register(c25); // float3
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r17.xyz = UniformVector_3.xyz - UniformVector_4.xyz;
    r0.xyz = UniformVector_7.xyz - UniformVector_6.xyz;
    ps = UniformVector_2.x * UniformVector_2.x;
    r9.xyz = UniformVector_4.xyz - UniformVector_5.xyz;
    r11.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r6.z = dot(r1.zxy, r1.zxy);
    r11.y = ps;
    ps = UniformScalar_22.x;
    r13.yzw = r12.xyz * UniformVector_8.xyz;
    ps = -UniformScalar_21.x + ps;
    r16.xyz = r12.xyz * UniformScalar_17.xxx;
    r12.w = ps;
    ps = r5.w + r5.w;
    r5.z = dot(r12.yzx, float3(0.59, 0.11, 0.3));
    r8.x = ps;
    ps = 4.0 * r5.x;
    r0.w = dot(r12.yxz, float3(0.59, 0.3, 0.11));
    r15.z = ps;
    ps = 4.0 * r5.y;
    r12.xyz = r8.yzw + r8.yzw;
    r15.w = ps;
    r14.xyz = r12.xyz * 0.7 + 0.3;
    ps = rsqrt(abs(r6.z));
    r5.x = UniformScalar_19.x + r0.w;
    r5.y = ps;
    ps = 5.0 * r5.z;
    r5.w = dot(r10.zxy, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    ps = 1.0 * r5.z;
    r8.yzw = r5.yyy * r1.xyz;
    r11.w = ps;
    ps = frac(r5.x);
    r15.xy = r11.wz * UniformScalar_15.xx;
    r9.w = ps;
    r1.xyz = r15.yyy * r9.xyz + UniformVector_5.xyz;
    ps = r8.w;
    r9.xyz = r6.xyw + r6.xyw;
    r5.x = ps;
    ps = 0.1 + r5.x;
    r5.z = float((r15.x >= 0.2));
    r5.x = ps;
    ps = (-1.0) + r8.x;
    r0.w = float((r15.x > 0.2));
    r5.y = ps;
    ps = 5.0 * r5.x;
    r6.xyz = r15.xzw + float3(-0.2, -2.0, -2.0);
    r5.x = saturate(ps);
    ps = 1.25 * r6.x;
    r9 = r9 + float4(-1.0, -1.0, -1.0, -0.5);
    r1.w = ps;
    ps = abs(r9.w) + abs(r9.w);
    r18.w = r5.y - r9.z;
    r5.y = ps;
    ps = r6.y;
    r11.zw = -r9.xy - 2.0;
    ps = -r9.x + ps;
    r15.xy = r11.zw + r15.zw;
    r15.z = ps;
    r0.xyz = r0.xyz * r5.yyy + UniformVector_6.xyz;
    r17.xyz = r1.www * r17.xyz + UniformVector_4.xyz;
    r17.xyz = (r0.www > 0.0) ? r17.xyz : UniformVector_4.xyz;
    ps = r6.z;
    r0.xyz = r0.xyz * UniformScalar_20.xxx;
    ps = -r9.y + ps;
    r0.xzw = r0.xzy * r10.zzz;
    r15.w = ps;
    r1.xyz = (r5.zzz > 0.0) ? r17.xyz : r1.xyz;
    r9 = r15 * UniformScalar_0.xxxx + r9.xyxy;
    ps = 1.0 - r5.w;
    r1.xyz = r1.xyz * UniformScalar_16.xxx;
    r0.y = ps;
    ps = 1.0 - r5.x;
    r15.xyz = r0.xzw * r10.zzz;
    r0.w = ps;
    r5.xyz = r16.xyz * r10.yyy + r15.xzy;
    r10.xyz = r1.xzy * r10.xxx + r5.xzy;
    r18.xyz = r14.xzy * r10.xyz - r10.xyz;
    r5.x = r18.w * UniformScalar_0.x - 2.0;
    r13.x = r6.w * 2.0 + r5.x;
    ps = r9.z;
    r5 = r13 * r0.yyyy;
    ps = r0.y * ps;
    r0.z = r5.x + 1.0;
    r0.x = ps;
    r12.xyz = r5.yzw * r12.xyz - r5.yzw;
    r13.xyz = r12.xyz * UniformScalar_0.xxx + r5.yzw;
    r6.z = r12.w * UniformScalar_0.x + UniformScalar_21.x;
    ps = UniformScalar_23.x * r0.y;
    r5 = r0.xyzy * UniformVector_2.xxzy;
    r1.y = ps;
    ps = r5.z * r5.z;
    r11.xy = r11.xy * r0.yz;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.z = r11.x * r9.z;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.xyz = r5.yww * r9.xyw;
    r6.y = ps;
    ps = r17.z * r17.z;
    r9.yzw = r13.xyz * r6.zzz;
    r6.w = ps;
    r6.z = dot(r11.yz, r0.zx) + r6.w;
    r9.x = r11.z * r0.x + r6.w;
    ps = rsqrt(abs(r6.z));
    r9 = r9.xywz + r1.xyyy;
    r15.x = ps;
    ps = rsqrt(abs(r9.x));
    r5.y = dot(r3.zxy, r3.zxy);
    r15.y = ps;
    ps = r17.z;
    r11.xy = r6.xy * abs(r7.xy);
    ps = r15.y * ps;
    r16.xyz = r5.zxz * r15.xyy;
    r16.w = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r16.zyw, r16.zyw);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r14.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    r6.xyw = r16.ywz * r5.xxx;
    r5.x = dot(r6.wxy, r14.zxy);
    r5.xyz = r6.xwy * r5.xxx;
    r7.xyz = r5.xzy * 2.0 - r14.xyz;
    r5 = xe_cube(r7.xyz);
    ps = 1.0 / abs(r5.z);
    r1.z = r5.w;
    r6.z = ps;
    r1.xy = r5.yx * r6.zz + 1.5;
    r12.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r1.xyz)).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.w = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r6.z = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    r1.w = ps;
    ps = UniformScalar_24.x;
    r4.xyz = r1.www * r4.xyz;
    r12.x = ps;
    ps = 0.0001;
    r3.xyz = r6.zzz - r5.xyz;
    r12.w = ps;
    r3.yzw = r3.xyz * 0.8 + r5.xyz;
    ps = max(r12.x, r12.w);
    r5.xy = r0.ww * ModShadowGroupColor.xy;
    r12.x = ps;
    r10.xyz = r18.xyz * UniformScalar_0.xxx + r10.xyz;
    ps = r13.x;
    r15.xy = r17.xy * r15.xx;
    ps = r1.x * ps;
    r15.z = r16.x;
    r1.x = ps;
    ps = r13.y;
    r5.z = dot(r15.xyz, r14.xyz);
    ps = r1.y * ps;
    r5.z = max(r5.z, 0.0);
    r1.y = ps;
    ps = r13.z;
    r12.w = dot(r4.zxy, r6.wxy);
    ps = r1.z * ps;
    r5 = -r5.xzyw + 1.0;
    r1.z = ps;
    ps = ConstantLighting.x * r6.w;
    r5.w = float((r5.w >= 0.004));
    r3.x = ps;
    ps = log2(abs(r5.y));
    r4 = r12.yzww * float4(0.875, 0.875, -0.5, 0.5);
    r5.y = ps;
    r12.yz = r4.xy * r5.xz + 0.125;
    ps = UniformScalar_2.x * r5.y;
    r4.xy = r4.zw + 0.5;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r4.xw = abs(r4.xy) * abs(r4.xy);
    r5.y = ps;
    ps = UniformScalar_3.x * r5.y;
    r5.z = saturate(dot(r8.wyz, r7.zxy));
    r5.x = ps;
    ps = log2(r5.z);
    r4.xyz = r1.xzy * r4.xxx;
    r12.w = ps;
    ps = r12.x * r12.w;
    r7.xyz = r1.xzy * r4.www;
    r6.z = ps;
    ps = r12.y * r12.z;
    r3.yzw = r5.xxx * r3.yzw;
    r5.x = ps;
    r5.xyz = r5.xxx * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.z);
    r8.xyz = r3.ywz * r0.yyy;
    r6.z = ps;
    ps = ConstantLighting.y * r6.w;
    r0.xyz = r6.zzz * ConstantLighting.xzy;
    r3.y = ps;
    r8.xyz = r8.xyz * UniformScalar_4.xxx + r10.xyz;
    ps = ConstantLighting.z * r6.w;
    r8.xyz = r8.xzy + UniformVector_0.xyz;
    r3.z = ps;
    r6.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz + r8.xyz;
    r6.xyz = r7.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r0.xyz * r9.yzw + r6.xzy;
    r6.xyz = r3.xyz * r1.xyz + r6.xzy;
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
