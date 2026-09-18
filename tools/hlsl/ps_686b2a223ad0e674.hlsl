// ps_686b2a223ad0e674.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
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
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xz = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r9.w;
    r6.xy = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xyz = UniformVector_4.xzy * 2e+01;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r8.y = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r8.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r11.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r12 = tex2D(Texture2D_1, r0.xy);
    r15 = tex2D(Texture2D_2, r0.xy);
    r10.yzw = tex2D(Texture2D_3, r6.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r5.xz).xyz;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = r4.w;
    r14.xyz = UniformVector_3.xzy * 2e+01;
    ps = 0.0001 * ps;
    r1.w = float((UniformScalar_8.x >= 1.0));
    r10.x = saturate(ps);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r5.z = float((UniformScalar_8.x > 1.0));
    r0.w = ps;
    ps = r1.z;
    r6.xyz = r9.xyz * UniformScalar_9.xxx;
    ps = 0.1 + ps;
    r0.xyz = r0.xyz * r2.www;
    r5.x = ps;
    r10.yzw = (-abs(r5.zzz) >= 0.0) ? r10.yzw : 1.0;
    ps = 5.0 * r5.x;
    r2.xyz = r15.xzy * r15.www;
    r11.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r12.xyz = r12.xzy * r12.www;
    r2.w = ps;
    r5.xyz = r11.wyz * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r4.xyz = r2.www * r1.xyz;
    r11.y = ps;
    ps = UniformVector_2.y * r5.z;
    r12.xyz = r14.xyz * r12.xyz;
    r11.z = ps;
    ps = UniformVector_2.z * r5.x;
    r2.xyz = r13.xyz * r2.xyz;
    r11.w = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r10.yzw;
    r6.xyz = r6.xyz * r1.xyz + UniformScalar_10.xxx;
    r10.yzw = (abs(r0.www) > 0.0) ? r12.xzy : r2.xzy;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r2.yxz : r12.yxz;
    r12.xyz = (-abs(r5.www) >= 0.0) ? r2.yxz : r5.xyz;
    ps = rsqrt(abs(r6.w));
    r5.xz = -r11.wx + 1.0;
    r5.y = ps;
    r2.xyz = (abs(r5.www) > 0.0) ? r10.yzw : r2.xzy;
    r1.xyz = r1.xyz * r9.xyz + r2.xyz;
    ps = ModShadowGroupColor.x * r5.z;
    r9.xyz = r5.yyy * r3.xyz;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = saturate(dot(r12.zxy, float3(0.59, 0.11, 0.3)));
    r10.z = ps;
    ps = r5.x;
    r5.w = dot(r2.zxy, float3(0.11, 0.3, 0.59));
    ps = r5.y * ps;
    r5.w = r5.w - r2.x;
    r5.z = ps;
    ps = r5.w;
    r5.xy = -r11.yz * r5.yy;
    ps = r2.x + ps;
    r5.xyz = r11.wyz + r5.zxy;
    r10.w = saturate(ps);
    ps = (-1.0) - -r5.x;
    r3 = -r10.wxyz + 1.0;
    r5.w = ps;
    r5.xyz = r5.wyz * r3.yyy;
    ps = 1.0 + r5.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r3.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r3.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r7.xyz;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r9.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r3.xxx;
    r8.x = ps;
    r5.xyz = r8.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r3.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
