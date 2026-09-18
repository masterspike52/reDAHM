// ps_f31102dc1511773f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041600 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c26); // float3
float4 ModShadowAccumResolution : register(c30); // float2
float4 ModShadowColor : register(c28); // float3
float4 ModShadowGroupColor : register(c29); // float3
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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = r13.w - 0.5;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r8.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r8.xy = r8.xy * abs(r9.xy);
    r11.x = ps;
    r8.zw = tex2D(ModShadowAccumTexture, r8.xy).xy;
    ps = (-4e+02) - -r3.w;
    r8.y = ps;
    ps = r0.x;
    r10.xy = r0.wz * 6.0;
    ps = UniformScalar_0.x * ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r7.w));
    r8.y = saturate(r8.y * 0.00022222222);
    r7.w = ps;
    ps = -r0.z;
    r9.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r12.yzw = r8.zwy * float3(0.875, 0.875, -0.025);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r11.zw = r9.xy * r12.ww;
    r11.y = ps;
    ps = r0.w;
    r8.yz = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r14.xw = float2((r11.xy >= 0.5));
    r4.x = ps;
    ps = r0.z;
    r8.yz = r8.yz - r11.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r8.yz * r14.xw;
    r4.y = ps;
    ps = r0.y;
    r11 = r11.zwxy + r4;
    ps = UniformScalar_0.x * ps;
    r8.zw = r11.zw + r11.zw;
    r8.y = ps;
    r22 = tex2D(Texture2D_1, r8.zw);
    r4.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r16.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r8.xy).wxy;
    r18.xyw = tex2D(Texture2D_2, r10.xy).xyw;
    r10.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r4.z = dot(r2.zxy, r2.zxy);
    r6 = r6.yxzw * 2.0 - 1.0;
    r15.xyz = r7.xyz * 2.0 - 1.0;
    r7.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r13.xyz = r7.xyz * r13.xyz;
    r18.w = r18.w * r10.y - 1.0;
    r14.yz = r18.xy * 2.0 - 1.0;
    r7.xy = r8.yz + r8.yz;
    ps = r10.x + r10.x;
    r7.w = dot(r15.zxy, r15.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r4.z));
    r8.w = dot(r6.zyx, r6.zyx);
    r4.z = ps;
    r20.xyz = r16.xyz * 2.0 - 1.0;
    r19.xyz = r4.xyw * 2.0 - 1.0;
    r18.z = r20.z * UniformVector_4.z - r19.z;
    ps = rsqrt(abs(r8.w));
    r10.xyz = r4.zzz * r2.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r7.w));
    r16.xyz = r6.xzy * r8.www;
    r7.w = ps;
    ps = r10.w + r10.w;
    r15.xyz = r15.xzy * r7.www;
    r7.w = ps;
    ps = OpacityOverride.x;
    r21 = r7 - 1.0;
    r7.x = saturate(ps);
    ps = r3.w;
    r7.yzw = r16.yzx * r15.zyx;
    r7.yzw = r16.xyz * r15.yxz - r7.yzw;
    ps = 0.0001 * ps;
    r4.xyz = r7.yzw * r6.www;
    r2.w = saturate(ps);
    ps = (-1.0) + r8.x;
    r8.w = dot(r4.zxy, r4.zxy);
    r12.x = ps;
    ps = r9.z;
    r10.w = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r8.x = ps;
    r6.w = (r10.w == 0.0) ? r22.x : r22.y;
    ps = 0.0;
    r6.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r8.y = ps;
    r6.w = (r6.z == 0.0) ? r22.z : r6.w;
    r7.y = (r6.y == 0.0) ? r22.w : r6.w;
    ps = 5.0 * r6.x;
    r6.w = max(r7.y, 0.0);
    r7.z = saturate(ps);
    ps = max(r8.x, r8.y);
    r7.xyz = -r7.xyz + 1.0;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r14.x = min(r6.w, 0.3);
    r2.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.xyz = r14.yzx * float3(0.5, 0.5, 3.3333333);
    r2.y = ps;
    ps = 2.5 * r7.y;
    r2 = -r2.wzyx + 1.0;
    r14.x = ps;
    ps = r2.x;
    r18.xy = r21.zw + r6.xy;
    r6.y = ps;
    r12.yzw = r12.xyz * r2.xwz + float3(1.0, 0.125, 0.125);
    r2.w = r6.z * r18.w + 1.0;
    ps = UniformScalar_1.x * r6.y;
    r14.yzw = r13.xyz * r12.yyy;
    r6.w = ps;
    r8.xy = r6.ww * r21.xy + r20.xy;
    r6.xy = r8.xy * UniformVector_4.xy - r19.xy;
    r7.w = saturate(r14.x * r2.w - 0.5);
    r18.xy = r6.zz * r18.xy + r6.xy;
    r6.xy = r18.xy * r7.ww + r19.xy;
    r6.z = r18.z * r7.w - 2.0;
    r6.z = r4.w * 2.0 + r6.z;
    r6.xyz = r6.xzy * r2.xxx;
    ps = 1.0 + r6.y;
    r4.w = UniformScalar_9.x * (-XE_FLT_MAX);
    r6.w = ps;
    r6.xyz = (r2.xxx > 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r8.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.x = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r4.xzy * r8.xxx;
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xzy * r6.xxx;
    r9.xyz = r6.xyz * 2.0 - r9.xzy;
    r6.xyz = r16.zxy * r9.yyy;
    r6.xyz = r8.xzy * r9.zzz + r6.xyz;
    r6.xyw = r15.yzx * r9.xxx + r6.zyx;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r8.w = tex2D(Texture2D_5, r0.xy).x;
    r16.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r6.xyw = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    ps = -ModShadowColor.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r6.z = dot(r5.zxy, r5.zxy);
    r15.x = ps;
    ps = rsqrt(abs(r6.z));
    r11.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r0.x = ps;
    ps = pow(2.0, r4.w);
    r0.w = dot(r6.wxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r0.xxx * r5.xyz;
    r13.xyz = r13.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = 1.0 + ps;
    r5.xyz = r0.www - r6.xyw;
    r15.y = ps;
    r6.xyw = r5.xyz * UniformScalar_6.xxx + r6.xyw;
    ps = log2(abs(r2.y));
    r5.xyz = r17.xyz * r6.xyw;
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r6.w = float((r7.x >= 0.004));
    r6.x = ps;
    r2.xyz = r14.yzw * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = pow(2.0, r6.x);
    r12.x = abs(r2.w) * abs(r2.w);
    r6.x = ps;
    r7.xyz = r14.yzw * r2.www - r16.xyz;
    r6.x = r6.x * UniformScalar_5.x + UniformScalar_4.x;
    ps = -ModShadowColor.z;
    r14.xyz = r5.xyz * r6.xxx;
    r5.xyz = r7.xyz * r7.www + r16.xyz;
    ps = 1.0 + ps;
    r6.xy = r12.xz * r12.xw;
    r15.z = ps;
    r7.xyz = r6.yyy * r15.xyz + ModShadowColor.xyz;
    r8.xyz = r5.xyz * r8.xyz;
    ps = UniformScalar_10.x * r6.z;
    r13.xyz = r14.xyz * r13.xyz;
    r13.w = ps;
    r12 = r13 * r12.yyyy;
    r12 = r12 * r8.wwww;
    ps = r6.x * r6.x;
    r2.xyz = r2.xyz + r12.www;
    r8.w = ps;
    r6.xyz = r12.xyz * r7.www + UniformVector_0.xyz;
    r6.xyz = r11.xyz * r5.xyz + r6.xyz;
    r2.xyz = r8.www * r2.xyz;
    r2.xyz = r2.xzy * r7.www;
    r7.w = saturate(dot(r10.zxy, r9.yxz));
    ps = log2(r7.w);
    r0.x = dot(r0.zxy, r4.zxy);
    r0.y = ps;
    r0.xyz = r0.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r0.z);
    r4.xy = r0.xy + 0.5;
    r7.w = ps;
    ps = abs(r4.x) * abs(r4.x);
    r0.xyz = r4.zzz * r1.xyz;
    r8.w = ps;
    ps = abs(r4.y) * abs(r4.y);
    r1.xyz = r7.www * r1.xzy;
    r7.w = ps;
    r4.xyz = r8.xzy * r8.www;
    r5.xyz = r8.xzy * r7.www;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r2.xyz + r6.xzy;
    r6.xyz = r0.xyz * r8.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
