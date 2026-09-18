// ps_5e6f183707899c1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040E00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
sampler2D ShadowTexture : register(s5);
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
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_3, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r1.xy * UniformScalar_0.xx;
    r7.y = ps;
    ps = 1.0 / r5.w;
    r7.xz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r0.zw = r7.xz * r6.xx + ScreenPositionScaleBias.wz;
    ps = r14.w;
    r7.zw = r1.wz * UniformVector_8.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.w = UniformVector_2.z * (-1.0);
    r7.x = ps;
    ps = (-0.5) + r6.x;
    r7.xy = r7.xy * abs(r8.xy);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r11.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r12.y = tex2D(ShadowTexture, r0.xy).x;
    r0.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r7.zw).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r6.yz).xyw;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = r5.w;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r7.z = saturate(ps);
    ps = UniformVector_7.x * UniformVector_7.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r13.zw = r10.xy + r10.xy;
    r5.z = ps;
    ps = rsqrt(abs(r6.y));
    r12.zw = r7.xy * 0.875;
    r7.y = ps;
    ps = 1.0 - r6.y;
    r7.w = float((UniformScalar_19.x >= 1.0));
    r7.x = saturate(ps);
    ps = 5.0 * r6.x;
    r0.w = float((UniformScalar_19.x > 1.0));
    r6.y = saturate(ps);
    r9.xyz = (-abs(r0.www) >= 0.0) ? r9.xyz : 1.0;
    r0.xzw = r0.zxy * 2.0 - 1.0;
    r9.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r9.xyz;
    ps = 1.0 - r6.y;
    r14.xyz = r5.xyz * r14.xyz;
    r6.y = ps;
    ps = log2(r7.x);
    r5.xyz = r7.yyy * -SpotDirection.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xy = r6.yy * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r5.zxy, r3.zxy);
    r6.x = ps;
    ps = -SpotAngles.x - -r6.y;
    r5.xyz = r6.xxx * r4.zxy;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r7.yzw = -r7.zxy + 1.0;
    r12.x = saturate(ps);
    ps = UniformScalar_1.x * r7.y;
    r9.xyz = r14.xyz * r9.xyz;
    r7.x = ps;
    ps = r12.x * r12.x;
    r13.xy = r12.zw * r7.zw;
    r6.z = ps;
    ps = r12.y * r12.y;
    r3 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r1.w = ps;
    r6.xy = r7.xx * r3.wz + r0.wz;
    ps = pow(2.0, r0.y);
    r2.w = r3.x * r3.y;
    r0.y = ps;
    r1.xyz = r2.www * r1.xyz + ModShadowColor.xyz;
    ps = UniformVector_2.x * r6.y;
    r11.xyz = r1.www * r11.xyz;
    r4.x = ps;
    ps = UniformVector_2.y * r6.x;
    r3 = r11.xzyw * r0.yyyx;
    r4.y = ps;
    ps = UniformVector_2.z * r0.x;
    r4.xy = r4.xy * r7.yy;
    r6.x = ps;
    r10.w = (r5.x >= 0.0) ? r6.x : r3.w;
    r6.xy = r10.zw - 1.0;
    r4.zw = r6.yx * r7.yy + 1.0;
    r0 = (r7.xyyy > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r4 = (r7.xyyy >= 0.0) ? r0 : float4(1.0, 0.0, 0.0, 1.0);
    r6.x = dot(r4.wyz, r4.wyz);
    ps = rsqrt(abs(r6.w));
    r7.xyz = r9.xyz * r4.xxx;
    r6.y = ps;
    r0.xyz = r7.xyz * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r6.yyy * r2.xyz;
    r6.x = ps;
    r6.xyw = r4.yzw * r6.xxx;
    r4.xyz = r6.xyw * TwoSidedSign.xxx;
    r6.x = dot(r4.zxy, r5.xyz);
    r6.xyw = r4.xzy * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r5.yxz;
    r6.x = saturate(dot(r2.zxy, r6.yxw));
    ps = log2(r6.x);
    r7.yzw = r7.xyz * r8.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.x = saturate(dot(r4.zxy, r2.zxy));
    r6.x = ps;
    r6.xyw = r0.xyz * r6.xxx;
    r6.xy = r7.yz * r7.xx + r6.xy;
    r6.w = r7.w * r7.x + r6.w;
    r6.xyw = r3.xzy * r6.xyw;
    r6.xyw = r6.xyw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xwy * r6.zzz;
    r6.xyz = r6.xzy * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
