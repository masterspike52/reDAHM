// ps_66c92f49106d281e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_4, r0.xy);
    r8.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r6.xy = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_2.x * UniformScalar_4.x;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r8.xz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xw = r8.xz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = r11.w - 0.5;
    r6.w = ps;
    ps = UniformVector_4.x * r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r8.x = ps;
    ps = UniformVector_4.x * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r8.z = ps;
    r8 = r8 + r0.xyxy;
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r14 = tex2D(Texture2D_1, r8.xy);
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r16 = tex2D(Texture2D_2, r8.zw);
    r6.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xw).xyz;
    r6.w = saturate(r4.w * 0.0001);
    ps = -UniformVector_0.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r13.xyz = UniformVector_3.xyz * 2e+01;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r5.w = float((UniformScalar_8.x >= 1.0));
    r0.y = ps;
    ps = -UniformVector_0.z;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = r1.z;
    r1.w = float((UniformScalar_8.x > 1.0));
    ps = 0.1 + ps;
    r10.xyz = r11.xyz * UniformScalar_9.xxx;
    r5.y = ps;
    ps = 5.0 * r5.y;
    r12.xyz = r8.xyz * r2.www;
    r8.x = saturate(ps);
    r15.xyz = (-abs(r1.www) >= 0.0) ? r6.xyz : 1.0;
    ps = 1.0 - r5.x;
    r6.xyz = r16.xyz * r16.www;
    r5.y = saturate(ps);
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r8.yzw = r7.xyz * UniformVector_2.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r0.www * r1.xyz;
    r5.x = ps;
    r6.xyz = r14.xyz * r14.www + r6.xyz;
    ps = log2(r5.y);
    r14.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r1.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r15.xyz;
    r10.xyz = r10.xyz * r1.xyz + UniformScalar_10.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = dot(r14.zxy, r2.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyz = r13.yxz * r6.yxz;
    r5.x = ps;
    r2.xyz = r1.xyz * r11.xyz + r6.yxz;
    ps = -SpotAngles.x - -r5.y;
    r11.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.w);
    r5.yz = -r8.wx + 1.0;
    r0.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.w = dot(r6.zyx, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = r5.w;
    r1.xyz = r12.xzy * r0.www;
    ps = -r6.y + ps;
    r2.xyz = r2.xyz * r0.xyz;
    r5.w = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.w = saturate(r5.w + r6.y);
    r6.z = ps;
    ps = SpotAngles.y * r5.x;
    r0.xy = -r8.yz * r5.ww;
    r5.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.zw = r5.yx * r5.wx;
    r3.x = ps;
    ps = 1.0 - r6.z;
    r8.xyz = r8.yzw + r0.xyz;
    r3.y = ps;
    ps = 1.0 - r6.w;
    r8.w = r8.z - 1.0;
    r3.z = ps;
    r6.xyz = r8.wxy * r3.zzz;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r3.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r6.w));
    r5.y = -r5.w + 1.0;
    r5.x = ps;
    r8.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r8.zxy, r11.zxy);
    r5.xzw = r8.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    r5.x = saturate(dot(r7.zxy, r5.wxz));
    ps = log2(r5.x);
    r6.xyz = r10.xyz * r5.yyy;
    r9.x = ps;
    r5.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r8.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r3.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
