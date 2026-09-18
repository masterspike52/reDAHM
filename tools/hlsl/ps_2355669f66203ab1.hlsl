// ps_2355669f66203ab1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003A8 10041000 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
samplerCUBE TextureCube_0 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r1.zxy, r1.zxy);
    r7.z = ps;
    r6.xyz = r2.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r3.w = saturate(OpacityOverride.x);
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r7.y = ps;
    ps = r7.y;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = abs(r5.x) * ps;
    r13.xyz = r0.www * r1.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r0.z));
    r0.w = dot(r6.xzy, r6.xzy);
    r0.z = ps;
    ps = r7.z;
    r1.xyz = r0.zzz * r3.zxy;
    ps = abs(r5.y) * ps;
    r3.x = saturate(dot(r1.xyz, r6.xzy));
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = r13.z + 0.1;
    r0.w = ps;
    ps = 5.0 * r0.z;
    r5.xyw = r6.zyx * r0.www;
    r3.z = saturate(ps);
    ps = 1.0 - r3.w;
    r0.z = dot(r5.wxy, r1.xyz);
    r5.z = ps;
    ps = 1.0 - r3.x;
    r6.xyz = r5.xyw * r0.zzz;
    r0.z = ps;
    r12.xyz = r6.xyz * 2.0 - r1.yzx;
    ps = 1.0 - r3.z;
    r1 = xe_cube(r12.xyz);
    r3.w = ps;
    ps = 1.0 / abs(r1.z);
    r8.z = r1.w;
    r0.w = ps;
    r8.xy = r1.yx * r0.ww + 1.5;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r14.w = tex2D(Texture2D_9, r0.xy).x;
    r10 = tex2D(Texture2D_1, r0.xy);
    r11.yzw = tex2D(Texture2D_2, r0.zz).xyz;
    r1.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).yxz;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.xy = r8.xy * 0.875;
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r0.w = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.y * r2.z;
    r14.yz = r14.yz * r0.xz;
    r9.y = ps;
    r15.xyz = r16.xzy * float3(2e+01, 22.0, 2e+01) + r15.xzy;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r16.xyz = r1.xyz * UniformScalar_3.xxx;
    r9.z = ps;
    ps = 0.7 * r0.y;
    r1 = r10.zwwy * r11.wzwz;
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r14.x = r0.x * r14.x;
    r0.x = ps;
    ps = r1.w;
    r4.yzw = r0.xxx * r4.xyz;
    r0.x = ps;
    r0.yw = r16.xz * UniformVector_1.xz + r15.xy;
    ps = 2e+01 * r0.x;
    r8.zw = r1.yz * 1.5e+02;
    r10.y = ps;
    r0.x = r16.y * UniformVector_1.y + r15.z;
    ps = 2e+01 * r1.x;
    r0.z = r0.x + r8.z;
    r10.z = ps;
    ps = r0.w;
    r14.yzw = r14.yzw * float3(0.65, 0.5, 1e+01);
    ps = r8.w + ps;
    r8.z = max(r14.w, 0.0001);
    r0.x = ps;
    ps = ConstantLighting.x * r5.w;
    r6.xyz = r14.xyz + r6.xyz;
    r4.x = ps;
    ps = r0.y;
    r11.x = dot(r4.wyz, r5.wxy);
    r0.y = ps;
    ps = UniformVector_0.x + r0.y;
    r11 = r11.xxyy * float4(-0.5, 0.5, 1.5e+02, 2e+01);
    r1.y = ps;
    r1.xz = -r3.ww * ModShadowGroupColor.xy + 1.0;
    r8.xy = r8.xy * r1.xz + 0.125;
    ps = UniformVector_0.y + r0.z;
    r4.z = saturate(dot(r13.zxy, r12.zxy));
    r1.z = ps;
    ps = UniformVector_0.z + r0.x;
    r4.yw = r11.xy + 0.5;
    r1.w = ps;
    ps = abs(r4.y) * abs(r4.y);
    r10.xw = r11.wz * r10.xw;
    r4.y = ps;
    ps = abs(r4.w) * abs(r4.w);
    r1.x = r1.y + r10.w;
    r3.w = ps;
    ps = log2(r4.z);
    r3.xyz = r10.xyz + r3.xyz;
    r8.w = ps;
    r1.xyz = r9.xzy * r3.xzy + r1.xwz;
    ps = r8.x * r8.y;
    r0.w = float((r5.z >= 0.004));
    r0.x = ps;
    ps = r8.z * r8.w;
    r3.xyz = r3.xyz * r2.yzx;
    r1.w = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r3.xzy * r4.yyy;
    r4.y = ps;
    ps = pow(2.0, r1.w);
    r9.xyz = r3.xzy * r3.www;
    r1.w = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r1.www * ConstantLighting.xzy;
    r4.z = ps;
    r1.xyz = r9.xyz * UpperSkyColor.xzy + r1.xyz;
    r1.xyz = r8.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r7.xyz * r6.xzy + r1.xzy;
    r1.xyz = r4.xyz * r3.xyz + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xzy * r0.xzy;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
