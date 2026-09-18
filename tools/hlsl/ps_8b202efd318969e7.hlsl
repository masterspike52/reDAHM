// ps_8b202efd318969e7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041300 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c26); // float4
float4 ConstantLighting : register(c27); // float3
float4 LowerSkyColor : register(c25); // float3
float4 ModShadowAccumResolution : register(c30); // float2
float4 ModShadowColor : register(c28); // float3
float4 ModShadowGroupColor : register(c29); // float3
float4 OpacityOverride : register(c23); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_15 : register(c14); // float
float4 UniformScalar_16 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_21 : register(c19); // float
float4 UniformScalar_22 : register(c20); // float
float4 UniformScalar_23 : register(c21); // float
float4 UniformScalar_24 : register(c22); // float
float4 UniformScalar_3 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UpperSkyColor : register(c24); // float3
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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_1, r0.xy).yxz;
    r10.xyz = UniformVector_7.xyz - UniformVector_6.xyz;
    ps = UniformVector_2.x * UniformVector_2.x;
    r17.xyz = UniformVector_3.xyz - UniformVector_4.xyz;
    r8.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r14.xyz = UniformVector_4.xyz - UniformVector_5.xyz;
    r8.y = ps;
    ps = UniformScalar_22.x;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = -UniformScalar_21.x + ps;
    r16.xyz = r13.xyz * UniformScalar_17.xxx;
    r15.w = ps;
    ps = r0.w + r0.w;
    r0.x = dot(r9.zxy, float3(1.0, 1.0, 1.0));
    r12.w = ps;
    ps = 4.0 * r0.z;
    r6.xyz = r7.xyz + r7.xyz;
    r18.z = ps;
    ps = 4.0 * r0.y;
    r0.z = dot(r13.yzx, float3(0.59, 0.11, 0.3));
    r18.w = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r11.xyz + r11.xyz;
    r0.w = ps;
    r11.xyz = r15.xyz * 0.7 + 0.3;
    ps = 5.0 * r0.z;
    r6.w = dot(r13.yxz, float3(0.59, 0.3, 0.11));
    r0.y = ps;
    ps = 1.0 * r0.z;
    r12.xyz = r0.www * r1.xyz;
    r0.w = ps;
    ps = UniformScalar_19.x;
    r18.xy = r0.wy * UniformScalar_15.xx;
    r14.xyz = r18.yyy * r14.xyz + UniformVector_5.xyz;
    ps = r6.w + ps;
    r0.yw = r12.zw + float2(0.1, -1.0);
    r0.z = ps;
    ps = frac(r0.z);
    r8.z = float((r18.x >= 0.2));
    r6.w = ps;
    ps = 5.0 * r0.y;
    r6 = r6.xzyw + float4(-1.0, -1.0, -1.0, -0.5);
    r0.z = saturate(ps);
    ps = abs(r6.w) + abs(r6.w);
    r1.xyz = r18.xzw + float3(-0.2, -2.0, -2.0);
    r8.w = ps;
    ps = 1.25 * r1.x;
    r7.w = float((r18.x > 0.2));
    r9.w = ps;
    ps = r0.w;
    r19.xy = -r6.xz - 2.0;
    ps = -r6.y + ps;
    r1.zw = r1.yz - r6.xz;
    r17.w = ps;
    r17.xyz = r9.www * r17.xyz + UniformVector_4.xyz;
    r10.xyz = r10.xyz * r8.www + UniformVector_6.xyz;
    ps = 1.0 - r0.x;
    r1.xy = r19.xy + r18.zw;
    r6.y = ps;
    ps = 1.0 - r0.z;
    r10.xyz = r10.xyz * UniformScalar_20.xxx;
    r6.w = ps;
    r0.xyz = (r7.www > 0.0) ? r17.xyz : UniformVector_4.xyz;
    ps = UniformScalar_23.x * r6.y;
    r13.xyz = r6.yyy * r13.xyz;
    r7.w = ps;
    r15.xyz = r13.xyz * r15.xyz - r13.xyz;
    r0.yzw = (r8.zzz > 0.0) ? r0.xyz : r14.xyz;
    r1 = r1 * UniformScalar_0.xxxx + r6.xzxz;
    ps = UniformScalar_16.x * r0.y;
    r10.xyz = r10.xzy * r9.zzz;
    r14.x = ps;
    ps = UniformScalar_16.x * r0.z;
    r10.xyz = r10.xyz * r9.zzz;
    r14.y = ps;
    r10.xyz = r16.xyz * r9.yyy + r10.xzy;
    r13.xyz = r15.xyz * UniformScalar_0.xxx + r13.xyz;
    r0.x = r15.w * UniformScalar_0.x + UniformScalar_21.x;
    ps = UniformScalar_16.x * r0.w;
    r9.yzw = r13.xyz * r0.xxx;
    r14.z = ps;
    r10.xyz = r14.xzy * r9.xxx + r10.xzy;
    r17.xyz = r11.xzy * r10.xyz - r10.xyz;
    r0.x = r17.w * UniformScalar_0.x - 2.0;
    ps = r1.z;
    r9.x = r0.x + r7.z;
    ps = r6.y * ps;
    r7 = r9.xywz + r7.zwww;
    r6.x = ps;
    r6.z = r7.x * r6.y + 1.0;
    r9.xy = r8.xy * r6.yz;
    r0 = r6.xyzy * UniformVector_2.xxzy;
    r9.z = r9.x * r1.z;
    ps = r0.z * r0.z;
    r15.xyz = r0.yww * r1.xyw;
    r1.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.y = r15.z * r15.z;
    r1.x = ps;
    r8.x = r9.z * r6.x + r8.y;
    r1.z = dot(r9.yz, r6.zx) + 0.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.zw = r8.xy + r1.yz;
    r1.y = ps;
    ps = rsqrt(abs(r1.z));
    r0.y = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r1.w));
    r11.yzw = -UniformVector_0.xyz + 1.0;
    r8.z = ps;
    ps = r15.z;
    r8.xy = r1.xy * abs(r5.xy);
    ps = r8.w * ps;
    r16.xyz = r0.zxz * r8.zww;
    r16.w = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r16.zyw, r16.zyw);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r3.yzw = r0.yyy * r3.xyz;
    r0.x = ps;
    r1.xyw = r16.ywz * r0.xxx;
    r0.x = dot(r1.wxy, r3.wyz);
    r0.xyz = r1.xwy * r0.xxx;
    r9.xyz = r0.xzy * 2.0 - r3.yzw;
    r0 = xe_cube(r9.xyz);
    ps = 1.0 / abs(r0.z);
    r5.z = r0.w;
    r1.z = ps;
    r5.xy = r0.yx * r1.zz + 1.5;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r3.x = dot(r4.zxy, r4.zxy);
    r0.w = saturate(ps);
    ps = rsqrt(abs(r3.x));
    r1.z = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r3.x = ps;
    ps = UniformScalar_24.x;
    r14.xyz = r3.xxx * r4.xyz;
    r18.x = ps;
    ps = 0.0001;
    r4.xyz = r1.zzz - r0.xyz;
    r18.y = ps;
    r4.yzw = r4.xyz * 0.8 + r0.xyz;
    ps = max(r18.x, r18.y);
    r0.xy = r6.ww * ModShadowGroupColor.xy;
    r11.x = ps;
    r10.xyz = r17.xyz * UniformScalar_0.xxx + r10.xyz;
    ps = r13.x;
    r15.xy = r15.xy * r8.zz;
    ps = r11.y * ps;
    r15.z = r16.x;
    r3.x = ps;
    ps = r13.y;
    r0.z = dot(r15.xyz, r3.yzw);
    ps = r11.z * ps;
    r0.z = max(r0.z, 0.0);
    r3.y = ps;
    ps = r13.z;
    r8.z = dot(r14.zxy, r1.wxy);
    ps = r11.w * ps;
    r0 = -r0.xzyw + 1.0;
    r3.z = ps;
    ps = ConstantLighting.x * r1.w;
    r0.w = float((r0.w >= 0.004));
    r4.x = ps;
    ps = log2(abs(r0.y));
    r8 = r8.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r0.y = ps;
    r11.yz = r8.xy * r0.xz + 0.125;
    ps = UniformScalar_2.x * r0.y;
    r8.xy = r8.zw + 0.5;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r8.xw = abs(r8.xy) * abs(r8.xy);
    r0.y = ps;
    ps = UniformScalar_3.x * r0.y;
    r0.z = saturate(dot(r12.zxy, r9.zxy));
    r0.x = ps;
    ps = log2(r0.z);
    r8.xyz = r3.xzy * r8.xxx;
    r11.w = ps;
    ps = r11.x * r11.w;
    r9.xyz = r3.xzy * r8.www;
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
    r1.xyz = r8.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r5.xyz * r7.yzw + r1.xzy;
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
