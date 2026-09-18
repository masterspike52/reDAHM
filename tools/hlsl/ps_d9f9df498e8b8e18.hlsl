// ps_d9f9df498e8b8e18.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041500 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 LightMapScale : register(c28); // float3
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
sampler2D LightMapTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r1.xy);
    ps = (-0.5) + r13.w;
    r8.xy = r1.wz * 6.0;
    r7.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r8.xyw = tex2D(Texture2D_2, r8.xy).xyw;
    ps = r1.w;
    r12.xw = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r10.xy = r1.wz * UniformVector_1.xy;
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.z = r3.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r4.zxy, r4.zxy);
    r11.y = ps;
    r14.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r14.y = saturate(r8.z * 0.00022222222);
    r7.w = ps;
    ps = -r1.z;
    r16.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r4.xyz = r14.yzw * float3(-0.025, 0.5, 0.5);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r14.zw = r16.xy * r4.xx;
    r14.y = ps;
    r10.zw = r14.xy - 0.5;
    r0.zw = float2((r14.xy >= 0.5));
    ps = r11.x;
    r10.zw = r10.zw - r14.xy;
    ps = abs(r9.x) * ps;
    r10.zw = r10.zw * r0.zw;
    r11.z = ps;
    ps = r11.y;
    r10 = r14.zwxy + r10;
    ps = abs(r9.y) * ps;
    r11.xy = r10.zw + r10.zw;
    r11.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r11.zw).xy;
    r15 = tex2D(Texture2D_1, r11.xy);
    r11.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r9.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r8.xyz = tex2D(Texture2D_3, r12.xw).wxy;
    ps = OpacityOverride.x;
    r4.w = saturate(r3.w * 0.0001);
    r4.x = saturate(ps);
    r6 = r6.yxzw * 2.0 - 1.0;
    r19.yzw = r7.xyz * 2.0 - 1.0;
    ps = (-1.0) + r8.x;
    r7.xyw = UniformVector_6.xyz * UniformVector_6.www;
    r19.x = ps;
    ps = r7.x;
    r9.x = dot(r2.zxy, r2.zxy);
    r17.w = r8.w * r14.z - 1.0;
    ps = r13.x * ps;
    r21.xy = r14.xy + r14.xy;
    r13.x = ps;
    ps = r8.y + r8.y;
    r7.z = dot(r19.wyz, r19.wyz);
    r21.z = ps;
    ps = rsqrt(abs(r9.x));
    r8.w = dot(r6.zyx, r6.zyx);
    r9.x = ps;
    r20.xyz = r9.yzw * 2.0 - 1.0;
    r18.xyz = r11.xyw * 2.0 - 1.0;
    r17.z = r20.z * UniformVector_4.z - r18.z;
    ps = rsqrt(abs(r8.w));
    r9.xyz = r9.xxx * r2.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r7.z));
    r14.xyz = r6.xzy * r8.www;
    r7.z = ps;
    ps = r8.z + r8.z;
    r11.xyz = r19.ywz * r7.zzz;
    r21.w = ps;
    ps = r7.y;
    r2 = r21.zwxy - 1.0;
    ps = r13.y * ps;
    r17.xy = r2.zw + r4.yz;
    r13.y = ps;
    ps = r7.w;
    r7.xyz = r14.yzx * r11.zyx;
    r7.xyz = r14.xyz * r11.yxz - r7.xyz;
    ps = r13.z * ps;
    r8.xyz = r7.xyz * r6.www;
    r13.z = ps;
    ps = r16.z;
    r9.w = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r6.w = (r9.w == 0.0) ? r15.x : r15.y;
    ps = 0.0;
    r6.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r0.w = ps;
    r6.w = (r6.z == 0.0) ? r15.z : r6.w;
    r4.y = (r6.y == 0.0) ? r15.w : r6.w;
    ps = 5.0 * r6.x;
    r6.w = max(r4.y, 0.0);
    r4.z = saturate(ps);
    ps = max(r0.z, r0.w);
    r7.xzw = -r4.yzx + 1.0;
    r4.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r12.x = min(r6.w, 0.3);
    r4.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r19.yzw = r12.yzx * float3(0.875, 0.875, 3.3333333);
    r4.y = ps;
    r2.z = r19.w * r17.w + 1.0;
    ps = 2.5 * r7.x;
    r4 = -r4.zwxy + 1.0;
    r15.x = ps;
    ps = r4.y;
    r7.x = dot(r8.zxy, r8.zxy);
    r6.y = ps;
    r12.yzw = r19.xyz * r4.yzw + float3(1.0, 0.125, 0.125);
    ps = UniformScalar_1.x * r6.y;
    r15.yzw = r13.xyz * r12.yyy;
    r6.x = ps;
    r6.xy = r6.xx * r2.xy + r20.xy;
    r6.xy = r6.xy * UniformVector_4.xy - r18.xy;
    r8.w = saturate(r15.x * r2.z - 0.5);
    r17.xy = r19.ww * r17.xy + r6.xy;
    r6.xy = r17.xy * r8.ww + r18.xy;
    r6.z = r17.z * r8.w - 2.0;
    r6.z = r11.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r4.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r4.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r8.xzy * r7.xxx;
    r6.x = ps;
    r2.xyw = r6.ywz * r6.xxx;
    r6.x = dot(r2.yxw, r16.zxy);
    r6.xyz = r2.xyw * r6.xxx;
    r4.yzw = r6.xyz * 2.0 - r16.xzy;
    r6.xyz = r14.zxy * r4.zzz;
    r6.xyz = r7.xzy * r4.www + r6.xyz;
    r6.xyw = r11.yzx * r4.yyy + r6.zyx;
    r7.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r0.w = tex2D(Texture2D_5, r1.xy).x;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r6.xyw = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = UniformScalar_9.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r1.y = dot(r5.zxy, r5.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.y));
    r11.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r1.y = ps;
    ps = pow(2.0, r6.z);
    r1.z = dot(r6.wxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.xyz = r1.yyy * r5.xyz;
    r1.y = ps;
    r13.xyz = r13.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = UniformVector_5.z * UniformVector_5.w;
    r14.xyz = r1.zzz - r6.xyw;
    r1.z = ps;
    r6.xyw = r14.xyz * UniformScalar_6.xxx + r6.xyw;
    r14.xyz = r1.xyz * r6.xyw;
    ps = log2(abs(r4.x));
    r12.x = abs(r2.z) * abs(r2.z);
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r6.w = float((r7.w >= 0.004));
    r7.w = ps;
    r1.xyz = r15.yzw * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = pow(2.0, r7.w);
    r6.xy = r12.xz * r12.xw;
    r7.w = ps;
    r8.xyz = r6.yyy * r8.xyz + ModShadowColor.xyz;
    r15.xyz = r15.yzw * r2.zzz - r10.xyz;
    r7.w = r7.w * UniformScalar_5.x + UniformScalar_4.x;
    r14.xyz = r14.xyz * r7.www;
    r10.xyz = r15.xyz * r8.www + r10.xyz;
    r0.xyz = r10.xyz * r0.xyz;
    ps = UniformScalar_10.x * r6.z;
    r13.xyz = r14.xyz * r13.xyz;
    r13.w = ps;
    r12 = r13 * r12.yyyy;
    r12 = r12 * r0.wwww;
    ps = r6.x * r6.x;
    r1.xyz = r1.xyz + r12.www;
    r7.w = ps;
    r6.xyz = r12.xyz * r8.www + UniformVector_0.xyz;
    r6.xyz = r11.xyz * r10.xyz + r6.xyz;
    r1.xyz = r7.www * r1.xyz;
    ps = LightMapScale.x * r7.y;
    r1.xyz = r1.xzy * r8.www;
    r4.x = ps;
    ps = LightMapScale.y * r7.z;
    r7.w = saturate(dot(r9.zxy, r4.zyw));
    r4.y = ps;
    ps = log2(r7.w);
    r4.z = dot(r5.zxy, r2.yxw);
    r4.w = ps;
    ps = LightMapScale.z * r7.x;
    r2.xzw = r4.zwz * float3(-0.5, 15.0, 0.5);
    r4.z = ps;
    ps = pow(2.0, r2.z);
    r2.xw = r2.xw + 0.5;
    r7.w = ps;
    ps = abs(r2.x) * abs(r2.x);
    r7.xyz = r4.xzy * r2.yyy;
    r8.w = ps;
    ps = abs(r2.w) * abs(r2.w);
    r2.xyz = r4.xzy * r7.www;
    r7.w = ps;
    r4.xyz = r0.xzy * r8.www;
    r5.xyz = r0.xzy * r7.www;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xyz + r6.xzy;
    r6.xyz = r7.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r8.xyz;
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
