// ps_bc55c6c932fe87fb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10041100 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 ConstantLighting : register(c20); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_6 : register(c14); // float
float4 UniformScalar_7 : register(c15); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c17); // float3
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

    r7.xy = r0.xy * UniformScalar_0.xx;
    r7.zw = r0.wz * 0.5;
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10 = tex2D(Texture2D_3, r0.xy);
    r9.zw = tex2D(Texture2D_0, r7.zw).xy;
    r7.xyz = tex2D(Texture2D_1, r7.xy).wxy;
    r14.x = saturate(r2.w * 0.0001);
    r5 = r5.yxzw * 2.0 - 1.0;
    r7.w = dot(r3.zxy, r3.zxy);
    r13.xyz = r6.xyz * 2.0 - 1.0;
    ps = (-1.0) + r7.x;
    r6.x = dot(r1.zxy, r1.zxy);
    r9.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xy = r7.yz + r7.yz;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.zw = r9.zw + r9.zw;
    r9.z = ps;
    ps = rsqrt(abs(r6.x));
    r14.z = float((r10.w >= 0.5));
    r7.x = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r13.zxy, r13.zxy);
    r12.x = ps;
    r6.xyz = r11.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r6.x;
    r7.y = dot(r5.zyx, r5.zyx);
    r16.w = ps;
    ps = rsqrt(abs(r7.y));
    r11.xyz = r12.xxx * r3.zxy;
    r7.y = ps;
    ps = r11.x;
    r16.xyz = r7.xxx * r1.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r12.yzw = r5.xzy * r7.yyy;
    r6.w = ps;
    ps = 0.0;
    r13.xyz = r13.xzy * r6.www;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r1 = r15.wxyz - 1.0;
    r14.y = ps;
    ps = r1.w;
    r5.yz = r16.zw + float2(0.1, -1.0);
    r5.x = ps;
    ps = 0.012 * r5.x;
    r7.xyz = r12.zwy * r13.zyx;
    r17.x = ps;
    r7.xyz = r12.yzw * r13.yxz - r7.xyz;
    ps = 5.0 * r5.y;
    r15.xyz = r7.xyz * r5.www;
    r14.w = saturate(ps);
    ps = r5.z;
    r6.w = dot(r15.zxy, r15.zxy);
    ps = r14.z * ps;
    r7.xyz = -r14.xyw + 1.0;
    r9.w = ps;
    r5.zw = r9.wy * r7.xx + 1.0;
    ps = 0.012 * r1.x;
    r5.y = r7.x * UniformScalar_1.x;
    r17.y = ps;
    r5.x = (r5.y > 0.0) ? r5.w : 1.0;
    r6.xy = r5.yy * r1.yz + r6.yz;
    r14.xy = r6.xy * UniformVector_2.xy - r17.xy;
    r14.w = (r5.y >= 0.0) ? r5.x : 1.0;
    ps = r0.z;
    r6.xyz = r14.xyz * r14.zzw;
    r9.y = ps;
    ps = r0.w;
    r5.xy = r17.xy + r6.xy;
    ps = UniformVector_5.x * ps;
    r5.xy = r5.xy * r7.xx;
    r1.x = ps;
    r5.xyz = (r7.xxx > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r15.xyz = r15.xzy * r6.www;
    r5.x = ps;
    ps = r0.z;
    r6.xyw = r5.yzw * r5.xxx;
    ps = UniformVector_5.y * ps;
    r5.x = dot(r6.wxy, r11.xyz);
    r1.y = ps;
    ps = r9.x;
    r5.xyz = r6.xwy * r5.xxx;
    r11.xyz = r5.xyz * 2.0 - r11.yxz;
    ps = abs(r8.x) * ps;
    r5.z = saturate(dot(r16.zxy, r11.yxz));
    r1.z = ps;
    ps = log2(abs(r7.y));
    r5.xyw = r12.wyz * r11.yyy;
    r12.y = ps;
    r5.xyw = r15.xzy * r11.zzz + r5.xyw;
    r5.xyw = r13.yzx * r11.xxx + r5.wyx;
    ps = log2(r5.z);
    r11.xyz = r5.xxx * LocalToWorldMatrix[2].xzy;
    r12.z = ps;
    ps = r9.z;
    r13.xyz = r12.xyz * float3(-0.075, 0.0125, 15.0);
    r9.x = r13.x * r3.x + r0.w;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xzy + r11.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = abs(r8.y) * ps;
    r5 = xe_cube(r5.xyz);
    r1.w = ps;
    ps = 1.0 / abs(r5.z);
    r0.z = r5.w;
    r7.w = ps;
    r0.xy = r5.yx * r7.ww + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r1.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r5.xyw = tex2D(Texture2D_4, r9.xy).xyz;
    ps = OpacityOverride.x;
    r3.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r3.w = saturate(ps);
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r5.z = float((UniformScalar_5.x >= 1.0));
    r0.x = ps;
    ps = -UniformVector_0.y;
    r7.w = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r0.z = float((UniformScalar_5.x > 1.0));
    r0.y = ps;
    r1.xyz = (-abs(r0.zzz) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r7.w));
    r3.xyz = r3.xyz * r10.xyz;
    r7.w = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r7.www * r4.xyz;
    r1.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r1.xyz;
    ps = 1.0 + ps;
    r5.z = -r14.z + 1.0;
    r0.z = ps;
    ps = 6.0 * r5.x;
    r10.xyz = r5.zzz * UniformVector_3.xyz;
    r12.x = ps;
    ps = 6.0 * r5.y;
    r3.xyz = r3.xyz * r1.xyz;
    r12.y = ps;
    r1.xyz = r14.zzz * UniformScalar_6.xxx + r10.xzy;
    ps = 6.0 * r5.w;
    r3.xyz = r3.xyz * r6.zzz;
    r12.z = ps;
    r1.xyz = r3.xyz * UniformScalar_7.xxx + r1.xzy;
    ps = ModShadowGroupColor.x * r7.z;
    r0.xyz = r3.xyz * r0.xyz;
    r3.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r8.x = dot(r4.zxy, r6.wxy);
    r3.y = ps;
    ps = ConstantLighting.x * r6.w;
    r5 = r8.yzxx * float4(0.875, 0.875, 0.5, -0.5);
    r7.x = ps;
    ps = ConstantLighting.y * r6.w;
    r7.zw = r5.wz + 0.5;
    r7.y = ps;
    ps = ConstantLighting.z * r6.w;
    r5.zw = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = pow(2.0, r13.y);
    r4.xyz = r0.xzy * r5.zzz;
    r3.z = ps;
    ps = pow(2.0, r13.z);
    r8.xyz = r0.xzy * r5.www;
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r6 = -r3.wxyz + 1.0;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r6.x = float((r6.x >= 0.004));
    r3.y = ps;
    r5.xy = r5.xy * r6.yz + 0.125;
    r6.yzw = r12.xzy * r6.www + r11.xzy;
    r6.yzw = r10.xyz * r6.ywz + UniformVector_0.xyz;
    ps = ConstantLighting.y * r5.w;
    r5.x = r5.x * r5.y;
    r3.z = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r6.yzw = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.yzw;
    r6.yzw = r8.xyz * UpperSkyColor.xzy + r6.ywz;
    r6.yzw = r4.xzy * LowerSkyColor.xyz + r6.ywz;
    r6.yzw = r3.xyz * r1.xzy + r6.ywz;
    r6.yzw = r7.xyz * r0.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.ywz * r5.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xzy - r5.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.x + r2.w;
    r5.xyz = r7.xyz * r6.xxx + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
