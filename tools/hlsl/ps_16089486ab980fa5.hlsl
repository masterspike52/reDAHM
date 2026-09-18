// ps_16089486ab980fa5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 285 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000474 10040F00 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 0.0001 * r2.w;
    r7.xy = r0.wz * 0.5;
    r13.x = saturate(ps);
    r12.xy = tex2D(Texture2D_0, r7.xy).xy;
    r9 = tex2D(Texture2D_2, r0.xy);
    r7.w = dot(r3.zxy, r3.zxy);
    r7.z = dot(r1.zxy, r1.zxy);
    r10 = r5.yxzw * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.w = float((r9.w >= 0.5));
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r6.zxy, r6.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r5.w = dot(r10.zyx, r10.zyx);
    r6.w = ps;
    r5.xy = r12.xy * 2.0 - 1.0;
    r11.xzw = r11.zxy * 2.0 - 1.0;
    r14.z = r11.x * UniformVector_2.z - 1.0;
    ps = 0.012 * r5.x;
    r11.xy = r7.xy * abs(r8.xy);
    r12.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r6.www * r1.zxy;
    r8.x = ps;
    ps = 0.012 * r5.y;
    r8.yzw = r8.xxx * r3.zxy;
    r12.y = ps;
    ps = rsqrt(abs(r5.w));
    r1.y = max(r8.y, 0.0);
    r5.x = ps;
    r14.xy = r11.zw * UniformVector_2.xy - r12.xy;
    ps = rsqrt(abs(r5.z));
    r15.xyz = r10.xzy * r5.xxx;
    r5.x = ps;
    ps = OpacityOverride.x;
    r10.xyz = r6.xzy * r5.xxx;
    r1.z = saturate(ps);
    ps = 0.1 - -r7.x;
    r5.yzw = r15.yzx * r10.zyx;
    r5.x = ps;
    r6.xyz = r15.xyz * r10.yxz - r5.yzw;
    ps = 5.0 * r5.x;
    r5.yzw = r14.xzy * r13.www;
    r1.x = saturate(ps);
    r1.xyw = -r1.xyz + 1.0;
    ps = r12.x;
    r6.yzw = r6.xyz * r10.www;
    ps = r5.y + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r11.z = ps;
    ps = r12.y;
    r13.yz = r1.xx * ModShadowGroupColor.xy;
    ps = r5.w + ps;
    r12 = -r13.wxyz + 1.0;
    r11.w = ps;
    r5.xy = r11.zw * r12.yy;
    r5.z = r5.z * r12.y + 1.0;
    r5.xyz = (r12.yyy > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r12.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.x));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r14.xyz = r6.ywz * r6.xxx;
    r5.x = ps;
    r6.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wxy, r8.yzw);
    r5.xyz = r6.xwy * r5.xxx;
    r8.yzw = r5.yxz * 2.0 - r8.yzw;
    r5.z = saturate(dot(r7.xyz, r8.yzw));
    ps = log2(abs(r1.y));
    r5.xyw = r15.zxy * r8.yyy;
    r8.y = ps;
    r5.xyw = r14.xzy * r8.www + r5.xyw;
    r5.xyw = r10.yzx * r8.zzz + r5.wyx;
    ps = log2(r5.z);
    r7.yzw = r5.xxx * LocalToWorldMatrix[2].xzy;
    r8.z = ps;
    r8.xyw = r8.xzy * float3(-0.075, 15.0, 0.0125);
    r7.x = r8.x * r3.x + r0.w;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xzy + r7.yzw;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = r0.z;
    r5 = xe_cube(r5.xyz);
    r7.y = ps;
    ps = 1.0 / abs(r5.z);
    r0.z = r5.w;
    r6.z = ps;
    r0.xy = r5.yx * r6.zz + 1.5;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r0.zw = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r5.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    ps = UniformVector_4.x * UniformVector_4.w;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r11.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r5.w = dot(r4.zxy, r4.zxy);
    r11.z = ps;
    ps = rsqrt(abs(r5.w));
    r9.xyz = r11.xyz * r9.xyz;
    r5.w = ps;
    r4.xyz = r5.www * r4.xyz;
    r1.xyz = r9.xyz * r13.www;
    ps = 6.0 * r5.x;
    r7.xyz = r1.xyz * r7.xyz;
    r11.x = ps;
    ps = 6.0 * r5.y;
    r5.w = float((r1.w >= 0.004));
    r11.y = ps;
    ps = 6.0 * r5.z;
    r9.xyz = r12.xxx * UniformVector_3.xyz;
    r11.z = ps;
    r5.xyz = r13.www * UniformScalar_1.xxx + r9.xzy;
    r1.xyz = r1.xyz * UniformScalar_2.xxx + r5.xzy;
    ps = ConstantLighting.x * r6.w;
    r0.y = dot(r4.zxy, r6.wxy);
    r0.x = ps;
    ps = ConstantLighting.y * r6.w;
    r4 = r0.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    r0.y = ps;
    ps = ConstantLighting.z * r6.w;
    r5.xy = r4.xy + 0.5;
    r0.z = ps;
    r6.xy = r4.zw * r12.zw + 0.125;
    ps = r6.x * r6.y;
    r5.xy = abs(r5.yx) * abs(r5.yx);
    r5.z = ps;
    r6.xyz = r5.zzz * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r8.y);
    r4.xyz = r7.xzy * r5.yyy;
    r5.y = ps;
    ps = pow(2.0, r8.w);
    r8.xyz = r7.xzy * r5.xxx;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r5.yyy * ConstantLighting.xzy;
    r5.x = ps;
    r5.xyz = r11.xzy * r5.xxx + r10.xzy;
    r5.xyz = r9.xyz * r5.xzy + UniformVector_0.xyz;
    r5.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r3.xyz * r1.xzy + r5.xzy;
    r5.xyz = r0.xyz * r7.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
