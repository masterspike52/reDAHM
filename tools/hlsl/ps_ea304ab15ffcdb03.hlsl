// ps_ea304ab15ffcdb03.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040A00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_7 : register(c6); // float
float4 UniformScalar_8 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xy = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r9.w - 0.5;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = float((UniformScalar_9.x >= 1.0));
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    ps = 0.0001 * r4.w;
    r5.zw = r5.zw * abs(r8.xy);
    r10.x = saturate(ps);
    r6.xz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.y = tex2D(Texture2D_1, r0.xy).x;
    ps = UniformVector_4.x * UniformVector_4.w;
    r5.x = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r5.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r5.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r10.yzw = r0.xyz * r9.xyz;
    r5.z = ps;
    r4.xyz = r10.yzw * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r5.zzz * r1.xyz;
    r7.w = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.z;
    r6.w = float((UniformScalar_9.x > 1.0));
    ps = 0.1 + ps;
    r8.xyz = r8.xyz * r2.www;
    r5.x = ps;
    ps = 1.0 - r5.w;
    r7.xyz = r7.zxy * UniformVector_2.zxy;
    r6.y = saturate(ps);
    ps = 5.0 * r5.x;
    r9.xyz = r10.yzw * r9.xyz;
    r5.z = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r3.xyz = r7.www * r3.xyz;
    r5.x = ps;
    ps = log2(r6.y);
    r1.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = 1.0 - r5.z;
    r6.y = dot(r1.zxy, r2.zxy);
    r5.z = ps;
    r10.yz = r5.zz * ModShadowGroupColor.xy;
    ps = (-1.0) - -r7.x;
    r1.xyz = -r10.xyz + 1.0;
    r7.w = ps;
    r7.xyz = r7.wyz * r1.xxx;
    ps = 1.0 + r7.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r1.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r1.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.w));
    r5.z = r6.y - SpotAngles.x;
    r5.w = ps;
    r7.yzw = r7.xyz * r5.www;
    ps = UniformScalar_8.x * r5.y;
    r5.w = dot(r7.wyz, r3.zxy);
    r8.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r10.xyz = r7.yzw * r5.www;
    r5.y = ps;
    r3.xyz = r10.xyz * 2.0 - r3.xyz;
    ps = pow(2.0, r5.y);
    r5.x = saturate(dot(r0.zxy, r3.zxy));
    r7.x = ps;
    ps = log2(r5.x);
    r5.z = saturate(r5.z * SpotAngles.y);
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r1.x = saturate(dot(r7.wyz, r0.zxy));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r6.yxz * float3(15.0, 0.875, 0.875);
    r7.y = ps;
    r5.xy = r0.yz * r1.yz + 0.125;
    r7 = r8.xzyw * r7.xxxy;
    r1.y = (r6.w > 0.0) ? 0.0 : r7.w;
    r5.xw = r5.xz * r5.yz;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6 = r9 * r1.xxxy;
    ps = pow(2.0, r0.x);
    r0.yzw = r4.xyz + r6.www;
    r0.x = ps;
    r6.xy = r0.yz * r0.xx + r6.xy;
    r6.z = r0.w * r0.x + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
