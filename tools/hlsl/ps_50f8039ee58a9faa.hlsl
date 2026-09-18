// ps_50f8039ee58a9faa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041200 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c27); // float4
float4 ConstantLighting : register(c28); // float3
float4 LowerSkyColor : register(c26); // float3
float4 ModShadowAccumResolution : register(c31); // float2
float4 ModShadowColor : register(c29); // float3
float4 ModShadowGroupColor : register(c30); // float3
float4 OpacityOverride : register(c24); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_17 : register(c17); // float
float4 UniformScalar_19 : register(c18); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_20 : register(c19); // float
float4 UniformScalar_21 : register(c20); // float
float4 UniformScalar_22 : register(c21); // float
float4 UniformScalar_23 : register(c22); // float
float4 UniformScalar_24 : register(c23); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UpperSkyColor : register(c25); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyw = tex2D(Texture2D_0, r0.xy).zxy;
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r18.xyz = UniformVector_3.xyz - UniformVector_4.xyz;
    r14.xyz = UniformVector_7.xyz - UniformVector_6.xyz;
    ps = UniformVector_2.x * UniformVector_2.x;
    r9.xyz = UniformVector_4.xyz - UniformVector_5.xyz;
    r8.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r0.x = dot(r1.zxy, r1.zxy);
    r8.z = ps;
    ps = UniformScalar_22.x;
    r13.yzw = r11.xyz * UniformVector_8.xyz;
    ps = -UniformScalar_21.x + ps;
    r15.xyz = r11.xyz * UniformScalar_17.xxx;
    r12.w = ps;
    ps = r2.z + r2.z;
    r0.z = dot(r11.yzx, float3(0.59, 0.11, 0.3));
    r7.x = ps;
    ps = 4.0 * r2.x;
    r0.y = dot(r11.yxz, float3(0.59, 0.3, 0.11));
    r16.z = ps;
    ps = 4.0 * r2.y;
    r11.xyz = r7.yzw + r7.yzw;
    r16.w = ps;
    r12.xyz = r11.xyz * 0.7 + 0.3;
    ps = rsqrt(abs(r0.x));
    r0.y = UniformScalar_19.x + r0.y;
    r0.w = ps;
    ps = 5.0 * r0.z;
    r0.x = dot(r10.zxy, float3(1.0, 1.0, 1.0));
    r8.y = ps;
    ps = 1.0 * r0.z;
    r7.yzw = r0.www * r1.xyz;
    r8.w = ps;
    ps = frac(r0.y);
    r16.xy = r8.wy * UniformScalar_15.xx;
    r9.w = ps;
    r17.xyz = r16.yyy * r9.xyz + UniformVector_5.xyz;
    ps = r7.w;
    r9.xyz = r6.ywx + r6.ywx;
    r0.y = ps;
    ps = 0.1 + r0.y;
    r1.w = float((r16.x >= 0.2));
    r0.y = ps;
    ps = (-1.0) + r7.x;
    r6.z = float((r16.x > 0.2));
    r0.w = ps;
    ps = 5.0 * r0.y;
    r1.xyz = r16.xzw + float3(-0.2, -2.0, -2.0);
    r0.z = saturate(ps);
    ps = 1.25 * r1.x;
    r9 = r9 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.y = ps;
    ps = abs(r9.w) + abs(r9.w);
    r17.w = r0.w - r9.z;
    r0.w = ps;
    ps = r1.y;
    r8.yw = -r9.xy - 2.0;
    ps = -r9.x + ps;
    r16.xy = r8.yw + r16.zw;
    r16.z = ps;
    r14.xyz = r14.xyz * r0.www + UniformVector_6.xyz;
    r18.xyz = r0.yyy * r18.xyz + UniformVector_4.xyz;
    r18.xyz = (r6.zzz > 0.0) ? r18.xyz : UniformVector_4.xyz;
    ps = r1.z;
    r14.xyz = r14.xyz * UniformScalar_20.xxx;
    ps = -r9.y + ps;
    r14.xyz = r14.xzy * r10.zzz;
    r16.w = ps;
    r1.xyz = (r1.www > 0.0) ? r18.xyz : r17.xyz;
    r9 = r16 * UniformScalar_0.xxxx + r9.xyxy;
    ps = 1.0 - r0.x;
    r1.xyz = r1.xyz * UniformScalar_16.xxx;
    r6.y = ps;
    ps = 1.0 - r0.z;
    r14.xyz = r14.xyz * r10.zzz;
    r6.w = ps;
    r0.xyz = r15.xyz * r10.yyy + r14.xzy;
    r10.xyz = r1.xzy * r10.xxx + r0.xzy;
    r17.xyz = r12.xzy * r10.xyz - r10.xyz;
    r0.x = r17.w * UniformScalar_0.x - 2.0;
    r13.x = r6.x * 2.0 + r0.x;
    ps = r9.z;
    r0 = r13 * r6.yyyy;
    ps = r6.y * ps;
    r6.z = r0.x + 1.0;
    r6.x = ps;
    r12.xyz = r0.yzw * r11.xyz - r0.yzw;
    r11.yzw = r12.xyz * UniformScalar_0.xxx + r0.yzw;
    r1.z = r12.w * UniformScalar_0.x + UniformScalar_21.x;
    ps = UniformScalar_23.x * r6.y;
    r0 = r6.xyzy * UniformVector_2.xxzy;
    r8.y = ps;
    ps = r0.z * r0.z;
    r12.xy = r8.xz * r6.yz;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.z = r12.x * r9.z;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xyz = r0.yww * r9.xyw;
    r1.y = ps;
    ps = r15.z * r15.z;
    r9.yzw = r11.yzw * r1.zzz;
    r1.w = ps;
    r1.z = dot(r12.yz, r6.zx) + r1.w;
    r9.x = r12.z * r6.x + r1.w;
    ps = rsqrt(abs(r1.z));
    r8 = r9.xywz + r8.xyyy;
    r9.z = ps;
    ps = rsqrt(abs(r8.x));
    r0.y = dot(r3.zxy, r3.zxy);
    r9.w = ps;
    ps = r15.z;
    r5.xy = r1.xy * abs(r5.xy);
    ps = r9.w * ps;
    r16.xyz = r0.zxz * r9.zww;
    r16.w = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r16.zyw, r16.zyw);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r14.xyz = r0.yyy * r3.xyz;
    r0.x = ps;
    r1.xyw = r16.ywz * r0.xxx;
    r0.x = dot(r1.wxy, r14.zxy);
    r0.xyz = r1.xwy * r0.xxx;
    r12.xyz = r0.xzy * 2.0 - r14.xyz;
    r0 = xe_cube(r12.xyz);
    ps = 1.0 / abs(r0.z);
    r3.z = r0.w;
    r1.z = ps;
    r3.xy = r0.yx * r1.zz + 1.5;
    r9.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r3.w = dot(r4.zxy, r4.zxy);
    r0.w = saturate(ps);
    ps = rsqrt(abs(r3.w));
    r1.z = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r3.w = ps;
    ps = UniformScalar_24.x;
    r13.xyz = r3.www * r4.xyz;
    r18.x = ps;
    ps = 0.0001;
    r4.xyz = r1.zzz - r0.xyz;
    r18.y = ps;
    r4.yzw = r4.xyz * 0.8 + r0.xyz;
    ps = max(r18.x, r18.y);
    r0.xy = r6.ww * ModShadowGroupColor.xy;
    r11.x = ps;
    r10.xyz = r17.xyz * UniformScalar_0.xxx + r10.xyz;
    ps = r11.y;
    r15.xy = r15.xy * r9.zz;
    ps = r3.x * ps;
    r15.z = r16.x;
    r3.x = ps;
    ps = r11.z;
    r0.z = dot(r15.xyz, r14.xyz);
    ps = r3.y * ps;
    r0.z = max(r0.z, 0.0);
    r3.y = ps;
    ps = r11.w;
    r9.z = dot(r13.zxy, r1.wxy);
    ps = r3.z * ps;
    r0 = -r0.xzyw + 1.0;
    r3.z = ps;
    ps = ConstantLighting.x * r1.w;
    r0.w = float((r0.w >= 0.004));
    r4.x = ps;
    ps = log2(abs(r0.y));
    r9 = r9.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r0.y = ps;
    r11.yz = r9.xy * r0.xz + 0.125;
    ps = UniformScalar_2.x * r0.y;
    r9.xy = r9.zw + 0.5;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r9.xy = abs(r9.xy) * abs(r9.xy);
    r0.y = ps;
    ps = UniformScalar_3.x * r0.y;
    r0.z = saturate(dot(r7.wyz, r12.zxy));
    r0.x = ps;
    ps = log2(r0.z);
    r7.xyz = r3.xzy * r9.xxx;
    r11.w = ps;
    ps = r11.x * r11.w;
    r9.xyz = r3.xzy * r9.yyy;
    r1.z = ps;
    ps = r11.y * r11.z;
    r4.yzw = r0.xxx * r4.yzw;
    r0.x = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.z);
    r6.xyz = r4.ywz * r6.yyy;
    r1.z = ps;
    ps = ConstantLighting.y * r1.w;
    r5.xyz = r1.zzz * ConstantLighting.xzy;
    r4.y = ps;
    r6.xyz = r6.xyz * UniformScalar_4.xxx + r10.xyz;
    ps = ConstantLighting.z * r1.w;
    r6.xyz = r6.xzy + UniformVector_0.xyz;
    r4.z = ps;
    r1.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r1.xyz = r9.xyz * UpperSkyColor.xzy + r1.xzy;
    r1.xyz = r7.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r5.xyz * r8.yzw + r1.xzy;
    r1.xyz = r4.xyz * r3.xyz + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
