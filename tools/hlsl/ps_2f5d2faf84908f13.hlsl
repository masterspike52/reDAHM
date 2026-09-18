// ps_2f5d2faf84908f13.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r6.y = ps;
    ps = r13.w;
    r6.zw = r0.xy * UniformScalar_7.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = (-0.5) + r5.x;
    r6.xy = r6.xy * abs(r7.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r16.z = tex2D(Texture2D_4, r6.zw).x;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.xyz = tex2D(Texture2D_0, r5.yz).xyw;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.x = UniformScalar_6.x - UniformScalar_5.x;
    ps = r0.z;
    r5.z = -UniformScalar_5.x + 1.0;
    r5.w = saturate(ps);
    ps = r1.z;
    r14.xy = r0.wz * UniformVector_4.xy;
    ps = 0.1 + ps;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    r9.z = r7.z * 2.0 - 1.0;
    r10.xw = r15.xy * 2.0 - 1.0;
    r9.xy = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r10.z = saturate(r6.x * 5.0);
    r5.y = ps;
    ps = 1.0 / r5.x;
    r5.z = r5.z - r5.w;
    r5.x = ps;
    ps = r5.z;
    r6.w = dot(r3.zxy, r3.zxy);
    ps = r5.x * ps;
    r11.xyz = r5.yyy * r1.xyz;
    r10.y = saturate(ps);
    ps = r4.w;
    r5.xw = -r10.zy + 1.0;
    ps = 0.0001 * ps;
    r1.yz = r5.xx * ModShadowGroupColor.xy;
    r1.x = saturate(ps);
    r5.xyz = -r1.yxz + 1.0;
    ps = UniformScalar_1.x * r5.y;
    r7.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r1.w = ps;
    r9.xy = r1.ww * r10.xw + r9.xy;
    r9.xyz = r9.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r6.w));
    r6.x = dot(r9.zxy, r9.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r6.www * r3.xyz;
    r6.x = ps;
    r12.xyz = r9.xyz * r6.xxx;
    r6.x = dot(r12.zxy, r1.zxy);
    r3.xyz = r12.xzy * r6.xxx;
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    r6.x = saturate(dot(r11.zxy, r1.yxz));
    ps = log2(r6.x);
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r6.xyw = r6.yzx * float3(0.875, 0.875, 15.0);
    r16.xy = r6.xy * r5.xz;
    r6.xyz = r16.xyz + float3(0.125, 0.125, 0.5);
    r15.w = r5.w * r6.z;
    ps = 1.0 / r4.w;
    r9.xy = r15.zw + float2(-1.0, -0.5);
    r5.w = ps;
    r10.xw = r9.zw * r5.ww + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_5, r14.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r10.xw).xyz;
    ps = -ModShadowColor.x;
    r5.w = float((UniformScalar_10.x >= 1.0));
    ps = 1.0 + ps;
    r0.w = float((UniformScalar_10.x > 1.0));
    r10.x = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r0.xyz * r2.www;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r1.xyz : 1.0;
    r1.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = 1.0 + ps;
    r2.xyz = r10.yyy * r13.xyz;
    r10.y = ps;
    r4.xyz = r4.xyz * r13.xyz - r2.xyz;
    ps = -ModShadowColor.z;
    r5.w = saturate(dot(r12.zxy, r11.zxy));
    ps = 1.0 + ps;
    r6.z = r6.x * r6.y;
    r10.z = ps;
    r6.xyz = r6.zzz * r10.xyz + ModShadowColor.xyz;
    r0.w = saturate(r9.y * 5.0000005);
    r2.xyz = r0.www * r4.xyz + r2.xyz;
    r5.x = r9.x * r5.y + 1.0;
    r5.x = (r1.w > 0.0) ? r5.x : 1.0;
    r2.xyz = r7.xyz * r2.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r5.x = (r1.w >= 0.0) ? r5.x : 1.0;
    r2.xyz = r1.xyz * r5.xxx;
    r1.xyz = r2.xyz * r8.xyz;
    ps = pow(2.0, r6.w);
    r3.xyz = -r2.xyz + r3.xyz;
    r5.x = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xyz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
