// ps_fdddd0895cc121c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040F00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
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

    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyw;
    r11.xy = r0.wz * 0.5;
    r9.xy = r0.wz * UniformVector_5.xy;
    r10.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    r13.xy = r5.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.x = saturate(r5.w * 5.0);
    r6.x = saturate(ps);
    ps = 1.0 / r4.w;
    r5.x = -r5.x + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -r6.yxz + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r5.xy = r5.xy * abs(r8.xy);
    r10.x = ps;
    r4.xy = r10.yz * r13.zz + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r9 = tex2D(Texture2D_3, r0.xy);
    r0.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.xw = tex2D(Texture2D_0, r11.xy).xy;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r5.w = dot(r3.zxy, r3.zxy);
    r0.w = dot(r1.zxy, r1.zxy);
    r15.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = (-1.0) + r5.z;
    r7.w = float((UniformScalar_5.x > 1.0));
    r12.x = ps;
    ps = 0.875 * r5.y;
    r0.xyz = r0.xyz * r2.www;
    r12.y = ps;
    ps = r4.x + r4.x;
    r9.xyz = r15.xyz * r9.xyz;
    r5.z = ps;
    r2.xyz = (-abs(r7.www) >= 0.0) ? r14.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r7.w = float((r9.w >= 0.5));
    r5.y = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = r4.w + r4.w;
    r3.xyz = r5.yyy * r3.xyz;
    r5.w = ps;
    r1.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r2.xyz;
    ps = 1.0 - r7.w;
    r5.y = r7.w * UniformScalar_6.x;
    r6.w = ps;
    r2.xyz = r6.www * UniformVector_3.zyx + r5.yyy;
    ps = UniformVector_2.z * r7.x;
    r9.xyz = r9.xyz * r1.xyz;
    r5.y = ps;
    ps = 0.875 * r5.x;
    r5.yzw = r5.yzw - 1.0;
    r12.w = ps;
    ps = 0.012 * r5.z;
    r12.z = r5.y * r7.w;
    r1.x = ps;
    r1.w = r12.z * r6.y + 1.0;
    r12.xyz = r12.xyw * r6.yzx + float3(1.0, 0.125, 0.125);
    r6.w = (r10.x > 0.0) ? r12.x : 1.0;
    r7.xy = r10.xx * r13.xy + r7.yz;
    ps = 0.012 * r5.w;
    r5.x = r12.z * r12.y;
    r1.y = ps;
    r5.xzw = r5.xxx * r11.xyz + ModShadowColor.xyz;
    r7.xy = r7.xy * UniformVector_2.xy - r1.xy;
    r7.z = (r10.x >= 0.0) ? r6.w : 1.0;
    r7.xyz = r7.wxy * r7.zww;
    r1.xy = r1.xy + r7.yz;
    r7.xyz = r9.xyz * r7.xxx;
    r1.z = r7.z * UniformScalar_7.x + r2.x;
    r2.xy = r7.xy * UniformScalar_7.xx + r2.zy;
    r1.xy = r1.xy * r6.yy;
    r1.xyw = (r6.yyy > 0.0) ? r1.xyw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r6.yyy >= 0.0) ? r1.xyw : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r1.xy = r7.xy * r8.xy;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r6.zxy, r3.zxy);
    r9.xyz = r6.xyz * r5.yyy;
    r3.xyz = r9.xyz * 2.0 - r3.xyz;
    r5.y = saturate(dot(r4.zxy, r3.zxy));
    ps = log2(r5.y);
    r2.z = r7.z * r8.z;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r7.y = saturate(dot(r6.zxy, r4.zxy));
    r7.x = ps;
    r6.xyz = r2.xyz * r7.xxy;
    r6.xyz = r1.xyz * r7.yyx + r6.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r5.xyz = r6.xyz * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
