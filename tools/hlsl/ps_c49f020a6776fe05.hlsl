// ps_c49f020a6776fe05.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 351 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000057C 10041200 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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

float4 AmbientColorAndSkyFactor : register(c29); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c28); // float3
float4 ModShadowAccumResolution : register(c32); // float2
float4 ModShadowColor : register(c30); // float3
float4 ModShadowGroupColor : register(c31); // float3
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
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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

    r16 = tex2D(Texture2D_3, r0.xy);
    ps = (-0.5) + r16.w;
    r8.xy = r0.xy * UniformScalar_0.xx;
    r8.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.zzzz)) clip(-1.0);
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r8.xy).wxy;
    ps = OpacityOverride.x;
    r10.x = dot(r4.zxy, r4.zxy);
    r12.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.w = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    r13 = r6.yxzw * 2.0 - 1.0;
    r12.yzw = r7.xyz * 2.0 - 1.0;
    r10.yz = r8.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r12.wyz, r12.wyz);
    r11.y = ps;
    ps = rsqrt(abs(r10.w));
    r8.w = dot(r13.zyx, r13.zyx);
    r7.x = ps;
    r6.xyz = r14.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r10.x));
    r7.xzw = r7.xxx * r2.zxy;
    r7.y = ps;
    ps = UniformVector_2.z * r6.x;
    r17.xyz = r7.yyy * r4.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r8.w));
    r10.w = max(r17.z, 0.0);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r14.xyz = r13.xzy * r6.xxx;
    r6.x = ps;
    ps = r7.y;
    r2.yzw = r12.ywz * r6.xxx;
    r6.x = ps;
    ps = (-1.0) + r6.x;
    r4.xyz = r14.yzx * r2.wzy;
    r6.w = ps;
    r4.xyz = r14.xyz * r2.zyw - r4.xyz;
    ps = 0.1 + r7.x;
    r4.xyz = r4.xyz * r13.www;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r8.w = dot(r4.zxy, r4.zxy);
    r10.x = saturate(ps);
    ps = r3.w;
    r10.xw = -r10.xw + 1.0;
    ps = 0.0001 * ps;
    r12.yz = r10.xx * ModShadowGroupColor.xy;
    r12.w = saturate(ps);
    r15 = -r12.wxyz + 1.0;
    r4.w = r15.x * UniformScalar_1.x;
    r6.yz = r4.ww * r10.yz + r6.yz;
    r6.yz = r6.yz * UniformVector_2.xy;
    ps = r0.w;
    r6.xyw = r6.yzw * r15.xxx;
    ps = UniformVector_5.x * ps;
    r6.z = r6.w + 1.0;
    r12.x = ps;
    r6.xyz = (r15.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r15.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r8.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r4.xzy * r8.www;
    r6.x = ps;
    ps = r0.z;
    r4.xyz = r6.yzw * r6.xxx;
    ps = UniformVector_5.y * ps;
    r6.x = dot(r4.zxy, r17.zxy);
    r12.y = ps;
    ps = r11.x;
    r6.xyz = r4.xzy * r6.xxx;
    r10.xyz = r6.xyz * 2.0 - r17.xzy;
    ps = abs(r9.x) * ps;
    r6.xyz = r14.zxy * r10.yyy;
    r2.x = ps;
    r6.xyz = r13.xzy * r10.zzz + r6.xyz;
    r6.xyw = r2.zwy * r10.xxx + r6.zyx;
    ps = r11.y;
    r2.yzw = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r2.yzw;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xzy);
    r2.y = ps;
    ps = 1.0 / abs(r6.z);
    r9.z = r6.w;
    r8.w = ps;
    r9.xy = r6.yx * r8.ww + 1.5;
    r2.z = tex2D(Texture2D_2, r0.xy).x;
    r11.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r17.xyz = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).xyz;
    r13.xyz = tex2D(Texture2D_4, r12.xy).xyz;
    r6.xw = tex2D(ModShadowAccumTexture, r2.xy).xy;
    ps = UniformScalar_9.x;
    r12.yzw = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r2.xyw = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r8.w = float((UniformScalar_14.x >= 1.0));
    r14.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.w = float((UniformScalar_14.x > 1.0));
    r14.y = ps;
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.z = float((UniformScalar_13.x >= 1.0));
    r9.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r0.x = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r0.y = float((UniformScalar_13.x > 1.0));
    r9.z = ps;
    r13.xyz = (-abs(r0.yyy) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r9.w = dot(r17.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = pow(2.0, r6.y);
    r9.xyz = r9.xyz * r16.xyz;
    r6.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.xyz = r0.xxx * r5.xyz;
    r14.z = ps;
    r5.xyz = r9.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = (-1.0) + r8.x;
    r18.xyz = r9.www - r17.xyz;
    r16.x = ps;
    r13.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r13.xyz;
    ps = 0.875 * r6.x;
    r9.xyz = r9.xyz * r13.xyz;
    r16.y = ps;
    r8.xyz = r18.xyz * UniformScalar_6.xxx + r17.xyz;
    ps = log2(abs(r10.w));
    r14.xyz = r14.xyz * r8.xyz;
    r6.z = ps;
    ps = 0.875 * r6.w;
    r6.z = r6.z * UniformScalar_3.x;
    r16.z = ps;
    ps = pow(2.0, r6.z);
    r8.x = float((r15.y >= 0.004));
    r6.x = ps;
    r8.z = r6.x * UniformScalar_5.x + UniformScalar_4.x;
    r6.xzw = r16.xyz * r15.xzw + float3(1.0, 0.125, 0.125);
    r8.y = (r4.w > 0.0) ? r6.x : 1.0;
    r14.xyz = r14.xyz * r8.zzz;
    ps = UniformScalar_10.x * r6.y;
    r5.xyz = r14.xyz * r5.xyz;
    r5.w = ps;
    r12.x = (r4.w >= 0.0) ? r8.y : 1.0;
    ps = r6.z * r6.w;
    r9.xyw = r9.xyz * r12.xxx;
    r13.w = ps;
    ps = r9.x;
    r11.xyz = -r9.xyw + r11.xyz;
    ps = r2.x * ps;
    r6 = r13.wxww * r12.wxzy;
    r8.y = ps;
    ps = r9.y;
    r5 = r5 * r6.yyyy;
    r11.xyz = r11.xyz * UniformScalar_15.xxx + r9.xyw;
    r9.xyz = r11.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    ps = r2.y * ps;
    r5 = r5 * r2.zzzz;
    r8.z = ps;
    r5 = (-abs(r0.wwww) >= 0.0) ? r5 : 0.0;
    r5 = (-abs(r8.wwww) >= 0.0) ? 0.0 : r5;
    ps = r9.w;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    ps = r2.w * ps;
    r2.xyz = r9.xzy + r5.www;
    r8.w = ps;
    r5.xyz = r8.yzw * AmbientColorAndSkyFactor.xyz + r5.xyz;
    ps = r6.w;
    r7.y = saturate(dot(r7.xzw, r10.yxz));
    r6.y = ps;
    ps = log2(r7.y);
    r7.x = dot(r0.zxy, r4.zxy);
    r7.y = ps;
    ps = ModShadowColor.x + r6.y;
    r7.yzw = r7.xxy * float3(-0.5, 0.5, 15.0);
    r7.x = ps;
    ps = pow(2.0, r7.w);
    r7.yz = r7.yz + 0.5;
    r7.w = ps;
    ps = abs(r7.y) * abs(r7.y);
    r0.xyz = r4.zzz * r1.xyz;
    r7.y = ps;
    ps = abs(r7.z) * abs(r7.z);
    r1.xyz = r7.www * r1.xzy;
    r7.z = ps;
    ps = ModShadowColor.y + r6.z;
    r4.xyz = r8.ywz * r7.yyy;
    r7.y = ps;
    ps = ModShadowColor.z + r6.x;
    r9.xyz = r8.ywz * r7.zzz;
    r7.z = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r2.xyz + r6.xzy;
    r6.xyz = r0.xyz * r8.yzw + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r8.x + r3.w;
    r6.xyz = r7.xyz * r8.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
