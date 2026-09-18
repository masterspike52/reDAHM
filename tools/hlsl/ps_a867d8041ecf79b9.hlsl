// ps_a867d8041ecf79b9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040E00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_4, r0.xy);
    r10.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r6.xy = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_2.x * UniformScalar_4.x;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r9.xy = r9.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r8.w - 0.5;
    r6.w = ps;
    ps = UniformVector_4.x * r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r10.x = ps;
    ps = UniformVector_4.x * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r10.z = ps;
    r5 = r10 + r0.xyxy;
    r7.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r14 = tex2D(Texture2D_1, r5.xy);
    r10 = tex2D(Texture2D_2, r5.zw);
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xzw = tex2D(Texture2D_3, r6.xy).xyz;
    r11.xyz = UniformVector_3.xyz * 2e+01;
    r6.z = float((UniformScalar_8.x >= 1.0));
    ps = r4.w;
    r1.w = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r6.y = dot(r1.zxy, r1.zxy);
    r6.x = saturate(ps);
    ps = r1.z;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r3.w = float((UniformScalar_8.x > 1.0));
    r5.x = ps;
    ps = 5.0 * r5.x;
    r13.xyz = r8.xyz * UniformScalar_9.xxx;
    r0.y = saturate(ps);
    r12.xyz = (-abs(r3.www) >= 0.0) ? r0.xzw : 1.0;
    ps = rsqrt(abs(r6.y));
    r5.x = saturate(-r6.w + 1.0);
    r3.w = ps;
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r0.xzw = r10.xyz * r10.www;
    r6.y = ps;
    ps = rsqrt(abs(r1.w));
    r4.xyz = r3.www * r1.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r10.xyz = r5.yyy * r3.xyz;
    r5.y = ps;
    r0.xzw = r14.xyz * r14.www + r0.xzw;
    r3.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r5.x);
    r12.xyz = r5.yyy * -SpotDirection.xyz;
    r5.x = ps;
    r1.xyz = r13.xyz * r3.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.y * r5.z;
    r5.y = dot(r12.zxy, r2.zxy);
    r6.z = ps;
    ps = UniformVector_2.z * r5.w;
    r0.xzw = r11.xyz * r0.xzw;
    r6.w = ps;
    r3.xyz = r3.xyz * r8.xyz + r0.xzw;
    ps = r6.w;
    r5.w = dot(r0.wxz, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = 1.0 - r5.z;
    r1.w = r5.w - r0.x;
    r5.w = ps;
    ps = 1.0 - r6.x;
    r0.z = saturate(r1.w + r0.x);
    r5.z = ps;
    ps = r5.w;
    r2.xy = -r6.yz * r0.zz;
    ps = r0.z * ps;
    r0.xw = -r0.yz + 1.0;
    r2.z = ps;
    r8.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r6.xyz = r6.wyz + r2.zxy;
    ps = (-1.0) - -r6.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = r6.wyz * r5.zzz;
    ps = 1.0 + r6.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r5.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r5.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.z = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.z));
    r2.xyz = r3.xyz * r2.xyz;
    r5.z = ps;
    r3.xyz = r6.xyz * r5.zzz;
    r5.z = dot(r3.zxy, r10.zxy);
    r6.xyz = r3.xyz * r5.zzz;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = saturate(dot(r4.zxy, r6.zxy));
    r5.z = ps;
    ps = log2(r5.w);
    r6.xyz = r1.xyz * r0.www;
    r9.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r5.x = ps;
    r1.yz = r1.yz * r8.xy + 0.125;
    ps = pow(2.0, r1.x);
    r5.y = saturate(dot(r3.zyx, r4.zyx));
    r5.w = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.zxy * r5.www;
    r1.x = saturate(ps);
    r6.yz = r2.xy * r5.yy + r6.yz;
    r6.w = r2.z * r5.y + r6.x;
    ps = pow(2.0, r5.z);
    r5.xw = r1.yx * r1.zx;
    r6.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
