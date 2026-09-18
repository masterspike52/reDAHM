// ps_7034e3991f626684.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041200 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c25); // float4
float4 LightMapScale : register(c26); // float3
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
sampler2D LightMapTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
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

    r11 = tex2D(Texture2D_5, r1.xy);
    ps = (-4e+02) - -r3.w;
    r8.x = ps;
    ps = r1.w;
    r8.z = dot(r4.zxy, r4.zxy);
    ps = 6.0 * ps;
    r7.w = -r1.z + 1.0;
    r0.z = ps;
    ps = rsqrt(abs(r8.z));
    r8.y = r11.w - 0.5;
    r8.z = ps;
    ps = 0.00022222222 * r8.x;
    r14.xyz = r8.zzz * r4.xyz;
    r8.x = saturate(ps);
    ps = (-0.025) * r8.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.yyyy)) clip(-1.0);
    r8.x = ps;
    ps = UniformVector_2.y * r7.w;
    r10.zw = r14.xy * r8.xx;
    r10.y = ps;
    ps = UniformVector_2.x * r1.w;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r10.x = ps;
    ps = r1.w;
    r8.yz = r10.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r18.xw = float2((r10.xy >= 0.5));
    r8.x = ps;
    ps = r1.z;
    r8.yz = r8.yz - r10.xy;
    ps = UniformVector_1.y * ps;
    r8.zw = r8.yz * r18.xw;
    r8.y = ps;
    ps = r1.z;
    r4 = r10.zxyw + r8.xzwy;
    ps = 6.0 * ps;
    r8.xy = r4.yz + r4.yz;
    r0.w = ps;
    r12 = tex2D(Texture2D_1, r8.xy);
    r8.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r10.xyw = tex2D(Texture2D_0, r4.xw).xyz;
    r15.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r13.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r6 = r6.yxzw * 2.0 - 1.0;
    r13.w = r15.z * r13.w - 1.0;
    r13.xy = r13.xy * 2.0 - 1.0;
    r18.yz = r15.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r6.zyx, r6.zyx);
    r0.w = ps;
    r15.xyz = r10.xyw * 2.0 - 1.0;
    r8.yzw = r8.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r8.x));
    r17.xyz = r8.yzw * UniformVector_4.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r7.x));
    r13.z = -r15.z + r17.z;
    r8.x = ps;
    r16.yzw = r16.xyz * r11.xyz;
    r7.x = dot(r7.wyz, r7.wyz);
    r11.xyz = r8.yyy * r2.xyz;
    ps = rsqrt(abs(r7.x));
    r10.xyz = r6.xzy * r8.xxx;
    r7.x = ps;
    ps = r3.w;
    r8.xyz = r7.ywz * r7.xxx;
    ps = 0.0001 * ps;
    r7.xyw = r10.yzx * r8.zyx;
    r7.z = saturate(ps);
    r7.xyw = r10.xyz * r8.yxz - r7.xyw;
    ps = r14.z;
    r2.yzw = r7.xyw * r6.www;
    r7.x = ps;
    ps = 0.0;
    r11.w = dot(r18.xww, float3(1.0, 1.0, 1.0));
    r7.y = ps;
    r6.w = (r11.w == 0.0) ? r12.x : r12.y;
    ps = max(r7.x, r7.y);
    r6.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r7.y = ps;
    ps = 5.0 * r6.x;
    r8.w = dot(r2.wyz, r2.wyz);
    r7.x = saturate(ps);
    r6.w = (r6.z == 0.0) ? r12.z : r6.w;
    r6.w = (r6.y == 0.0) ? r12.w : r6.w;
    ps = OpacityOverride.x;
    r7.xyz = -r7.zyx + 1.0;
    r6.x = saturate(ps);
    ps = ModShadowGroupColor.x * r7.z;
    r6.z = max(r6.w, 0.0);
    r6.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r18.x = min(r6.z, 0.3);
    r6.z = ps;
    r12 = -r6.wxyz + 1.0;
    ps = r12.x;
    r6.yzw = r18.yxz * float3(0.5, 3.3333333, 0.5);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r13.xy = r13.xy + r6.yw;
    r16.x = ps;
    r6.xy = r6.zz * r13.xy + r17.xy;
    r2.x = r6.z * r13.w + 1.0;
    r7.w = saturate(r16.x * r2.x - 0.5);
    r13.xy = r6.xy - r15.xy;
    r6.xy = r13.xy * r7.ww + r15.xy;
    r6.z = r13.z * r7.w - 2.0;
    r6.z = r10.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.xxx;
    ps = 1.0 + r6.x;
    r0.zw = r0.zw * abs(r9.xy);
    r6.w = ps;
    r6.xyz = (r7.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r8.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.w = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r2.ywz * r8.www;
    r6.x = ps;
    r13.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r13.zxy, r14.zxy);
    r6.xyz = r13.xzy * r6.xxx;
    r2.yzw = r6.xyz * 2.0 - r14.xzy;
    r6.xyz = r10.zxy * r2.zzz;
    r6.xyz = r9.xzy * r2.www + r6.xyz;
    r6.xyw = r8.yzx * r2.yyy + r6.zyx;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r4.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.x = tex2D(Texture2D_4, r1.xy).x;
    r15.xyz = tex2D(Texture2D_6, r4.xw).xyz;
    r18.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.z));
    r6.y = UniformScalar_7.x * (-XE_FLT_MAX);
    r6.z = ps;
    ps = pow(2.0, r6.y);
    r14.xyz = r6.zzz * r5.xyz;
    r6.y = ps;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r0.xyz * LightMapScale.xyz;
    r0.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r6.z = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r1.xyz = r16.yzw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r9.xyz = r16.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r5.xyz = r6.zzz - r18.xyz;
    r5.xyz = r5.xyz * UniformScalar_4.xxx + r18.xyz;
    ps = log2(abs(r7.y));
    r17.xyz = r17.xyz * r5.xyz;
    r6.z = ps;
    ps = UniformScalar_1.x * r6.z;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r6.w = float((r12.y >= 0.004));
    r6.z = ps;
    r6.z = r6.z * UniformScalar_3.x + UniformScalar_2.x;
    r7.xyz = r17.xyz * r6.zzz;
    ps = UniformScalar_8.x * r6.y;
    r9.xyz = r7.xyz * r9.xyz;
    r9.w = ps;
    r7.xyz = r16.yzw * r2.xxx - r15.xyz;
    r7.xyz = r7.xyz * r7.www + r15.xyz;
    r9 = r9 * r6.xxxx;
    r1.xyz = r1.xyz + r9.www;
    r8.xyz = r7.xyz * r8.xyz;
    r6.xyz = r9.xyz * r7.www + UniformVector_0.xyz;
    r9.xyz = r0.xyz * r7.xyz + r6.xyz;
    r0.xyz = r10.xzy * r13.zzz;
    r4.x = dot(r14.zxy, r13.zxy);
    r4 = r4.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r4.xy = r4.xy * r12.zw + 0.125;
    r6.x = saturate(dot(r11.zxy, r2.zyw));
    ps = log2(r6.x);
    r2.yz = r4.zw + 0.5;
    r6.x = ps;
    r2.xyw = abs(r2.yzx) * abs(r2.yzx);
    ps = 15.0 * r6.x;
    r7.xyz = r8.xzy * r2.xxx;
    r8.w = ps;
    ps = pow(2.0, r8.w);
    r6.xyz = r8.xzy * r2.yyy;
    r8.w = ps;
    ps = r2.w * r2.w;
    r2.xyz = r10.xzy * r8.www;
    r4.z = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r7.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r4.xy = r4.xz * r4.yz;
    r6.xyz = r4.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xyz = r4.yyy * r1.xyz;
    r1.xyz = r1.xzy * r7.www;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r8.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
