// ps_c19baeda142debfd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040E00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_19 : register(c10); // float
float4 UniformScalar_20 : register(c11); // float
float4 UniformScalar_21 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_7 : register(c6); // float4
float4 UniformVector_8 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r9.y = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r6.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = r12.w;
    r6.xy = r0.wz * UniformVector_8.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = (-0.5) + r5.x;
    r7.xy = r9.xy * abs(r7.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r7.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r10.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r14.xyz = tex2D(Texture2D_4, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r5.yz).xyw;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_2.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = (-1.0) * ps;
    r6.x = saturate(r4.w * 0.0001);
    r13.x = ps;
    ps = r1.z;
    r13.yzw = UniformVector_7.xyz * UniformVector_7.www;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    r5.zw = r11.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r5.y = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = 1.0 - r5.y;
    r6.w = float((UniformScalar_19.x >= 1.0));
    r6.y = saturate(ps);
    ps = 5.0 * r5.x;
    r0.w = float((UniformScalar_19.x > 1.0));
    r5.y = saturate(ps);
    r0.xyz = r0.zxy * 2.0 - 1.0;
    r4.xyz = (-abs(r0.www) >= 0.0) ? r14.xyz : 1.0;
    r4.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r4.xyz;
    ps = UniformVector_2.z * r0.x;
    r12.xyz = r13.yzw * r12.xyz;
    r3.w = ps;
    ps = 1.0 - r5.y;
    r13.yzw = r10.xyz * r2.www;
    r5.y = ps;
    ps = log2(r6.y);
    r10.xyz = r6.zzz * r3.zxy;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.yz = r5.yy * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.yzw = -r6.xyz + 1.0;
    r0.w = ps;
    ps = UniformScalar_1.x * r6.y;
    r2 = r13 * r0.xwww;
    r6.x = ps;
    r11.w = (r10.x >= 0.0) ? r3.w : r2.x;
    r5.xy = r6.xx * r5.wz + r0.zy;
    ps = UniformVector_2.x * r5.y;
    r3.xyz = r12.xyz * r4.xyz;
    r0.x = ps;
    ps = UniformVector_2.y * r5.x;
    r5.zw = r11.zw - 1.0;
    r0.y = ps;
    r5.xy = r0.xy * r6.yy;
    r5.zw = r5.wz * r6.yy + 1.0;
    r5 = (r6.xyyy > 0.0) ? r5.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r0 = (r6.xyyy >= 0.0) ? r5 : float4(1.0, 0.0, 0.0, 1.0);
    r5.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r1.w));
    r5.yzw = r3.xyz * r0.xxx;
    r1.w = ps;
    r3.xyz = r5.yzw * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.www * r1.xyz;
    r5.x = ps;
    r0.xyz = r0.yzw * r5.xxx;
    r4.xyz = r0.xyz * TwoSidedSign.xxx;
    r5.x = dot(r4.zxy, r10.xyz);
    r0.xyz = r4.xzy * r5.xxx;
    r0.xyz = r0.xyz * 2.0 - r10.yxz;
    r5.x = saturate(dot(r1.zxy, r0.yxz));
    ps = log2(r5.x);
    r0.xyz = r5.yzw * r9.xyz;
    r7.x = ps;
    r5.xyz = r7.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r4.zxy, r1.zxy));
    r5.z = ps;
    r5.xy = r5.xy * r6.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r3.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r2.yzw * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
