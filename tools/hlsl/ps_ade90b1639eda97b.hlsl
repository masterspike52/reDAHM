// ps_ade90b1639eda97b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041400 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c29); // float3
float4 ModShadowAccumResolution : register(c33); // float2
float4 ModShadowColor : register(c31); // float3
float4 ModShadowGroupColor : register(c32); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r8.xy = r0.xy * UniformVector_1.xy;
    r10.w = ps;
    r17.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r8.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r10.yz = tex2D(Texture2D_5, r0.xy).xy;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r8.w = dot(r4.zxy, r4.zxy);
    r12.w = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r18.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r15.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r8.x = dot(r2.zxy, r2.zxy);
    r15.y = ps;
    r11 = r6.yxzw * 2.0 - 1.0;
    r13.xyz = r7.xyz * 2.0 - 1.0;
    ps = UniformVector_3.z * UniformVector_3.w;
    r6.x = UniformScalar_15.x - UniformScalar_14.x;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.yzw = r16.xyz + r16.xyz;
    r8.y = ps;
    r10.x = r6.x * UniformScalar_2.x + UniformScalar_14.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r13.zxy, r13.zxy);
    r8.z = ps;
    ps = r14.z + r14.z;
    r7.w = dot(r11.zyx, r11.zyx);
    r6.x = ps;
    ps = rsqrt(abs(r8.x));
    r6.yz = r14.xy * 4.0;
    r8.x = ps;
    r7.xyz = r12.zxy * 2.0 - 1.0;
    r12.xyz = (-abs(r12.www) >= 0.0) ? UniformVector_4.xyz : r15.xyz;
    r14.xyz = (-abs(r12.www) >= 0.0) ? UniformVector_6.xyz : r18.xyz;
    r14.xyz = (-abs(r10.www) >= 0.0) ? r18.xyz : r14.xyz;
    r15.xyz = (-abs(r10.www) >= 0.0) ? r15.xyz : r12.xyz;
    ps = (-2.0) - r7.y;
    r12.yz = r8.yz * abs(r9.xy);
    r9.w = ps;
    ps = rsqrt(abs(r8.w));
    r8.xyz = r8.xxx * r2.xzy;
    r8.w = ps;
    ps = (-2.0) + r6.y;
    r20.xyz = r8.www * r4.xyz;
    r2.x = ps;
    ps = (-2.0) + r6.z;
    r19.xyz = r15.xzy * r10.yyy;
    r2.y = ps;
    ps = rsqrt(abs(r7.w));
    r9.xyz = r14.xzy * r10.zzz;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r11.xyz * r7.www;
    r6.w = ps;
    ps = (-1.0) + r6.x;
    r18.xyz = r13.xzy * r6.www;
    r2.z = ps;
    ps = (-2.0) - r7.z;
    r4.xyz = r2.xyz - r7.yzx;
    r6.w = ps;
    ps = r6.w;
    r2.xyz = r15.zxy * r18.zxy;
    r2.xyz = r15.xzy * r18.yxz - r2.xzy;
    ps = r6.z + ps;
    r2.xyw = r2.xyz * r11.www;
    r4.w = ps;
    r4 = r4 * UniformScalar_2.xxxx + r7.yzxz;
    ps = 0.1 - -r8.y;
    r7.w = dot(r4.zxy, r4.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r2.wxy, r2.wxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r14.z = saturate(r8.w * 5.0);
    r6.w = ps;
    ps = r10.y + r10.z;
    r4 = r4.xywz * r7.wwww;
    r14.y = ps;
    ps = r9.w;
    r8.w = dot(r4.wxy, r4.wxy);
    ps = r6.y + ps;
    r10.y = dot(r4.wxy, r20.zxy);
    r16.x = ps;
    ps = rsqrt(abs(r8.w));
    r14.xw = max(r10.yx, float2(0.0, 0.0001));
    r6.x = ps;
    ps = r2.x;
    r10.xyw = r4.xyw * r6.xxx;
    ps = r6.w * ps;
    r6.x = dot(r10.wxy, r20.zxy);
    r13.x = ps;
    ps = r2.y;
    r11.xyz = -r14.zxy + 1.0;
    ps = r6.w * ps;
    r6.xyz = r10.xwy * r6.xxx;
    r13.y = ps;
    r2.xyz = r6.xyz * 2.0 - r20.xzy;
    ps = r2.w;
    r6.xyz = r11.zzz * r17.xyz;
    r9.xyz = r9.xzy * r17.xyz + r6.xyz;
    ps = r6.w * ps;
    r6.xyz = r15.yzx * r2.yyy;
    r13.z = ps;
    r6.xyz = r13.xzy * r2.zzz + r6.xyz;
    r9.xyz = r19.xyz * r17.xzy + r9.xzy;
    r16.yzw = r9.xyz * r16.ywz - r9.xyz;
    r6.xyw = r18.xzy * r2.xxx + r6.xzy;
    ps = LocalToWorldMatrix[2].x * r6.w;
    r17.xyz = r13.xzy * r4.zzz;
    r4.x = ps;
    ps = LocalToWorldMatrix[2].y * r6.w;
    r13.xyz = r6.yyy * LocalToWorldMatrix[1].xyz;
    r4.y = ps;
    r6.z = r16.x * UniformScalar_2.x + r7.y;
    ps = LocalToWorldMatrix[2].z * r6.w;
    r6.z = r6.z * r7.w;
    r4.z = ps;
    r7.x = r18.z * r6.z + r17.z;
    r7.yz = r18.xy * r6.zz + r17.xy;
    r6.z = r15.y * r4.w + r7.y;
    r7.xy = r15.zx * r4.ww + r7.zx;
    ps = LocalToWorldMatrix[2].z * r7.x;
    r13.w = r7.y * LocalToWorldMatrix[1].z;
    r4.w = ps;
    r6 = r6.xxxz * LocalToWorldMatrix[0].xzyz + r13.xzyw;
    r4 = r6.xzyw + r4;
    r6 = xe_cube(r4.xyz);
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r13.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r12.x = tex2D(Texture2D_3, r0.xy).x;
    r6.xy = tex2D(ModShadowAccumTexture, r12.yz).xy;
    r12.yzw = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r6.z = tex2D(Texture2D_4, r0.xy).x;
    r6.w = dot(r5.zxy, r5.zxy);
    r8.w = r6.z * UniformScalar_9.x + UniformScalar_10.x;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r12.wyz, float3(0.11, 0.3, 0.59));
    r6.w = ps;
    r7.xyz = r6.www * r5.xyz;
    r0.xyz = r6.zzz - r12.yzw;
    r0.xyz = r0.xyz * UniformScalar_4.xxx + r12.yzw;
    r6.z = dot(r7.zxy, r10.wxy);
    ps = OpacityOverride.x;
    r12.yz = r11.xx * ModShadowGroupColor.xy;
    r12.w = saturate(ps);
    ps = log2(abs(r11.y));
    r7 = r6.zxyz * float4(0.5, 0.875, 0.875, -0.5);
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r6.z = saturate(dot(r8.yxz, r2.yxz));
    r6.x = ps;
    ps = log2(r6.z);
    r2 = -r12.wyzx + 1.0;
    r6.z = ps;
    ps = pow(2.0, r6.x);
    r4.yz = r7.yz * r2.yz;
    r6.w = ps;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r11.xyz = r13.xyz * UniformScalar_6.xxx;
    ps = r7.w;
    r13.xyz = r13.xzy * UniformScalar_7.xxx;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r5.xyz = r0.xyz * UniformScalar_5.xxx;
    r6.y = ps;
    ps = r14.w;
    r0.xyz = r10.www * r1.xyz;
    ps = r6.z * ps;
    r14.xyz = r5.xzy * r6.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = float((r2.x >= 0.004));
    r6.x = ps;
    ps = 0.5 + r7.x;
    r5.xyz = r6.xxx * r1.xyz;
    r6.x = ps;
    r7.xyz = r16.yzw * UniformScalar_2.xxx + r9.xyz;
    r1.xyz = r7.xzy * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = abs(r6.y) * abs(r6.y);
    r7.xyz = r7.xzy - UniformVector_2.xyz;
    r7.w = ps;
    r9.xyz = r7.xyz * r8.www + UniformVector_2.xyz;
    ps = abs(r6.x) * abs(r6.x);
    r8.xyz = r9.xyz * r8.xyz;
    r6.x = ps;
    ps = r8.x;
    r2.xyz = r5.xzy * r8.www;
    ps = r7.w * ps;
    r5.xyz = r8.xzy * r6.xxx;
    r4.x = ps;
    ps = r8.z;
    r4.w = r4.w * 0.5;
    ps = r7.w * ps;
    r6.xyz = r4.ywz + float3(0.125, 0.5, 0.125);
    r4.y = ps;
    ps = abs(r6.y) * abs(r6.y);
    r6.x = r6.x * r6.z;
    r7.x = ps;
    r6.xyz = r6.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r8.y;
    r7.xyz = r14.xzy * r7.xxx;
    r7.xyz = r13.xyz * r12.xxx + r7.xzy;
    r7.xyz = r11.xzy * r2.www + r7.xyz;
    ps = r7.w * ps;
    r7.xyz = r7.xzy * UniformScalar_8.xxx;
    r4.z = ps;
    r7.xyz = r7.xyz * r8.www + UniformVector_0.xyz;
    r7.xyz = r10.xyz * r9.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xzy + r7.xzy;
    r7.xyz = r0.xyz * r8.xyz + r7.xzy;
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
