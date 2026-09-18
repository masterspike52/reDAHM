// ps_18db63e05d8d810a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003A8 10041100 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    r9.xyz = r5.wzy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.w = saturate(OpacityOverride.x);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r6.x = ps;
    ps = r6.x;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = abs(r7.x) * ps;
    r12.xyz = r5.yyy * r1.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.y = dot(r9.xzy, r9.xzy);
    r5.x = ps;
    ps = r6.z;
    r5.yzw = r5.xxx * r3.zxy;
    ps = abs(r7.y) * ps;
    r6.x = saturate(dot(r5.yzw, r9.xzy));
    r8.z = ps;
    ps = rsqrt(abs(r6.y));
    r5.x = r12.z + 0.1;
    r6.y = ps;
    ps = 5.0 * r5.x;
    r1.xyw = r9.zyx * r6.yyy;
    r6.z = saturate(ps);
    ps = 1.0 - r6.w;
    r5.x = dot(r1.wxy, r5.yzw);
    r8.x = ps;
    ps = 1.0 - r6.x;
    r3.xyz = r1.xyw * r5.xxx;
    r6.y = ps;
    r11.xyz = r3.xyz * 2.0 - r5.zwy;
    ps = 1.0 - r6.z;
    r5 = xe_cube(r11.xyz);
    r1.z = ps;
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.x = ps;
    r3.xy = r5.yx * r6.xx + 1.5;
    r9.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r15.w = tex2D(Texture2D_9, r0.xy).x;
    r10 = tex2D(Texture2D_1, r0.xy);
    r13.yzw = tex2D(Texture2D_2, r6.yy).xyz;
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r17.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r5.xyz = tex2D(Texture2D_8, r0.xy).yxz;
    r0.xy = tex2D(ModShadowAccumTexture, r8.yz).xy;
    r3.yzw = -ModShadowColor.xyz + 1.0;
    r7.xy = r0.xy * 0.875;
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r5.w = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    ps = AmbientColorAndSkyFactor.y * r2.z;
    r15.yz = r15.yz * r5.xz;
    r8.z = ps;
    r16.xyz = r17.xzy * float3(2e+01, 22.0, 2e+01) + r16.xzy;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r17.xyz = r6.xyz * UniformScalar_3.xxx;
    r8.w = ps;
    ps = 0.7 * r5.y;
    r6 = r10.zwwy * r13.wzwz;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r15.x = r5.x * r15.x;
    r5.x = ps;
    ps = r6.w;
    r0.xyz = r5.xxx * r4.xyz;
    r5.x = ps;
    r5.yw = r17.xz * UniformVector_1.xz + r16.xy;
    ps = 2e+01 * r5.x;
    r4.xy = r6.yz * 1.5e+02;
    r10.y = ps;
    r5.x = r17.y * UniformVector_1.y + r16.z;
    ps = 2e+01 * r6.x;
    r5.z = r5.x + r4.x;
    r10.z = ps;
    ps = r5.w;
    r15.yzw = r15.yzw * float3(0.65, 0.5, 1e+01);
    ps = r4.y + ps;
    r7.z = max(r15.w, 0.0001);
    r5.x = ps;
    ps = ConstantLighting.x * r1.w;
    r4.xyz = r15.xyz + r14.xyz;
    r3.x = ps;
    ps = r5.y;
    r13.x = dot(r0.zxy, r1.wxy);
    r5.y = ps;
    ps = UniformVector_0.x + r5.y;
    r0 = r13.xxyy * float4(-0.5, 0.5, 1.5e+02, 2e+01);
    r6.y = ps;
    r6.xz = -r1.zz * ModShadowGroupColor.xy + 1.0;
    r7.xy = r7.xy * r6.xz + 0.125;
    ps = UniformVector_0.y + r5.z;
    r4.w = saturate(dot(r12.zxy, r11.zxy));
    r6.z = ps;
    ps = UniformVector_0.z + r5.x;
    r0.xy = r0.xy + 0.5;
    r6.w = ps;
    ps = abs(r0.x) * abs(r0.x);
    r10.xw = r0.wz * r10.xw;
    r1.z = ps;
    ps = abs(r0.y) * abs(r0.y);
    r6.x = r6.y + r10.w;
    r0.w = ps;
    ps = log2(r4.w);
    r0.xyz = r10.xyz + r9.xyz;
    r7.w = ps;
    r6.xyz = r8.ywz * r0.xzy + r6.xwz;
    ps = r7.x * r7.y;
    r5.w = float((r8.x >= 0.004));
    r5.x = ps;
    ps = r7.z * r7.w;
    r0.xyz = r0.xyz * r2.yzx;
    r6.w = ps;
    r5.xyz = r5.xxx * r3.yzw + ModShadowColor.xyz;
    ps = ConstantLighting.y * r1.w;
    r8.xyz = r0.xzy * r1.zzz;
    r3.y = ps;
    ps = pow(2.0, r6.w);
    r9.xyz = r0.xzy * r0.www;
    r6.w = ps;
    ps = ConstantLighting.z * r1.w;
    r7.xyz = r6.www * ConstantLighting.xzy;
    r3.z = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r8.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r7.xyz * r4.xzy + r6.xzy;
    r6.xyz = r3.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
