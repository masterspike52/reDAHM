// ps_f88f93df8e07fa29.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.xy = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r2.w;
    r5.xz = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xw = r2.yz * UniformScalar_4.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    ps = (-0.5) + r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r9.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r12 = tex2D(Texture2D_1, r0.xy);
    r5.yzw = tex2D(Texture2D_3, r5.xz).xyz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = dot(r3.zxy, r3.zxy);
    r10.xyz = UniformVector_3.xyz * 2e+01;
    r6.y = float((UniformScalar_3.x >= 1.0));
    r6.x = float((UniformScalar_3.x > 1.0));
    r7.xyz = r7.xyz * 2.0 - 1.0;
    r5.yzw = (-abs(r6.xxx) >= 0.0) ? r5.yzw : 1.0;
    r6.xzw = r12.xyz * r12.www;
    r6.xzw = r10.xyz * r6.xzw;
    r12.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r5.yzw;
    r5.yzw = r12.xyz * r2.xyz + r6.xzw;
    ps = rsqrt(abs(r0.y));
    r6.y = r12.x * UniformScalar_4.x;
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r6.y = r6.y * r2.x;
    r1.w = ps;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = r9.xzy * LightColor.xzy;
    r10.xyz = r7.xyz * UniformVector_2.xyz;
    r7.xyz = r1.www * r1.xyz;
    ps = r4.w;
    r9.xyz = r0.www * r3.xyz;
    ps = 0.0001 * ps;
    r0.w = dot(r6.wxz, float3(0.11, 0.3, 0.59));
    r10.w = saturate(ps);
    ps = r0.w;
    r6.zw = r8.xw * r12.yz;
    ps = -r6.x + ps;
    r3.xy = -r10.zw + 1.0;
    r0.w = ps;
    ps = 0.1 - -r1.z;
    r4.x = saturate(r0.w + r6.x);
    r5.x = ps;
    ps = r3.x;
    r1.xyz = r5.yzw * r11.xyz;
    ps = r4.x * ps;
    r5.yz = -r10.xy * r4.xx;
    r5.w = ps;
    r10.xyz = r10.xyz + r5.yzw;
    ps = 5.0 * r5.x;
    r10.w = r10.z - 1.0;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r10.xyw = r10.xyw * r3.yyy;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.z = r10.w + 1.0;
    r4.y = ps;
    r5.xyw = (r3.yyy > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r3.yyy >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = ModShadowGroupColor.y * r5.z;
    r5.w = dot(r3.zxy, r3.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = -r4.yzx + 1.0;
    r5.w = ps;
    r4.xyz = r3.xyz * r5.www;
    ps = UniformScalar_5.x + r6.y;
    r5.w = dot(r4.zxy, r9.zxy);
    r3.x = ps;
    ps = UniformScalar_5.x + r6.z;
    r10.xyz = r4.xyz * r5.www;
    r3.y = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = UniformScalar_5.x + r6.w;
    r5.w = saturate(dot(r7.zxy, r9.zxy));
    r3.z = ps;
    ps = log2(r5.w);
    r6.xyz = r3.xyz * r5.zzz;
    r8.x = ps;
    r3.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    ps = pow(2.0, r3.x);
    r5.w = saturate(dot(r4.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r3.yz * r5.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
