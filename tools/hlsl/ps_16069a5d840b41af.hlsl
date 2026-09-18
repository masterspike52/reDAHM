// ps_16069a5d840b41af.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041400 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 ConstantLighting : register(c28); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c26); // float3
float4 ModShadowAccumResolution : register(c31); // float2
float4 ModShadowColor : register(c29); // float3
float4 ModShadowGroupColor : register(c30); // float3
float4 OpacityOverride : register(c24); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c12); // float
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_10 : register(c21); // float
float4 UniformScalar_11 : register(c22); // float
float4 UniformScalar_12 : register(c23); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformScalar_6 : register(c17); // float
float4 UniformScalar_7 : register(c18); // float
float4 UniformScalar_8 : register(c19); // float
float4 UniformScalar_9 : register(c20); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UpperSkyColor : register(c25); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
samplerCUBE TextureCube_0 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r12.w - 0.5;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r7.xy = r7.xy * abs(r8.xy);
    r8.x = ps;
    r7.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    ps = r0.x;
    r10.xy = r0.wz * 6.0;
    ps = UniformScalar_0.x * ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = (-4e+02) - -r2.w;
    r12.xyz = r17.xyz * r12.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r6.w));
    r7.y = saturate(r7.y * 0.00022222222);
    r6.w = ps;
    ps = -r0.z;
    r9.xyz = r6.www * r3.xyz;
    ps = 1.0 + ps;
    r20.yzw = r7.zwy * float3(0.875, 0.875, -0.025);
    r6.w = ps;
    ps = UniformVector_2.y * r6.w;
    r8.zw = r9.xy * r20.ww;
    r8.y = ps;
    ps = r0.w;
    r7.yz = r8.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r11.xw = float2((r8.xy >= 0.5));
    r3.x = ps;
    ps = r0.z;
    r7.yz = r7.yz - r8.xy;
    ps = UniformVector_1.y * ps;
    r3.zw = r7.yz * r11.xw;
    r3.y = ps;
    ps = r0.y;
    r8 = r8.zwxy + r3;
    ps = UniformScalar_0.x * ps;
    r7.zw = r8.zw + r8.zw;
    r7.y = ps;
    r13 = tex2D(Texture2D_1, r7.zw);
    r3.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r7.xy).wxy;
    r16.xyw = tex2D(Texture2D_2, r10.xy).xyw;
    r10.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r3.z = dot(r1.zxy, r1.zxy);
    r5 = r5.yxzw * 2.0 - 1.0;
    r14.xyz = r6.xyz * 2.0 - 1.0;
    r16.w = r16.w * r10.y - 1.0;
    r11.yz = r16.xy * 2.0 - 1.0;
    r6.xy = r7.yz + r7.yz;
    ps = r10.x + r10.x;
    r6.w = dot(r14.zxy, r14.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r3.z));
    r7.w = dot(r5.zyx, r5.zyx);
    r3.z = ps;
    r18.xyz = r15.xyz * 2.0 - 1.0;
    r17.xyz = r3.xyw * 2.0 - 1.0;
    r16.z = r18.z * UniformVector_4.z - r17.z;
    ps = rsqrt(abs(r7.w));
    r10.xyz = r3.zzz * r1.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r5.xzy * r7.www;
    r6.w = ps;
    ps = r10.w + r10.w;
    r14.xyz = r14.xzy * r6.www;
    r6.w = ps;
    ps = OpacityOverride.x;
    r19 = r6 - 1.0;
    r6.x = saturate(ps);
    ps = r2.w;
    r6.yzw = r15.yzx * r14.zyx;
    r6.yzw = r15.xyz * r14.yxz - r6.yzw;
    ps = 0.0001 * ps;
    r3.xyz = r6.yzw * r5.www;
    r1.w = saturate(ps);
    ps = (-1.0) + r7.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r20.x = ps;
    ps = r9.z;
    r10.w = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r5.w = (r10.w == 0.0) ? r13.x : r13.y;
    ps = 0.0;
    r5.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r7.y = ps;
    r5.w = (r5.z == 0.0) ? r13.z : r5.w;
    r6.y = (r5.y == 0.0) ? r13.w : r5.w;
    ps = 5.0 * r5.x;
    r5.w = max(r6.y, 0.0);
    r6.z = saturate(ps);
    ps = max(r7.x, r7.y);
    r6.xyz = -r6.xyz + 1.0;
    r1.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r11.x = min(r5.w, 0.3);
    r1.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.xyz = r11.yzx * float3(0.5, 0.5, 3.3333333);
    r1.y = ps;
    ps = 2.5 * r6.y;
    r11 = -r1.wxyz + 1.0;
    r13.x = ps;
    ps = r11.x;
    r16.xy = r19.zw + r5.xy;
    r5.y = ps;
    r1.yzw = r20.xyz * r11.xyz + float3(1.0, 0.125, 0.125);
    r9.w = r5.z * r16.w + 1.0;
    ps = UniformScalar_1.x * r5.y;
    r13.yzw = r12.xyz * r1.yyy;
    r5.w = ps;
    r7.xy = r5.ww * r19.xy + r18.xy;
    r5.xy = r7.xy * UniformVector_4.xy - r17.xy;
    r7.w = saturate(r13.x * r9.w - 0.5);
    r16.xy = r5.zz * r16.xy + r5.xy;
    r5.xy = r16.xy * r7.ww + r17.xy;
    r5.z = r16.z * r7.w - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r5.xyz = r5.xzy * r11.xxx;
    ps = 1.0 + r5.y;
    r5.w = ps;
    r5.xyz = (r11.xxx > 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r11.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r3.xzy * r6.www;
    r5.x = ps;
    r3.xyz = r5.wyz * r5.xxx;
    r5.x = dot(r3.xyz, r9.zxy);
    r5.xyz = r3.yxz * r5.xxx;
    r9.xyz = r5.xyz * 2.0 - r9.xzy;
    r5.xyz = r15.zxy * r9.yyy;
    r5.xyz = r7.xzy * r9.zzz + r5.xyz;
    r5.xyw = r14.yzx * r9.xxx + r5.zyx;
    r7.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r6.w = ps;
    r7.xy = r5.yx * r6.ww + 1.5;
    r0.z = tex2D(Texture2D_5, r0.xy).x;
    r5.xzw = tex2D(Texture2D_7, r8.xy).xyz;
    r0.xyw = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    ps = UniformScalar_9.x;
    r8.yzw = UniformVector_5.xyz * UniformVector_5.www;
    ps = (-XE_FLT_MAX) * ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r3.w = ps;
    ps = pow(2.0, r5.y);
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r11.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r12.w = ps;
    ps = r3.w;
    r5.y = dot(r0.wxy, float3(0.11, 0.3, 0.59));
    r12.xyz = r12.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = r4.x * ps;
    r15.xyz = r5.yyy - r0.xyw;
    r8.x = ps;
    r0.xyw = r15.xyz * UniformScalar_6.xxx + r0.xyw;
    ps = log2(abs(r11.w));
    r8.yzw = r8.yzw * r0.xyw;
    r5.y = ps;
    ps = UniformScalar_3.x * r5.y;
    r6.x = float((r6.x >= 0.004));
    r5.y = ps;
    r6.yzw = r13.yzw * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = pow(2.0, r5.y);
    r1.x = abs(r9.w) * abs(r9.w);
    r5.y = ps;
    r0.xyw = r13.yzw * r9.www - r5.xzw;
    r5.y = r5.y * UniformScalar_5.x + UniformScalar_4.x;
    ps = r3.w;
    r13.xyz = r8.yzw * r5.yyy;
    r0.xyw = r0.xyw * r7.www + r5.xzw;
    ps = r4.y * ps;
    r5.xw = r1.zx * r1.wx;
    r8.y = ps;
    r5.xyz = r5.xxx * r14.xyz + ModShadowColor.xyz;
    ps = r3.w;
    r12.xyz = r13.xyz * r12.xyz;
    ps = r4.z * ps;
    r1 = r12 * r1.yyyy;
    r8.z = ps;
    ps = r5.w * r5.w;
    r4 = r1 * r0.zzzz;
    r5.w = ps;
    ps = r0.x;
    r1.xyz = r6.yzw + r4.www;
    r6.yzw = r4.xyz * r7.www + UniformVector_0.xyz;
    r6.yzw = r11.xyz * r0.xyw + r6.yzw;
    ps = r7.x * ps;
    r1.xyz = r5.www * r1.xyz;
    r7.x = ps;
    ps = r0.y;
    r1.xyz = r1.xzy * r7.www;
    ps = r7.y * ps;
    r5.w = saturate(dot(r10.zxy, r9.yxz));
    r7.y = ps;
    ps = log2(r5.w);
    r4.x = dot(r8.zxy, r3.xyz);
    r4.y = ps;
    ps = r0.w;
    r0.xyz = r4.xxy * float3(-0.5, 0.5, 15.0);
    ps = r7.z * ps;
    r4.xy = r0.xy + 0.5;
    r7.z = ps;
    ps = pow(2.0, r0.z);
    r3.yz = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r0.xyz = r3.xxx * ConstantLighting.xyz;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r7.xzy * r3.yyy;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r7.xzy * r3.zzz;
    r3.z = ps;
    r6.yzw = r8.xyz * UpperSkyColor.xzy + r6.ywz;
    r6.yzw = r4.xzy * LowerSkyColor.xyz + r6.ywz;
    r6.yzw = r3.xyz * r1.xyz + r6.ywz;
    r6.yzw = r0.xyz * r7.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xyz - r5.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.x + r2.w;
    r5.xyz = r7.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
