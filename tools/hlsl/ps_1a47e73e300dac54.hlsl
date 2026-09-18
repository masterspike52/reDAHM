// ps_1a47e73e300dac54.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10040F00 0000080A 00000000 00006908 003F00FF 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * UniformScalar_0.xx;
    r6.xyz = tex2D(Texture2D_1, r6.xy).xyw;
    r0.zw = r1.xy * 0.5;
    r7.zw = r1.xy * UniformVector_5.xy;
    r10.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r6.w = r2.z + 0.1;
    r12.xy = r6.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.x = saturate(r6.w * 5.0);
    r1.x = saturate(ps);
    ps = 1.0 / r5.w;
    r6.x = -r6.x + 1.0;
    r12.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.yz = r6.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xyz = -r1.yxz + 1.0;
    r6.y = ps;
    ps = UniformScalar_1.x * r1.y;
    r6.xy = r6.xy * abs(r8.xy);
    r10.x = ps;
    r7.xy = r10.yz * r12.zz + ScreenPositionScaleBias.wz;
    r14.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r8 = tex2D(Texture2D_3, r0.xy);
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).zxy;
    r5.xw = tex2D(Texture2D_0, r0.zw).xy;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r3.xyw = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r6.w = dot(r4.zxy, r4.zxy);
    r0.x = dot(r2.zxy, r2.zxy);
    ps = (-1.0) + r6.z;
    r9.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r13.x = ps;
    ps = 0.875 * r6.y;
    r0.y = float((UniformScalar_5.x > 1.0));
    r13.y = ps;
    ps = r5.x + r5.x;
    r9.xyz = r9.xyz * r8.xyz;
    r6.z = ps;
    r8.xyz = (-abs(r0.yyy) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r0.w = float((r8.w >= 0.5));
    r6.y = ps;
    r0.xyz = r14.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = r5.w + r5.w;
    r5.xyz = r6.yyy * r4.xyz;
    r6.w = ps;
    r4.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r8.xyz;
    ps = 1.0 - r0.w;
    r6.y = r0.w * UniformScalar_6.x;
    r7.w = ps;
    r8.xyw = r7.www * UniformVector_3.zyx + r6.yyy;
    ps = UniformVector_2.z * r0.x;
    r9.xyz = r9.xyz * r4.xyz;
    r6.y = ps;
    ps = 0.875 * r6.x;
    r6.yzw = r6.yzw - 1.0;
    r13.w = ps;
    ps = 0.012 * r6.z;
    r13.z = r6.y * r0.w;
    r4.x = ps;
    r8.z = r13.z * r1.y + 1.0;
    r4.yzw = r13.xyw * r1.yzx + float3(1.0, 0.125, 0.125);
    r7.w = (r10.x > 0.0) ? r4.y : 1.0;
    r0.xy = r10.xx * r12.xy + r0.yz;
    ps = 0.012 * r6.w;
    r6.x = r4.w * r4.z;
    r4.y = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    r0.xy = r0.xy * UniformVector_2.xy - r4.xy;
    r0.z = (r10.x >= 0.0) ? r7.w : 1.0;
    r0.xyz = r0.wxy * r0.zww;
    r4.zw = r4.xy + r0.yz;
    r0.xyz = r9.xzy * r0.xxx;
    r3.z = r0.y * UniformScalar_7.x + r8.x;
    r4.xy = r0.xz * UniformScalar_7.xx + r8.wy;
    r8.xy = r4.zw * r1.yy;
    r8.xyz = (r1.yyy > 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.yyy >= 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r6.w));
    r3.xy = r0.xz * r3.xy;
    r6.w = ps;
    r1.xyz = r1.xyz * r6.www;
    r6.w = dot(r1.zxy, r5.zxy);
    r8.xyz = r1.xyz * r6.www;
    r5.xyz = r8.xyz * 2.0 - r5.xyz;
    ps = LightColor.x * r7.y;
    r6.w = saturate(dot(r2.zxy, r5.zxy));
    r0.x = ps;
    ps = log2(r6.w);
    r4.z = r0.y * r3.w;
    r6.w = ps;
    ps = LightColor.y * r7.z;
    r6.w = r6.w * 15.0;
    r0.y = ps;
    ps = pow(2.0, r6.w);
    r2.y = saturate(dot(r1.zxy, r2.zxy));
    r2.x = ps;
    ps = LightColor.z * r7.x;
    r1.xyz = r4.xyz * r2.xxy;
    r0.z = ps;
    r7.xyz = r3.xyz * r2.yyx + r1.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
