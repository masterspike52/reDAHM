// ps_6b0887a06ad822ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c25); // float4
float4 ConstantLighting : register(c26); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c24); // float3
float4 ModShadowAccumResolution : register(c29); // float2
float4 ModShadowColor : register(c27); // float3
float4 ModShadowGroupColor : register(c28); // float3
float4 OpacityOverride : register(c22); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_10 : register(c21); // float
float4 UniformScalar_2 : register(c13); // float
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
float4 UpperSkyColor : register(c23); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
samplerCUBE TextureCube_0 : register(s7);
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
    float4 color1 : COLOR1; // r7
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
    float4 r7 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_5, r0.xy);
    ps = (-4e+02) - -r3.w;
    r11.x = r1.x * UniformVector_2.x;
    r0.w = ps;
    ps = r1.x;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = 6.0 * ps;
    r7.w = -r1.y + 1.0;
    r13.x = ps;
    ps = rsqrt(abs(r0.z));
    r1.z = r10.w - 0.5;
    r0.z = ps;
    ps = 0.00022222222 * r0.w;
    r9.yzw = r0.zzz * r4.xyz;
    r0.z = saturate(ps);
    ps = (-0.025) * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r0.z = ps;
    ps = UniformVector_2.y * r7.w;
    r11.zw = r9.yz * r0.zz;
    r11.y = ps;
    ps = r1.x;
    r0.zw = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r1.zw = float2((r11.xy >= 0.5));
    r4.x = ps;
    ps = r1.y;
    r0.zw = r0.zw - r11.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r0.zw * r1.zw;
    r4.y = ps;
    ps = r1.y;
    r4 = r11.zxyw + r4.xzwy;
    ps = 6.0 * ps;
    r0.zw = r4.yz + r4.yz;
    r13.y = ps;
    r19 = tex2D(Texture2D_1, r0.zw);
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyw = tex2D(Texture2D_0, r4.xw).xyz;
    r13.yzw = tex2D(Texture2D_2, r13.xy).xyw;
    r14.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.x = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    r6 = r6.yxzw * 2.0 - 1.0;
    r14.w = r13.w * r14.w - 1.0;
    r0.zw = r14.xy * 2.0 - 1.0;
    r18.yz = r13.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r6.zyx, r6.zyx);
    r13.y = ps;
    r16.xyz = r11.xyw * 2.0 - 1.0;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r17.xyz = r12.xyz * UniformVector_4.xyz;
    r1.y = ps;
    ps = rsqrt(abs(r7.x));
    r14.z = -r16.z + r17.z;
    r1.x = ps;
    r12.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r15.yzw = r12.xyz * r10.xyz;
    r7.x = dot(r7.wyz, r7.wyz);
    r10.xyz = r1.yyy * r2.xyz;
    ps = rsqrt(abs(r7.x));
    r12.xyz = r6.xzy * r1.xxx;
    r7.x = ps;
    ps = OpacityOverride.x;
    r2.xyz = r7.ywz * r7.xxx;
    r7.w = saturate(ps);
    ps = r3.w;
    r7.xyz = r12.yzx * r2.zyx;
    r7.xyz = r12.xyz * r2.yxz - r7.xyz;
    ps = 0.0001 * ps;
    r11.xyz = r7.xyz * r6.www;
    r7.z = saturate(ps);
    ps = r9.w;
    r10.w = dot(r1.zww, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r6.w = (r10.w == 0.0) ? r19.x : r19.y;
    ps = 0.0;
    r6.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r1.y = ps;
    ps = 5.0 * r6.x;
    r7.y = dot(r11.zxy, r11.zxy);
    r7.x = saturate(ps);
    r6.w = (r6.z == 0.0) ? r19.z : r6.w;
    r6.w = (r6.y == 0.0) ? r19.w : r6.w;
    ps = max(r1.x, r1.y);
    r7.xzw = -r7.zwx + 1.0;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r7.w;
    r6.y = max(r6.w, 0.0);
    r6.x = ps;
    ps = ModShadowGroupColor.y * r7.w;
    r18.x = min(r6.y, 0.3);
    r6.y = ps;
    r1 = -r6.wzxy + 1.0;
    ps = r1.x;
    r6.yzw = r18.yxz * float3(0.5, 3.3333333, 0.5);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r14.xy = r0.zw + r6.yw;
    r15.x = ps;
    r6.xy = r6.zz * r14.xy + r17.xy;
    r9.x = r6.z * r14.w + 1.0;
    r0.w = saturate(r15.x * r9.x - 0.5);
    r14.xy = r6.xy - r16.xy;
    r6.xy = r14.xy * r0.ww + r16.xy;
    r6.z = r14.z * r0.w - 2.0;
    r6.z = r11.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.xxx;
    ps = 1.0 + r6.x;
    r8.xy = r13.xy * abs(r8.xy);
    r6.w = ps;
    r6.xyz = (r7.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.y));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r11.xzy * r7.xxx;
    r6.x = ps;
    r7.xyw = r6.yzw * r6.xxx;
    r6.x = dot(r7.wxy, r9.wyz);
    r6.xyz = r7.xwy * r6.xxx;
    r9.yzw = r6.xyz * 2.0 - r9.ywz;
    r6.xyz = r12.zxy * r9.zzz;
    r6.xyz = r11.xzy * r9.www + r6.xyz;
    r6.xyw = r2.yzx * r9.yyy + r6.zyx;
    r2.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r0.z = ps;
    r2.xy = r6.yx * r0.zz + 1.5;
    r4.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r6.x = tex2D(Texture2D_4, r0.xy).x;
    r8.xyz = tex2D(Texture2D_6, r4.xw).xyz;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.z));
    r6.y = UniformScalar_7.x * (-XE_FLT_MAX);
    r6.z = ps;
    ps = pow(2.0, r6.y);
    r11.xyz = r6.zzz * r5.xyz;
    r6.y = ps;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r2.xyz = r15.yzw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r13.xyz = r15.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r5.xyz = r6.zzz - r16.xyz;
    r5.xyz = r5.xyz * UniformScalar_4.xxx + r16.xyz;
    ps = log2(abs(r1.y));
    r14.xyz = r14.xyz * r5.xyz;
    r6.z = ps;
    ps = UniformScalar_1.x * r6.z;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r7.z = float((r7.z >= 0.004));
    r6.z = ps;
    r15.xyz = r15.yzw * r9.xxx - r8.xyz;
    r6.z = r6.z * UniformScalar_3.x + UniformScalar_2.x;
    r14.xyz = r14.xyz * r6.zzz;
    r8.xyz = r15.xyz * r0.www + r8.xyz;
    r0.xyz = r8.xyz * r0.xyz;
    ps = UniformScalar_8.x * r6.y;
    r13.xyz = r14.xyz * r13.xyz;
    r13.w = ps;
    r6 = r13 * r6.xxxx;
    r2.xyz = r2.xyz + r6.www;
    r6.xyz = r6.xyz * r0.www + UniformVector_0.xyz;
    r8.xyz = r12.xyz * r8.xyz + r6.xyz;
    ps = ConstantLighting.x * r7.w;
    r4.x = dot(r11.zxy, r7.wxy);
    r1.x = ps;
    ps = ConstantLighting.y * r7.w;
    r6 = r4.yxxz * float4(0.875, -0.5, 0.5, 0.875);
    r1.y = ps;
    r4.xy = r6.xw * r1.zw + 0.125;
    ps = ConstantLighting.z * r7.w;
    r6.x = saturate(dot(r10.zxy, r9.zyw));
    r1.z = ps;
    ps = log2(r6.x);
    r9.yz = r6.yz + 0.5;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r9.xyz = abs(r9.xyz) * abs(r9.xyz);
    r6.w = ps;
    ps = r9.x * r9.x;
    r7.xyw = r0.xzy * r9.yyy;
    r4.z = ps;
    ps = pow(2.0, r6.w);
    r6.xyz = r0.xzy * r9.zzz;
    r6.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r7.xyw = r7.xwy * LowerSkyColor.xyz + r6.xzy;
    ps = ConstantLighting.x * r6.w;
    r4.yz = r4.xz * r4.yz;
    r4.x = ps;
    r6.xyz = r4.yyy * r5.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r6.w;
    r2.xyz = r4.zzz * r2.xyz;
    r4.y = ps;
    ps = ConstantLighting.y * r6.w;
    r2.xyz = r2.xzy * r0.www;
    r4.z = ps;
    r7.xyw = r4.xyz * r2.xyz + r7.xwy;
    r7.xyw = r1.xyz * r0.xyz + r7.xwy;
    ps = -r3.w;
    r6.xyz = r7.xyw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.z + r3.w;
    r6.xyz = r0.xyz * r7.zzz + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
