// ps_671e71ceb8b7e8ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041300 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_5, r0.xy);
    ps = r0.w;
    r7.z = dot(r3.zxy, r3.zxy);
    ps = 6.0 * ps;
    r6.w = -r0.z + 1.0;
    r13.x = ps;
    ps = rsqrt(abs(r7.z));
    r7.y = r10.w - 0.5;
    r7.z = ps;
    ps = UniformVector_2.x * r0.w;
    r7.x = r2.w - 4e+02;
    r11.x = ps;
    ps = 0.00022222222 * r7.x;
    r9.yzw = r7.zzz * r3.xyz;
    r7.x = saturate(ps);
    ps = (-0.025) * r7.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r7.x = ps;
    ps = UniformVector_2.y * r6.w;
    r11.zw = r9.yz * r7.xx;
    r11.y = ps;
    ps = r0.w;
    r7.yz = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r16.xy = float2((r11.xy >= 0.5));
    r7.x = ps;
    ps = r0.z;
    r7.yz = r7.yz - r11.xy;
    ps = UniformVector_1.y * ps;
    r7.zw = r7.yz * r16.xy;
    r7.y = ps;
    ps = r0.z;
    r11 = r11.zxyw + r7.xzwy;
    ps = 6.0 * ps;
    r7.xy = r11.yz + r11.yz;
    r13.y = ps;
    r3 = tex2D(Texture2D_1, r7.xy);
    r7.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyw = tex2D(Texture2D_0, r11.xw).xyz;
    r13.xyz = tex2D(Texture2D_2, r13.xy).xyw;
    r14.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.yzw = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r1.zxy, r1.zxy);
    r14.x = ps;
    r5 = r5.yxzw * 2.0 - 1.0;
    r16.w = r13.z * r14.w - 1.0;
    r14.zw = r14.yz * 2.0 - 1.0;
    r19.yz = r13.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r5.zyx, r5.zyx);
    r14.y = ps;
    r17.xyz = r12.xyw * 2.0 - 1.0;
    r7.yzw = r7.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r18.xyz = r7.yzw * UniformVector_4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r16.z = -r17.z + r18.z;
    r7.x = ps;
    r13.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r15.yzw = r13.xyz * r10.xyz;
    r6.x = dot(r6.wyz, r6.wyz);
    r10.xyz = r7.yyy * r1.xyz;
    ps = rsqrt(abs(r6.x));
    r12.xyz = r5.xzy * r7.xxx;
    r6.x = ps;
    ps = OpacityOverride.x;
    r7.xyz = r6.ywz * r6.xxx;
    r6.w = saturate(ps);
    ps = r2.w;
    r6.xyz = r12.yzx * r7.zyx;
    r6.xyz = r12.xyz * r7.yxz - r6.xyz;
    ps = 0.0001 * ps;
    r13.xyz = r6.xyz * r5.www;
    r6.z = saturate(ps);
    ps = r9.w;
    r10.w = dot(r16.xyy, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r5.w = (r10.w == 0.0) ? r3.x : r3.y;
    ps = 0.0;
    r5.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r1.y = ps;
    ps = 5.0 * r5.x;
    r6.y = dot(r13.zxy, r13.zxy);
    r6.x = saturate(ps);
    r5.w = (r5.z == 0.0) ? r3.z : r5.w;
    r5.w = (r5.y == 0.0) ? r3.w : r5.w;
    ps = max(r1.x, r1.y);
    r6.xzw = -r6.zwx + 1.0;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r5.y = max(r5.w, 0.0);
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r19.x = min(r5.y, 0.3);
    r5.y = ps;
    r3 = -r5.wxyz + 1.0;
    ps = r3.x;
    r5.yzw = r19.yxz * float3(0.5, 3.3333333, 0.5);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r16.xy = r14.zw + r5.yw;
    r15.x = ps;
    r5.xy = r5.zz * r16.xy + r18.xy;
    r9.x = r5.z * r16.w + 1.0;
    r7.w = saturate(r15.x * r9.x - 0.5);
    r16.xy = r5.xy - r17.xy;
    r5.xy = r16.xy * r7.ww + r17.xy;
    r5.z = r16.z * r7.w - 2.0;
    r5.z = r12.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.xxx;
    ps = 1.0 + r5.x;
    r1.xy = r14.xy * abs(r8.xy);
    r5.w = ps;
    r5.xyz = (r6.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.y));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r13.xzy * r6.xxx;
    r5.x = ps;
    r6.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wxy, r9.wyz);
    r5.xyz = r6.xwy * r5.xxx;
    r9.yzw = r5.xyz * 2.0 - r9.ywz;
    r5.xyz = r12.zxy * r9.zzz;
    r5.xyz = r8.xzy * r9.www + r5.xyz;
    r5.xyw = r7.yzx * r9.yyy + r5.zyx;
    r7.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r7.x = ps;
    r7.xy = r5.yx * r7.xx + 1.5;
    r11.yz = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    r8.xyz = tex2D(Texture2D_6, r11.xw).xyz;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r5.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.z));
    r5.y = UniformScalar_7.x * (-XE_FLT_MAX);
    r5.z = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r5.zzz * r4.xyz;
    r5.y = ps;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r12.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r5.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r1.xyz = r15.yzw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r13.xyz = r15.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r4.xyz = r5.zzz - r16.xyz;
    r4.xyz = r4.xyz * UniformScalar_4.xxx + r16.xyz;
    ps = log2(abs(r3.w));
    r14.xyz = r14.xyz * r4.xyz;
    r5.z = ps;
    ps = UniformScalar_1.x * r5.z;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r6.z = float((r6.z >= 0.004));
    r5.z = ps;
    r15.xyz = r15.yzw * r9.xxx - r8.xyz;
    r5.z = r5.z * UniformScalar_3.x + UniformScalar_2.x;
    r14.xyz = r14.xyz * r5.zzz;
    r8.xyz = r15.xyz * r7.www + r8.xyz;
    r7.xyz = r8.xyz * r7.xyz;
    ps = UniformScalar_8.x * r5.y;
    r13.xyz = r14.xyz * r13.xyz;
    r13.w = ps;
    r5 = r13 * r5.xxxx;
    r1.xyz = r1.xyz + r5.www;
    r5.xyz = r5.xyz * r7.www + UniformVector_0.xyz;
    r8.xyz = r12.xyz * r8.xyz + r5.xyz;
    ps = ConstantLighting.x * r6.w;
    r11.x = dot(r0.zxy, r6.wxy);
    r0.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5 = r11.yxxz * float4(0.875, -0.5, 0.5, 0.875);
    r0.y = ps;
    r3.xy = r5.xw * r3.yz + 0.125;
    ps = ConstantLighting.z * r6.w;
    r5.x = saturate(dot(r10.zxy, r9.zyw));
    r0.z = ps;
    ps = log2(r5.x);
    r9.yz = r5.yz + 0.5;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r9.xyz = abs(r9.xyz) * abs(r9.xyz);
    r5.w = ps;
    ps = r9.x * r9.x;
    r6.xyw = r7.xzy * r9.yyy;
    r3.z = ps;
    ps = pow(2.0, r5.w);
    r5.xyz = r7.xzy * r9.zzz;
    r5.w = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyw = r6.xwy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.x * r5.w;
    r3.yz = r3.xz * r3.yz;
    r3.x = ps;
    r5.xyz = r3.yyy * r4.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r1.xyz = r3.zzz * r1.xyz;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r1.xyz = r1.xzy * r7.www;
    r3.z = ps;
    r6.xyw = r3.xyz * r1.xyz + r6.xwy;
    r6.xyw = r0.xyz * r7.xyz + r6.xwy;
    ps = -r2.w;
    r5.xyz = r6.xyw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xyz - r5.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.z + r2.w;
    r5.xyz = r7.xyz * r6.zzz + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
