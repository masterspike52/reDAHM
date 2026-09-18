// ps_953115bd5f57c3d1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041200 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 LightMapScale : register(c31); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c29); // float3
float4 ModShadowAccumResolution : register(c34); // float2
float4 ModShadowColor : register(c32); // float3
float4 ModShadowGroupColor : register(c33); // float3
float4 OpacityOverride : register(c27); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c21); // float
float4 UniformScalar_11 : register(c22); // float
float4 UniformScalar_12 : register(c23); // float
float4 UniformScalar_13 : register(c24); // float
float4 UniformScalar_14 : register(c25); // float
float4 UniformScalar_15 : register(c26); // float
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
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
float4 UniformVector_6 : register(c12); // float4
float4 UpperSkyColor : register(c28); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = OpacityOverride.x;
    r8.xy = r1.xy * UniformVector_1.xy;
    r10.w = saturate(ps);
    r15.yzw = tex2D(Texture2D_6, r8.xy).xyz;
    r14.xyz = tex2D(Texture2D_0, r8.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r10.yz = tex2D(Texture2D_5, r1.xy).xy;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r0.z = float((UniformScalar_11.x > 0.0));
    r8.w = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r10.x = dot(r4.zxy, r4.zxy);
    r18.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r17.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r18.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r8.x = dot(r2.zxy, r2.zxy);
    r18.z = ps;
    r11 = r6.yxzw * 2.0 - 1.0;
    r13.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = r12.xyz + r12.xyz;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r13.zxy, r13.zxy);
    r8.z = ps;
    ps = r16.z + r16.z;
    r7.w = dot(r11.zyx, r11.zyx);
    r6.x = ps;
    ps = rsqrt(abs(r8.x));
    r6.yz = r16.xy * 4.0;
    r8.x = ps;
    r7.xyz = r14.zxy * 2.0 - 1.0;
    r16.xyz = (-abs(r0.zzz) >= 0.0) ? UniformVector_4.xyz : r17.xyz;
    r14.xyz = (-abs(r0.zzz) >= 0.0) ? UniformVector_6.xyz : r18.xyz;
    r14.xyz = (-abs(r8.www) >= 0.0) ? r18.xyz : r14.xyz;
    r17.xyz = (-abs(r8.www) >= 0.0) ? r17.xyz : r16.xyz;
    ps = (-2.0) - r7.y;
    r0.zw = r8.yz * abs(r9.xy);
    r8.w = ps;
    ps = rsqrt(abs(r10.x));
    r8.xyz = r8.xxx * r2.xzy;
    r2.x = ps;
    ps = (-2.0) + r6.y;
    r16.xyz = r2.xxx * r4.xyz;
    r2.x = ps;
    ps = (-2.0) + r6.z;
    r17.xyz = r17.xzy * r10.yyy;
    r2.y = ps;
    ps = rsqrt(abs(r7.w));
    r18.xyz = r14.xzy * r10.zzz;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r11.xyz = r11.xyz * r7.www;
    r6.w = ps;
    ps = (-1.0) + r6.x;
    r14.xyz = r13.xzy * r6.www;
    r2.z = ps;
    ps = (-2.0) - r7.z;
    r2.xyz = r2.xyz - r7.yzx;
    r6.w = ps;
    ps = r6.w;
    r4.xyz = r11.zxy * r14.zxy;
    r4.xyz = r11.xzy * r14.yxz - r4.xzy;
    ps = r6.z + ps;
    r9.xyz = r4.xyz * r11.www;
    r2.w = ps;
    r2 = r2 * UniformScalar_2.xxxx + r7.yzxz;
    ps = 0.1 - -r8.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r9.zxy, r9.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r10.x = saturate(r4.x * 5.0);
    r6.w = ps;
    ps = r10.y + r10.z;
    r2 = r2.xywz * r7.wwww;
    r10.z = ps;
    ps = r8.w;
    r4.x = dot(r2.wxy, r16.zxy);
    ps = r6.y + ps;
    r8.w = dot(r2.wxy, r2.wxy);
    r15.x = ps;
    ps = rsqrt(abs(r8.w));
    r10.y = max(r4.x, 0.0);
    r6.x = ps;
    ps = r9.x;
    r13.xyw = r2.xyw * r6.xxx;
    ps = r6.w * ps;
    r4 = -r10.zxwy + 1.0;
    r9.x = ps;
    ps = r9.y;
    r6.x = dot(r13.wxy, r16.zxy);
    ps = r6.w * ps;
    r6.xyz = r13.xwy * r6.xxx;
    r9.y = ps;
    ps = r9.z;
    r10.xyz = r4.xxx * r15.yzw;
    r10.xyz = r18.xzy * r15.yzw + r10.xyz;
    r16.xyz = r6.xyz * 2.0 - r16.xzy;
    ps = r6.w * ps;
    r6.xyz = r11.yzx * r16.yyy;
    r9.z = ps;
    r10.xyz = r17.xyz * r15.ywz + r10.xzy;
    r15.yzw = r10.xyz * r12.xzy - r10.xyz;
    r6.xyz = r9.xzy * r16.zzz + r6.xyz;
    r6.xyw = r14.xzy * r16.xxx + r6.xzy;
    ps = LocalToWorldMatrix[2].x * r6.w;
    r12.xyz = r9.xzy * r2.zzz;
    r2.x = ps;
    ps = LocalToWorldMatrix[2].y * r6.w;
    r9.xyz = r6.yyy * LocalToWorldMatrix[1].xyz;
    r2.y = ps;
    r6.z = r15.x * UniformScalar_2.x + r7.y;
    ps = LocalToWorldMatrix[2].z * r6.w;
    r6.z = r6.z * r7.w;
    r2.z = ps;
    r7.x = r14.z * r6.z + r12.z;
    r7.yz = r14.xy * r6.zz + r12.xy;
    r6.z = r11.y * r2.w + r7.y;
    r7.xy = r11.zx * r2.ww + r7.zx;
    ps = LocalToWorldMatrix[2].z * r7.x;
    r9.w = r7.y * LocalToWorldMatrix[1].z;
    r2.w = ps;
    r6 = r6.xxxz * LocalToWorldMatrix[0].xzyz + r9.xzyw;
    r2 = r6.xzyw + r2;
    r6 = xe_cube(r2.xyz);
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r13.z = tex2D(Texture2D_3, r1.xy).x;
    r17.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r14.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.w = tex2D(Texture2D_4, r1.xy).x;
    r6.w = UniformScalar_15.x - UniformScalar_14.x;
    r7.xyz = -UniformVector_0.yzx + 1.0;
    r7.w = r7.w * UniformScalar_9.x + UniformScalar_10.x;
    r6.w = r6.w * UniformScalar_2.x + UniformScalar_14.x;
    ps = LightMapScale.x * r6.y;
    r8.w = dot(r5.zxy, r5.zxy);
    r12.x = ps;
    ps = LightMapScale.y * r6.z;
    r0.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r12.y = ps;
    ps = LightMapScale.z * r6.x;
    r0.xyz = r0.xxx - r9.xyz;
    r12.z = ps;
    r0.xyz = r0.xyz * UniformScalar_4.xxx + r9.xyz;
    r9.xyz = r12.xzy * r13.www;
    ps = rsqrt(abs(r8.w));
    r4.x = r9.x * r7.z;
    r6.x = ps;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = r14.xyz * UniformScalar_6.xxx;
    r14.xyz = r14.xzy * UniformScalar_7.xxx;
    r14.w = max(r6.w, 0.0001);
    r6.xyz = r6.xxx * r5.xyz;
    r1.xyz = r0.xyz * UniformScalar_5.xxx;
    r17.x = dot(r6.zxy, r13.wxy);
    ps = AmbientColorAndSkyFactor.y * r7.x;
    r13.xy = r4.yy * ModShadowGroupColor.xy;
    r4.y = ps;
    ps = log2(abs(r4.w));
    r6.w = float((r4.z >= 0.004));
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r0 = r17.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r6.x = saturate(dot(r8.yxz, r16.yxz));
    r6.y = ps;
    ps = log2(r6.x);
    r1.xyz = r1.xzy * r6.yyy;
    r13.w = ps;
    r10.xyz = r15.yzw * UniformScalar_2.xxx + r10.xyz;
    ps = AmbientColorAndSkyFactor.z * r7.y;
    r5.xyz = -r13.xyz + 1.0;
    r4.z = ps;
    ps = r0.y;
    r8 = r14.xzyw * r13.zzzw;
    r6.x = ps;
    r8.xyz = r11.xzy * r5.zzz + r8.xzy;
    r11.xyz = r10.xzy * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = pow(2.0, r8.w);
    r10.xyz = r10.xzy - UniformVector_2.xyz;
    r6.y = ps;
    r10.xyz = r10.xyz * r7.www + UniformVector_2.xyz;
    ps = 0.5 + r6.x;
    r12.xyz = r12.xyz * r6.yyy;
    r6.x = ps;
    ps = 0.5 + r0.x;
    r12.xyz = r12.xzy * r7.www;
    r1.w = ps;
    ps = abs(r6.x) * abs(r6.x);
    r4.yzw = r4.xyz * r10.xyz;
    r8.w = ps;
    ps = abs(r1.w) * abs(r1.w);
    r6.xyz = r10.yxz * r7.xzy;
    r7.x = ps;
    r7.xyz = r6.yzx * r7.xxx;
    r10.xyz = r6.yzx * r8.www;
    r9.x = r12.x * r11.x + r4.y;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r9.yz = r9.zy * r6.xz;
    r4.x = ps;
    r9.yz = r12.zy * r11.yz + r9.yz;
    r6.xyz = r10.xzy * LowerSkyColor.xyz + r9.xyz;
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r6.xyz;
    ps = r2.w;
    r0.xy = r0.zw * r5.xy;
    r6.x = ps;
    ps = 0.5 * r6.x;
    r7.xyz = r7.xyz + r4.xzw;
    r0.z = ps;
    r6.xyz = r0.xzy + float3(0.125, 0.5, 0.125);
    ps = abs(r6.y) * abs(r6.y);
    r6.x = r6.x * r6.z;
    r8.w = ps;
    r6.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    r8.xyz = r1.xyz * r8.www + r8.xyz;
    r8.xyz = r8.xzy * UniformScalar_8.xxx;
    r8.xyz = r8.xyz * r7.www + UniformVector_0.xyz;
    r7.xyz = r8.xyz + r7.xyz;
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
