// ps_6d23458c4091382d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040E00 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c24); // float4
float4 ConstantLighting : register(c25); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c23); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c19); // float
float4 UniformScalar_11 : register(c20); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_3 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformScalar_5 : register(c14); // float
float4 UniformScalar_6 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformScalar_9 : register(c18); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UpperSkyColor : register(c22); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_2, r0.xy).wxyz;
    r7.x = r12.x - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r7.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r9.x = saturate(r2.w * 0.0001);
    r9.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    r13 = r5.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.y = ps;
    r14.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = dot(r14.zxy, r14.zxy);
    r5.w = ps;
    r5.xyz = r7.wyz * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r6.w = dot(r13.zyx, r13.zyx);
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r10.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r7.xyz = r5.www * r1.zxy;
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r5.w = max(r10.z, 0.0);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r1.yzw = r13.xzy * r5.yyy;
    r5.y = ps;
    ps = 0.1 - -r7.x;
    r3.xyz = r14.xzy * r5.yyy;
    r5.y = ps;
    ps = 5.0 * r5.y;
    r14.xyz = r1.zwy * r3.zyx;
    r5.z = saturate(ps);
    r14.xyz = r1.yzw * r3.yxz - r14.xyz;
    ps = 1.0 - r5.z;
    r14.xyz = r14.xyz * r13.www;
    r6.x = ps;
    ps = 1.0 - r5.w;
    r7.w = dot(r14.zxy, r14.zxy);
    r1.x = ps;
    ps = UniformVector_2.z * r5.x;
    r9.yz = r6.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = (-1.0) - -r6.x;
    r9 = -r9.wxyz + 1.0;
    r6.w = ps;
    r5.xyz = r6.wyz * r9.yyy;
    ps = 1.0 + r5.x;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r9.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r14.xyz = r14.xzy * r6.xxx;
    r5.x = ps;
    r6.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wxy, r10.zxy);
    ps = r11.x;
    r5.xyz = r6.xwy * r5.xxx;
    r10.xyz = r5.xyz * 2.0 - r10.xzy;
    ps = abs(r8.x) * ps;
    r5.xyz = r1.wyz * r10.yyy;
    r1.y = ps;
    r5.xyz = r14.xzy * r10.zzz + r5.xyz;
    r5.xyw = r3.yzx * r10.xxx + r5.zyx;
    ps = r11.y;
    r3.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r3.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    ps = abs(r8.y) * ps;
    r5 = xe_cube(r5.xzy);
    r1.z = ps;
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.z = ps;
    r3.xy = r5.yx * r6.zz + 1.5;
    r1.yz = tex2D(ModShadowAccumTexture, r1.yz).xy;
    r7.w = tex2D(Texture2D_1, r0.xy).x;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r5.y = UniformScalar_7.x * (-XE_FLT_MAX);
    ps = UniformVector_3.x * UniformVector_3.w;
    r5.x = float((UniformScalar_9.x >= 1.0));
    r12.x = ps;
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.z = float((UniformScalar_9.x > 1.0));
    r0.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r5.w = dot(r4.zxy, r4.zxy);
    r0.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r5.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r0.xyz * r12.yzw;
    r5.w = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r4.yzw = r5.www * r4.xyz;
    r12.y = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r3.xyz * r13.xyz;
    r5.y = ps;
    r8.xyz = r3.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r3.xyz = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = UniformVector_3.z * UniformVector_3.w;
    r13.xyz = r5.zzz - r11.xyz;
    r12.z = ps;
    r11.xyz = r13.xyz * UniformScalar_4.xxx + r11.xyz;
    ps = log2(abs(r1.x));
    r11.xyz = r12.xyz * r11.xyz;
    r5.z = ps;
    ps = UniformScalar_1.x * r5.z;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.w = float((r9.x >= 0.004));
    r5.z = ps;
    r5.z = r5.z * UniformScalar_3.x + UniformScalar_2.x;
    r11.xyz = r11.xyz * r5.zzz;
    ps = UniformScalar_8.x * r5.y;
    r3.xyz = r11.xyz * r3.xyz;
    r3.w = ps;
    ps = -ModShadowColor.x;
    r3 = r3 * r7.wwww;
    r3 = (-abs(r6.zzzz) >= 0.0) ? r3 : 0.0;
    r3 = (-abs(r5.xxxx) >= 0.0) ? 0.0 : r3;
    ps = 1.0 + ps;
    r5.xyz = r3.xyz + UniformVector_0.xyz;
    r4.x = ps;
    ps = -ModShadowColor.y;
    r3.xyz = r8.xzy + r3.www;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    ps = 1.0 + ps;
    r1.x = dot(r4.wyz, r6.wxy);
    r4.y = ps;
    ps = -ModShadowColor.z;
    r1 = r1.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    ps = 1.0 + ps;
    r5.x = saturate(dot(r7.xyz, r10.yxz));
    r4.z = ps;
    r7.xy = r1.zw * r9.zw + 0.125;
    ps = ConstantLighting.x * r6.w;
    r5.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5.yz = abs(r5.yz) * abs(r5.yz);
    r1.y = ps;
    ps = log2(r5.x);
    r6.z = r7.x * r7.y;
    r5.x = ps;
    r7.xyz = r6.zzz * r4.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r4.xyz = r0.xzy * r5.yyy;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r5.xyz = r0.xzy * r5.zzz;
    r6.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r6.w;
    r4.xyz = r6.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r4.xyz * r3.xyz + r5.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r7.xyz;
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
