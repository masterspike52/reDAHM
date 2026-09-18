// ps_4af6320d14a7da8c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = (-0.5) + r10.w;
    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    ps = r0.z;
    r2.yz = r0.wz * UniformVector_4.xy;
    r6.x = saturate(ps);
    ps = r4.w;
    r9.zw = r0.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r5.y = -UniformScalar_5.x + 1.0;
    r5.w = saturate(ps);
    ps = UniformScalar_6.x;
    r8.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r5.x = r1.z + 0.1;
    r5.z = ps;
    r14.xy = r11.xy * 2.0 - 1.0;
    ps = 1.0 / r5.z;
    r5.y = r5.y - r6.x;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r9.y = saturate(r5.y * r5.z);
    r9.x = saturate(ps);
    ps = 1.0 / r4.w;
    r2.xw = -r9.xy + 1.0;
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yz = r2.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = -r5.yzw + 1.0;
    r6.y = ps;
    ps = UniformScalar_1.x * r5.z;
    r6.xy = r6.xy * abs(r7.xy);
    r8.x = ps;
    r6.zw = r8.yz * r14.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r13.x = tex2D(Texture2D_4, r9.zw).x;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_5, r2.yz).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.w = float((UniformScalar_10.x >= 1.0));
    r0.w = float((UniformScalar_10.x > 1.0));
    r5.w = dot(r1.zxy, r1.zxy);
    r13.w = r0.z * 2.0 - 1.0;
    r13.yz = r0.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r17.xyz * LightColor.xyz;
    r5.w = ps;
    r16.xyz = (-abs(r0.www) >= 0.0) ? r16.xyz : 1.0;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r16.xyz;
    r1.xyz = r5.www * r1.xyz;
    r9.xyz = r9.yyy * r10.xyz;
    r10.xyz = r15.xyz * r10.xyz - r9.xyz;
    r13.yz = r8.xx * r14.xy + r13.yz;
    r14.xyz = r13.yzw * UniformVector_2.xyz;
    ps = rsqrt(abs(r6.z));
    r5.w = dot(r14.zxy, r14.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r5.w));
    r13.yzw = r6.zzz * r3.xyz;
    r5.w = ps;
    r3.xyz = r14.xyz * r5.www;
    r5.w = dot(r3.zxy, r13.wyz);
    r14.xyz = r3.xzy * r5.www;
    r13.yzw = r14.xyz * 2.0 - r13.ywz;
    r6.z = saturate(dot(r1.zxy, r13.zyw));
    ps = log2(r6.z);
    r5.w = saturate(dot(r3.zxy, r1.zxy));
    r6.z = ps;
    r6.xyw = r6.xyz * float3(0.875, 0.875, 15.0);
    r13.yz = r6.xy * r5.xy;
    r6.xyz = r13.xyz + float3(0.5, 0.125, 0.125);
    ps = r6.y * r6.z;
    r11.w = r2.w * r6.x;
    r5.x = ps;
    r6.xyz = r5.xxx * r12.xyz + ModShadowColor.xyz;
    r5.xy = r11.wz + float2(-0.5, -1.0);
    r5.z = r5.y * r5.z + 1.0;
    ps = 5.0000005 * r5.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = saturate(ps);
    r3.xyz = r5.xxx * r10.xyz + r9.xyz;
    r5.x = (r8.x > 0.0) ? r5.z : 1.0;
    r5.x = (r8.x >= 0.0) ? r5.x : 1.0;
    r3.xyz = r7.xyz * r3.xyz;
    r2.xyz = r3.xyz * r2.xyz;
    r2.xyz = r2.xyz * r5.xxx;
    r1.xyz = r2.xyz * r1.xyz;
    ps = pow(2.0, r6.w);
    r3.xyz = -r2.xyz + r4.xyz;
    r5.x = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
