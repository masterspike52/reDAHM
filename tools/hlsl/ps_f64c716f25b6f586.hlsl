// ps_f64c716f25b6f586.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 351 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000057C 10041100 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c29); // float4
float4 ConstantLighting : register(c30); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c28); // float3
float4 ModShadowAccumResolution : register(c33); // float2
float4 ModShadowColor : register(c31); // float3
float4 ModShadowGroupColor : register(c32); // float3
float4 OpacityOverride : register(c26); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_10 : register(c20); // float
float4 UniformScalar_13 : register(c21); // float
float4 UniformScalar_14 : register(c22); // float
float4 UniformScalar_15 : register(c23); // float
float4 UniformScalar_16 : register(c24); // float
float4 UniformScalar_17 : register(c25); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c27); // float3
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
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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

    r10 = tex2D(Texture2D_3, r0.xy);
    ps = (-0.5) + r10.w;
    r7.xy = r0.xy * UniformScalar_0.xx;
    r7.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r7.xy).wxy;
    ps = OpacityOverride.x;
    r9.x = dot(r3.zxy, r3.zxy);
    r11.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = dot(r1.zxy, r1.zxy);
    r12.x = ps;
    r13 = r5.yxzw * 2.0 - 1.0;
    r11.yzw = r6.xyz * 2.0 - 1.0;
    r9.yz = r7.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r11.wyz, r11.wyz);
    r12.y = ps;
    ps = rsqrt(abs(r9.w));
    r7.w = dot(r13.zyx, r13.zyx);
    r6.x = ps;
    r5.xyz = r14.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r9.x));
    r6.xzw = r6.xxx * r1.zxy;
    r6.y = ps;
    ps = UniformVector_2.z * r5.x;
    r16.xyz = r6.yyy * r3.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r9.w = max(r16.z, 0.0);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r15.xyz = r13.xzy * r5.xxx;
    r5.x = ps;
    ps = r6.y;
    r1.xyz = r11.ywz * r5.xxx;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r3.xyz = r15.yzx * r1.zyx;
    r5.w = ps;
    r3.xyz = r15.xyz * r1.yxz - r3.xyz;
    ps = 0.1 + r6.x;
    r3.xyz = r3.xyz * r13.www;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r7.w = dot(r3.zxy, r3.zxy);
    r9.x = saturate(ps);
    ps = r2.w;
    r9.xw = -r9.xw + 1.0;
    ps = 0.0001 * ps;
    r11.yz = r9.xx * ModShadowGroupColor.xy;
    r11.w = saturate(ps);
    r13 = -r11.wxyz + 1.0;
    r3.w = r13.x * UniformScalar_1.x;
    r5.yz = r3.ww * r9.yz + r5.yz;
    r5.yz = r5.yz * UniformVector_2.xy;
    ps = r0.w;
    r5.xyw = r5.yzw * r13.xxx;
    ps = UniformVector_5.x * ps;
    r5.z = r5.w + 1.0;
    r11.z = ps;
    r5.xyz = (r13.xxx > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r13.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r14.xyz = r3.xzy * r7.www;
    r5.x = ps;
    ps = r0.z;
    r3.xyz = r5.yzw * r5.xxx;
    ps = UniformVector_5.y * ps;
    r5.x = dot(r3.zxy, r16.zxy);
    r11.w = ps;
    ps = r12.x;
    r5.xyz = r3.xzy * r5.xxx;
    r9.xyz = r5.xyz * 2.0 - r16.xzy;
    ps = abs(r8.x) * ps;
    r5.xyz = r15.zxy * r9.yyy;
    r11.x = ps;
    r5.xyz = r14.xzy * r9.zzz + r5.xyz;
    r5.xyw = r1.yzx * r9.xxx + r5.zyx;
    ps = r12.y;
    r1.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r1.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    ps = abs(r8.y) * ps;
    r5 = xe_cube(r5.xzy);
    r11.y = ps;
    ps = 1.0 / abs(r5.z);
    r8.z = r5.w;
    r7.w = ps;
    r8.xy = r5.yx * r7.ww + 1.5;
    r1.x = tex2D(Texture2D_2, r0.xy).x;
    r1.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r12.xyz = tex2D(Texture2D_4, r11.zw).xyz;
    r5.xw = tex2D(ModShadowAccumTexture, r11.xy).xy;
    ps = UniformScalar_9.x;
    r11.yzw = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r8.xyw = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.w = float((UniformScalar_14.x >= 1.0));
    r14.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.w = float((UniformScalar_14.x > 1.0));
    r14.y = ps;
    ps = UniformVector_4.x * UniformVector_4.w;
    r5.z = float((UniformScalar_13.x >= 1.0));
    r15.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r0.x = dot(r4.zxy, r4.zxy);
    r15.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r0.y = float((UniformScalar_13.x > 1.0));
    r15.z = ps;
    r12.xyz = (-abs(r0.yyy) >= 0.0) ? r12.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r8.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = pow(2.0, r5.y);
    r15.yzw = r15.xyz * r10.xyz;
    r5.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.xyz = r0.xxx * r4.xyz;
    r14.z = ps;
    r10.xyz = r15.yzw * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = (-1.0) + r7.x;
    r17.xyz = r8.zzz - r16.xyz;
    r15.x = ps;
    r12.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r12.xyz;
    ps = 0.875 * r5.x;
    r4.xyz = r15.yzw * r12.xyz;
    r15.y = ps;
    r7.xyz = r17.xyz * UniformScalar_6.xxx + r16.xyz;
    ps = log2(abs(r9.w));
    r14.xyz = r14.xyz * r7.xyz;
    r5.z = ps;
    ps = 0.875 * r5.w;
    r5.z = r5.z * UniformScalar_3.x;
    r15.z = ps;
    ps = pow(2.0, r5.z);
    r7.x = float((r13.y >= 0.004));
    r5.x = ps;
    r5.x = r5.x * UniformScalar_5.x + UniformScalar_4.x;
    r13.xyz = r15.xyz * r13.xzw + float3(1.0, 0.125, 0.125);
    ps = UniformScalar_10.x * r5.y;
    r5.xzw = r14.xyz * r5.xxx;
    r10.w = ps;
    r5.y = (r3.w > 0.0) ? r13.x : 1.0;
    r11.x = (r3.w >= 0.0) ? r5.y : 1.0;
    ps = r13.y * r13.z;
    r4.xyz = r4.xyz * r11.xxx;
    r12.w = ps;
    ps = r4.x;
    r10.xyz = r5.xzw * r10.xyz;
    ps = r8.x * ps;
    r1.yzw = -r4.xyz + r1.yzw;
    r7.y = ps;
    ps = r4.y;
    r5 = r12.wxww * r11.wxzy;
    ps = r8.y * ps;
    r10 = r10 * r5.yyyy;
    r7.z = ps;
    r1.yzw = r1.yzw * UniformScalar_15.xxx + r4.xyz;
    r8.xyz = r1.yzw * UniformScalar_16.xxx + UniformScalar_17.xxx;
    ps = r4.z;
    r1 = r10 * r1.xxxx;
    r1 = (-abs(r0.wwww) >= 0.0) ? r1 : 0.0;
    r1 = (-abs(r7.wwww) >= 0.0) ? 0.0 : r1;
    ps = r8.w * ps;
    r4.xyz = r1.xyz + UniformVector_0.xyz;
    r7.w = ps;
    ps = r5.w;
    r1.xyz = r8.xzy + r1.www;
    r5.y = ps;
    r8.xyz = r7.yzw * AmbientColorAndSkyFactor.xyz + r4.xyz;
    ps = ModShadowColor.x + r5.y;
    r6.z = saturate(dot(r6.xzw, r9.yxz));
    r6.x = ps;
    ps = log2(r6.z);
    r6.y = dot(r0.zxy, r3.zxy);
    r6.z = ps;
    ps = ModShadowColor.y + r5.z;
    r0.xyz = r6.yyz * float3(-0.5, 0.5, 15.0);
    r6.y = ps;
    ps = ModShadowColor.z + r5.x;
    r4.xy = r0.xy + 0.5;
    r6.z = ps;
    ps = pow(2.0, r0.z);
    r5.xy = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r0.xyz = r3.zzz * ConstantLighting.xyz;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r7.ywz * r5.xxx;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.xyz = r7.ywz * r5.yyy;
    r3.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r3.xyz * r1.xyz + r5.xzy;
    r5.xyz = r0.xyz * r7.yzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r7.x + r2.w;
    r5.xyz = r6.xyz * r7.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
